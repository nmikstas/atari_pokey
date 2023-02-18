--Cell 2r
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                        --Cell 2r Entity--                                      --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cell2r is
    port 
    (
        clk : in std_logic;
        D   : in std_logic;
        Ld  : in std_logic;
        nLD : in std_logic;
        R   : in std_logic;

        Q   : out std_logic
    );     
end cell2r;

----------------------------------------------------------------------------------------------------
--                                     --Cell 2r Architecture--                                   --
----------------------------------------------------------------------------------------------------

--Binary decrement with borrow delay.
architecture structural of cell2r is

    signal muxOut : std_logic;
    signal nor1   : std_logic;
    signal nQ     : std_logic;
    signal intQ   : std_logic;
    signal muxSel : std_logic_vector(1 downto 0);
    
begin

    process(all)
    begin

        --MUX output.
        muxSel <= Ld & nLd;
       
        if(muxSel = "01") then
            muxout <= intQ;
        else
            muxOut <= D;
        end if;

        --NOR gate.
       nor1 <= not muxOut;

        --Update stored data bit.
        if(falling_edge(clk)) then
            nQ <= nor1;
        end if;

        --Output and feedback.
        intQ <= R nor nQ;
        Q    <= intQ;

    end process;
end structural;
