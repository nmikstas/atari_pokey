--Test bench for the POKEY audio frequency control module.
--Written by Nick Mikstas

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_aud_Freq_control is
end tb_aud_Freq_control;

architecture behavioral of tb_aud_Freq_control is

    constant CLK179MHZ_PERIOD : time := 558.7247666 ns;

    signal clk            : std_logic := '0';
    signal D              : std_logic_vector(7 downto 0) := "00000000";
    signal Addr0w         : std_logic := '0';
    signal Addr2w         : std_logic := '0';
    signal Addr4w         : std_logic := '0';
    signal Addr6w         : std_logic := '0';
    signal Addr9w         : std_logic := '0';
    signal enFastClk1     : std_logic := '0';
    signal enFastClk3     : std_logic := '1';
    signal ch2Bits16      : std_logic := '1';
    signal ch4Bits16      : std_logic := '1';
    signal resyncTwoTones : std_logic := '0';
    signal resyncSerClk   : std_logic := '0';
    signal Timer          : std_logic_vector(4 downto 1);
    signal nTimer         : std_logic_vector(4 downto 1);
    signal rstAudPhase    : std_logic;

    --Clock pulse generator signals.
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

    aud_freq_control_0 : entity work.aud_freq_control
    port map
    ( 
        clk            => clk,
        audClock       => audClock,
        D              => D,
        Addr0w         => Addr0w,
        Addr2w         => Addr2w,
        Addr4w         => Addr4w,
        Addr6w         => Addr6w,
        Addr9w         => Addr9w,
        enFastClk1     => enFastClk1,
        enFastClk3     => enFastClk3,
        ch2Bits16       => ch2Bits16,
        ch4Bits16       => ch4Bits16,
        resyncTwoTones => resyncTwoTones,
        resyncSerClk   => resyncSerClk,
        Timer          => Timer,
        nTimer         => nTimer,
        rstAudPhase    => rstAudPhase
    );

    process
    begin
        --Set resync flip-flops into a known state.
        wait for 2000 ns;
        wait until rising_edge(clk);
        Addr9w <= '1';
        wait until rising_edge(clk);
        Addr9w <= '0';

        --Set resync flip-flops into a known state.
        wait for 2000 ns;
        wait until rising_edge(clk);
        Addr9w <= '1';
        wait until rising_edge(clk);
        Addr9w <= '0';

        wait for 20000 ns;

        --Initialize clock pulse generator.
        wait for 2000 ns;
        wait until falling_edge(clk);
        init <= '1';
        wait for 9000 ns;
        wait until falling_edge(clk);
        init <= '0';

        --Load counter register 1.
        wait for 2000 ns;
        wait until falling_edge(clk);
        D <= "00101100";
        wait until rising_edge(clk);
        Addr0w <= '1';
        wait until falling_edge(clk);
        D <= "00000000";
        wait until rising_edge(clk);
        Addr0w <= '0';

        --Load counter register 2.
        wait for 2000 ns;
        wait until falling_edge(clk);
        D <= "00000001";
        wait until rising_edge(clk);
        Addr2w <= '1';
        wait until falling_edge(clk);
        D <= "00000000";
        wait until rising_edge(clk);
        Addr2w <= '0';

        --Load counter register 3.
        wait for 2000 ns;
        wait until falling_edge(clk);
        D <= "00000100";
        wait until rising_edge(clk);
        Addr4w <= '1';
        wait until falling_edge(clk);
        D <= "00000000";
        wait until rising_edge(clk);
        Addr4w <= '0';

        --Load counter register 4.
        wait for 2000 ns;
        wait until falling_edge(clk);
        D <= "00001000";
        wait until rising_edge(clk);
        Addr6w <= '1';
        wait until falling_edge(clk);
        D <= "00000000";
        wait until rising_edge(clk);
        Addr6w <= '0';

        --Set resync flip-flops into a known state.
        wait for 2000 ns;
        wait until rising_edge(clk);
        Addr9w <= '1';
        wait until rising_edge(clk);
        Addr9w <= '0';

        --resync.
        wait for 200000 ns;
        wait until rising_edge(clk);
        Addr9w <= '1';
        wait until rising_edge(clk);
        Addr9w <= '0';




        
        wait for 100000000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;
