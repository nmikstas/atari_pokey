--SKCTLS Register
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                   --SKCTLS Register Entity--                                   --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SKCTLS_reg is
    port 
    (
        clk    : in  std_logic;
        wren   : in  std_logic;
	d      : in  std_logic_vector(7 downto 0);
        Skctls : out std_logic_vector(7 downto 0);
        Init   : out std_logic
    );     
end SKCTLS_reg;

----------------------------------------------------------------------------------------------------
--                                --SKCTLS Register Architecture--                                --
----------------------------------------------------------------------------------------------------

architecture structural of SKCTLS_reg is
begin

    process(all)
    begin
        if falling_edge(clk) and (wren = '1') then
            Skctls <= d;
        end if;

        Init <= Skctls(0) nor Skctls(1);
   
    end process;

end structural;
