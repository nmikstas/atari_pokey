library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity test is
    port 
    (
        clk         : in std_logic;
        slowClk     : in std_logic;
        sdonShiftEn : in std_logic;
        ssoLoad     : in std_logic;
        
        ssoShift    : out std_logic;
        ssoTransfer : out std_logic;
        ssoRec      : out std_logic  
    );     
end test;

architecture structural of test is

    signal delay1  : std_logic;
    signal delay3  : std_logic;
    signal nor1    : std_logic;

    signal qdelay1   : std_logic;
    signal qssoShift : std_logic;
    signal qdelay3   : std_logic;

begin

    process(all)
    begin
        
        nor1 <= slowClk nor sdonShiftEn;

        if(falling_edge(clk)) then
            delay1   <= nor1;
            ssoShift <= delay1;
            delay3   <= ssoShift;
        end if;

        if(rising_edge(clk)) then
            ssoRec <= ssoShift nor delay1;
            
            qdelay1   <= delay1;
            qdelay3   <= delay3;
            qssoShift <= ssoShift;
        end if;

        ssoRec      <= not(qdelay1 or qdelay3 or qssoShift or ssoLoad);
        ssoTransfer <= qdelay1 nor qssoShift;

    end process;
end structural;
