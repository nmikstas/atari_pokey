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
        sid   : in  std_logic;
        bclki : in  std_logic;
        bclko : out std_logic;
        sod   : out std_logic;
        oclk  : out std_logic
    );     
end pokey_top;

----------------------------------------------------------------------------------------------------
--                                   --POKEY Top Architecture--                                   --
----------------------------------------------------------------------------------------------------

architecture structural of pokey_top is

    --IO core signals.
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

    signal Data0r : std_logic_vector(7 downto 0); --POT0
    signal Data1r : std_logic_vector(7 downto 0); --POT1
    signal Data2r : std_logic_vector(7 downto 0); --POT2
    signal Data3r : std_logic_vector(7 downto 0); --POT3
    signal Data4r : std_logic_vector(7 downto 0); --POT4
    signal Data5r : std_logic_vector(7 downto 0); --POT5
    signal Data6r : std_logic_vector(7 downto 0); --POT6
    signal Data7r : std_logic_vector(7 downto 0); --POT7
    signal Data8r : std_logic_vector(7 downto 0); --ALLPOT
    signal Data9r : std_logic_vector(7 downto 0); --KBCODE
    signal DataAr : std_logic_vector(7 downto 0); --RANDOM
    signal DataDr : std_logic_vector(7 downto 0); --SERIN
    signal DataEr : std_logic_vector(7 downto 0); --IRQST
    signal DataFr : std_logic_vector(7 downto 0); --SKSTAT

    --SKCTLS signals.
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

    --CLOCK core signals.
    signal audClock : std_logic;
    signal keybClk  : std_logic;

    --POLY core signals.
    signal poly4bit    : std_logic;
    signal poly5bit    : std_logic;
    signal poly917bit  : std_logic;

    --KEY core signals.
    signal setKey   : std_logic;
    signal kShift   : std_logic;
    signal setBreak : std_logic;
    signal keyDown  : std_logic;

    --IRQ core signals.
    signal setSdiCompl : std_logic;
    signal setSdoCompl : std_logic;
    signal sdoFinish   : std_logic;
    signal Timer4      : std_logic;
    signal Timer2      : std_logic;
    signal Timer1      : std_logic;
    signal keyOvrun    : std_logic;
    signal sdiOvrun    : std_logic;

    --SKSTAT register signals.
    signal setFramer : std_logic;
    signal sdiBusy   : std_logic;
    signal siDelay   : std_logic;

    --AUD core signals.
    signal resync2Tones : std_logic;
    signal resyncSerClk : std_logic;

begin

    --Temporarily set unused inputs to a known value.
    setSdiCompl  <= '0';
    setSdoCompl  <= '0';
    sdoFinish    <= '1';
    setFramer    <= '0';
    sdiBusy      <= '0';
    siDelay      <= '0';
    resync2Tones <= '0';
    resyncSerClk <= '0';

    --Data and address I/O.
    IO_core_0 : entity work.IO_core
    port map
    ( 
        clk   => phi2,
        RW    => rw, 
        CS    => cs,  
        D     => d, 
        A     => a, 
        Dataw => dw,
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
        Data0r => Data0r,
        Data1r => Data1r,
        Data2r => Data2r,
        Data3r => Data3r,
        Data4r => Data4r,
        Data5r => Data5r,
        Data6r => Data6r,
        Data7r => Data7r,
        Data8r => Data8r,
        Data9r => Data9r,
        DataAr => DataAr,
        DataDr => DataDr,
        DataEr => DataEr,
        DataFr => DataFr
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

    --Random number generator core.
    poly_core_0 : entity work.poly_core
    port map
    ( 
        clk         => phi2,
        init        => init,
        sel9bitPoly => sel9bitPoly,
        rndNum      => DataAr,
        poly4bit    => poly4bit,
        poly5bit    => poly5bit,
        poly917bit  => poly917bit
    );

    --Potentiometer scanning core.
    pot_core_0 : entity work.pot_core
    port map
    (
        clk      => phi2,
        POTGO    => AddrBw,
        fastScan => skctls(2),
        keybClk  => keybClk,
        p        => p,
        dump     => dump,
        POT0     => Data0r,
        POT1     => Data1r,
        POT2     => Data2r,
        POT3     => Data3r,
        POT4     => Data4r,
        POT5     => Data5r,
        POT6     => Data6r,
        POT7     => Data7r,
        ALLPOT   => Data8r
    );     

    --Keyboard scanning core.
    key_core_0 : entity work.key_core
    port map
    (
        clk      => phi2,
        keybClk  => keybClk,
        KR       => kr,
        SKCTLS   => SKCTLS(1) & SKCTLS(0),
        setKey   => setKey,
        kShift   => kShift,
        setBreak => setBreak,
        keyDown  => keyDown,
        D        => Data9r,
        K        => k
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
        Dr          => DataEr,
        keyOvrun    => keyOvrun,
        sdiOvrun    => sdiOvrun
    );

    --SKSTAT register.
    SKSTAT_0 : entity work.SKSTAT
    port map
    ( 
        clk       => phi2,
        sdiOvrun  => sdiOvrun,
        keyOvrun  => keyOvrun,
        setFramer => setFramer,
        kShift    => kShift,
        keyDown   => keyDown,
        sdiBusy   => sdiBusy,
        siDelay   => siDelay,
        addrAw    => AddrAw,
        Dout      => DataFr
    );

    --AUD core.
    AUD_core_0 : entity work.AUD_core
    port map
    (
        D            => dw,
        clk          => phi2,
        audClock     => audClock,
        poly4In      => poly4bit,
        poly5In      => poly5bit,
        poly17In     => poly917bit,
        enFastClk1   => enFastClk1,
        enFastClk3   => enFastClk3,
        ch2Bits16    => ch2Bits16,
        ch4Bits16    => ch4Bits16,
        disHiFltr1   => disHiFltr1,
        disHiFltr2   => disHiFltr2,
        resync2Tones => resync2Tones,
        resyncSerClk => resyncSerClk,
        Addr0w       => Addr0w,
        Addr1w       => Addr1w,
        Addr2w       => Addr2w,
        Addr3w       => Addr3w,
        Addr4w       => Addr4w,
        Addr5w       => Addr5w,
        Addr6w       => Addr6w,
        Addr7w       => Addr7w,
        Addr9w       => Addr9w,
        AUDOut       => audio,
        Tmr1         => Timer1,
        Tmr2         => Timer2,
        Tmr4         => Timer4
    );     

end structural;
