--Cell 23
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                       --Cell 23 Entity--                                       --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cell23 is
    port 
    (
        clk : in std_logic;
        P   : in std_logic;
        CR  : in std_logic;
        nCR : in std_logic;

        Q    : out std_logic;
        nQ   : out std_logic;
        BOR  : out std_logic;
        nBOR : out std_logic
    );     
end cell23;

----------------------------------------------------------------------------------------------------
--                                    --Cell 23 Architecture--                                    --
----------------------------------------------------------------------------------------------------

architecture structural of cell23 is

    signal muxSel : std_logic_vector(1 downto 0);
    signal muxOut : std_logic;
    signal Qout   : std_logic;
    signal nnQ    : std_logic;
    signal or1    : std_logic;
    signal nor1   : std_logic;
    
begin

    process(all)
    begin

        --Assign output signals.
        Q    <= or1;
        nQ   <= nnQ;
        BOR  <= nor1;
        nBOR <= not nor1;

        --Inverse value of the data stored in the flip-flop.
        nnQ <= not or1;

        --Mux to the input of the decrement flip-flop.
        muxSel <= CR & nCR;
        if(muxSel = "01") then
            muxOut <= or1;
        else
            muxOut <= nnQ;
        end if;

        --Decrement flip-flop
        if(rising_edge(clk)) then
            Qout <= muxOut;
        end if;

        --Preset ORed with output of flip-flop.
        or1 <= Qout or P;

        --Borrow output.
        nor1 <= nCR nor or1;

    end process;
end structural;