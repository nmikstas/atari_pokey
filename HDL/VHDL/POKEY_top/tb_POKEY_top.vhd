--Test bench for the top level of the POKEY.
--Written by Nick Mikstas

library modelsim_lib;
use modelsim_lib.util.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_pokey_top is
end tb_pokey_top;

architecture behavioral of tb_pokey_top is

    constant CLK179MHZ_PERIOD : time := 558.7247666 ns;

    signal phi2  : std_logic                    := '0';
    signal cs    : std_logic_vector(1 downto 0) := "00";
    signal rw    : std_logic                    := '1';
    signal d     : std_logic_vector(7 downto 0) := "ZZZZZZZZ";
    signal a     : std_logic_vector(3 downto 0) := "ZZZZ";
    signal p     : std_logic_vector(7 downto 0) := "11111111";
    signal kr    : std_logic_vector(2 downto 1) := "00";
    signal sid   : std_logic                    := '0';
    signal bclki : std_logic                    := '0';

    signal bclko : std_logic;
    signal irq   : std_logic;
    signal sod   : std_logic;
    signal oclk  : std_logic;
    signal audio : std_logic_vector(5 downto 0);
    signal dump  : std_logic;
    signal k     : std_logic_vector(5 downto 0);

    --Internal signals.
    signal setBreak : std_logic;
    signal keybClk  : std_logic;
    signal sdiClock : std_logic;

    --BCLK_in clock signal.
    signal counter : unsigned(2 downto 0) := "000";
    
