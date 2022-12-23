--Test bench for the POKEY clock generator core.
--Written by Nick Mikstas

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_clock_gen_core is
end tb_clock_gen_core;

architecture behavioral of tb_clock_gen_core is

    constant CLK179MHZ_PERIOD : time := 558.7247666 ns;

    signal clk      : std_logic := '0';
    signal init     : std_logic := '0';
    signal sel15Khz : std_logic := '1';
    signal audClock : std_logic;
    signal keybClk  : std_logic;
    
begin

    clk <= NOT clk after CLK179MHZ_PERIOD / 2;

    clock_gen_core_0 : entity work.clock_gen_core
    port map
    ( 
        clk      => clk,
        init     => init,
        sel15Khz => sel15Khz,
        audClock => audClock,
        keybClk  => keybClk
    );

    process
    begin
        wait for 5000 ns;
        wait until falling_edge(clk);

        init <= '1';
        wait for 20000 ns;
        wait until falling_edge(clk);

        init <= '0';

        wait for 200000 ns;
        wait until falling_edge(clk);
        sel15Khz <= '0';

        wait for 250000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;
