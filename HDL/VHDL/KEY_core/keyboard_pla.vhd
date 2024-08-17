--Keyboard PLA
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                     --Keyboard PLA Entity--                                    --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity keyboard_pla is
    port 
    (
        i1 : in  std_logic;
        i2 : in  std_logic;
        i3 : in  std_logic;
        i4 : in  std_logic;
        o1 : out std_logic;
        o2 : out std_logic;
        o3 : out std_logic;
        o4 : out std_logic
    );     
end keyboard_pla;

----------------------------------------------------------------------------------------------------
--                                  --Keyboard PLA Architecture--                                 --
----------------------------------------------------------------------------------------------------

architecture structural of keyboard_pla is

    signal m1 : std_logic;
    signal m2 : std_logic;
    signal m3 : std_logic;
    signal m4 : std_logic;
    signal m5 : std_logic;
    signal m6 : std_logic;
    signal m7 : std_logic;
    signal m8 : std_logic;

begin
    process(all)
    begin
        m1 <= not(not(i1) or i4);
        m2 <= not(i2 or i3 or (not i4));
        m3 <= not(i3 or (not i4));
        m4 <= not(i2 or i3);
        m5 <= not((not i1) or i3);
        m6 <= not((not i1) or i2 or (not i3) or i4);
        m7 <= not((not i1) or (not i2) or (not i3));
        m8 <= not(i1 or i2 or (not i4));
        
        o1 <= not(m8 or m7 or m2 or m1);
        o2 <= not(m6 or m5 or m4 or m3);
        o3 <= not(m7);
        o4 <= not(m6);
    end process;
end structural;
