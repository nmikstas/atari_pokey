--Keyboard state machine module
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                    --Keyboard State Entity--                                   --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity kb_state is
    port 
    (
        clk        : in std_logic;
        KR1        : in std_logic;
        ndebDis    : in std_logic;
        nkbScanDis : in std_logic;
        keybClk    : in std_logic;
        match      : in std_logic;

        setKey   : out std_logic;
        kbCodeLd : out std_logic;
        kbCmpLd  : out std_logic;
        qkeybClk : out std_logic;
        keyDown  : out std_logic
    );     
end kb_state;

----------------------------------------------------------------------------------------------------
--                                 --Keyboard State Architecture--                                --
----------------------------------------------------------------------------------------------------

architecture structural of kb_state is

    signal keyD    : std_logic_vector(1 downto 0);
    signal keyQ    : std_logic_vector(1 downto 0);
    signal nLdComp : std_logic;
    signal nLdKbus : std_logic;
    signal iKR1    : std_logic;
    signal debComp : std_logic;
    signal intLd   : std_logic;
  
begin

    --Keyboard control PLA.
    keyboard_pla_0 : entity work.keyboard_pla
    port map
    ( 
        i1 => iKR1,
        i2 => keyQ(0),
        i3 => keyQ(1),
        i4 => debComp,
        o1 => keyD(0),
        o2 => keyD(1),
        o3 => nLdComp,
        o4 => nLdKbus
    );

    --State registers.
    gen: for i in 0 to 1 generate
        cell2p: entity work.cell2p
        port map
        (
            clk => clk,
            D   => keyD(i),
            Ld  => not keybClk,
            nLD => keybClk,
            P   => not nkbScanDis,
            Q   => keyQ(i)
        );
    end generate gen;

    --Debounce enable/disable.
    debComp <= (not ndebDis) nor match;
    
    --Key down status.
    keyDown <= not keyQ(1);

    --KR1 status.
    iKR1 <= not KR1;

    --Keyboard compare register load signal.
    kbCmpLd <= nLdComp nor keybClk;

    --Read data register load signal.
    intLd <= nLdKbus nor keybClk;
    kbCodeLd <= intLd;

    process(all)
    begin

        --setKey interrupt signal.
        if(falling_edge(clk)) then
            setKey <= intLd;
        end if;

        --Delay keyboard by one clock cycle.
        if(falling_edge(clk)) then
            qkeybClk <= keybClk;
        end if;

    end process;
end structural;
