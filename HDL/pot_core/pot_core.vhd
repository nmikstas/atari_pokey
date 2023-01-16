--Potentiometer scanner core
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                      --Pot Core Entity--                                       --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pot_core is
    port 
    (
        clk      : in std_logic;
        POTGO    : in std_logic;
        fastScan : in std_logic;
        keybClk  : in std_logic;
        p        : in std_logic_vector(7 downto 0);
        
        dump   : out std_logic;
        POT0   : out std_logic_vector(7 downto 0);
        POT1   : out std_logic_vector(7 downto 0);
        POT2   : out std_logic_vector(7 downto 0);
        POT3   : out std_logic_vector(7 downto 0);
        POT4   : out std_logic_vector(7 downto 0);
        POT5   : out std_logic_vector(7 downto 0);
        POT6   : out std_logic_vector(7 downto 0);
        POT7   : out std_logic_vector(7 downto 0);
        ALLPOT : out std_logic_vector(7 downto 0)
    );     
end pot_core;

----------------------------------------------------------------------------------------------------
--                                   --Pot Core Architecture--                                    --
----------------------------------------------------------------------------------------------------

architecture structural of pot_core is

    --Upper decrement counter signals.
    signal nkClk   : std_logic;
    signal Qnk     : std_logic;
    signal Qsk     : std_logic;
    signal nPotClk : std_logic;

    --Lower decrement counter signals.
    signal nor1      : std_logic := '1';
    signal nor2      : std_logic := '0';
    signal potPreset : std_logic := '0';
    signal delay1    : std_logic := '0';
    signal delay2    : std_logic := '0';
    signal nor3      : std_logic := '1';
    signal nor4      : std_logic := '0';
    signal Qnor3     : std_logic := '1';
    signal Qnor4     : std_logic := '0';
    signal Qcount    : std_logic := '0';
    signal Qdelay2   : std_logic;
    signal nQnor4    : std_logic;
    signal Qdump1    : std_logic;
    signal Qdump2    : std_logic;

    --Pot load signals.
    signal nQp : std_logic_vector(7 downto 0);
    signal Ld  : std_logic_vector(7 downto 0);
    
    --Decrement counter signals.
    signal Q         : std_logic_vector(7 downto 0);
    signal nQ        : std_logic_vector(7 downto 0);
    signal CR_BOR1   : std_logic_vector(2 downto 0);
    signal nCR_BOR1  : std_logic_vector(2 downto 0);
    signal CR_BOR2   : std_logic_vector(2 downto 0);
    signal nCR_BOR2  : std_logic_vector(2 downto 0);

    signal bor   : std_logic;
    signal count : std_logic;

