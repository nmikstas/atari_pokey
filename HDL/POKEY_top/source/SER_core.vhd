--Serial core module
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                     --Serial Core Entity--                                     --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SER_core is 
    port 
    (
        Dw      : in std_logic_vector(7 downto 0);
        SKCTLS  : in std_logic_vector(7 downto 3);
        clk     : in std_logic;
        SID     : in std_logic;
        AddrDw  : in std_logic;
        Init    : in std_logic;
        Timer1  : in std_logic;
        Timer2  : in std_logic;
        Timer4  : in std_logic;
        BCLK_in : in std_logic;

        BCLK_out     : out std_logic;
        OCLK         : out std_logic;
        SOD          : out std_logic;
        siDelay      : out std_logic;
        setFramerr   : out std_logic;
        setSdiCompl  : out std_logic;
        sdiBusy      : out std_logic;
        resyncSerClk : out std_logic;
        resync2Tones : out std_logic;
        sdoFinish    : out std_logic;
        setSdoCompl  : out std_logic;
        Dr           : out std_logic_vector(7 downto 0)
    );     
end SER_core;

----------------------------------------------------------------------------------------------------
--                                  --Serial Core Architecture--                                  --
----------------------------------------------------------------------------------------------------

architecture structural of SER_core is

    signal sdiClock : std_logic;
    signal sdoClock : std_logic;

begin

    --Serial clock generator and router.
    ser_clock_gen_0 : entity work.SER_clock_gen
    port map
    ( 
        clk          => clk,
        SKCTLS       => SKCTLS(6 downto 4),
        resyncSerClk => resyncSerClk,
        Timer2       => Timer2,
        Timer4       => Timer1,
        BCLK_in      => BCLK_in,
        BCLK_out     => BCLK_out,
        sdiClock     => sdiClock,
        sdoClock     => sdoClock,
        OCLK         => OCLK
    );

    --Serial out module.
    serout_0 : entity work.SEROUT
    port map
    ( 
        clk            => clk,
        D              => Dw,
        AddrDw         => AddrDw,
        Init           => Init,
        sdoClock       => sdoClock,
        SKCTLS7        => SKCTLS(7),
        SKCTLS3        => SKCTLS(3),
        Timer1         => Timer1,
        Timer2         => Timer2,
        resync2Tones   => resync2Tones,
        sdoFinish      => sdoFinish,
        setSdoComplete => setSdoCompl,
        SOD            => SOD
    );

    --Serial in module.
    serin_0 : entity work.SERIN
    port map
    (
        clk            => clk,
        SID            => SID,
        Init           => Init,
        SKCTLS4        => SKCTLS(4),
        sdiClock       => sdiClock,
        D              => Dr,
        siDelay        => siDelay,
        setFramerr     => setFramerr,
        setSdiCompl    => setSdiCompl,
        sdiBusy        => sdiBusy,
        resyncSerClock => resyncSerClk
    ); 
 
end structural;