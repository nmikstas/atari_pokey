library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_test is
end tb_test;

architecture behavioral of tb_test is

    constant CLK179MHZ_PERIOD : time := 558.7247666 ns;

    signal clk         : std_logic := '0';
    signal slowClk     : std_logic := '0';
    signal sdonShiftEn : std_logic := '1'; --Active low.
    signal ssoLoad     : std_logic := '0'; --Active high.
    signal ssoShift    : std_logic;
    signal ssoTransfer : std_logic;
    signal ssoRec      : std_logic;

    signal counter : unsigned(3 downto 0) := "0000";

begin

    clk <= NOT clk after CLK179MHZ_PERIOD / 2;

    test_0 : entity work.test
    port map
    ( 
        clk         => clk,        
        slowClk     => slowClk,
        sdonShiftEn => sdonShiftEn,
        ssoLoad     => ssoLoad,
        ssoShift    => ssoShift,
        ssoTransfer => ssoTransfer,
        ssoRec      => ssoRec
    );

    process(all)
    begin
        if(falling_edge(clk)) then
            counter <= counter + '1';
        end if;

        if counter > "0111" then
            slowClk <= '0';
        else
            slowClk <= '1';
        end if;
    end process;

    process
    begin
        
        --Load.
        wait until falling_edge(slowClk);
        wait until rising_edge(slowClk);
        wait until falling_edge(clk);
        wait until rising_edge(clk);
        ssoLoad <= '1';
        wait until rising_edge(clk);
        wait until rising_edge(clk);
        ssoLoad <= '0';

        --Shift.
        wait until falling_edge(slowClk);
        sdonShiftEn <= '0';
        wait until rising_edge(slowClk);
        sdonShiftEn <= '1';
        
        wait for 10000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;