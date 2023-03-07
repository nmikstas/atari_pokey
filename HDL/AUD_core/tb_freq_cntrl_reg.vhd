--Test bench for the POKEY frequency control register core.
--Written by Nick Mikstas

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_freq_cntrl_reg is
end tb_freq_cntrl_reg;

architecture behavioral of tb_freq_cntrl_reg is

    constant CLK179MHZ_PERIOD : time := 558.7247666 ns;

    signal clk      : std_logic := '0';
    signal D        : std_logic_vector(7 downto 0) := "00011101";
    signal WR       : std_logic := '0';
    signal decEn    : std_logic := '0';
    signal Ld       : std_logic := '0';
    signal nBOR     : std_logic;

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

    freq : entity work.freq_cntrl_reg
    port map
    ( 
        clk   => clk,
        D     => D(7 downto 0),
        WR    => WR,
        decEn => audClock,
        Load  => Ld,
        nBOR  => nBOR
    );

    process
    begin
        wait for 2000 ns;
        wait until falling_edge(clk);

        wait for 5000 ns;
        wait until falling_edge(clk);

        init <= '1';
        wait for 20000 ns;
        wait until falling_edge(clk);
        init <= '0';

        WR <= '1';
        wait until falling_edge(clk);
        WR <= '0';

        wait for 4000 ns;
        wait until falling_edge(clk);

        Ld <= '1';
        wait until falling_edge(clk);
        Ld <= '0';

        wait for 8000 ns;
        wait until falling_edge(clk);
        decEn <= '1';

        wait for 8000 ns;
        wait until falling_edge(clk);

        Ld <= '1';
        wait until falling_edge(clk);
        Ld <= '0';

        wait for 10000000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;
