--Test bench for the POKEY keyboard counter register core.
--Written by Nick Mikstas

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_keyboard_counter is
end tb_keyboard_counter;

architecture behavioral of tb_keyboard_counter is

    constant CLK179MHZ_PERIOD : time := 558.7247666 ns;

    signal clk      : std_logic := '0';
   
    signal init     : std_logic := '0';
    signal sel15Khz : std_logic := '0';
    signal audClock : std_logic;
    signal keybClk  : std_logic;

    signal R  : std_logic := '0';
    signal Q  : std_logic_vector(5 downto 0);
    signal nQ : std_logic_vector(5 downto 0);

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

    kb_count : entity work.kb_count_reg
    port map
    ( 
        clk => clk,
        T1  => not keybClk,
        nT1 => keybClk,
        R   => R,
        Q   => Q,
        nQ  => nQ
    );

    process
    begin
        wait for 2000 ns;
        wait until falling_edge(clk);
        init <= '1';
        R    <= '1';

        wait for 10000 ns;
        wait until falling_edge(clk);
        init <= '0';
        R    <= '0';
                
        wait for 30000000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;
