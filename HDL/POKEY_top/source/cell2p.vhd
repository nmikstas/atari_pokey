--Cell 2p
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                       --Cell 2p Entity--                                       --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cell2p is
    port 
    (
        clk : in std_logic;
        D   : in std_logic;
        Ld  : in std_logic;
        nLD : in std_logic;
        P   : in std_logic;

        Q   : out std_logic
    );     
end cell2p;

----------------------------------------------------------------------------------------------------
--                                    --Cell 2p Architecture--                                    --
----------------------------------------------------------------------------------------------------

--Binary decrement with borrow delay.
architecture structural of cell2p is

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
       nor1 <= muxOut nor P;

        --Update stored data bit.
        if(falling_edge(clk)) then
            nQ <= nor1;
        end if;

        --Output and feedback.
        intQ <= not nQ;
        Q    <= intQ;

    end process;
end structural;
