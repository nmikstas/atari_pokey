--Test bench for the POKEY keyboard state machine controller.
--Written by Nick Mikstas

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_kb_state is
end tb_kb_state;

architecture behavioral of tb_kb_state is

    constant CLK179MHZ_PERIOD : time := 558.7247666 ns;

    signal clk        : std_logic := '0';
    signal KR1        : std_logic := '1';
    signal match      : std_logic := '0';
    signal setKey     : std_logic;
    signal kbCodeLd   : std_logic;
    signal kbCmpLd    : std_logic;
    signal qkeybClk   : std_logic;
    signal keyDown    : std_logic;

    signal init     : std_logic := '0';
    signal sel15Khz : std_logic := '0';
    signal audClock : std_logic;
    signal keybClk  : std_logic;

begin

    clk <= NOT clk after CLK179MHZ_PERIOD / 2;

    clock_gen_core_0 : entity work.clock_gen_core
    port map
    ( 
        clk      => clk,
        init     => init,
        sel15Khz => sel15Khz,
        audClock => audClock,
        keybClk  => keybClk
    );

    kb_state_0 : entity work.kb_state
    port map
    ( 
        clk        => clk,
        KR1        => KR1,
        ndebDis    => not Init,
        nkbScanDis => not Init,
        keybClk    => keybClk,
        match      => match,
        setKey     => setKey,
        kbCodeLd   => kbCodeLd,
        kbCmpLd    => kbCmpLd,
        qkeybClk   => qkeybClk,
        keyDown    => keyDown
    );

    process
    begin

        --Initialize clock pulse generator core.
        wait for 2000 ns;
        wait until falling_edge(clk);
        init <= '1';
        wait for 10000 ns;
        wait until falling_edge(clk);
        init <= '0';

        --Move to key press debounce state.
        wait for 50000 ns;
        wait until falling_edge(keybClk);
        KR1 <= '0';
        wait until falling_edge(clk);
        KR1 <= '1';

        --Move to waiting for key release state.
        wait until falling_edge(keybClk);
        match <= '1';
        KR1   <= '0';
        wait until falling_edge(clk);
        match <= '0';
        KR1   <= '1';

        --Move to debounce key release state.
        wait until falling_edge(keybClk);
        match <= '1';
        wait until falling_edge(clk);
        match <= '0';

        --Move to waiting for key press state.
        wait until falling_edge(keybClk);
        match <= '1';
        wait until falling_edge(clk);
        match <= '0';
        
        wait for 20000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;
