--POKEY top level
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                      --POKEY Top Entity--                                      --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pokey_top is
    port 
    (
        --Main clock.
        phi2 : in std_logic;

        --Read/write and enable signals.
        cs : in std_logic_vector(1 downto 0);
        rw : in std_logic;

        --IRQ.
        irq : out std_logic;

        --Data and address lines.
        d : inout std_logic_vector(7 downto 0);
        a : in    std_logic_vector(3 downto 0);

        --Digital audio out.
        audio : out std_logic_vector(5 downto 0);

        --Potentiometer signals.
        p    : in  std_logic_vector(7 downto 0);
        dump : out std_logic;

        --Keyboard scan signals.
        k  : out std_logic_vector(5 downto 0);
        kr : in  std_logic_vector(1 downto 0);

        --Serial port signals.
        sid  : in    std_logic;
        sod  : out   std_logic;
        oclk : out   std_logic;
        bclk : inout std_logic
        
    );     
end pokey_top;

----------------------------------------------------------------------------------------------------
--                                   --POKEY Top Architecture--                                   --
----------------------------------------------------------------------------------------------------

architecture structural of pokey_top is

    signal dw : std_logic_vector(7 downto 0); --Data being written into the POKEY.

    signal Addr0w : std_logic; --AUDF1
    signal Addr1w : std_logic; --AUDC1
    signal Addr2w : std_logic; --AUDF2
    signal Addr3w : std_logic; --AUDC2
    signal Addr4w : std_logic; --AUDF3
    signal Addr5w : std_logic; --AUDC3
    signal Addr6w : std_logic; --AUDF4
    signal Addr7w : std_logic; --AUDC4
    signal Addr8w : std_logic; --AUDCTL
    signal Addr9w : std_logic; --STIMER
    signal AddrAw : std_logic; --SKRES
    signal AddrBw : std_logic; --POTGO
    signal AddrDw : std_logic; --SEROUT
    signal AddrEw : std_logic; --IRQEN
    signal AddrFw : std_logic; --SKCTLS

    signal Addr0Data : std_logic_vector(7 downto 0); --POT0
    signal Addr1Data : std_logic_vector(7 downto 0); --POT1
    signal Addr2Data : std_logic_vector(7 downto 0); --POT2
    signal Addr3Data : std_logic_vector(7 downto 0); --POT3
    signal Addr4Data : std_logic_vector(7 downto 0); --POT4
    signal Addr5Data : std_logic_vector(7 downto 0); --POT5
    signal Addr6Data : std_logic_vector(7 downto 0); --POT6
    signal Addr7Data : std_logic_vector(7 downto 0); --POT7
    signal Addr8Data : std_logic_vector(7 downto 0); --ALLPOT
    signal Addr9Data : std_logic_vector(7 downto 0); --KBCODE
    signal AddrAData : std_logic_vector(7 downto 0); --RANDOM
    signal AddrDData : std_logic_vector(7 downto 0); --SERIN
    signal AddrEData : std_logic_vector(7 downto 0); --IRQST
    signal AddrFData : std_logic_vector(7 downto 0); --SKSTAT

    signal skctls : std_logic_vector(7 downto 0); --Value stored in SKCTLS register.
    signal init   : std_logic; --Init used for the clock generator and poly core.

    --AUDCTL signals.
    signal sel15Khz    : std_logic;
    signal disHiFltr2  : std_logic;
    signal disHiFltr1  : std_logic;
    signal ch4Bits16   : std_logic;
    signal ch2Bits16   : std_logic;
    signal enFastClk3  : std_logic;
    signal enFastClk1  : std_logic;
    signal sel9bitPoly : std_logic;

    --Clock generator signals.
    signal audClock : std_logic;
    signal keybClk  : std_logic;

    --IRQ core signals.
    signal setBreak    : std_logic;
    signal setKey      : std_logic;
    signal setSdiCompl : std_logic;
    signal setSdoCompl : std_logic;
    signal sdoFinish   : std_logic;
    signal Timer4      : std_logic;
    signal Timer2      : std_logic;
    signal Timer1      : std_logic;
    signal keyOvrun    : std_logic;
    signal sdiOvrun    : std_logic;

    --Poly core signals.
    signal poly4bit    : std_logic;
    signal poly5bit    : std_logic;
    signal poly917bit  : std_logic;