begin

    phi2 <= NOT phi2 after CLK179MHZ_PERIOD / 2;

    pokey_top_0 : entity work.POKEY_top
    port map
    (
        phi2  => phi2,
        cs    => cs,
        rw    => rw,
        irq   => irq,
        d     => d,
        a     => a,
        audio => audio,
        p     => p,
        dump  => dump,
        k     => k,
        kr    => kr,
        sid   => sid,
        sod   => sod,
        oclk  => oclk,
        bclki => bclki,
        bclko => bclko
    );

    spy_process : process
    begin
        init_signal_spy("/tb_pokey_top/pokey_top_0/setBreak","/setBreak");
        init_signal_spy("/tb_pokey_top/pokey_top_0/keybClk","/keybClk");
        init_signal_spy("/tb_pokey_top/pokey_top_0/SER_core_0/sdiClock","/sdiClock");
        wait;
    end process spy_process;

    process(all)
    begin
        if(falling_edge(phi2)) then
            counter <= counter + '1';
            if(counter >= "100") then
                bclki <= '0';
            else
                bclki <= '1';
            end if;
        end if;
    end process;

    process
    begin

        --Set input pins to known values.
        kr <= "11";

        --Set the audio clock to 15KHz.
        --wait for 5000 ns;
        --wait until falling_edge(phi2);
        --wait for 100 ns;
        --cs <= "10";
        --rw <= '0';
        --a  <= "1000";

        --wait until rising_edge(phi2);
        --wait for 100 ns;
        --a  <= "ZZZZ";
        --wait for 100 ns;
        --d  <= "00000001";
        
        --wait until falling_edge(phi2);
        --wait for 100 ns;
        --cs <= "00";
        --d  <= "ZZZZZZZZ";
        --rw <= '1';

        SID <= '1';

        --Initialize the chip.
        wait for 5000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "1111";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "00000000";     
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Release the initialization.
        wait for 9000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "1111";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "00010011";
        wait until falling_edge(phi2);
        wait for 200 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Set the SKSTAT latches into a known state.
        wait for 1000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "1010";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "00000000";
        wait until falling_edge(phi2);
        wait for 200 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Disable all interrupts.
        wait for 1000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "1110";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "00000000";
        wait until falling_edge(phi2);
        wait for 200 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --wait until setBreak is a known value.
        wait until setBreak <= '0';

        --Enable all interrupts.
        wait for 2000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "1110";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "11111111";
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Load audio channel 1 configuration.
        wait for 2000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "0001";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "11001000";
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Load audio channel 2 configuration.
        wait for 2000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "0011";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "11100010";
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Load audio channel 3 configuration.
        wait for 2000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "0101";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "01100001";
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Load audio channel 4 configuration.
        wait for 2000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "0111";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "11101111";
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Load counter configuration.
        wait for 2000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "1000";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "11100110";
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Load counter register 1.
        wait for 2000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "0000";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "00011111";
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Load counter register 2.
        wait for 2000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "0010";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "00010000";
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Load counter register 3.
        wait for 2000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "0100";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "00100000";
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Load counter register 4.
        wait for 2000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "0110";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "01000000";
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Reset counters.
        wait for 2000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "1001";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "00000000";
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Disable all interrupts.
        wait for 2000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "1110";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "00000000";
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Enable sdi interrupt.
        wait for 2000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "1110";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "00100000";
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        
        --Begin async receiving data.
        wait for 2000000 ns;
        SID <= '0'; --Start bit.
        wait for 2000000 ns;
        SID <= '1';
        wait for 2000000 ns;
        SID <= '1';
        wait for 2000000 ns;
        SID <= '0';
        wait for 2000000 ns;
        SID <= '1';
        wait for 2000000 ns;
        SID <= '0';
        wait for 2000000 ns;
        SID <= '0';
        wait for 2000000 ns;
        SID <= '0';
        wait for 2000000 ns;
        SID <= '1';
        wait for 2000000 ns;
        SID <= '0'; --Causes frame error. Should be a stop bit.
        wait for 2000000 ns;
        SID <= '1';

        --Read received byte.
        wait for 1000 ns;
        wait until falling_edge(phi2);
        wait for 250 ns;
        cs <= "10";
        rw <= '1';
        a  <= "1101";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait until falling_edge(phi2);
        wait for 175 ns;
        cs <= "11";
        
        --Receive a second byte "11111111".
        wait for 2000000 ns;
        SID <= '0';
        wait for 2000000 ns;
        SID <= '1';

        --Wait for second byte to finish transmitting.
        wait for 20000000 ns;

        --Change clock config for async receive.
        wait for 9000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "1111";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "00100011";
        wait until falling_edge(phi2);
        wait for 200 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Receive a synchronous byte.
        wait until falling_edge(sdiClock);
        wait for 5000 ns;
        SID <= '0';
        wait until falling_edge(sdiClock);
        wait for 5000 ns;
        SID <= '1';
        wait until falling_edge(sdiClock);
        wait for 5000 ns;
        SID <= '0';
        wait until falling_edge(sdiClock);
        wait for 5000 ns;
        SID <= '1';
        wait until falling_edge(sdiClock);
        wait for 5000 ns;
        SID <= '0';
        wait until falling_edge(sdiClock);
        wait for 5000 ns;
        SID <= '1';
        wait until falling_edge(sdiClock);
        wait for 5000 ns;
        SID <= '0';
        wait until falling_edge(sdiClock);
        wait for 5000 ns;
        SID <= '1';
        wait until falling_edge(sdiClock);
        wait for 5000 ns;
        SID <= '0';
        wait until falling_edge(sdiClock);
        wait for 5000 ns;
        SID <= '1';

        --Reset counters.
        wait for 2000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "1001";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "00000000";
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Load zeroes to transmit.
        wait for 2000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "1101";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "00000000";
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Disable all interrupts.
        wait for 2000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "1110";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "00000000";
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Enable sdo interrupt.
        wait for 2000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "1110";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "11110000";
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Wait for TX to finish.
        wait for 10000000 ns;

        --Read SKSTAT register.
        wait for 1000 ns;
        wait until falling_edge(phi2);
        wait for 250 ns;
        cs <= "10";
        rw <= '1';
        a  <= "1111";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait until falling_edge(phi2);
        wait for 175 ns;
        cs <= "11";


        --Wait for TX to finish.
        wait for 8000000 ns;

        --Reset SKSTAT register.
        wait for 2000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "1010";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "00000000";
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Wait for TX to finish.
        wait for 10000000 ns;
        
        --Set to 2 tone mode.
        wait for 2000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "1111";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "00101011";
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Load data to transmit.
        wait for 2000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "1101";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "01001011";
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Wait for TX to finish.
        wait for 25000000 ns;
        
        --Disable all interrupts.
        wait for 2000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "1110";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "00000000";
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Enable sdo interrupt.
        wait for 2000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "1110";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "11110000";
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Disable 2 tone mode.
        wait for 2000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "1111";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "00100011";
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Wait for TX to finish.
        wait for 7000000 ns;

        --Load data to transmit.
        wait for 2000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "1101";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "01001011";
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';



        --Press a key.
        --wait until k = "010010" and keybClk = '0';
        --kr(1) <= '0';
        --wait until rising_edge(keybClk);
        --kr(1) <= '1';
        --wait until k = "010010" and keybClk = '0';
        --kr(1) <= '0';
        --wait until rising_edge(keybClk);
        --kr(1) <= '1';

        --Release the key
        --wait until k = "010010" and keybClk = '0';
        --wait until rising_edge(keybClk);
        --wait until k = "010010" and keybClk = '0';
        --wait until rising_edge(keybClk);

        --Disable IRQs.
        --wait for 1000 ns;
        --wait until falling_edge(phi2);
        --wait for 100 ns;
        --cs <= "10";
        --rw <= '0';
        --a  <= "1110";
        --wait until rising_edge(phi2);
        --wait for 100 ns;
        --a  <= "ZZZZ";
        --wait for 100 ns;
        --d  <= "00000000";
        --wait until falling_edge(phi2);
        --wait for 100 ns;
        --cs <= "00";
        --d  <= "ZZZZZZZZ";
        --rw <= '1';

        --Press and release again(key overrun).
        --wait until k = "010010" and keybClk = '0';
        --kr(1) <= '0';
        --wait until rising_edge(keybClk);
        --kr(1) <= '1';
        --Press shift key.
        --wait until k = "101111" and keybClk = '0';
        --kr(2) <= '0';
        --wait until rising_edge(keybClk);
        --kr(2) <= '1';
        --wait until k = "010010" and keybClk = '0';
        --kr(1) <= '0';
        --wait until rising_edge(keybClk);
        --kr(1) <= '1';

        --Read key status
        --wait for 1000 ns;
        --wait until falling_edge(phi2);
        --wait for 250 ns;
        --cs <= "10";
        --rw <= '1';
        --a  <= "1001";
        --wait until rising_edge(phi2);
        --wait for 100 ns;
        --a  <= "ZZZZ";
        --wait until falling_edge(phi2);
        --wait for 175 ns;
        --cs <= "11";

        --Read IRQ bits.
        --wait for 1000 ns;
        --wait until falling_edge(phi2);
        --wait for 250 ns;
        --cs <= "10";
        --rw <= '1';
        --a  <= "1110";
        --wait until rising_edge(phi2);
        --wait for 100 ns;
        --a  <= "ZZZZ";
        --wait until falling_edge(phi2);
        --wait for 175 ns;
        --cs <= "11";
        

        --Read SKSTAT bits.
        --wait for 1000 ns;
        --wait until falling_edge(phi2);
        --wait for 250 ns;
        --cs <= "10";
        --rw <= '1';
        --a  <= "1111";
        --wait until rising_edge(phi2);
        --wait for 100 ns;
        --a  <= "ZZZZ";
        --wait until falling_edge(phi2);
        --wait for 175 ns;
        --cs <= "11";

        --Disable IRQs.
        --wait for 1000 ns;
        --wait until falling_edge(phi2);
        --wait for 100 ns;
        --cs <= "10";
        --rw <= '0';
        --a  <= "1110";
        --wait until rising_edge(phi2);
        --wait for 100 ns;
        --a  <= "ZZZZ";
        --wait for 100 ns;
        --d  <= "00000000";
        --wait until falling_edge(phi2);
        --wait for 100 ns;
        --cs <= "00";
        --d  <= "ZZZZZZZZ";
        --rw <= '1';

        --Enable IRQs.
        --wait for 1000 ns;
        --wait until falling_edge(phi2);
        --wait for 100 ns;
        --cs <= "10";
        --rw <= '0';
        --a  <= "1110";
        --wait until rising_edge(phi2);
        --wait for 100 ns;
        --a  <= "ZZZZ";
        --wait for 100 ns;
        --d  <= "11111111";
        --wait until falling_edge(phi2);
        --wait for 100 ns;
        --cs <= "00";
        --d  <= "ZZZZZZZZ";
        --rw <= '1';

        --Reset SKSTAT.
        --wait for 2000 ns;
        --wait until falling_edge(phi2);
        --wait for 100 ns;
        --cs <= "10";
        --rw <= '0';
        --a  <= "1010";
        --wait until rising_edge(phi2);
        --wait for 100 ns;
        --a  <= "ZZZZ";
        --wait for 100 ns;
        --d  <= "11111111";
        --wait until falling_edge(phi2);
        --wait for 100 ns;
        --cs <= "00";
        --d  <= "ZZZZZZZZ";
        --rw <= '1';

        --Press brake key.
        --wait until k = "001111" and keybClk = '0';
        --kr(2) <= '0';
        --wait until rising_edge(keybClk);
        --kr(2) <= '1';
        
        --Disable IRQs.
        --wait for 1000 ns;
        --wait until falling_edge(phi2);
        --wait for 100 ns;
        --cs <= "10";
        --rw <= '0';
        --a  <= "1110";
        --wait until rising_edge(phi2);
        --wait for 100 ns;
        --a  <= "ZZZZ";
        --wait for 100 ns;
        --d  <= "00000000";
        --wait until falling_edge(phi2);
        --wait for 100 ns;
        --cs <= "00";
        --d  <= "ZZZZZZZZ";
        --rw <= '1';

        --Press control key.
        --wait until k = "111111" and keybClk = '0';
        --kr(2) <= '0';
        --wait until rising_edge(keybClk);
        --kr(2) <= '1';

        --Set the audio clock to 64KHz.
        --wait for 150000 ns;
        --wait until falling_edge(phi2);
        --wait for 100 ns;
        --cs <= "10";
        --rw <= '0';
        --a  <= "1000";

        --wait until rising_edge(phi2);
        --wait for 100 ns;
        --a  <= "ZZZZ";
        --wait for 100 ns;
        --d  <= "00000000";
        
        --wait until falling_edge(phi2);
        --wait for 100 ns;
        --cs <= "00";
        --d  <= "ZZZZZZZZ";
        --rw <= '1';
        
        --Read out the random number.
        --wait for 3000 ns;
        --wait until falling_edge(phi2);
        --wait for 100 ns;
        --cs <= "10";
        --rw <= '1';
        --a  <= "1010";

        --Set the RNG to 9-bit polynomial
        --wait for 15000 ns;
        --wait until falling_edge(phi2);
        --wait for 100 ns;
        --cs <= "10";
        --rw <= '0';
        --a  <= "1000";

        --wait until rising_edge(phi2);
        --wait for 100 ns;
        --a  <= "ZZZZ";
        --wait for 100 ns;
        --d  <= "10000000";
        
        --wait until falling_edge(phi2);
        --wait for 100 ns;
        --cs <= "00";
        --d  <= "ZZZZZZZZ";
        --rw <= '1';

        --Start a pot scan.
        --wait for 5000 ns;
        --wait until falling_edge(phi2);
        --wait for 100 ns;
        --cs <= "10";
        --rw <= '0';
        --a  <= "1011";

        --wait until rising_edge(phi2);
        --wait for 100 ns;
        --a  <= "ZZZZ";
        --wait for 100 ns;
        --d  <= "00000000";     
        
        --wait until falling_edge(phi2);
        --wait for 100 ns;
        --cs <= "00";
        --d  <= "ZZZZZZZZ";
        --rw <= '1';

        --Slow scan test.
        --wait for 1500000 ns;
        --wait until falling_edge(phi2);
        --p(5) <= '0';

        --wait for 700000 ns;
        --wait until falling_edge(phi2);
        --p(4) <= '0';

        --wait for 2500000 ns;
        --wait until falling_edge(phi2);
        --p(0) <= '0';

        --wait for 2000000 ns;
        --wait until falling_edge(phi2);
        --p(7) <= '0';

        --Read ALLPOT register.
        --wait for 5000 ns;
        --wait until falling_edge(phi2);
        --wait for 100 ns;
        --cs <= "10";
        --rw <= '1';
        --a  <= "1000";
        --wait until rising_edge(phi2);
        --wait for 100 ns;
        --a <= "ZZZZ";   
        --wait until falling_edge(phi2);
        --wait until rising_edge(phi2);
        --cs <= "00";        

        --Finish slow pot scan.
        --wait for 1500000 ns;
        --wait until falling_edge(phi2);
        --p(2) <= '0';

        --wait for 3000000 ns;
        --wait until falling_edge(phi2);
        --p(6) <= '0';

        --wait for 2700000 ns;
        --wait until falling_edge(phi2);
        --p(1) <= '0';

        --Read POT registers.
        --wait for 1000000 ns;
        --wait until falling_edge(phi2);
        --cs <= "10";
        --rw <= '1';
        --a  <= "0000";
        --wait until falling_edge(phi2);
        --a  <= "0001";
        --wait until falling_edge(phi2);
        --a  <= "0010";
        --wait until falling_edge(phi2);
        --a  <= "0011";
        --wait until falling_edge(phi2);
        --a  <= "0100";
        --wait until falling_edge(phi2);
        --a  <= "0101";
        --wait until falling_edge(phi2);
        --a  <= "0110";
        --wait until falling_edge(phi2);
        --a  <= "0111";

        --Fast scan test.
        --p <= "11111111";
        --wait for 1000000 ns;
        --wait until falling_edge(phi2);
        --wait for 100 ns;
        --cs <= "10";
        --rw <= '0';
        --a  <= "1111";

        --wait until rising_edge(phi2);
        --wait for 100 ns;
        --a  <= "ZZZZ";
        --wait for 100 ns;
        --d  <= "00000111";
        
        --wait until falling_edge(phi2);
        --wait for 100 ns;
        --cs <= "00";
        --d  <= "ZZZZZZZZ";
        --rw <= '1';

        --Start a pot scan.
        --wait for 5000 ns;
        --wait until falling_edge(phi2);
        --wait for 100 ns;
        --cs <= "10";
        --rw <= '0';
        --a  <= "1011";

        --wait until rising_edge(phi2);
        --wait for 100 ns;
        --a  <= "ZZZZ";
        --wait for 100 ns;
        --d  <= "00000000";     
        
        --wait until falling_edge(phi2);
        --wait for 100 ns;
        --cs <= "00";
        --d  <= "ZZZZZZZZ";
        --rw <= '1';

        --wait for 15000 ns;
        --wait until falling_edge(phi2);
        --p(3) <= '0';

        --wait for 5000 ns;
        --wait until falling_edge(phi2);
        --p(0) <= '0';

        --wait for 7000 ns;
        --wait until falling_edge(phi2);
        --p(1) <= '0';

        --wait for 3000 ns;
        --wait until falling_edge(phi2);
        --p(2) <= '0';

        --wait for 2500 ns;
        --wait until falling_edge(phi2);
        --p(6) <= '0';

        --wait for 5500 ns;
        --wait until falling_edge(phi2);
        --p(4) <= '0';

        --wait for 15500 ns;
        --wait until falling_edge(phi2);
        --p(7) <= '0';

        wait for 150000000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;
