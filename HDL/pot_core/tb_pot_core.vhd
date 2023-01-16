--Test bench for the POKEY potentiometer core.
--Written by Nick Mikstas

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_pot_core is
end tb_pot_core;

architecture behavioral of tb_pot_core is

    constant CLK179MHZ_PERIOD : time := 558.7247666 ns;

    --Pot scan signals.
    signal clk      : std_logic := '0';
    signal POTGO    : std_logic := '0';
    signal fastScan : std_logic := '0';
    signal p        : std_logic_vector(7 downto 0) := "11111111";  
    
    signal dump   : std_logic;
    signal POT0   : std_logic_vector(7 downto 0);
    signal POT1   : std_logic_vector(7 downto 0);
    signal POT2   : std_logic_vector(7 downto 0);
    signal POT3   : std_logic_vector(7 downto 0);
    signal POT4   : std_logic_vector(7 downto 0);
    signal POT5   : std_logic_vector(7 downto 0);
    signal POT6   : std_logic_vector(7 downto 0);
    signal POT7   : std_logic_vector(7 downto 0);
    signal ALLPOT : std_logic_vector(7 downto 0);

    --Clock gen signals.
    signal init     : std_logic := '0';
    signal sel15Khz : std_logic := '0';
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

    pot_core_0 : entity work.pot_core
    port map
    (
        clk      => clk,
        POTGO    => POTGO,
        fastScan => fastScan,
        keybClk  => keybClk,
        p        => P,
        dump     => dump,
        POT0     => POT0,
        POT1     => POT1,
        POT2     => POT2, 
        POT3     => POT3, 
        POT4     => POT4, 
        POT5     => POT5, 
        POT6     => POT6, 
        POT7     => POT7, 
        ALLPOT   => ALLPOT 
    );    

    process
    begin
        wait for 2000 ns;
        wait until falling_edge(clk);

        init <= '1';
        wait for 10000 ns;
        wait until falling_edge(clk);
        init <= '0';
        
        wait for 3000 ns;
        wait until rising_edge(clk);
        POTGO <= '1';
        wait until rising_edge(clk);
        POTGO <= '0';

        --Fast scan test.
        --wait for 15000 ns;
        --wait until falling_edge(clk);
        --P(3) <= '0';

        --wait for 5000 ns;
        --wait until falling_edge(clk);
        --P(0) <= '0';

        --wait for 7000 ns;
        --wait until falling_edge(clk);
        --P(1) <= '0';

        --wait for 3000 ns;
        --wait until falling_edge(clk);
        --P(2) <= '0';

        --wait for 2500 ns;
        --wait until falling_edge(clk);
        --P(6) <= '0';

        --wait for 5500 ns;
        --wait until falling_edge(clk);
        --P(4) <= '0';

        --wait for 15500 ns;
        --wait until falling_edge(clk);
        --P(7) <= '0';

        --Slow scan test.
        wait for 1500000 ns;
        wait until falling_edge(clk);
        P(5) <= '0';

        wait for 700000 ns;
        wait until falling_edge(clk);
        P(4) <= '0';

        wait for 2500000 ns;
        wait until falling_edge(clk);
        P(0) <= '0';

        wait for 2000000 ns;
        wait until falling_edge(clk);
        P(7) <= '0';

        wait for 1500000 ns;
        wait until falling_edge(clk);
        P(2) <= '0';

        wait for 3000000 ns;
        wait until falling_edge(clk);
        P(6) <= '0';

        wait for 2700000 ns;
        wait until falling_edge(clk);
        P(1) <= '0';

        wait for 1500000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;
