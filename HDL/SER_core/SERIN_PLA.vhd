--Serial Data In PLA
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                      --SERIN PLA Entity--                                      --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity serin_pla is
    port 
    (
        sdiStopBit   : in  std_logic;
        sdinStartBit : in  std_logic;
        sdiQ1        : in  std_logic;
        sdiBusy      : out std_logic;
        nFramer      : out std_logic;
        sdiCompl     : out std_logic;
        sdiD1        : out std_logic;
        preSdiSet    : out std_logic;
        noSdiErr     : out std_logic
    );     
end serin_pla;

----------------------------------------------------------------------------------------------------
--                                   --SERIN PLA Architecture--                                   --
----------------------------------------------------------------------------------------------------

architecture structural of serin_pla is

    signal m1 : std_logic;
    signal m2 : std_logic;
    signal m3 : std_logic;
    signal m4 : std_logic;
    
begin
    process(all)
    begin
        m1 <= not(sdiStopBit or (not sdiQ1));
        m2 <= not(sdinStartBit or sdiQ1);
        m3 <= not((not sdiStopBit) or (not sdinStartBit) or sdiQ1);
        m4 <= not(sdiStopBit or (not sdinStartBit) or sdiQ1);

        sdiBusy   <= not sdiQ1;
        nFramer   <= not m4;
        sdiCompl  <= not(m4 or m3);
        sdiD1     <= not(m2 or m1);
        preSdiSet <= not m1;
        --noSdiErr  <= not(sdiStopBit or m3); --Incorrect!
        noSdiErr <= (not sdiStopBit) or m2;
    end process;
end structural;
