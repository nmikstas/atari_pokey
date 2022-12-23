--Test bench for the POKEY data and address core.
--Written by Nick Mikstas

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_data_address_core is
end tb_data_address_core;

architecture behavioral of tb_data_address_core is

    constant CLK179MHZ_PERIOD : time := 558.659 ns;

    signal clk       : std_logic := '0';
    signal RW        : std_logic := 'Z';
    signal CS0       : std_logic := 'Z';
    signal CS1       : std_logic := 'Z';
    signal D         : std_logic_vector(7 downto 0) := "ZZZZZZZZ";
    signal A         : std_logic_vector(3 downto 0) := "ZZZZ";
    signal DW        : std_logic_vector(7 downto 0);
    signal Addr0w    : std_logic;
    signal Addr1w    : std_logic;
    signal Addr2w    : std_logic;
    signal Addr3w    : std_logic;
    signal Addr4w    : std_logic;
    signal Addr5w    : std_logic;
    signal Addr6w    : std_logic;
    signal Addr7w    : std_logic;
    signal Addr8w    : std_logic;
    signal Addr9w    : std_logic;
    signal AddrAw    : std_logic;
    signal AddrBw    : std_logic;
    signal AddrDw    : std_logic;
    signal AddrEw    : std_logic;
    signal AddrFw    : std_logic;
    signal Addr0Data : std_logic_vector(7 downto 0) := "11110000";
    signal Addr1Data : std_logic_vector(7 downto 0) := "00001111";
    signal Addr2Data : std_logic_vector(7 downto 0) := "01010101";
    signal Addr3Data : std_logic_vector(7 downto 0) := "10101010";
    signal Addr4Data : std_logic_vector(7 downto 0) := "11001100";
    signal Addr5Data : std_logic_vector(7 downto 0) := "00110011";
    signal Addr6Data : std_logic_vector(7 downto 0) := "10011001";
    signal Addr7Data : std_logic_vector(7 downto 0) := "01100110";
    signal Addr8Data : std_logic_vector(7 downto 0) := "10000001";
    signal Addr9Data : std_logic_vector(7 downto 0) := "01111110";
    signal AddrAData : std_logic_vector(7 downto 0) := "11100011";
    signal AddrDData : std_logic_vector(7 downto 0) := "00011100";
    signal AddrEData : std_logic_vector(7 downto 0) := "00000001";
    signal AddrFData : std_logic_vector(7 downto 0) := "10000000";

begin

    clk <= NOT clk after CLK179MHZ_PERIOD / 2;

    data_address_core_0 : entity work.data_address_core
    port map
    ( 
        clk => clk,
        RW  => RW, 
        CS0 => CS0, 
        CS1 => CS1, 
        D => D, 
        A => A, 
        Dw => Dw, 
        Addr0w => Addr0w,
        Addr1w => Addr1w,
        Addr2w => Addr2w,
        Addr3w => Addr3w,
        Addr4w => Addr4w,
        Addr5w => Addr5w,
        Addr6w => Addr6w,
        Addr7w => Addr7w,
        Addr8w => Addr8w,
        Addr9w => Addr9w,
        AddrAw => AddrAw,
        AddrBw => AddrBw,
        AddrDw => AddrDw,
        AddrEw => AddrEw,
        AddrFw => AddrFw,
        Addr0Data => Addr0Data,
        Addr1Data => Addr1Data,
        Addr2Data => Addr2Data,
        Addr3Data => Addr3Data,
        Addr4Data => Addr4Data,
        Addr5Data => Addr5Data,
        Addr6Data => Addr6Data,
        Addr7Data => Addr7Data,
        Addr8Data => Addr8Data,
        Addr9Data => Addr9Data,
        AddrAData => AddrAData,
        AddrDData => AddrDData,
        AddrEData => AddrEData,
        AddrFData => AddrFData
    );

    process
    begin

        --Read out address 0x04.
        wait for 5000 ns;
        wait until falling_edge(clk);
        wait for 100 ns;
        RW  <= '1';
        CS0 <= '0';
        CS1 <= '1';
        A   <= "0100";

        wait until rising_edge(clk);
        wait for 100 ns;
        A <= "ZZZZ";

        wait until falling_edge(clk);
        wait for 100 ns;
        RW  <= 'Z';
        CS0 <= 'Z';
        CS1 <= 'Z';
        
        --Write to address 0x0A;
        wait for 2000 ns;
        wait until falling_edge(clk);
        wait for 100 ns;
        RW <= '0';
        CS0 <= '0';
        CS1 <= '1';
        A  <= "1010";

        wait until rising_edge(clk);
        wait for 100 ns;
        A <= "ZZZZ";

        wait for 100 ns;
        D  <= "00011000";

        wait until falling_edge(clk);
        wait for 100 ns;
        RW <= 'Z';
        CS0 <= 'Z';
        CS1 <= 'Z';
        D  <= "ZZZZZZZZ";

        wait for 1000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;
