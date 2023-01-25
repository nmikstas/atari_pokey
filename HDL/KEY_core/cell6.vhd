--Cell 6
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                       --Cell 6 Entity--                                        --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cell6 is
    port 
    (
        clk : in std_logic;
        T2  : in std_logic;
        nT2 : in std_logic;
        R   : in std_logic;

        T1  : out std_logic;
        nT1 : out std_logic;
        Q   : out std_logic;
        nQ  : out std_logic
    );     
end cell6;

----------------------------------------------------------------------------------------------------
--                                    --Cell 6 Architecture--                                     --
----------------------------------------------------------------------------------------------------

--Binary decrement with borrow delay.
architecture structural of cell6 is

    signal muxOut : std_logic;
    signal Din    : std_logic;
    signal intQ   : std_logic;
    signal nintQ  : std_logic;
    signal norIn1 : std_logic;
    signal norIn2 : std_logic;
    signal intT1  : std_logic;
    signal muxSel : std_logic_vector(1 downto 0);

begin

    process(all)
    begin

        --Always update the outputs.
        T1  <= intT1;
        nT1 <= not intT1;
        Q   <= intQ;
        nQ  <= nintQ;

        --Combine T2 and nT2 into a single signal;
        muxSel <= T2 & nT2;

        --Always update mux output.
        if(muxSel = "01") then
            muxout <= nintQ;
        else
            muxOut <= intQ;
        end if;

        --Update the data NOR.
        Din <= muxOut nor R;

        --Update stored data bit.
        if(rising_edge(clk)) then
            intQ  <= Din;
            nintQ <= not Din;
        end if;

        --Update output flip-flops.
        if(falling_edge(clk)) then
            norIn1 <= nT2;
            norIn2 <= intQ;
        end if;

        --Output NOR gate.
        intT1 <= norIn1 nor norIn2;
    end process;
end structural;
