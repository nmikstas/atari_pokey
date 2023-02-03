--POKEY Keyboard scanner core
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                       --KEY Core Entity--                                      --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity KEY_core is
    port 
    (
        clk     : in std_logic;
        keybClk : in std_logic;
        KR      : in std_logic_vector(2 downto 1);
        SKCTLS  : in std_logic_vector(1 downto 0);
        
        setKey   : out std_logic;
        kShift   : out std_logic;
        setBreak : out std_logic;
        keyDown  : out std_logic;
        D        : out std_logic_vector(7 downto 0);
        K        : out std_logic_vector(5 downto 0)
    );     
end KEY_core;

----------------------------------------------------------------------------------------------------
--                                    --KEY Core Architecture--                                   --
----------------------------------------------------------------------------------------------------

architecture structural of KEY_core is

    signal match     : std_logic;
    signal kbCodeLd  : std_logic;
    signal kbCmpLd   : std_logic;
    signal qkeybClk  : std_logic;
    signal shift     : std_logic;
    signal control   : std_logic;
    signal enBreak   : std_logic;
    signal oQ        : std_logic_vector(5 downto 0);
    signal nQ        : std_logic_vector(5 downto 0);
  
begin

    --State machine module.
    kb_state_0 : entity work.kb_state
    port map
    (
        clk        => clk,
        KR1        => KR(1),
        ndebDis    => SKCTLS(0),
        nkbScanDis => SKCTLS(1),
        keybClk    => keybClk,
        match      => match,
        setKey     => setKey,
        kbCodeLd   => kbCodeLd,
        kbCmpLd    => kbCmpLd,
        qkeybClk   => qkeybClk,
        keyDown    => keyDown
    );

    --Output and shift and control detect module.
    kb_regs_0 : entity work.kb_regs
    port map
    (
        clk        => clk,
        nkbScanDis => SKCTLS(1),
        qkeybClk   => qkeybClk,
        kbCmpLd    => kbCmpLd,
        kbCodeLd   => kbCodeLd,
        shiftIn    => shift,
        controlIn  => control,
        match      => match,
        oQ         => oQ,
        nQ         => nQ,
        D          => D
    );     
    
    --Count, compare and register module.
    kb_code_0 : entity work.kb_code
    port map
    (
        clk        => clk,
        keybClk    => keybClk,
        KR2        => KR(2),
        Q          => oQ,
        nQ         => nQ,
        enBreak    => enBreak,
        controlOut => control,
        shiftOut   => shift,
        K          => K
    );

    --Break detect module.
    kb_break_0 : entity work.kb_break
    port map
    (
        clk      => clk,
        enBreak  => enBreak,
        KR2      => KR(2),
        setBreak => setBreak
    );

    kShift <= shift;

end structural;
