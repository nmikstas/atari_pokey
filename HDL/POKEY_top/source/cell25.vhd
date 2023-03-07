--Cell 25
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                       --Cell 25 Entity--                                       --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cell25 is 
    port 
    (
        clk   : in  std_logic;
        Shift : in  std_logic;
        D     : in  std_logic;
        Q     : out std_logic
    );     
end cell25;

----------------------------------------------------------------------------------------------------
--                                    --Cell 25 Architecture--                                    --
----------------------------------------------------------------------------------------------------

architecture structural of cell25 is

    signal QShift : std_logic;
    signal and1   : std_logic;
    signal Qint   : std_logic;
    signal mux1   : std_logic;
    
begin
    process(all)
    begin
       
        --Always update the output.
        Q <= Qint;

        --Edge detector.
        if(falling_edge(clk)) then
            QShift <= Shift;
        end if;

        and1 <= Shift and (not QShift);

        --Shift cell.
        if(and1 = '1') then
            mux1 <= D;
        else
            mux1 <= Qint;
        end if;

        if(rising_edge(clk)) then
            Qint <= mux1;
        end if;

    end process;
end structural;