begin

    --Data and address I/O.
    data_address_core_0 : entity work.data_address_core
    port map
    ( 
        clk => phi2,
        RW  => rw, 
        CS0 => cs(0), 
        CS1 => cs(1), 
        D   => d, 
        A   => a, 
        Dw  => dw,

        Addr0w => Addr0w,
        Addr1w => Addr1w,
        Addr2w => Addr2w,
        Addr3w => Addr3w,
        Addr4w => Addr4w,
        Addr5w => Addr5w,
        Addr6w => Addr6w,
        Addr7w => Addr7w,
        Addr8w => Addr8w,
        Addr9w => Addr9w,
        AddrAw => AddrAw,
        AddrBw => AddrBw,
        AddrDw => AddrDw,
        AddrEw => AddrEw,
        AddrFw => AddrFw,

        Addr0Data => Addr0Data,
        Addr1Data => Addr1Data,
        Addr2Data => Addr2Data,
        Addr3Data => Addr3Data,
        Addr4Data => Addr4Data,
        Addr5Data => Addr5Data,
        Addr6Data => Addr6Data,
        Addr7Data => Addr7Data,
        Addr8Data => Addr8Data,
        Addr9Data => Addr9Data,
        AddrAData => AddrAData,
        AddrDData => AddrDData,
        AddrEData => AddrEData,
        AddrFData => AddrFData
    );

    --SKCTLS register.
    SKCTLS_reg_0 : entity work.SKCTLS_reg
    port map
    ( 
        clk    => phi2,
        wren   => AddrFw,
        d      => dw,
        Skctls => skctls,
        Init   => init
    );

    --AUDCTL register.
    AUDCTL_reg_0 : entity work.AUDCTL_reg
    port map
    ( 
        clk         => phi2,
        wren        => Addr8w,
        d           => dw,
        sel15Khz    => sel15Khz,
        disHiFltr2  => disHiFltr2,
        disHiFltr1  => disHiFltr1,
        ch4Bits16   => ch4Bits16,
        ch2Bits16   => ch2Bits16,
        enFastClk3  => enFastClk3,
        enFastClk1  => enFastClk1,
        sel9bitPoly => sel9bitPoly
    );

    --Clock generator core.
    clock_gen_core_0 : entity work.clock_gen_core
    port map
    ( 
        clk      => phi2,
        init     => init,
        sel15Khz => sel15Khz,
        audClock => audClock,
        keybClk  => keybClk
    );
    
    --IRQ core.
    irq_core_0 : entity work.IRQ_core
    port map
    ( 
        clk         => phi2,
        IRQEN       => AddrEw,
        Dw          => dw,
        setBreak    => setBreak,
        setKey      => setKey,
        setSdiCompl => setSdiCompl,
        setSdoCompl => setSdoCompl,
        sdoFinish   => sdoFinish,
        Timer4      => Timer4,
        Timer2      => Timer2,
        Timer1      => Timer1,
        IRQ         => irq,
        Dr          => AddrEData,
        keyOvrun    => keyOvrun,
        sdiOvrun    => sdiOvrun
    );

    --Random number generator core.
    poly_core_0 : entity work.poly_core
    port map
    ( 
        clk         => phi2,
        init        => init,
        sel9bitPoly => sel9bitPoly,
        rndNum      => AddrAData,
        poly4bit    => poly4bit,
        poly5bit    => poly5bit,
        poly917bit  => poly917bit
    );

end structural;
