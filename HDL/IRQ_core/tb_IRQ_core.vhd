--Test bench for the POKEY IRQ core.
--Written by Nick Mikstas

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_irq_core is
end tb_irq_core;

architecture behavioral of tb_irq_core is

    constant CLK179MHZ_PERIOD : time := 558.7247666 ns;

    signal clk         : std_logic := '0';
    signal IRQEN       : std_logic := '0';
    signal Dw          : std_logic_vector(7 downto 0) := "00000000";
    signal setBreak    : std_logic := '0';
    signal setKey      : std_logic := '0';
    signal setSdiCompl : std_logic := '0';
    signal setSdoCompl : std_logic := '0';
    signal sdoFinish   : std_logic := '0';
    signal Timer4      : std_logic := '0';
    signal Timer2      : std_logic := '0';
    signal Timer1      : std_logic := '0';
    signal IRQ         : std_logic;
    signal Dr          : std_logic_vector(7 downto 0);
    signal keyOvrun    : std_logic;
    signal sdiOvrun    : std_logic;
    
begin

    clk <= NOT clk after CLK179MHZ_PERIOD / 2;

    irq_core_0 : entity work.irq_core
    port map
    ( 
        clk         => clk,
        IRQEN       => IRQEN,
        Dw          => Dw,
        setBreak    => setBreak,
        setKey      => setKey,
        setSdiCompl => setSdiCompl,
        setSdoCompl => setSdoCompl,
        sdoFinish   => sdoFinish,
        Timer4      => Timer4,
        Timer2      => Timer2,
        Timer1      => Timer1,
        IRQ         => IRQ,
        Dr          => Dr,
        keyOvrun    => keyOvrun,
        sdiOvrun    => sdiOvrun
    );

    process
    begin
        --Disable all the IRQs.
        wait for 5000 ns;
        wait until rising_edge(clk);
        IRQEN <= '1';
        wait until rising_edge(clk);
        IRQEN <= '0';

        --Activate all IRQ signals. IRQ line should not go high.
        wait for 1000 ns;
        wait until rising_edge(clk);
        setBreak    <= '1';
        setKey      <= '1';
        setSdiCompl <= '1';
        setSdoCompl <= '1';
        sdoFinish   <= '1';
        Timer4      <= '1';
        Timer2      <= '1';
        Timer1      <= '1';

        --Turn off all IRQ signals.
        wait for 1000 ns;
        wait until rising_edge(clk);
        setBreak    <= '0';
        setKey      <= '0';
        setSdiCompl <= '0';
        setSdoCompl <= '0';
        sdoFinish   <= '1';
        Timer4      <= '0';
        Timer2      <= '0';
        Timer1      <= '0';       

        --------------------------------------Test Timer 1 IRQ--------------------------------------
        wait for 5000 ns;

        --Enable IRQ.
        wait until rising_edge(clk);
        Dw <= "00000001";
        wait until rising_edge(clk);
        IRQEN <= '1';
        wait until rising_edge(clk);
        IRQEN <= '0';
        wait until rising_edge(clk);
        Dw <= "00000000";

        --Send an IRQ.
        wait for 3000 ns;
        wait until rising_edge(clk);
        Timer1 <= '1';
        wait until rising_edge(clk);
        Timer1 <= '0';

        --Clear IRQ signal.
        wait for 3000 ns;
        wait until rising_edge(clk);
        Dw <= "00000000";
        wait until rising_edge(clk);
        IRQEN <= '1';
        wait until rising_edge(clk);
        IRQEN <= '0';
        
        --------------------------------------Test Timer 2 IRQ--------------------------------------
        wait for 5000 ns;

        --Enable IRQ.
        wait until rising_edge(clk);
        Dw <= "00000010";
        wait until rising_edge(clk);
        IRQEN <= '1';
        wait until rising_edge(clk);
        IRQEN <= '0';
        wait until rising_edge(clk);
        Dw <= "00000000";

        --Send an IRQ.
        wait for 3000 ns;
        wait until rising_edge(clk);
        Timer2 <= '1';
        wait until rising_edge(clk);
        Timer2 <= '0';

        --Clear IRQ signal.
        wait for 3000 ns;
        wait until rising_edge(clk);
        Dw <= "00000000";
        wait until rising_edge(clk);
        IRQEN <= '1';
        wait until rising_edge(clk);
        IRQEN <= '0';

        --------------------------------------Test Timer 4 IRQ--------------------------------------
        wait for 5000 ns;

        --Enable IRQ.
        wait until rising_edge(clk);
        Dw <= "00000100";
        wait until rising_edge(clk);
        IRQEN <= '1';
        wait until rising_edge(clk);
        IRQEN <= '0';
        wait until rising_edge(clk);
        Dw <= "00000000";

        --Send an IRQ.
        wait for 3000 ns;
        wait until rising_edge(clk);
        Timer4 <= '1';
        wait until rising_edge(clk);
        Timer4 <= '0';

        --Clear IRQ signal.
        wait for 3000 ns;
        wait until rising_edge(clk);
        Dw <= "00000000";
        wait until rising_edge(clk);
        IRQEN <= '1';
        wait until rising_edge(clk);
        IRQEN <= '0';        

        -------------------------------------Test sdo Finish IRQ------------------------------------
        wait for 5000 ns;

        --Enable IRQ.
        wait until rising_edge(clk);
        Dw <= "00001000";
        wait until rising_edge(clk);
        IRQEN <= '1';
        wait until rising_edge(clk);
        IRQEN <= '0';
        wait until rising_edge(clk);
        Dw <= "00000000";

        --Send an IRQ.
        wait for 3000 ns;
        wait until rising_edge(clk);
        sdoFinish <= '0';
        wait until rising_edge(clk);
        sdoFinish <= '1';

        --Clear IRQ signal.
        wait for 3000 ns;
        wait until rising_edge(clk);
        Dw <= "00000000";
        wait until rising_edge(clk);
        IRQEN <= '1';
        wait until rising_edge(clk);
        IRQEN <= '0';

        ------------------------------------Test Sdo Complete IRQ-----------------------------------
        wait for 5000 ns;

        --Enable IRQ.
        wait until rising_edge(clk);
        Dw <= "00010000";
        wait until rising_edge(clk);
        IRQEN <= '1';
        wait until rising_edge(clk);
        IRQEN <= '0';
        wait until rising_edge(clk);
        Dw <= "00000000";

        --Send an IRQ.
        wait for 3000 ns;
        wait until rising_edge(clk);
        setSdoCompl <= '1';
        wait until rising_edge(clk);
        setSdoCompl <= '0';

        --Clear IRQ signal.
        wait for 3000 ns;
        wait until rising_edge(clk);
        Dw <= "00000000";
        wait until rising_edge(clk);
        IRQEN <= '1';
        wait until rising_edge(clk);
        IRQEN <= '0';  

        ------------------------------------Test Sdi Complete IRQ-----------------------------------
        wait for 5000 ns;

        --Enable IRQ.
        wait until rising_edge(clk);
        Dw <= "00100000";
        wait until rising_edge(clk);
        IRQEN <= '1';
        wait until rising_edge(clk);
        IRQEN <= '0';
        wait until rising_edge(clk);
        Dw <= "00000000";

        --Send an IRQ.
        wait for 3000 ns;
        wait until rising_edge(clk);
        setSdiCompl <= '1';
        wait until rising_edge(clk);
        setSdiCompl <= '0';

        --Clear IRQ signal.
        wait for 3000 ns;
        wait until rising_edge(clk);
        Dw <= "00000000";
        wait until rising_edge(clk);
        IRQEN <= '1';
        wait until rising_edge(clk);
        IRQEN <= '0';

        ----------------------------------------Test Key IRQ----------------------------------------
        wait for 5000 ns;

        --Enable IRQ.
        wait until rising_edge(clk);
        Dw <= "01000000";
        wait until rising_edge(clk);
        IRQEN <= '1';
        wait until rising_edge(clk);
        IRQEN <= '0';
        wait until rising_edge(clk);
        Dw <= "00000000";

        --Send an IRQ.
        wait for 3000 ns;
        wait until rising_edge(clk);
        setKey <= '1';
        wait until rising_edge(clk);
        setKey <= '0';

        --Clear IRQ signal.
        wait for 3000 ns;
        wait until rising_edge(clk);
        Dw <= "00000000";
        wait until rising_edge(clk);
        IRQEN <= '1';
        wait until rising_edge(clk);
        IRQEN <= '0';

        ---------------------------------------Test Break IRQ---------------------------------------
        wait for 5000 ns;

        --Enable IRQ.
        wait until rising_edge(clk);
        Dw <= "10000000";
        wait until rising_edge(clk);
        IRQEN <= '1';
        wait until rising_edge(clk);
        IRQEN <= '0';
        wait until rising_edge(clk);
        Dw <= "00000000";

        --Send an IRQ.
        wait for 3000 ns;
        wait until rising_edge(clk);
        setBreak <= '1';
        wait until rising_edge(clk);
        setBreak <= '0';

        --Clear IRQ signal.
        wait for 3000 ns;
        wait until rising_edge(clk);
        Dw <= "00000000";
        wait until rising_edge(clk);
        IRQEN <= '1';
        wait until rising_edge(clk);
        IRQEN <= '0'; 


        wait for 100000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;
