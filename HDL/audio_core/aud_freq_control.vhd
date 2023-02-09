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

        ch2Bits16 : in std_logic;
        ch4Bits16 : in std_logic;

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
    signal nBOR      : std_logic_vector(4 downto 1);
    signal CR        : std_logic_vector(4 downto 1);
    signal nCR       : std_logic_vector(4 downto 1);
    signal cntrLd    : std_logic_vector(4 downto 1);
    signal Qbor      : std_logic_vector(4 downto 1);
    signal norb      : std_logic_vector(4 downto 1);
    signal mux       : std_logic_vector(4 downto 1);

    signal intTimer  : std_logic_vector(4 downto 1);
    signal intnTimer : std_logic_vector(4 downto 1);

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
    signal Qr12_1 : std_logic;
    signal Qmux1  : std_logic;

    --Channel 2 signals.
    signal Qr12_2 : std_logic;
    signal Qb2    : std_logic;
    
    --Channel 3 signals.
    signal Qr34_3 : std_logic;
    signal Qmux3  : std_logic;

    --Channel 4 signals.
    signal Qr34_4 : std_logic;
    signal Qb4    : std_logic;
    
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

    --Always update the timers.
    intTimer <= not intnTimer;

    --Assign internal signals to outputs.
    Timer  <= intTimer;
    nTimer <= intnTimer;

    process(all)
    begin

        --Capture borrow signal.
        if(rising_edge(clk)) then
            Qbor <= nBOR;
        end if;

        --Generate timer signal.
        if(falling_edge(clk)) then
            intnTimer <= not norb;
        end if;

        ------------------------------------- Resync Circuitry -------------------------------------
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

        ----------------------------------- Channel 1 Circuitry ------------------------------------
  
        --Update the MUX.
        if(ch2Bits16 = '0') then
            mux(1) <= norb(1);
        else
            mux(1) <= norb(2);
        end if;

        --Carry assignment.
        nCR(1) <= not(enFastClk1 or audClock or cntrLd(1));
        CR(1)  <= nCR(1) nor cntrLd(1);

        --Borrow/load circuits.
        norb(1) <= Qbor(1) nor reload12;
        
        if(falling_edge(clk)) then
            Qr12_1 <= reload12;
            Qmux1  <= mux(1);
        end if;

        cntrLd(1) <= Qr12_1 or Qmux1;

        ----------------------------------- Channel 2 Circuitry ------------------------------------

        --Update the MUX.
        if(ch2Bits16 = '0') then
            mux(2) <= audClock;
        else
            mux(2) <= intTimer(1);
        end if;

        --Carry assignment.
        nCR(2) <= mux(2) nor cntrLd(2);
        CR(2)  <= nCR(2) nor cntrLd(2);

        --Borrow/load circuits.
        norb(2) <= Qbor(2) nor reload12;

        if(falling_edge(clk)) then
            Qr12_2 <= reload12;
            Qb2    <= norb(2);
        end if;

        cntrLd(2) <= Qr12_2 or Qb2;

        ----------------------------------- Channel 3 Circuitry ------------------------------------

        --Update the MUX.
        if(ch4Bits16 = '0') then
            mux(3) <= norb(3);
        else
            mux(3) <= norb(4);
        end if;

        --Carry assignment.
        nCR(3) <= not(enFastClk3 or audClock or cntrLd(3));
        CR(3)  <= nCR(3) nor cntrLd(3);

        --Borrow/load circuits.
        norb(3) <= Qbor(3) nor reload34;

        if(falling_edge(clk)) then
            Qr34_3 <= reload34;
            Qmux3  <= mux(3);
        end if;

        cntrLd(3) <= Qr34_3 or Qmux3;

        ----------------------------------- Channel 4 Circuitry ------------------------------------

        --Update the MUX.
        if(ch4Bits16 = '0') then
            mux(4) <= audClock;
        else
            mux(4) <= intTimer(3);
        end if;

        --Carry assignment.
        nCR(4) <= mux(4) nor cntrLd(4);
        CR(4)  <= nCR(4) nor cntrLd(4);

        --Borrow/load circuits.
        norb(4) <= Qbor(4) nor reload34;

        if(falling_edge(clk)) then
            Qr34_4 <= reload34;
            Qb4    <= norb(4);
        end if;

        cntrLd(4) <= Qr34_4 or Qb4;

    end process;
end structural;
