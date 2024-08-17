--Test bench for the POKEY serial output module.
--Written by Nick Mikstas

library modelsim_lib;
use modelsim_lib.util.all;
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_SEROUT_shift_module is
end tb_SEROUT_shift_module;

architecture behavioral of tb_SEROUT_shift_module is

    constant CLK179MHZ_PERIOD : time := 558.7247666 ns;

    signal clk       : std_logic := '0';
    signal D         : std_logic_vector(7 downto 0) := "11001001";
    signal AddrDw    : std_logic := '0';
    signal Load      : std_logic := '0';
    signal Shift     : std_logic := '0';
    signal Empty     : std_logic;
    signal DshiftOut : std_logic;
    signal shiftOut  : std_logic;
    signal Qout      : std_logic_vector(8 downto 0);
    signal Q10bit    : std_logic_vector(9 downto 0);
    
begin

    clk <= NOT clk after CLK179MHZ_PERIOD / 2;

    SEROUT_shift_module_0 : entity work.SEROUT_shift_module
    port map
    ( 
        clk       => clk,
        D         => D,
        AddrDw    => AddrDw,
        Load      => Load,
        Shift     => Shift,
        Empty     => Empty,
        DshiftOut => DshiftOut
    );

    Q10bit <= Qout & shiftOut;

    spy_process : process
    begin
        
        init_signal_spy("/tb_SEROUT_shift_module/SEROUT_shift_module_0/Qout","/Qout");
        init_signal_spy("/tb_SEROUT_shift_module/SEROUT_shift_module_0/shiftOut","/shiftOut");
        wait;

       
    end process spy_process;

    process
    begin
        

        --Load write register.
        wait for 1000 ns;
        wait until rising_edge(clk);
        AddrDw <= '1';
        wait until rising_edge(clk);
        AddrDw <= '0';

        --Transfer contents of write register to the shift register.
        wait until rising_edge(clk);
        Load <= '1';
        wait until rising_edge(clk);
        Load <= '0';

        --Shift out.
        wait for 1000 ns;
        wait until falling_edge(clk);
        Shift <= '1';
        wait until falling_edge(clk);
        Shift <= '0';

        wait until falling_edge(clk);
        Shift <= '1';
        wait until falling_edge(clk);
        Shift <= '0';

        wait until falling_edge(clk);
        wait until falling_edge(clk);
        Shift <= '1';
        wait until falling_edge(clk);
        Shift <= '0';

        wait until falling_edge(clk);
        Shift <= '1';
        wait until falling_edge(clk);
        Shift <= '0';

        wait until falling_edge(clk);
        Shift <= '1';
        wait until falling_edge(clk);
        wait until falling_edge(clk);
        Shift <= '0';

        wait until falling_edge(clk);
        Shift <= '1';
        wait until falling_edge(clk);
        Shift <= '0';

        wait until falling_edge(clk);
        Shift <= '1';
        wait until falling_edge(clk);
        wait until falling_edge(clk);
        wait until falling_edge(clk);
        Shift <= '0';

        wait until falling_edge(clk);
        Shift <= '1';
        wait until falling_edge(clk);
        Shift <= '0';

        wait until falling_edge(clk);
        Shift <= '1';
        wait until falling_edge(clk);
        Shift <= '0';

        wait until falling_edge(clk);
        Shift <= '1';
        wait until falling_edge(clk);
        Shift <= '0';
                
        wait for 2000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;
