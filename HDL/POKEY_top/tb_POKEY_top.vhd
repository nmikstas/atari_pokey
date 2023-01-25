--Test bench for the top level of the POKEY.
--Written by Nick Mikstas

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
    signal kr    : std_logic_vector(1 downto 0) := "00";
    signal sid   : std_logic                    := '0';
    signal bclki : std_logic                    := '0';

    signal bclko : std_logic;
    signal irq   : std_logic;
    signal sod   : std_logic;
    signal oclk  : std_logic;
    signal audio : std_logic_vector(5 downto 0);
    signal dump  : std_logic;
    signal k     : std_logic_vector(5 downto 0);
    
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

    process
    begin

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
        d  <= "00000011";
        
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

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
        wait for 5000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "1011";

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

        --Slow scan test.
        wait for 1500000 ns;
        wait until falling_edge(phi2);
        p(5) <= '0';

        wait for 700000 ns;
        wait until falling_edge(phi2);
        p(4) <= '0';

        wait for 2500000 ns;
        wait until falling_edge(phi2);
        p(0) <= '0';

        wait for 2000000 ns;
        wait until falling_edge(phi2);
        p(7) <= '0';

        --Read ALLPOT register.
        wait for 5000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '1';
        a  <= "1000";
        wait until rising_edge(phi2);
        wait for 100 ns;
        a <= "ZZZZ";   
        wait until falling_edge(phi2);
        wait until rising_edge(phi2);
        cs <= "00";        

        --Finish slow pot scan.
        wait for 1500000 ns;
        wait until falling_edge(phi2);
        p(2) <= '0';

        wait for 3000000 ns;
        wait until falling_edge(phi2);
        p(6) <= '0';

        wait for 2700000 ns;
        wait until falling_edge(phi2);
        p(1) <= '0';

        --Read POT registers.
        wait for 1000000 ns;
        wait until falling_edge(phi2);
        cs <= "10";
        rw <= '1';
        a  <= "0000";
        wait until falling_edge(phi2);
        a  <= "0001";
        wait until falling_edge(phi2);
        a  <= "0010";
        wait until falling_edge(phi2);
        a  <= "0011";
        wait until falling_edge(phi2);
        a  <= "0100";
        wait until falling_edge(phi2);
        a  <= "0101";
        wait until falling_edge(phi2);
        a  <= "0110";
        wait until falling_edge(phi2);
        a  <= "0111";

        --Fast scan test.
        p <= "11111111";
        wait for 1000000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "1111";

        wait until rising_edge(phi2);
        wait for 100 ns;
        a  <= "ZZZZ";
        wait for 100 ns;
        d  <= "00000111";
        
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Start a pot scan.
        wait for 5000 ns;
        wait until falling_edge(phi2);
        wait for 100 ns;
        cs <= "10";
        rw <= '0';
        a  <= "1011";

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

        wait for 15000 ns;
        wait until falling_edge(phi2);
        p(3) <= '0';

        wait for 5000 ns;
        wait until falling_edge(phi2);
        p(0) <= '0';

        wait for 7000 ns;
        wait until falling_edge(phi2);
        p(1) <= '0';

        wait for 3000 ns;
        wait until falling_edge(phi2);
        p(2) <= '0';

        wait for 2500 ns;
        wait until falling_edge(phi2);
        p(6) <= '0';

        wait for 5500 ns;
        wait until falling_edge(phi2);
        p(4) <= '0';

        wait for 15500 ns;
        wait until falling_edge(phi2);
        p(7) <= '0';

        wait for 15000000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;
