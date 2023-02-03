library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_SKSTAT is
end tb_SKSTAT;

architecture behavioral of tb_SKSTAT is

    constant CLK179MHZ_PERIOD : time := 558.7247666 ns;

    signal clk       : std_logic := '0';
    signal sdiOvrun  : std_logic := '0';
    signal keyOvrun  : std_logic := '0';
    signal setFramer : std_logic := '0';
    signal kShift    : std_logic := '0';
    signal keyDown   : std_logic := '0';
    signal sdiBusy   : std_logic := '0';
    signal siDelay   : std_logic := '0';
    signal addrAw    : std_logic := '0';
    signal Dout      : std_logic_vector(7 downto 0);

begin

    clk <= NOT clk after CLK179MHZ_PERIOD / 2;

    SKSTAT_0 : entity work.SKSTAT
    port map
    ( 
        clk       => clk,
        sdiOvrun  => sdiOvrun,
        keyOvrun  => keyOvrun,
        setFramer => setFramer,
        kShift    => kShift,
        keyDown   => keyDown,
        sdiBusy   => sdiBusy,
        siDelay   => siDelay,
        addrAw    => addrAw,
        Dout      => Dout
    );

    process
    begin
        wait for 2000 ns;
        wait until rising_edge(clk);
        addrAw <= '1';
        wait until rising_edge(clk);
        addrAw <= '0';

        wait until rising_edge(clk);
        wait until rising_edge(clk);
        sdiOvrun <= '1';
        wait until rising_edge(clk);
        sdiOvrun <= '0';

        wait until rising_edge(clk);
        wait until rising_edge(clk);
        keyOvrun <= '1';
        wait until rising_edge(clk);
        keyOvrun <= '0';

        wait until rising_edge(clk);
        wait until rising_edge(clk);
        setFramer <= '1';
        wait until rising_edge(clk);
        setFramer <= '0';

        wait until rising_edge(clk);
        wait until rising_edge(clk);
        addrAw <= '1';
        wait until rising_edge(clk);
        addrAw <= '0';

        wait until rising_edge(clk);
        wait until rising_edge(clk);
        wait until rising_edge(clk);
        kShift  <= '1';
        keyDown <= '1';
        sdiBusy <= '1';
        siDelay <= '1';

        wait for 2000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;