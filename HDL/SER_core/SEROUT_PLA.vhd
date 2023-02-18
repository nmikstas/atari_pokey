--Serial Data Out PLA
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                      --SEROUT PLA Entity--                                     --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity serout_pla is
    port 
    (
        sdoQ1       : in  std_logic;
        sdoDloaded  : in  std_logic;
        sdoEmpty    : in  std_logic;
        sdoFinish   : out std_logic;
        sdoD1       : out std_logic;
        sdonShiftEn : out std_logic;
        preSdoLoad  : out std_logic
    );     
end serout_pla;

----------------------------------------------------------------------------------------------------
--                                   --SEROUT PLA Architecture--                                  --
----------------------------------------------------------------------------------------------------

architecture structural of serout_pla is

    signal m1 : std_logic;
    signal m2 : std_logic;
    signal m3 : std_logic;
    
begin
    process(all)
    begin
       m1 <= not((not sdoQ1) or sdoDloaded);
       m2 <= not(sdoQ1 or (not sdoEmpty));
       m3 <= not(sdoDloaded or sdoEmpty);

       sdoFinish   <= not sdoQ1;
       sdoD1       <= not(m1 or m2 or m3);
       sdonShiftEn <= not m2;
       preSdoLoad  <= not(m1 or m3);
    end process;
end structural;