begin

    ----------- Decrement Counter Lower Nibble ----------

    --Bit 0.
    cell23_0 : entity work.cell23
    port map
    ( 
        clk  => clk,
        P    => potPreset,
        CR   => not nPotClk,
        nCR  => nPotClk,
        Q    => Q(0),
        nQ   => nQ(0),
        BOR  => CR_BOR1(0),
        nBOR => nCR_BOR1(0)
    );

    --Bit 1.
    cell23_1 : entity work.cell23
    port map
    ( 
        clk  => clk,
        P    => potPreset,
        CR   => CR_BOR1(0),
        nCR  => nCR_BOR1(0),
        Q    => Q(1),
        nQ   => nQ(1),
        BOR  => CR_BOR1(1),
        nBOR => nCR_BOR1(1)
    );

    --Bit 2.
    cell23_2 : entity work.cell23
    port map
    ( 
        clk  => clk,
        P    => potPreset,
        CR   => CR_BOR1(1),
        nCR  => nCR_BOR1(1),
        Q    => Q(2),
        nQ   => nQ(2),
        BOR  => CR_BOR1(2),
        nBOR => nCR_BOR1(2)
    );

    --Bit 3.
    cell23_3 : entity work.cell23
    port map
    ( 
        clk  => clk,
        P    => potPreset,
        CR   => CR_BOR1(2),
        nCR  => nCR_BOR1(2),
        Q    => Q(3),
        nQ   => nQ(3),
        BOR  => open,
        nBOR => open
    );

    --Carry/borrow signal.
    bor <= not(nPotClk or Q(0) or Q(1) or Q(2) or Q(3));

    ---------- Decrement Counter Upper Nibble ----------

    --Bit 4.
    cell23_4 : entity work.cell23
    port map
    ( 
        clk  => clk,
        P    => potPreset,
        CR   => bor,
        nCR  => not bor,
        Q    => Q(4),
        nQ   => nQ(4),
        BOR  => CR_BOR2(0),
        nBOR => nCR_BOR2(0)
    );

    --Bit 5.
    cell23_5 : entity work.cell23
    port map
    ( 
        clk  => clk,
        P    => potPreset,
        CR   => CR_BOR2(0),
        nCR  => nCR_BOR2(0),
        Q    => Q(5),
        nQ   => nQ(5),
        BOR  => CR_BOR2(1),
        nBOR => nCR_BOR2(1)
    );

    --Bit 6.
    cell23_6 : entity work.cell23
    port map
    ( 
        clk  => clk,
        P    => potPreset,
        CR   => CR_BOR2(1),
        nCR  => nCR_BOR2(1),
        Q    => Q(6),
        nQ   => nQ(6),
        BOR  => CR_BOR2(2),
        nBOR => nCR_BOR2(2)
    );

    --Bit 7.
    cell23_7 : entity work.cell23
    port map
    ( 
        clk  => clk,
        P    => potPreset,
        CR   => CR_BOR2(2),
        nCR  => nCR_BOR2(2),
        Q    => Q(7),
        nQ   => nQ(7),
        BOR  => open,
        nBOR => open
    );

    --Count complete signal.
    count <= not((not Q(0)) or (not Q(1)) or Q(2) or (not Q(3)) or (not Q(4)) or Q(5) or Q(6) or Q(7));

    process(all)
    begin

        ---------- Upper decrement counter logic ----------

        --Inverted keyboard clock.
        nkClk <= not keybClk;
        
        --Upper flip-flops.
        if(rising_edge(clk)) then
            Qnk <= nkClk;
            Qsk <= fastScan;
        end if;
    
        --Pot clock generation logic.
        nPotClk <= Qnk nor Qsk;

        ---------- Lower decrement counter logic ----------

        --POTGO latch.
        nor1 <= POTGO nor nor2;
        nor2 <= delay2 nor nor1;

        --POTGO delay line.
        if(falling_edge(clk)) then
            potPreset <= not nor1;
            delay1    <= potPreset;
            delay2    <= delay1;
        end if;

        --Dump latch.
        if(rising_edge(clk)) then
            Qnor3   <= nor3;
            Qdelay2 <= delay2;
        end if;

        if(falling_edge(clk)) then
            Qcount <= count;
            Qnor4  <= nor4;
        end if;

        nor3 <= Qcount nor Qnor4;
        nor4 <= Qdelay2 nor Qnor3;

        --Dump control logic.
        if(falling_edge(clk)) then
            nQnor4 <= not nor4;
        end if;

        if(rising_edge(clk)) then
            Qdump1 <= nQnor4;
            Qdump2 <= fastScan;
        end if;

        dump <= Qdump1 nor Qdump2;

        ---------- Pot load signals ----------

        --Enable in flip-flop.
        if(rising_edge(clk)) then
            nQp <= not p;
        end if;

        Ld(0) <= nQp(0) nor nor4;
        Ld(1) <= nQp(1) nor nor4;
        Ld(2) <= nQp(2) nor nor4;
        Ld(3) <= nQp(3) nor nor4;
        Ld(4) <= nQp(4) nor nor4;
        Ld(5) <= nQp(5) nor nor4;
        Ld(6) <= nQp(6) nor nor4;
        Ld(7) <= nQp(7) nor nor4;

        --Potentiometer count and status registers.
        if(falling_edge(clk) and Ld(0) = '1') then
            POT0 <= nQ;
        end if;
        if(falling_edge(clk) and Ld(1) = '1') then
            POT1 <= nQ;
        end if;
        if(falling_edge(clk) and Ld(2) = '1') then
            POT2 <= nQ;
        end if;
        if(falling_edge(clk) and Ld(3) = '1') then
            POT3 <= nQ;
        end if;
        if(falling_edge(clk) and Ld(4) = '1') then
            POT4 <= nQ;
        end if;
        if(falling_edge(clk) and Ld(5) = '1') then
            POT5 <= nQ;
        end if;
        if(falling_edge(clk) and Ld(6) = '1') then
            POT6 <= nQ;
        end if;
        if(falling_edge(clk) and Ld(7) = '1') then
            POT7 <= nQ;
        end if;
        if(falling_edge(clk)) then
            ALLPOT <= Ld;
        end if;
    end process;
end structural;