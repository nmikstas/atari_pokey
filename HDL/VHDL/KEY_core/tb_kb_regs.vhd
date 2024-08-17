--Test bench for the POKEY keyboard count, compare and register controller.
--Written by Nick Mikstas

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_kb_regs is
end tb_kb_regs;

architecture behavioral of tb_kb_regs is

    constant CLK179MHZ_PERIOD : time := 558.7247666 ns;

    signal clk        : std_logic := '0';
    signal nkbScanDis : std_logic := '1';
    signal qkeybClk   : std_logic := '1';
    signal kbCmpLd    : std_logic;
    signal kbCodeLd   : std_logic;
    signal match      : std_logic;
    signal oQ         : std_logic_vector(5 downto 0);
    signal nQ         : std_logic_vector(5 downto 0);
    signal D          : std_logic_vector(7 downto 0);
    signal shiftIn    : std_logic := '1';
    signal controlIn  : std_logic := '1';

    signal nLdComp   : std_logic := '1';
    signal nLdKbus   : std_logic := '1';

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

    kb_regs_0 : entity work.kb_regs
    port map
    ( 
        clk        => clk,
        nkbScanDis => nkbScanDis,
        qkeybClk   => qkeybClk,
        kbCmpLd    => kbCmpLd,
        kbCodeLd   => kbCodeLd,
        shiftIn    => shiftIn,
        controlIn  => controlIn,
        match      => match,
        oQ         => oQ,
        nQ         => nQ,
        D          => D
    );

    kbCmpLd  <= keybClk nor nLdComp;
    kbCodeLd <= keybClk nor nLdKbus;

    process(all)
    begin
        if(falling_edge(clk)) then
            qkeybClk <= keybClk;
        end if;
    end process;

    process
    begin

        --Initialize clock pulse generator core.
        wait for 2000 ns;
        wait until falling_edge(clk);
        init <= '1';
        nkbScanDis <= '0';
        wait for 10000 ns;
        wait until falling_edge(clk);
        init <= '0';
        nkbScanDis <= '1';

        --Load compare register with known value.
        wait until keybClk = '0';
        nLdComp <= '0';
        wait until falling_edge(clk);
        nLdComp <= '1';

        --Load read register with known value.
        wait until keybClk = '0';
        nLdKbus <= '0';
        wait until falling_edge(clk);
        nLdKbus <= '1';

        --Clear shift and control bits.
        wait for 250000 ns;
        shiftIn   <= '0';
        controlIn <= '0';

        --Load compare register with new value.
        wait for 250000 ns;
        wait until keybClk = '0';
        nLdComp <= '0';
        wait until falling_edge(clk);
        nLdComp <= '1';

        --Load read register with new value.
        wait until keybClk = '0';
        nLdKbus <= '0';
        wait until falling_edge(clk);
        nLdKbus <= '1';

        wait for 40000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;
