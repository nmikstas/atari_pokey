--AUDCTL Register
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                   --AUDCTL Register Entity--                                   --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity AUDCTL_reg is
    port 
    (
        clk         : in  std_logic;
        wren        : in  std_logic;
	d           : in  std_logic_vector(7 downto 0);
        sel15Khz    : out std_logic;
        disHiFltr2  : out std_logic;
        disHiFltr1  : out std_logic;
        ch4Bits16   : out std_logic;
        ch2Bits16   : out std_logic;
        enFastClk3  : out std_logic;
        enFastClk1  : out std_logic;
        sel9bitPoly : out std_logic
    );     
end AUDCTL_reg;

----------------------------------------------------------------------------------------------------
--                                --AUDCTL Register Architecture--                                --
----------------------------------------------------------------------------------------------------

architecture structural of AUDCTL_reg is
begin

    process(all)
    begin
        if falling_edge(clk) and (wren = '1') then
            sel15Khz    <= d(0);
            disHiFltr2  <= not d(1);
            disHiFltr1  <= not d(2);
            ch4Bits16   <= d(3);
            ch2Bits16   <= d(4);
            enFastClk3  <= d(5);
            enFastClk1  <= d(6);
            sel9bitPoly <= d(7);
        end if;   
    end process;

end structural;
