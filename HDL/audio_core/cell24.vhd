--Cell 24
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                       --Cell 24 Entity--                                       --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cell24 is
    port 
    (
        clk  : in std_logic;
        D    : in std_logic;
        WR   : in std_logic;
        Ld   : in std_logic;
        CR   : in std_logic;
        nCR  : in std_logic;

        BOR  : out std_logic;
        nBOR : out std_logic
    );     
end cell24;

----------------------------------------------------------------------------------------------------
--                                    --Cell 24 Architecture--                                    --
----------------------------------------------------------------------------------------------------

--Binary decrement with borrow delay.
architecture structural of cell24 is

    signal nDout  : std_logic;
    signal muxOut : std_logic;
    signal bt     : std_logic;
    signal nbt    : std_logic;
    signal nor1   : std_logic;
    signal muxSel : std_logic_vector(2 downto 0);

begin

    process(all)
    begin

        --Capture incomming data bit.
        if(falling_edge(clk)) then
            if(WR = '1') then
                nDout <= (not D);
            end if;
        end if;

        --Mux to the input of the decrement flip-flop.
        muxSel <= Ld & CR & nCR;

        if(muxSel = "010") then
            muxout <= nbt;
        elsif(muxSel = "001") then
            muxOut <= bt;
        else
            muxOut <= nDout;
        end if;

        --Decrement flip-flop.
        nbt <= (not bt);

        if(falling_edge(clk)) then
            bt <= muxOut;
        end if;

        --First NOR gate.
        nor1 <= not(Ld or nbt or nCR);

        --Outputs.
        nBOR <= not(Ld or nor1);
        BOR <= nor1;

    end process;
end structural;
