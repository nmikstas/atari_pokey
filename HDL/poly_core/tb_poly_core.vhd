--Test bench for the POKEY polynomial core.
--Written by Nick Mikstas

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_poly_core is
end tb_poly_core;

architecture behavioral of tb_poly_core is

    constant CLK179MHZ_PERIOD : time := 558.7247666 ns;

    signal clk         : std_logic := '0';
    signal init        : std_logic := '0';
    signal sel9bitPoly : std_logic := '0';
    signal rndNum      : std_logic_vector(7 downto 0);
    signal poly4bit    : std_logic;
    signal poly5bit    : std_logic;
    signal poly917bit  : std_logic;
    
begin

    clk <= NOT clk after CLK179MHZ_PERIOD / 2;

    poly_core_0 : entity work.poly_core
    port map
    ( 
        clk         => clk,
        init        => init,
        sel9bitPoly => sel9bitPoly,
        rndNum      => rndNum,
        poly4bit    => poly4bit,
        poly5bit    => poly5bit,
        poly917bit  => poly917bit
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
        sel9bitPoly <= '1';

        wait for 250000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;