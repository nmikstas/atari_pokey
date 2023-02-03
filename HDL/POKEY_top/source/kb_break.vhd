--Keyboard break module
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                   --Keyboard Break Entity--                                    --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity kb_break is
    port 
    (
        clk     : in std_logic;
        enBreak : in std_logic;
        KR2     : in std_logic;

        setBreak : out std_logic
    );     
end kb_break;

----------------------------------------------------------------------------------------------------
--                                --Keyboard Break Architecture--                                 --
----------------------------------------------------------------------------------------------------

--Binary decrement with borrow delay.
architecture structural of kb_break is

    signal muxOut   : std_logic;
    signal qMuxOut  : std_logic;
    signal qLoop    : std_logic;
    signal nqLoop   : std_logic;
    signal qLoop2   : std_logic;
    signal preBreak : std_logic;

begin

    process(all)
    begin

        --Always update mux output.
        if(enBreak = '1') then
            muxOut <= KR2;
        else
            muxOut <= nqLoop;
        end if;

        --loop signals.
        if(rising_edge(clk)) then
            qMuxOut <= muxOut;   
        end if;

        if(falling_edge(clk)) then
            qLoop <= not qMuxOut;
        end if;

        nqLoop <= not qLoop;

        --preBreak logic.
        if(falling_edge(clk)) then
            qLoop2 <= not qMuxOut;
        end if;

        preBreak <= qLoop2 nor muxOut;

        --Output.
        if(falling_edge(clk)) then
            setBreak <= preBreak;
        end if;

    end process;
end structural;
