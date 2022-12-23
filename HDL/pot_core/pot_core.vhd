--Potentiometer core
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                  --Potentiometer Core Entity--                                 --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity pot_core is
    port 
    (
        clk      : in std_logic;
        p        : in std_logic_vector(7 downto 0);
        fastScan : in std_logic;
        keybClk  : in std_logic;
        POTGO    : in std_logic;
        ALLPOT   : in std_logic;
        pot0     : in std_logic;
        pot1     : in std_logic;
        pot2     : in std_logic;
        pot3     : in std_logic;
        pot4     : in std_logic;
        pot5     : in std_logic;
        pot6     : in std_logic;
        pot7     : in std_logic;
        dump     : out std_logic;
        Dr       : out std_logic_vector(7 downto 0)
    );     
end pot_core;

----------------------------------------------------------------------------------------------------
--                               --Potentiometer Core Architecture--                              --
----------------------------------------------------------------------------------------------------

architecture structural of pot_core is

    signal potLatch : std_logic_vector(7 downto 0);

begin
    
    process(all)
    begin

        --Capture the status of the pots.
        if falling_edge(clk) then
            potLatch <= not p;
        end if;

    end process;

end structural;
