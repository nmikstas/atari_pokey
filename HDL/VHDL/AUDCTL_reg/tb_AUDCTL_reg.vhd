--Test bench for the POKEY AUDCTL register.
--Written by Nick Mikstas

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_AUDCTL_reg is
end tb_AUDCTL_reg;

architecture behavioral of tb_AUDCTL_reg is

    constant CLK179MHZ_PERIOD : time := 558.7247666 ns;

    signal clk         : std_logic := '0';
    signal wren        : std_logic := '0';
    signal d           : std_logic_vector(7 downto 0) := "00000000";
    signal sel15Khz    : std_logic;
    signal disHiFltr2  : std_logic;
    signal disHiFltr1  : std_logic;
    signal ch4Bits16   : std_logic;
    signal ch2Bits16   : std_logic;
    signal enFastClk3  : std_logic;
    signal enFastClk1  : std_logic;
    signal sel9bitPoly : std_logic;
    signal q           : std_logic_vector(7 downto 0);

begin

    clk <= NOT clk after CLK179MHZ_PERIOD / 2;

    q <= sel15Khz & disHiFltr2 & disHiFltr1 & ch4Bits16 & ch2Bits16 & enFastClk3 & enFastClk1 & sel9bitPoly;

    AUDCTL_reg_0 : entity work.AUDCTL_reg
    port map
    ( 
        clk         => clk,
        wren        => wren,
        d           => d,
        sel15Khz    => sel15Khz,
        disHiFltr2  => disHiFltr2,
        disHiFltr1  => disHiFltr1,
        ch4Bits16   => ch4Bits16,
        ch2Bits16   => ch2Bits16,
        enFastClk3  => enFastClk3,
        enFastClk1  => enFastClk1,
        sel9bitPoly => sel9bitPoly
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
        d <= "00000100";
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
