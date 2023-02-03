--Cell 4
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                       --Cell 4 Entity--                                        --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cell4 is
    port 
    (
        clk : in std_logic;
        D   : in std_logic;
        Ld  : in std_logic;
        nLd : in std_logic;

        Q : out std_logic;
        C : out std_logic
    );     
end cell4;

----------------------------------------------------------------------------------------------------
--                                    --Cell 4 Architecture--                                     --
----------------------------------------------------------------------------------------------------

--Binary decrement with borrow delay.
architecture structural of cell4 is

    signal en : std_logic;
    signal nQ : std_logic;
    
begin

    process(all)
    begin

        --Flip-flop enable.
        en <= Ld and (not nLd);
       
        --Flip-flop bit compare storage.
        if(rising_edge(clk) and en = '1') then
            Q  <= D;
            nQ <= not D;
        end if;

        --Output compare bit.
        C <= nQ xnor D;
      
    end process;
end structural;
