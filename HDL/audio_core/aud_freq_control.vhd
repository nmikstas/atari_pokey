--Audio frequency control block
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                     --Freq Control Entity--                                    --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aud_freq_control is
    port 
    (
        clk      : in std_logic;
        audClock : in std_logic;
        D        : in std_logic_vector(7 downto 0);

        Addr0w : in std_logic;
        Addr2w : in std_logic;
        Addr4w : in std_logic;
        Addr6w : in std_logic;
        Addr9w : in std_logic;

        enFastClk1 : in std_logic;
        enFastClk3 : in std_logic;

        ch2Bit16 : in std_logic;
        ch4Bit16 : in std_logic;

        resyncTwoTones : in std_logic;
        resyncSerClk   : in std_logic;

        Timer       : out std_logic_vector(4 downto 1);
        nTimer      : out std_logic_vector(4 downto 1);
        rstAudPhase : out std_logic
    );     
end aud_freq_control;

----------------------------------------------------------------------------------------------------
--                                  --Freq Control Architecture--                                 --
----------------------------------------------------------------------------------------------------

architecture structural of aud_freq_control is

    --Multi-bit signals.
    signal nBOR   : std_logic_vector(4 downto 1);
    signal CR     : std_logic_vector(4 downto 1);
    signal nCR    : std_logic_vector(4 downto 1);
    signal cntrLd : std_logic_vector(4 downto 1);

    --Resync signals.
    signal nor1     : std_logic;
    signal nor2     : std_logic;
    signal presync  : std_logic;
    signal resync   : std_logic;
    signal Q2tones  : std_logic;
    signal Qserial  : std_logic;
    signal reload12 : std_logic;
    signal reload34 : std_logic;

    --Channel 1 signals.



    --Channel 2 signals.



    --Channel 3 signals.



    --Channel 4 signals.



begin

    --Channel 1 frequency counter.
    freq_reg_1: entity work.freq_reg
    port map
    (
        clk  => clk,
        D    => D,
        WR   => Addr0W,
        Ld   => cntrLd(1),
        CR   => CR(1),
        nCR  => nCR(1),
        nBOR => nBOR(1)
    ); 

    --Channel 2 frequency counter.
    freq_reg_2: entity work.freq_reg
    port map
    (
        clk  => clk,
        D    => D,
        WR   => Addr2W,
        Ld   => cntrLd(2),
        CR   => CR(2),
        nCR  => nCR(2),
        nBOR => nBOR(2)
    );

    --Channel 3 frequency counter.
    freq_reg_3: entity work.freq_reg
    port map
    (
        clk  => clk,
        D    => D,
        WR   => Addr4W,
        Ld   => cntrLd(3),
        CR   => CR(3),
        nCR  => nCR(3),
        nBOR => nBOR(3)
    );

    --Channel 4 frequency counter.
    freq_reg_4: entity work.freq_reg
    port map
    (
        clk  => clk,
        D    => D,
        WR   => Addr6W,
        Ld   => cntrLd(4),
        CR   => CR(4),
        nCR  => nCR(4),
        nBOR => nBOR(4)
    );

    process(all)
    begin

        --Resync circuitry.
        nor1 <= nor2 nor Addr9w;
        nor2 <= nor1 nor resync;

        if(falling_edge(clk)) then
            presync <= nor1;
        end if;

        if(rising_edge(clk)) then
            rstAudPhase <= not presync;
            resync      <= not presync;
            Q2tones     <= resyncTwoTones;
            Qserial     <= resyncSerClk;
        end if;

        reload12 <= Q2tones or resync;
        reload34 <= Qserial or resync;

        --Channel 1 circuitry.



        --Channel 2 circuitry.



        --Channel 3 circuitry.



        --Channel 4 circuitry.



    end process;
end structural;
