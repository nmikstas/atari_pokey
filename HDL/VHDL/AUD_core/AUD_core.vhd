--Audio core
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                      --Audio Core Entity--                                     --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AUD_core is
    port 
    (
        D            : in std_logic_vector(7 downto 0);
        clk          : in std_logic;
        audClock     : in std_logic;
        poly4In      : in std_logic;
        poly5In      : in std_logic;
        poly17In     : in std_logic;
        enFastClk1   : in std_logic;
        enFastClk3   : in std_logic;
        ch2Bits16    : in std_logic;
        ch4Bits16    : in std_logic;
        disHiFltr1   : in std_logic;
        disHiFltr2   : in std_logic;
        resync2Tones : in std_logic;
        resyncSerClk : in std_logic;
        Addr0w       : in std_logic;
        Addr1w       : in std_logic;
        Addr2w       : in std_logic;
        Addr3w       : in std_logic;
        Addr4w       : in std_logic;
        Addr5w       : in std_logic;
        Addr6w       : in std_logic;
        Addr7w       : in std_logic;
        Addr9w       : in std_logic;

        AUDOut : out std_logic_vector(5 downto 0);
        Tmr1   : out std_logic;
        Tmr2   : out std_logic;
        Tmr4   : out std_logic
    );     
end AUD_core;

----------------------------------------------------------------------------------------------------
--                                   --Audio Core Architecture--                                  --
----------------------------------------------------------------------------------------------------

architecture structural of AUD_core is

    --Audio frequency control signals.
    signal Timer       : std_logic_vector(4 downto 1);
    signal nTimer      : std_logic_vector(4 downto 1);
    signal rstAudPhase : std_logic;

    --Polynomial delay chain.
    signal poly4  : std_logic_vector(3 downto 1);
    signal poly5  : std_logic_vector(3 downto 1);
    signal poly17 : std_logic_vector(3 downto 1);

    --Audio addition signals.
    signal AUD1  : std_logic_vector(3 downto 0);
    signal AUD2  : std_logic_vector(3 downto 0);
    signal AUD3  : std_logic_vector(3 downto 0);
    signal AUD4  : std_logic_vector(3 downto 0);
    signal AUD12 : unsigned(4 downto 0);
    signal AUD34 : unsigned(4 downto 0);

begin

    aud_freq_control_0 : entity work.aud_freq_control
    port map
    ( 
        clk            => clk,
        audClock       => audClock,
        D              => D,
        Addr0w         => Addr0w,
        Addr2w         => Addr2w,
        Addr4w         => Addr4w,
        Addr6w         => Addr6w,
        Addr9w         => Addr9w,
        enFastClk1     => enFastClk1,
        enFastClk3     => enFastClk3,
        ch2Bits16      => ch2Bits16,
        ch4Bits16      => ch4Bits16,
        resyncTwoTones => resync2Tones,
        resyncSerClk   => resyncSerClk,
        Timer          => Timer,
        nTimer         => nTimer,
        rstAudPhase    => rstAudPhase
    );

    --Channel 1 audio control.
    aud_control_1 : entity work.aud_control_hp
    port map
    (
        clk         => clk,
        D           => D,
        AUDC        => Addr1w,
        poly4In     => poly4In,
        poly5In     => poly5In,
        poly17In    => poly17In,
        Timer       => Timer(1),
        nTimer      => nTimer(1),
        rstAudPhase => rstAudPhase,
        disHiFltr   => disHiFltr1,
        Timerx      => nTimer(3),
        AUD         => AUD1,
        poly4Out    => poly4(1),
        poly5Out    => poly5(1),
        poly17Out   => poly17(1)
    );

    --Channel 2 audio control.
    aud_control_2 : entity work.aud_control_hp
    port map
    (
        clk         => clk,
        D           => D,
        AUDC        => Addr3w,
        poly4In     => poly4(1),
        poly5In     => poly5(1),
        poly17In    => poly17(1),
        Timer       => Timer(2),
        nTimer      => nTimer(2),
        rstAudPhase => rstAudPhase,
        disHiFltr   => disHiFltr2,
        Timerx      => nTimer(4),
        AUD         => AUD2,
        poly4Out    => poly4(2),
        poly5Out    => poly5(2),
        poly17Out   => poly17(2)
    );

    --Channel 3 audio control.
    aud_control_3 : entity work.aud_control
    port map
    (
        clk         => clk,
        D           => D,
        AUDC        => Addr5w,
        poly4In     => poly4(2),
        poly5In     => poly5(2),
        poly17In    => poly17(2),
        Timer       => Timer(3),
        nTimer      => nTimer(3),
        rstAudPhase => rstAudPhase,
        AUD         => AUD3,
        poly4Out    => poly4(3),
        poly5Out    => poly5(3),
        poly17Out   => poly17(3)
    );

    --Channel 4 audio control.
    aud_control_4 : entity work.aud_control
    port map
    (
        clk         => clk,
        D           => D,
        AUDC        => Addr7w,
        poly4In     => poly4(3),
        poly5In     => poly5(3),
        poly17In    => poly17(3),
        Timer       => Timer(4),
        nTimer      => nTimer(4),
        rstAudPhase => rstAudPhase,
        AUD         => AUD4,
        poly4Out    => open,
        poly5Out    => open,
        poly17Out   => open
    );

    --Assign output timer signals.
    Tmr1 <= Timer(1);
    Tmr2 <= Timer(2);
    Tmr4 <= Timer(4);

    process(all)
    begin
        --Add all the audio channels together.
        if(rising_edge(clk)) then
            AUD12  <= unsigned('0' & AUD1) + unsigned('0' & AUD2);  
            AUD34  <= unsigned('0' & AUD3) + unsigned('0' & AUD4);    
            AUDOut <= std_logic_vector(('0' & AUD34) + ('0' & AUD12));
        end if;
    end process;
end structural;