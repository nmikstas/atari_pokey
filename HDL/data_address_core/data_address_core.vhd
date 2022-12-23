--Address and data IO controller
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                   --Data And Address Entity--                                  --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity data_address_core is
    port 
    (
        --Main system clock.
        clk : in std_logic;

        --Read/write and chip enable signals.
        RW  : in std_logic;
        CS0 : in std_logic;
        CS1 : in std_logic;
        
        --Data and address lines.
        D : inout std_logic_vector(7 downto 0);
        A : in    std_logic_vector(3 downto 0);

        --Data being written into POKEY internal registers.
        Dw : out   std_logic_vector(7 downto 0);

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
        Addr0Data : in std_logic_vector(7 downto 0);
        Addr1Data : in std_logic_vector(7 downto 0);
        Addr2Data : in std_logic_vector(7 downto 0);
        Addr3Data : in std_logic_vector(7 downto 0);
        Addr4Data : in std_logic_vector(7 downto 0);
        Addr5Data : in std_logic_vector(7 downto 0);
        Addr6Data : in std_logic_vector(7 downto 0);
        Addr7Data : in std_logic_vector(7 downto 0);
        Addr8Data : in std_logic_vector(7 downto 0);
        Addr9Data : in std_logic_vector(7 downto 0);
        AddrAData : in std_logic_vector(7 downto 0);
        AddrDData : in std_logic_vector(7 downto 0);
        AddrEData : in std_logic_vector(7 downto 0);
        AddrFData : in std_logic_vector(7 downto 0)
    );     
end data_address_core;

----------------------------------------------------------------------------------------------------
--                                --Data And Address Architecture--                               --
----------------------------------------------------------------------------------------------------

architecture structural of data_address_core is

    signal preDoutDis : std_logic;
    signal DoutDis    : std_logic;
    signal CsWr       : std_logic;

    --Internal data read enable signals.
    signal Addr0r : std_logic;
    signal Addr1r : std_logic;
    signal Addr2r : std_logic;
    signal Addr3r : std_logic;
    signal Addr4r : std_logic;
    signal Addr5r : std_logic;
    signal Addr6r : std_logic;
    signal Addr7r : std_logic;
    signal Addr8r : std_logic;
    signal Addr9r : std_logic;
    signal AddrAr : std_logic;
    signal AddrDr : std_logic;
    signal AddrEr : std_logic;
    signal AddrFr : std_logic;

    --Data read MUX output.
    signal DataMUXOut : std_logic_vector(7 downto 0);

begin

    process(all)
    begin

        ---------------------------------------Enable Signals---------------------------------------

        --Address write.
        CsWr <= RW or CS0 or (not CS1);

        --Data out disable. Lock it in on the clock edge.
        if(rising_edge(clk)) then
            if((RW = '1') and (CS0 = '0') and (CS1 = '1')) then
                preDoutDis <= '0';
            else
                preDoutDis <= '1';
            end if;
        end if;

        --Inhibit output data if the chip selects or read/write change.
        if((preDoutDis = '0') and (RW = '1') and (CS0 = '0') and (CS1 = '1')) then
            DoutDis <= '0';
        else
            DoutDis <= '1';
        end if;

        ----------------------------------------Address Read----------------------------------------

        --Zero out enables when clock is low. Only allow enables when clock is high.
        if(rising_edge(clk)) then
            if(A = "0000" and RW = '1') then
                DataMUXOut <= Addr0Data;
            elsif(A = "0001" and RW = '1') then
                DataMUXOut <= Addr1Data;
            elsif(A = "0010" and RW = '1') then
                DataMUXOut <= Addr2Data;
            elsif(A = "0011" and RW = '1') then
                DataMUXOut <= Addr3Data;
            elsif(A = "0100" and RW = '1') then
                DataMUXOut <= Addr4Data;
            elsif(A = "0101" and RW = '1') then
                DataMUXOut <= Addr5Data;
            elsif(A = "0110" and RW = '1') then
                DataMUXOut <= Addr6Data;
            elsif(A = "0111" and RW = '1') then
                DataMUXOut <= Addr7Data;
            elsif(A = "1000" and RW = '1') then
                DataMUXOut <= Addr8Data;
            elsif(A = "1001" and RW = '1') then
                DataMUXOut <= Addr9Data;
            elsif(A = "1010" and RW = '1') then
                DataMUXOut <= AddrAData;
            elsif(A = "1101" and RW = '1') then
                DataMUXOut <= AddrDData;
            elsif(A = "1110" and RW = '1') then
                DataMUXOut <= AddrEData;
            elsif(A = "1111" and RW = '1') then
                DataMUXOut <= AddrFData;
            else
                DataMUXOut <= "11111111";
            end if;
        end if;

        ------------------------------------------Data I/O------------------------------------------

        if(DoutDis = '1') then
            D  <= "ZZZZZZZZ";
            Dw <= D;
        else
            D  <= DataMUXOut;
            Dw <= D;
        end if;
        
        ----------------------------------------Address Write---------------------------------------

        --Lock in the address to write to.
        if(rising_edge(clk)) then
            if(CsWr = '1') then
                Addr0w <= '0';
                Addr1w <= '0';
                Addr2w <= '0';
                Addr3w <= '0';
                Addr4w <= '0';
                Addr5w <= '0';
                Addr6w <= '0';
                Addr7w <= '0';
                Addr8w <= '0';
                Addr9w <= '0';
                AddrAw <= '0';
                AddrBw <= '0';
                AddrDw <= '0';
                AddrEw <= '0';
                AddrFw <= '0';
            else
                if(A = "0000") then
                    Addr0w <= '1';
                elsif(A = "0001") then
                    Addr1w <= '1';
                elsif(A = "0010") then
                    Addr2w <= '1';
                elsif(A = "0011") then
                    Addr3w <= '1';
                elsif(A = "0100") then
                    Addr4w <= '1';
                elsif(A = "0101") then
                    Addr5w <= '1';
                elsif(A = "0110") then
                    Addr6w <= '1';
                elsif(A = "0111") then
                    Addr7w <= '1';
                elsif(A = "1000") then
                    Addr8w <= '1';
                elsif(A = "1001") then
                    Addr9w <= '1';
                elsif(A = "1010") then
                    AddrAw <= '1';
                elsif(A = "1011") then
                    AddrBw <= '1';
                elsif(A = "1101") then
                    AddrDw <= '1';
                elsif(A = "1110") then
                    AddrEw <= '1';
                elsif(A = "1111") then
                    AddrFw <= '1';
                else
                    Addr0w <= '0';
                    Addr1w <= '0';
                    Addr2w <= '0';
                    Addr3w <= '0';
                    Addr4w <= '0';
                    Addr5w <= '0';
                    Addr6w <= '0';
                    Addr7w <= '0';
                    Addr8w <= '0';
                    Addr9w <= '0';
                    AddrAw <= '0';
                    AddrBw <= '0';
                    AddrDw <= '0';
                    AddrEw <= '0';
                    AddrFw <= '0';
                end if;
            end if;
        end if;

    end process;
end structural;