--Test bench for the POKEY audio control modules.
--Written by Nick Mikstas

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_aud_control is
end tb_aud_control;

architecture behavioral of tb_aud_control is

    constant CLK179MHZ_PERIOD : time := 558.7247666 ns;

    --Clock pulse generator signals.
    signal init     : std_logic := '0';
    signal sel15Khz : std_logic := '0';
    signal audClock : std_logic;
    signal keybClk  : std_logic;

    --Polynomial signals.
    signal sel9bitPoly : std_logic := '0';
    signal rndNum      : std_logic_vector(7 downto 0);
    signal poly4bit    : std_logic;
    signal poly5bit    : std_logic;
    signal poly917bit  : std_logic;

    --Audio frequency control signals.
    signal clk            : std_logic := '0';
    signal D              : std_logic_vector(7 downto 0) := "00000000";
    signal Addr0w         : std_logic := '0';
    signal Addr2w         : std_logic := '0';
    signal Addr4w         : std_logic := '0';
    signal Addr6w         : std_logic := '0';
    signal Addr9w         : std_logic := '0';
    signal enFastClk1     : std_logic := '0';
    signal enFastClk3     : std_logic := '0';
    signal ch2Bits16      : std_logic := '0';
    signal ch4Bits16      : std_logic := '0';
    signal resyncTwoTones : std_logic := '0';
    signal resyncSerClk   : std_logic := '0';
    signal Timer          : std_logic_vector(4 downto 1);
    signal nTimer         : std_logic_vector(4 downto 1);
    signal rstAudPhase    : std_logic;

    --Polynomial delay chain.
    signal poly4  : std_logic_vector(3 downto 1);
    signal poly5  : std_logic_vector(3 downto 1);
    signal poly17 : std_logic_vector(3 downto 1);

    --aoudio channel signals.
    signal AUDC : std_logic_vector(4 downto 1) := "0000";
    signal AUD1 : std_logic_vector(3 downto 0);
    signal AUD2 : std_logic_vector(3 downto 0);
    signal AUD3 : std_logic_vector(3 downto 0);
    signal AUD4 : std_logic_vector(3 downto 0);
    signal dis1 : std_logic := '0';
    signal dis2 : std_logic := '1';

    --Audio addition signals.
    signal AUD12  : unsigned(4 downto 0);
    signal AUD34  : unsigned(4 downto 0);
    signal AUDOut : unsigned(5 downto 0);

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

    poly_core_0 : entity work.poly_core
    port map
    ( 
        clk         => clk,
        init        => init,
        sel9bitPoly => sel9bitPoly,
        rndNum      => rndNum,
        poly4bit    => poly4bit,
        poly5bit    => poly5bit,
        poly917bit  => poly917bit
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

    --Channel 1 audio control.
    aud_control_1 : entity work.aud_control_hp
    port map
    (
        clk         => clk,
        D           => D,
        AUDC        => AUDC(1),
        poly4In     => poly4bit,
        poly5In     => poly5bit,
        poly17In    => poly917bit,
        Timer       => Timer(1),
        nTimer      => nTimer(1),
        rstAudPhase => rstAudPhase,
        disHiFltr   => dis1,
        Timerx      => nTimer(3),
        AUD         => AUD1,
        poly4Out    => poly4(1),
        poly5Out    => poly5(1),
        poly17Out   => poly17(1)
    );

    --Channel 2 audio control.
    aud_control_2 : entity work.aud_control_hp
    port map
    (
        clk         => clk,
        D           => D,
        AUDC        => AUDC(2),
        poly4In     => poly4(1),
        poly5In     => poly5(1),
        poly17In    => poly17(1),
        Timer       => Timer(2),
        nTimer      => nTimer(2),
        rstAudPhase => rstAudPhase,
        disHiFltr   => dis2,
        Timerx      => nTimer(4),
        AUD         => AUD2,
        poly4Out    => poly4(2),
        poly5Out    => poly5(2),
        poly17Out   => poly17(2)
    );

    --Channel 3 audio control.
    aud_control_3 : entity work.aud_control
    port map
    (
        clk         => clk,
        D           => D,
        AUDC        => AUDC(3),
        poly4In     => poly4(2),
        poly5In     => poly5(2),
        poly17In    => poly17(2),
        Timer       => Timer(3),
        nTimer      => nTimer(3),
        rstAudPhase => rstAudPhase,
        AUD         => AUD3,
        poly4Out    => poly4(3),
        poly5Out    => poly5(3),
        poly17Out   => poly17(3)
    );

    --Channel 4 audio control.
    aud_control_4 : entity work.aud_control
    port map
    (
        clk         => clk,
        D           => D,
        AUDC        => AUDC(4),
        poly4In     => poly4(3),
        poly5In     => poly5(3),
        poly17In    => poly17(3),
        Timer       => Timer(4),
        nTimer      => nTimer(4),
        rstAudPhase => rstAudPhase,
        AUD         => AUD4,
        poly4Out    => open,
        poly5Out    => open,
        poly17Out   => open
    );

    --Add all the audio channels together.
    process(all)
    begin

        if(rising_edge(clk)) then
            AUD12  <= unsigned('0' & AUD1) + unsigned('0' & AUD2);  
            AUD34  <= unsigned('0' & AUD3) + unsigned('0' & AUD4);    
            AUDOut <= ('0' & AUD34) + ('0' & AUD12);
        end if;

    end process;

    process
    begin

        --Load audio channel 1 configuration.
        wait for 2000 ns;
        wait until rising_edge(clk);
        D <= "11000011";
        AUDC(1) <= '1';
        wait until rising_edge(clk);
        D <= "00000000";
        AUDC(1) <= '0';

        --Load audio channel 2 configuration.
        wait for 2000 ns;
        wait until rising_edge(clk);
        D <= "11100010";
        AUDC(2) <= '1';
        wait until rising_edge(clk);
        D <= "00000000";
        AUDC(2) <= '0';

        --Load audio channel 3 configuration.
        wait for 2000 ns;
        wait until rising_edge(clk);
        D <= "01100001";
        AUDC(3) <= '1';
        wait until rising_edge(clk);
        D <= "00000000";
        AUDC(3) <= '0';

        --Load audio channel 4 configuration.
        wait for 2000 ns;
        wait until rising_edge(clk);
        D <= "11101111";
        AUDC(4) <= '1';
        wait until rising_edge(clk);
        D <= "00000000";
        AUDC(4) <= '0';

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
        D <= "00011111";
        wait until rising_edge(clk);
        Addr0w <= '1';
        wait until falling_edge(clk);
        D <= "00000000";
        wait until rising_edge(clk);
        Addr0w <= '0';

        --Load counter register 2.
        wait for 2000 ns;
        wait until falling_edge(clk);
        D <= "00010000";
        wait until rising_edge(clk);
        Addr2w <= '1';
        wait until falling_edge(clk);
        D <= "00000000";
        wait until rising_edge(clk);
        Addr2w <= '0';

        --Load counter register 3.
        wait for 2000 ns;
        wait until falling_edge(clk);
        D <= "00100000";
        wait until rising_edge(clk);
        Addr4w <= '1';
        wait until falling_edge(clk);
        D <= "00000000";
        wait until rising_edge(clk);
        Addr4w <= '0';

        --Load counter register 4.
        wait for 2000 ns;
        wait until falling_edge(clk);
        D <= "01000000";
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

        --Set resync flip-flops into a known state.
        --wait for 2000 ns;
        --wait until rising_edge(clk);
        --Addr9w <= '1';
        --wait until rising_edge(clk);
        --Addr9w <= '0';

        --Load audio channel 4 configuration.
        wait for 10000000 ns;
        wait until rising_edge(clk);
        D <= "11101111";
        AUDC(4) <= '1';
        wait until rising_edge(clk);
        D <= "00000000";
        AUDC(4) <= '0';

        wait for 10000000 ns;

        wait until AUD4 = "0000";
        wait until rising_edge(clk);
        D <= "11101110";
        AUDC(4) <= '1';
        wait until rising_edge(clk);
        D <= "00000000";
        AUDC(4) <= '0';

        wait until AUD4 = "0000";
        wait until rising_edge(clk);
        D <= "11101101";
        AUDC(4) <= '1';
        wait until rising_edge(clk);
        D <= "00000000";
        AUDC(4) <= '0';

        wait until AUD4 = "0000";
        wait until rising_edge(clk);
        D <= "11101100";
        AUDC(4) <= '1';
        wait until rising_edge(clk);
        D <= "00000000";
        AUDC(4) <= '0';

        wait until AUD4 = "0000";
        wait until rising_edge(clk);
        D <= "11101011";
        AUDC(4) <= '1';
        wait until rising_edge(clk);
        D <= "00000000";
        AUDC(4) <= '0';

        wait until AUD4 = "0000";
        wait until rising_edge(clk);
        D <= "11101010";
        AUDC(4) <= '1';
        wait until rising_edge(clk);
        D <= "00000000";
        AUDC(4) <= '0';

        wait until AUD4 = "0000";
        wait until rising_edge(clk);
        D <= "11101000";
        AUDC(4) <= '1';
        wait until rising_edge(clk);
        D <= "00000000";
        AUDC(4) <= '0';

        wait until AUD4 = "0000";
        wait until rising_edge(clk);
        D <= "11100111";
        AUDC(4) <= '1';
        wait until rising_edge(clk);
        D <= "00000000";
        AUDC(4) <= '0';

        wait until AUD4 = "0000";
        wait until rising_edge(clk);
        D <= "11000110";
        AUDC(4) <= '1';
        wait until rising_edge(clk);
        D <= "00000000";
        AUDC(4) <= '0';

        wait until AUD4 = "0000";
        wait until rising_edge(clk);
        D <= "11000101";
        AUDC(4) <= '1';
        wait until rising_edge(clk);
        D <= "00000000";
        AUDC(4) <= '0';

        wait until AUD4 = "0000";
        wait until rising_edge(clk);
        D <= "11000100";
        AUDC(4) <= '1';
        wait until rising_edge(clk);
        D <= "00000000";
        AUDC(4) <= '0';

        wait until AUD4 = "0000";
        wait until rising_edge(clk);
        D <= "11000011";
        AUDC(4) <= '1';
        wait until rising_edge(clk);
        D <= "00000000";
        AUDC(4) <= '0';

        wait until AUD4 = "0000";
        wait until rising_edge(clk);
        D <= "10000010";
        AUDC(4) <= '1';
        wait until rising_edge(clk);
        D <= "00000000";
        AUDC(4) <= '0';

        wait until AUD4 = "0000";
        wait until rising_edge(clk);
        D <= "10000001";
        AUDC(4) <= '1';
        wait until rising_edge(clk);
        D <= "00000000";
        AUDC(4) <= '0';

        wait until AUD4 = "0000";
        wait until rising_edge(clk);
        D <= "10000000";
        AUDC(4) <= '1';
        wait until rising_edge(clk);
        D <= "00000000";
        AUDC(4) <= '0';

        wait for 10000000 ns;
        wait until rising_edge(clk);
        D <= "01100111";
        AUDC(4) <= '1';
        wait until rising_edge(clk);
        D <= "00000000";
        AUDC(4) <= '0';

        wait for 10000000 ns;
        wait until rising_edge(clk);
        D <= "11101111";
        AUDC(4) <= '1';
        wait until rising_edge(clk);
        D <= "00000000";
        AUDC(4) <= '0';








        
        wait for 100000000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;