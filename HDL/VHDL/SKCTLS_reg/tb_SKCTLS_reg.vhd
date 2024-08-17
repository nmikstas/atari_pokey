--Test bench for the POKEY SKCTLS register.
--Written by Nick Mikstas

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_SKCTLS_reg is
end tb_SKCTLS_reg;

architecture behavioral of tb_SKCTLS_reg is

    constant CLK179MHZ_PERIOD : time := 558.659 ns;

    signal clk    : std_logic := '0';
    signal wren   : std_logic := '0';
    signal d      : std_logic_vector(7 downto 0) := "00000000";
    signal Skctls : std_logic_vector(7 downto 0);
    signal Init   : std_logic;
    
begin

    clk <= NOT clk after CLK179MHZ_PERIOD / 2;

    SKCTLS_reg_0 : entity work.SKCTLS_reg
    port map
    ( 
        clk    => clk,
        wren   => wren,
        d      => d,
        Skctls => Skctls,
        Init   => Init
    );

    process
    begin
        wait for 2000 ns;
        wait until rising_edge(clk);
        d <= "11110001";
        wait for 100 ns;
        wren <= '1';
        wait until falling_edge(clk);
        wait for 150 ns;
        wren <= '1';
      
        wait for 2000 ns;
        wait until rising_edge(clk);
        d <= "00000000";
        wait for 100 ns;
        wren <= '1';
        wait until falling_edge(clk);
        wait for 150 ns;
        wren <= '1';

        wait for 2000 ns;
        wait until rising_edge(clk);
        d <= "00000011";
        wait for 100 ns;
        wren <= '1';
        wait until falling_edge(clk);
        wait for 150 ns;
        wren <= '1';

        wait for 5000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;
