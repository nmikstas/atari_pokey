--Test bench for the POKEY serial clock generator.
--Written by Nick Mikstas

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_SER_clock_gen is
end tb_SER_clock_gen;

architecture behavioral of tb_SER_clock_gen is

    constant CLK179MHZ_PERIOD : time := 558.7247666 ns;

    --Frequency control signals.
    signal clk            : std_logic := '0';
    signal D              : std_logic_vector(7 downto 0) := "00000000";
    signal Addr0w         : std_logic := '0';
    signal Addr2w         : std_logic := '0';
    signal Addr4w         : std_logic := '0';
    signal Addr6w         : std_logic := '0';
    signal Addr9w         : std_logic := '0';
    signal enFastClk1     : std_logic := '1';
    signal enFastClk3     : std_logic := '1';
    signal ch2Bits16      : std_logic := '1';
    signal ch4Bits16      : std_logic := '1';
    signal resyncTwoTones : std_logic := '0';
    signal resyncSerClk   : std_logic := '1';
    signal Timer          : std_logic_vector(4 downto 1);
    signal nTimer         : std_logic_vector(4 downto 1);
    signal rstAudPhase    : std_logic;

    --Clock pulse generator signals.
    signal init     : std_logic := '0';
    signal sel15Khz : std_logic := '0';
    signal audClock : std_logic;
    signal keybClk  : std_logic;

    --Serial clock generator signals.
    signal SKCTLS       : std_logic_vector(6 downto 4) := "000";
    signal BCLK_in      : std_logic := '0';
    signal BCLK_out     : std_logic;
    signal sdiClock     : std_logic;
    signal sdoClock     : std_logic;
    signal OCLK         : std_logic;

    --BCLK_in clock signal.
    signal counter : unsigned(2 downto 0) := "000";

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
        ch2Bits16      => ch2Bits16,
        ch4Bits16      => ch4Bits16,
        resyncTwoTones => resyncTwoTones,
        resyncSerClk   => resyncSerClk,
        Timer          => Timer,
        nTimer         => nTimer,
        rstAudPhase    => rstAudPhase
    );

    ser_clock_gen_0 : entity work.SER_clock_gen
    port map
    ( 
        clk          => clk,
        SKCTLS       => SKCTLS,
        resyncSerClk => resyncSerClk,
        Timer2       => Timer(2),
        Timer4       => Timer(4),
        BCLK_in      => BCLK_in,
        BCLK_out     => BCLK_out,
        sdiClock     => sdiClock,
        sdoClock     => sdoClock,
        OCLK         => OCLK
    );

    process(all)
    begin
        if(falling_edge(clk)) then
            counter <= counter + '1';
            if(counter >= "100") then
                BCLK_in <= '0';
            else
                BCLK_in <= '1';
            end if;
        end if;
    end process;

    process
    begin
        --Clear serial clock resync.
        wait for 2000 ns;
        wait until falling_edge(clk);
        resyncSerClk <= '0';
        SKCTLS(6)    <= '1';

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

        --Initialize clock pulse generator.
        wait until falling_edge(clk);
        init <= '1';
        wait for 9000 ns;
        wait until falling_edge(clk);
        init <= '0';

        --Load counter register 1.
        wait until falling_edge(clk);
        D <= "00001001";
        wait until rising_edge(clk);
        Addr0w <= '1';
        wait until falling_edge(clk);
        D <= "00000000";
        wait until rising_edge(clk);
        Addr0w <= '0';

        --Load counter register 2.
        wait until falling_edge(clk);
        D <= "00000000";
        wait until rising_edge(clk);
        Addr2w <= '1';
        wait until falling_edge(clk);
        D <= "00000000";
        wait until rising_edge(clk);
        Addr2w <= '0';

        --Load counter register 3.
        wait until falling_edge(clk);
        D <= "00011001";
        wait until rising_edge(clk);
        Addr4w <= '1';
        wait until falling_edge(clk);
        D <= "00000000";
        wait until rising_edge(clk);
        Addr4w <= '0';

        --Load counter register 4.
        wait until falling_edge(clk);
        D <= "00000000";
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

        --Change clock config
        wait for 2000 ns;
        wait until falling_edge(clk);
        resyncSerClk <= '0';
        SKCTLS       <= "110";
        
        wait for 1000000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;