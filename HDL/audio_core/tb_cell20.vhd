--Test bench for the POKEY cell20 core.
--Written by Nick Mikstas

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_cell20 is
end tb_cell20;

architecture behavioral of tb_cell20 is

    constant CLK179MHZ_PERIOD : time := 558.7247666 ns;

    signal clk  : std_logic := '0';
    signal D    : std_logic := '0';
    signal WR   : std_logic := '0';
    signal Ld   : std_logic := '0';
    signal CR   : std_logic := '0';
    signal nCR  : std_logic := '0';
    signal BOR  : std_logic;
    signal nBOR : std_logic;

begin

    clk <= NOT clk after CLK179MHZ_PERIOD / 2;

    cell20_0 : entity work.cell20
    port map
    ( 
        clk  => clk,
        D    => D,
        WR   => WR,
        Ld   => Ld,
        CR   => CR,
        nCR  => nCR,
        BOR  => BOR,
        nBOR => nBOR
    );

    process
    begin
        wait for 2000 ns;
        wait until rising_edge(clk);

        WR <= '1';
        wait until rising_edge(clk);
        WR <= '0';

        wait for 25000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;