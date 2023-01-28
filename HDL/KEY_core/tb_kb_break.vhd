--Test bench for the POKEY keyboard break controller.
--Written by Nick Mikstas

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_kb_break is
end tb_kb_break;

architecture behavioral of tb_kb_break is

    constant CLK179MHZ_PERIOD : time := 558.7247666 ns;

    signal clk      : std_logic := '0';
    signal enBreak  : std_logic := '0';
    signal KR2      : std_logic := '1';
    signal setBreak : std_logic;

begin

    clk <= NOT clk after CLK179MHZ_PERIOD / 2;

    kb_break_0 : entity work.kb_break
    port map
    ( 
        clk      => clk,
        enBreak  => enBreak,
        KR2      => KR2,
        setBreak => setBreak
    );

    process
    begin
        --Set registers into known state.
        wait for 2000 ns;
        wait until falling_edge(clk);
        enBreak <= '1';
        wait until falling_edge(clk);
        enBreak <= '0';
        
        --Send a break request.
        wait for 2000 ns;
        wait until falling_edge(clk);
        enBreak <= '1';
        KR2     <= '0';
        wait until falling_edge(clk);
        enBreak <= '0';
        KR2     <= '1';

        --Reset break flip-flops.
        wait for 2000 ns;
        wait until falling_edge(clk);
        enBreak <= '1';
        wait until falling_edge(clk);
        enBreak <= '0';

        --Send a break request.
        wait for 2000 ns;
        wait until falling_edge(clk);
        enBreak <= '1';
        KR2     <= '0';
        wait until falling_edge(clk);
        enBreak <= '0';
        KR2     <= '1';
        
        --Send another break request(nothing happens).
        wait for 2000 ns;
        wait until falling_edge(clk);
        enBreak <= '1';
        KR2     <= '0';
        wait until falling_edge(clk);
        enBreak <= '0';
        KR2     <= '1';

        --Reset break flip-flops.
        wait for 2000 ns;
        wait until falling_edge(clk);
        enBreak <= '1';
        wait until falling_edge(clk);
        enBreak <= '0';

        --Send a break on KR2 without enabling the break hardware(nothing happens).
        wait for 2000 ns;
        wait until falling_edge(clk);
        KR2     <= '0';
        wait until falling_edge(clk);
        KR2     <= '1';
                
        wait for 5000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;
