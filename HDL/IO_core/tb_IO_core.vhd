library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_IO_core is
end tb_IO_core;

architecture behavioral of tb_IO_core is

    constant CLK179MHZ_PERIOD : time := 558.659 ns;

    signal init        : std_logic := '0';
    signal sel9bitPoly : std_logic := '0';
    signal rndNum      : std_logic_vector(7 downto 0);
    signal poly4bit    : std_logic;
    signal poly5bit    : std_logic;
    signal poly917bit  : std_logic;

    signal clk : std_logic := '0';
    signal RW  : std_logic := 'Z';
    signal CS  : std_logic_vector(1 downto 0) := "ZZ";
    signal D   : std_logic_vector(7 downto 0) := "ZZZZZZZZ";
    signal A   : std_logic_vector(3 downto 0) := "ZZZZ";

    signal Addr0w : std_logic;
    signal Addr1w : std_logic;
    signal Addr2w : std_logic;
    signal Addr3w : std_logic;
    signal Addr4w : std_logic;
    signal Addr5w : std_logic;
    signal Addr6w : std_logic;
    signal Addr7w : std_logic;
    signal Addr8w : std_logic;
    signal Addr9w : std_logic;
    signal AddrAw : std_logic;
    signal AddrBw : std_logic;
    signal AddrDw : std_logic;
    signal AddrEw : std_logic;
    signal AddrFw : std_logic;

    signal Data0r : std_logic_vector(7 downto 0) := "11110000";
    signal Data1r : std_logic_vector(7 downto 0) := "00001111";
    signal Data2r : std_logic_vector(7 downto 0) := "01010101";
    signal Data3r : std_logic_vector(7 downto 0) := "10101010";
    signal Data4r : std_logic_vector(7 downto 0) := "11001100";
    signal Data5r : std_logic_vector(7 downto 0) := "00110011";
    signal Data6r : std_logic_vector(7 downto 0) := "10011001";
    signal Data7r : std_logic_vector(7 downto 0) := "01100110";
    signal Data8r : std_logic_vector(7 downto 0) := "10000001";
    signal Data9r : std_logic_vector(7 downto 0) := "11100011";
    signal DataAr : std_logic_vector(7 downto 0);
    signal DataDr : std_logic_vector(7 downto 0) := "00011100";
    signal DataEr : std_logic_vector(7 downto 0) := "00000001";
    signal DataFr : std_logic_vector(7 downto 0) := "10000000";

    signal DataW     : std_logic_vector(7 downto 0);
