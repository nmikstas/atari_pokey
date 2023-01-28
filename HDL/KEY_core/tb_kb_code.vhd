--Test bench for the POKEY keyboard code controller.
--Written by Nick Mikstas

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_kb_code is
end tb_kb_code;

architecture behavioral of tb_kb_code is

    constant CLK179MHZ_PERIOD : time := 558.7247666 ns;

    signal init     : std_logic := '0';
    signal sel15Khz : std_logic := '0';
    signal audClock : std_logic;
    signal keybClk  : std_logic;

    signal clk        : std_logic := '0';
    signal KR2        : std_logic := '1';
    signal Q          : std_logic_vector(5 downto 0) := "111111";
    signal nQ         : std_logic_vector(5 downto 0);
    signal enBreak    : std_logic;
    signal controlOut : std_logic;
    signal shiftOut   : std_logic;
    signal K          : std_logic_vector(5 downto 0);

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

    kb_code_0 : entity work.kb_code
    port map
    ( 
        clk        => clk,
        KR2        => KR2,
        Q          => Q,
        nQ         => nQ,
        keybClk    => keybClk,
        enBreak    => enBreak,
        controlOut => controlOut,
        shiftOut   => shiftOut,
        K          => K
    );

    nQ <= not Q;

    process
    begin

        --Initialize clock pulse generator core.
        wait for 2000 ns;
        wait until falling_edge(clk);
        init <= '1';
        wait for 10000 ns;
        wait until falling_edge(clk);
        init <= '0';

        --initialize shiftOut and controlOut.
        wait for 43500 ns;
        Q <= "101010";
        wait until keybClk = '0';
        Q <= "010000";
        wait for 63500 ns;
        Q <= "101010";
        wait until keybClk = '0';
        Q <= "000000";

        --Send out enShift.
        wait for 63500 ns;
        Q <= "101010";
        wait until keybClk = '0';
        Q   <= "010000";
        KR2 <= '0';
        wait until falling_edge(clk);
        KR2 <= '1';

        --Send out enControl.
        wait for 63000 ns;
        Q <= "101010";
        wait until keybClk = '0';
        Q   <= "000000";
        KR2 <= '0';
        wait until falling_edge(clk);
        KR2 <= '1';

        --Disable enShift.
        wait for 63000 ns;
        Q <= "101010";
        wait until keybClk = '0';
        Q   <= "010000";
        wait until falling_edge(clk);

        --Disable enControl.
        wait for 63000 ns;
        Q <= "101010";
        wait until keybClk = '0';
        Q   <= "000000";
        wait until falling_edge(clk);

        --Send out enBreak.
        wait for 63000 ns;
        Q <= "101010";
        wait until keybClk = '0';
        Q   <= "110000";
                
        wait for 50000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;
