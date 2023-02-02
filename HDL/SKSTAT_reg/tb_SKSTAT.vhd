library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_test is
end tb_test;

architecture behavioral of tb_test is

    constant CLK179MHZ_PERIOD : time := 558.7247666 ns;

    signal clk       : std_logic := '0';
    signal nsdiOvrun : std_logic := '0';
    signal nkeyOvrun : std_logic := '0';
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
        nsdiOvrun => nsdiOvrun,
        nkeyOvrun => nkeyOvrun,
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
        nsdiOvrun <= '1';
        wait until rising_edge(clk);
        nsdiOvrun <= '0';

        wait until rising_edge(clk);
        wait until rising_edge(clk);
        nkeyOvrun <= '1';
        wait until rising_edge(clk);
        nkeyOvrun <= '0';

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