begin

    clk <= NOT clk after CLK179MHZ_PERIOD / 2;

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

    io_core_0 : entity work.IO_core
    port map
    ( 
        clk => clk,
        RW  => RW, 
        CS => CS, 
        D => D, 
        A => A, 
        Dataw => Dataw, 
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
        Data0r => Data0r,
        Data1r => Data1r,
        Data2r => Data2r,
        Data3r => Data3r,
        Data4r => Data4r,
        Data5r => Data5r,
        Data6r => Data6r,
        Data7r => Data7r,
        Data8r => Data8r,
        Data9r => Data9r,
        DataAr => rndNum,
        DataDr => DataDr,
        DataEr => DataEr,
        DataFr => DataFr
    );

    process
    begin
        wait for 5000 ns;
        wait until falling_edge(clk);

        init <= '1';
        wait for 20000 ns;
        wait until falling_edge(clk);

        init <= '0';

        wait for 3000 ns;
        wait until falling_edge(clk);
        CS(0) <= '0';
        CS(1) <= '1';
        RW    <= '1';
        A     <= "1010";
        wait until rising_edge(clk);
        A     <= "1100";
        wait until falling_edge(clk);
        CS(0) <= '1';
        CS(1) <= '1';
        RW    <= '0';

        wait for 1000 ns;
        wait until falling_edge(clk);
        CS(0) <= '0';
        CS(1) <= '1';
        RW    <= '0';
        A     <= "0000";
        wait until rising_edge(clk);
        A     <= "1100";
        wait until falling_edge(clk);
        CS(0) <= '1';
        CS(1) <= '1';
        RW    <= '0';

        wait for 1000 ns;
        wait until falling_edge(clk);
        CS(0) <= '0';
        CS(1) <= '1';
        RW    <= '0';
        A     <= "0001";
        wait until rising_edge(clk);
        A     <= "1100";
        wait until falling_edge(clk);
        CS(0) <= '1';
        CS(1) <= '1';
        RW    <= '0';

        wait for 1000 ns;
        wait until falling_edge(clk);
        CS(0) <= '0';
        CS(1) <= '1';
        RW    <= '0';
        A     <= "0010";
        wait until rising_edge(clk);
        A     <= "1100";
        wait until falling_edge(clk);
        CS(0) <= '1';
        CS(1) <= '1';
        RW    <= '0';

        wait for 1000 ns;
        wait until falling_edge(clk);
        CS(0) <= '0';
        CS(1) <= '1';
        RW    <= '0';
        A     <= "0011";
        wait until rising_edge(clk);
        A     <= "1100";
        wait until falling_edge(clk);
        CS(0) <= '1';
        CS(1) <= '1';
        RW    <= '0';

        wait for 1000 ns;
        wait until falling_edge(clk);
        CS(0) <= '0';
        CS(1) <= '1';
        RW    <= '0';
        A     <= "0100";
        wait until rising_edge(clk);
        A     <= "1100";
        wait until falling_edge(clk);
        CS(0) <= '1';
        CS(1) <= '1';
        RW    <= '0';

        wait for 1000 ns;
        wait until falling_edge(clk);
        CS(0) <= '0';
        CS(1) <= '1';
        RW    <= '0';
        A     <= "0101";
        wait until rising_edge(clk);
        A     <= "1100";
        wait until falling_edge(clk);
        CS(0) <= '1';
        CS(1) <= '1';
        RW    <= '0';

        wait for 1000 ns;
        wait until falling_edge(clk);
        CS(0) <= '0';
        CS(1) <= '1';
        RW    <= '0';
        A     <= "0110";
        wait until rising_edge(clk);
        A     <= "1100";
        wait until falling_edge(clk);
        CS(0) <= '1';
        CS(1) <= '1';
        RW    <= '0';

        wait for 1000 ns;
        wait until falling_edge(clk);
        CS(0) <= '0';
        CS(1) <= '1';
        RW    <= '0';
        A     <= "0111";
        wait until rising_edge(clk);
        A     <= "1100";
        wait until falling_edge(clk);
        CS(0) <= '1';
        CS(1) <= '1';
        RW    <= '0';

        wait for 1000 ns;
        wait until falling_edge(clk);
        CS(0) <= '0';
        CS(1) <= '1';
        RW    <= '0';
        A     <= "1000";
        wait until rising_edge(clk);
        A     <= "1100";
        wait until falling_edge(clk);
        CS(0) <= '1';
        CS(1) <= '1';
        RW    <= '0';

        wait for 1000 ns;
        wait until falling_edge(clk);
        CS(0) <= '0';
        CS(1) <= '1';
        RW    <= '0';
        A     <= "1001";
        wait until rising_edge(clk);
        A     <= "1100";
        wait until falling_edge(clk);
        CS(0) <= '1';
        CS(1) <= '1';
        RW    <= '0';

        wait for 1000 ns;
        wait until falling_edge(clk);
        CS(0) <= '0';
        CS(1) <= '1';
        RW    <= '0';
        A     <= "1010";
        wait until rising_edge(clk);
        A     <= "1100";
        wait until falling_edge(clk);
        CS(0) <= '1';
        CS(1) <= '1';
        RW    <= '0';

        wait for 1000 ns;
        wait until falling_edge(clk);
        CS(0) <= '0';
        CS(1) <= '1';
        RW    <= '0';
        A     <= "1011";
        wait until rising_edge(clk);
        A     <= "1100";
        wait until falling_edge(clk);
        CS(0) <= '1';
        CS(1) <= '1';
        RW    <= '0';

        wait for 1000 ns;
        wait until falling_edge(clk);
        CS(0) <= '0';
        CS(1) <= '1';
        RW    <= '0';
        A     <= "1101";
        wait until rising_edge(clk);
        A     <= "1100";
        wait until falling_edge(clk);
        CS(0) <= '1';
        CS(1) <= '1';
        RW    <= '0';

        wait for 1000 ns;
        wait until falling_edge(clk);
        CS(0) <= '0';
        CS(1) <= '1';
        RW    <= '0';
        A     <= "1110";
        wait until rising_edge(clk);
        A     <= "1100";
        wait until falling_edge(clk);
        CS(0) <= '1';
        CS(1) <= '1';
        RW    <= '0';

        wait for 1000 ns;
        wait until falling_edge(clk);
        CS(0) <= '0';
        CS(1) <= '1';
        RW    <= '0';
        A     <= "1111";
        wait until rising_edge(clk);
        A     <= "1100";
        wait until falling_edge(clk);
        CS(0) <= '1';
        CS(1) <= '1';
        RW    <= '0';

        --Read functions.
        wait for 3000 ns;
        wait until rising_edge(clk);
        CS(0) <= '0';
        CS(1) <= '1';
        RW    <= '1';
        A     <= "1100";

        wait until falling_edge(clk);
        A <= "0000";
        wait until rising_edge(clk);
        A <= "1100";
        wait until falling_edge(clk);
        A <= "0001";
        wait until rising_edge(clk);
        A <= "1100";
        wait until falling_edge(clk);
        A <= "0010";
        wait until rising_edge(clk);
        A <= "1100";
        wait until falling_edge(clk);
        A <= "0011";
        wait until rising_edge(clk);
        A <= "1100";
        wait until falling_edge(clk);
        A <= "0100";
        wait until rising_edge(clk);
        A <= "1100";
        wait until falling_edge(clk);
        A <= "0101";
        wait until rising_edge(clk);
        A <= "1100";
        wait until falling_edge(clk);
        A <= "0100";
        wait until rising_edge(clk);
        A <= "1100";
        wait until falling_edge(clk);
        A <= "0101";
        wait until rising_edge(clk);
        A <= "1100";
        wait until falling_edge(clk);
        A <= "0110";
        wait until rising_edge(clk);
        A <= "1100";
        wait until falling_edge(clk);
        A <= "0111";
        wait until rising_edge(clk);
        A <= "1100";
        wait until falling_edge(clk);
        A <= "1000";
        wait until rising_edge(clk);
        A <= "1100";
        wait until falling_edge(clk);
        A <= "1001";
        wait until rising_edge(clk);
        A <= "1100";
        wait until falling_edge(clk);
        A <= "1010";
        wait until rising_edge(clk);
        A <= "1100";
        wait until falling_edge(clk);
        A <= "1101";
        wait until rising_edge(clk);
        A <= "1100";
        wait until falling_edge(clk);
        A <= "1110";
        wait until rising_edge(clk);
        A <= "1100";
        wait until falling_edge(clk);
        A <= "1111";
        wait until rising_edge(clk);
        A <= "1100";

        wait for 100000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;
