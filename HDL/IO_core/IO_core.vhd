--IO core
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                          --IO Entity--                                         --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity io_core is
    port 
    (
        --Main system clock.
        clk : in std_logic;

        --Read/write and chip enable signals.
        RW : in std_logic;
        CS : in std_logic_vector(1 downto 0);
        
        --Data and address lines.
        D : inout std_logic_vector(7 downto 0);
        A : in    std_logic_vector(3 downto 0);

        --Data being written into POKEY internal registers.
        Dataw : out   std_logic_vector(7 downto 0);

        --Enables that are active when a specific address is selected for data write.
        Addr0w : out std_logic;
        Addr1w : out std_logic;
        Addr2w : out std_logic;
        Addr3w : out std_logic;
        Addr4w : out std_logic;
        Addr5w : out std_logic;
        Addr6w : out std_logic;
        Addr7w : out std_logic;
        Addr8w : out std_logic;
        Addr9w : out std_logic;
        AddrAw : out std_logic;
        AddrBw : out std_logic;
        AddrDw : out std_logic;
        AddrEw : out std_logic;
        AddrFw : out std_logic;

        --Data sources multiplexed on the data out lines.
        Data0r : in std_logic_vector(7 downto 0);
        Data1r : in std_logic_vector(7 downto 0);
        Data2r : in std_logic_vector(7 downto 0);
        Data3r : in std_logic_vector(7 downto 0);
        Data4r : in std_logic_vector(7 downto 0);
        Data5r : in std_logic_vector(7 downto 0);
        Data6r : in std_logic_vector(7 downto 0);
        Data7r : in std_logic_vector(7 downto 0);
        Data8r : in std_logic_vector(7 downto 0);
        Data9r : in std_logic_vector(7 downto 0);
        DataAr : in std_logic_vector(7 downto 0);
        DataDr : in std_logic_vector(7 downto 0);
        DataEr : in std_logic_vector(7 downto 0);
        DataFr : in std_logic_vector(7 downto 0)
    );     
end io_core;

----------------------------------------------------------------------------------------------------
--                                       --IO Architecture--                                      --
----------------------------------------------------------------------------------------------------

architecture structural of io_core is
    signal Data0Q : std_logic_vector(7 downto 0); 
    signal Data1Q : std_logic_vector(7 downto 0);
    signal Data2Q : std_logic_vector(7 downto 0);
    signal Data3Q : std_logic_vector(7 downto 0);
    signal Data4Q : std_logic_vector(7 downto 0);
    signal Data5Q : std_logic_vector(7 downto 0);
    signal Data6Q : std_logic_vector(7 downto 0);
    signal Data7Q : std_logic_vector(7 downto 0);
    signal Data8Q : std_logic_vector(7 downto 0);
    signal Data9Q : std_logic_vector(7 downto 0);
    signal DataAQ : std_logic_vector(7 downto 0);
    signal DataDQ : std_logic_vector(7 downto 0);
    signal DataEQ : std_logic_vector(7 downto 0);
    signal DataFQ : std_logic_vector(7 downto 0);

    signal muxOut : std_logic_vector(7 downto 0);

    signal AQ : std_logic_vector(3 downto 0);

    signal readEn   : std_logic;
    signal nwriteEn : std_logic;
begin

    process(all)
    begin

        --Always lock in the address.
        if(rising_edge(clk)) then
            AQ <= A;
        end if;

        ---------------------------------------Enable Signals---------------------------------------

        readEn   <= RW and (not CS(0)) and CS(1);
        nwriteEn <= RW or CS(0) or (not CS(1));

        ----------------------------------------Address Read----------------------------------------

        --Re-time the output data so we have plenty of time on the negative clock edge.
        if(rising_edge(clk)) then
            Data0Q <= Data0r;
            Data1Q <= Data1r;
            Data2Q <= Data2r;
            Data3Q <= Data3r;
            Data4Q <= Data4r;
            Data5Q <= Data5r;
            Data6Q <= Data6r;
            Data7Q <= Data7r;
            Data8Q <= Data8r;
            Data9Q <= Data9r;
            DataAQ <= DataAr;
            DataDQ <= DataDr;
            DataEQ <= DataEr;
            DataFQ <= DataFr;
        end if;

        --MUX out based on captured address.
        case AQ is
      when "0000" =>
        muxOut <= Data0Q; 
            when "0001" =>
        muxOut <= Data1Q; 
            when "0010" =>
        muxOut <= Data2Q;
            when "0011" =>
        muxOut <= Data3Q;
            when "0100" =>
        muxOut <= Data4Q;
            when "0101" =>
        muxOut <= Data5Q;
            when "0110" =>
        muxOut <= Data6Q;
            when "0111" =>
        muxOut <= Data7Q;
            when "1000" =>
        muxOut <= Data8Q;
            when "1001" =>
        muxOut <= Data9Q;
            when "1010" =>
        muxOut <= DataAQ;
            when "1101" =>
        muxOut <= DataDQ;
            when "1110" =>
        muxOut <= DataEQ;
            when "1111" =>
        muxOut <= DataFQ;
            when others =>
        muxOut <= "00000000";
    end case;

        ------------------------------------------Data I/O------------------------------------------

        if(readEn = '0') then
            D  <= "ZZZZZZZZ";
            Dataw <= D;
        else
            D  <= muxOut;
            Dataw <= D;
        end if;
        
        ----------------------------------------Address Write---------------------------------------

        Addr0w <= not(nwriteEn or      AQ(0)  or      AQ(1)  or      AQ(2)  or      AQ(3));
        Addr1w <= not(nwriteEn or (not AQ(0)) or      AQ(1)  or      AQ(2)  or      AQ(3));
        Addr2w <= not(nwriteEn or      AQ(0)  or (not AQ(1)) or      AQ(2)  or      AQ(3));
        Addr3w <= not(nwriteEn or (not AQ(0)) or (not AQ(1)) or      AQ(2)  or      AQ(3));
        Addr4w <= not(nwriteEn or      AQ(0)  or      AQ(1)  or (not AQ(2)) or      AQ(3));
        Addr5w <= not(nwriteEn or (not AQ(0)) or      AQ(1)  or (not AQ(2)) or      AQ(3));
        Addr6w <= not(nwriteEn or      AQ(0)  or (not AQ(1)) or (not AQ(2)) or      AQ(3));
        Addr7w <= not(nwriteEn or (not AQ(0)) or (not AQ(1)) or (not AQ(2)) or      AQ(3));
        Addr8w <= not(nwriteEn or      AQ(0)  or      AQ(1)  or      AQ(2)  or (not AQ(3)));
        Addr9w <= not(nwriteEn or (not AQ(0)) or      AQ(1)  or      AQ(2)  or (not AQ(3)));
        AddrAw <= not(nwriteEn or      AQ(0)  or (not AQ(1)) or      AQ(2)  or (not AQ(3)));
        AddrBw <= not(nwriteEn or (not AQ(0)) or (not AQ(1)) or      AQ(2)  or (not AQ(3)));
        AddrDw <= not(nwriteEn or (not AQ(0)) or      AQ(1)  or (not AQ(2)) or (not AQ(3)));
        AddrEw <= not(nwriteEn or      AQ(0)  or (not AQ(1)) or (not AQ(2)) or (not AQ(3)));
        AddrFw <= not(nwriteEn or (not AQ(0)) or (not AQ(1)) or (not AQ(2)) or (not AQ(3)));

    end process;
end structural;
