--Test bench for the POKEY cell23 core.
--Written by Nick Mikstas

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_cell23 is
end tb_cell23;

architecture behavioral of tb_cell23 is

    constant CLK179MHZ_PERIOD : time := 558.7247666 ns;

    signal clk      : std_logic := '0';
    signal P        : std_logic := '0';
    signal en       : std_logic := '0';
    signal Q        : std_logic_vector(7 downto 0);
    signal nQ       : std_logic_vector(7 downto 0);
    signal CR_BOR1  : std_logic_vector(2 downto 0);
    signal nCR_BOR1 : std_logic_vector(2 downto 0);
    signal CR_BOR2  : std_logic_vector(2 downto 0);
    signal nCR_BOR2 : std_logic_vector(2 downto 0);

    signal bor   : std_logic;
    signal count : std_logic;

begin

    clk <= NOT clk after CLK179MHZ_PERIOD / 2;

    ---------- Lower Nibble ----------

    --Bit 0.
    cell23_0 : entity work.cell23
    port map
    ( 
        clk  => clk,
        P    => P,
        CR   => en,
        nCR  => not en,
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
        P    => P,
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
        P    => P,
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
        P    => P,
        CR   => CR_BOR1(2),
        nCR  => nCR_BOR1(2),
        Q    => Q(3),
        nQ   => nQ(3),
        BOR  => open,
        nBOR => open
    );

    ---------- Upper Nibble ----------

    bor <= not((not en) or Q(0) or Q(1) or Q(2) or Q(3));

    --Bit 4.
    cell23_4 : entity work.cell23
    port map
    ( 
        clk  => clk,
        P    => P,
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
        P    => P,
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
        P    => P,
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
        P    => P,
        CR   => CR_BOR2(2),
        nCR  => nCR_BOR2(2),
        Q    => Q(7),
        nQ   => nQ(7),
        BOR  => open,
        nBOR => open
    );

    count <= not((not Q(0)) or (not Q(1)) or Q(2) or (not Q(3)) or (not Q(4)) or Q(5) or Q(6) or Q(7));

    process
    begin
        
        --Reset the decrement counter.
        wait for 2000 ns;
        wait until falling_edge(clk);
        P <= '1';
        wait until falling_edge(clk);
        P <= '0';

        --Enable the decrement counter.
        wait for 2000 ns;
        wait until rising_edge(clk);
        en <= '1';

        wait for 150000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;