--Test bench for the POKEY KEY core.
--Written by Nick Mikstas

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_KEY_core is
end tb_KEY_core;

architecture behavioral of tb_KEY_core is

    constant CLK179MHZ_PERIOD : time := 558.7247666 ns;

    signal clk      : std_logic := '0';
    signal KR1      : std_logic := '1';
    signal KR2      : std_logic := '1';
    signal setKey   : std_logic;
    signal kShift   : std_logic;
    signal setBreak : std_logic;
    signal keyDown  : std_logic;
    signal D        : std_logic_vector(7 downto 0);
    signal K        : std_logic_vector(5 downto 0);
    
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

    KEY_core_0 : entity work.KEY_core
    port map
    ( 
        clk      => clk,
        keybClk  => keybClk,
        KR       => KR2 & KR1,
        SKCTLS   => (not init) & (not init),
        setKey   => setKey,
        kShift   => kShift,
        setBreak => setBreak,
        keyDown  => keyDown,
        D        => D,
        K        => K 
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

        --Wait until control, break and shift key statuses become valid.
        wait until kShift <= '0';
        
        --Strobe the break interrupt.
        wait until K = "001111" and falling_edge(keybClk); 
        KR2 <= '0';
        wait until falling_edge(clk);
        KR2 <= '1';

        --Set the control key.
        wait until K = "111111" and falling_edge(keybClk); 
        KR2 <= '0';
        wait until falling_edge(clk);
        KR2 <= '1';

        --Set the control key.
        wait until K = "101111" and falling_edge(keybClk); 
        KR2 <= '0';
        wait until falling_edge(clk);
        KR2 <= '1';

        --Press key.
        wait until K = "101010" and falling_edge(keybClk);
        KR1 <= '0';
        wait until falling_edge(clk);
        KR1 <= '1';

        --Debounce key press.
        wait until K = "101010" and falling_edge(keybClk);
        KR1 <= '0';
        wait until falling_edge(clk);
        KR1 <= '1';

        --Release key.
        wait until K = "101010" and falling_edge(keybClk);

        --Debounce key release.
        wait until K = "101010" and falling_edge(keybClk);

        --Wait for next key press.
        wait until K = "101010" and falling_edge(keybClk);

        --Press key along with shift and control key.
        wait until K = "000111" and falling_edge(keybClk);
        KR1 <= '0';
        wait until falling_edge(clk);
        KR1 <= '1';

        --Press shift key.
        wait until K = "101111" and falling_edge(keybClk); 
        KR2 <= '0';
        wait until falling_edge(clk);
        KR2 <= '1';

        --Press control key.
        wait until K = "111111" and falling_edge(keybClk); 
        KR2 <= '0';
        wait until falling_edge(clk);
        KR2 <= '1';

        --Debounce key press.
        wait until K = "000111" and falling_edge(keybClk);
        KR1 <= '0';
        wait until falling_edge(clk);
        KR1 <= '1';

        
        
        



        wait for 10000000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;
