--Keyboard code module
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                    --Keyboard Code Entity--                                    --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity kb_code is
    port 
    (
        clk     : in std_logic;
        keybClk : in std_logic;
        KR2     : in std_logic;
        Q       : in std_logic_vector(5 downto 0);
        nQ      : in std_logic_vector(5 downto 0);

        enBreak    : out std_logic;
        controlOut : out std_logic;
        shiftOut   : out std_logic;
        K          : out std_logic_vector(5 downto 0)
    );     
end kb_code;

----------------------------------------------------------------------------------------------------
--                                 --Keyboard Code Architecture--                                 --
----------------------------------------------------------------------------------------------------

--Binary decrement with borrow delay.
architecture structural of kb_code is

    signal nKR2      : std_logic;
    signal enControl : std_logic;
    signal enShift   : std_logic;

begin

    process(all)
    begin

        --always update output K values.
        K <= nQ;

        --Control enable(Q = "000000").
        enControl <= not(Q(5) or Q(4) or Q(3) or Q(2) or Q(1) or Q(0) or keybClk);

        --Shift enable(Q = "010000").
        enShift <= not(Q(5) or nQ(4) or Q(3) or Q(2) or Q(1) or Q(0) or keybClk);

        --Break enable(Q = "110000").
        enBreak <= not(nQ(5) or nQ(4) or Q(3) or Q(2) or Q(1) or Q(0) or keybClk);

        --Control and shift output signals.
        nKR2 <= not KR2;

        if(falling_edge(clk)) then
            if(enControl = '1') then
                controlOut <= nKR2;
            end if;

            if(enShift = '1') then
                shiftOut <= nKR2;
            end if;
        end if;

    end process;
end structural;
