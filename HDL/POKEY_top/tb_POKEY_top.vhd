--Test bench for the top level of the POKEY.
--Written by Nick Mikstas

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_pokey_top is
end tb_pokey_top;

architecture behavioral of tb_pokey_top is

    constant CLK179MHZ_PERIOD : time := 558.7247666 ns;

    signal phi2 : std_logic                    := '0';
    signal cs   : std_logic_vector(1 downto 0) := "00";
    signal rw   : std_logic                    := '1';
    signal d    : std_logic_vector(7 downto 0) := "ZZZZZZZZ";
    signal a    : std_logic_vector(3 downto 0) := "0000";
    signal p    : std_logic_vector(7 downto 0) := "00000000";
    signal kr   : std_logic_vector(1 downto 0) := "00";
    signal sid  : std_logic                    := '0';
    signal bclk : std_logic                    := '0';

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
        bclk  => bclk
    );

    process
    begin
        --Initialize the chip.
        wait for 5000 ns;
        wait until falling_edge(phi2);
        cs <= "10";
        a  <= "1111";
        rw <= '0';

        wait until rising_edge(phi2);
        d  <= "00000000";
        a  <= "0000";
        
        wait until falling_edge(phi2);
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Set the audio clock to 15KHz.
        wait for 5000 ns;
        wait until falling_edge(phi2);
        cs <= "10";
        a  <= "1000";
        rw <= '0';

        wait until rising_edge(phi2);
        d  <= "00000001";
        a  <= "0000";
        
        wait until falling_edge(phi2);
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';
       
        --Release the initialization.
        wait for 20000 ns;
        wait until falling_edge(phi2);
        cs <= "10";
        a  <= "1111";
        rw <= '0';

        wait until rising_edge(phi2);
        d  <= "00000011";
        a  <= "0000";
        
        wait until falling_edge(phi2);
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';

        --Set the audio clock to 64KHz.
        wait for 250000 ns;
        wait until falling_edge(phi2);
        cs <= "10";
        a  <= "1000";
        rw <= '0';

        wait until rising_edge(phi2);
        d  <= "00000000";
        a  <= "0000";
        
        wait until falling_edge(phi2);
        cs <= "00";
        d  <= "ZZZZZZZZ";
        rw <= '1';
        
        --Read out the random number.
        wait until falling_edge(phi2);
        cs <= "10";
        a  <= "1010";
        rw <= '1';




        wait for 250000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;
