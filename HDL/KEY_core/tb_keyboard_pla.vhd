--Test bench for the POKEY keyboardPLA register.
--Written by Nick Mikstas

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_keyboard_pla is
end tb_keyboard_pla;

architecture behavioral of tb_keyboard_pla is

    signal inBus : std_logic_vector(3 downto 0) := x"0";
    
    signal o1 : std_logic;
    signal o2 : std_logic;
    signal o3 : std_logic;
    signal o4 : std_logic;

begin

    keyboard_pla_0 : entity work.keyboard_pla
    port map
    ( 
        i1 => inBus(0),
        i2 => inBus(1),
        i3 => inBus(2),
        i4 => inBus(3),
        o1 => o1,
        o2 => o2,
        o3 => o3,
        o4 => o4
    );

    process
    begin

        wait for 1000 ns;
        inBus <= "0001";

        wait for 1000 ns;
        inBus <= x"2";

        wait for 1000 ns;
        inBus <= x"3";

        wait for 1000 ns;
        inBus <= x"4";

        wait for 1000 ns;
        inBus <= x"5";

        wait for 1000 ns;
        inBus <= x"6";

        wait for 1000 ns;
        inBus <= x"7";

        wait for 1000 ns;
        inBus <= x"8";

        wait for 1000 ns;
        inBus <= x"9";

        wait for 1000 ns;
        inBus <= x"A";

        wait for 1000 ns;
        inBus <= x"B";

        wait for 1000 ns;
        inBus <= x"C";

        wait for 1000 ns;
        inBus <= x"D";

        wait for 1000 ns;
        inBus <= x"E";

        wait for 1000 ns;
        inBus <= x"F";

        wait for 1000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;
