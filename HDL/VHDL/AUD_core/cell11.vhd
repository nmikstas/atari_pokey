--Cell 11
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                       --Cell 11 Entity--                                       --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cell11 is
    port 
    (
        V : in std_logic_vector(3 downto 0);
        T : in std_logic;
        I : in std_logic;

        O : out std_logic_vector(3 downto 0)
    );     
end cell11;

----------------------------------------------------------------------------------------------------
--                                    --Cell 11 Architecture--                                    --
----------------------------------------------------------------------------------------------------

architecture structural of cell11 is

    signal m : std_logic;

begin

    m <= T nor I;
    O(0) <= V(0) nor m;
    O(1) <= V(1) nor m;
    O(2) <= V(2) nor m;
    O(3) <= V(3) nor m;
    
end structural;