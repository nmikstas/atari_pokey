--Keyboard counter register
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                  --Keyboard Counter Entity--                                   --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity kb_count_reg is
    port 
    (
        clk : in std_logic;
        T1  : in std_logic;
        nT1 : in std_logic;
        R   : in std_logic;
        
        Q  : out std_logic_vector(5 downto 0);
        nQ : out std_logic_vector(5 downto 0)
    );     
end kb_count_reg;

----------------------------------------------------------------------------------------------------
--                               --Keyboard Counter Architecture--                                --
----------------------------------------------------------------------------------------------------

architecture structural of kb_count_reg is

    signal T    : std_logic_vector(4 downto 0);
    signal nT   : std_logic_vector(4 downto 0);

begin

    --Bit Q0.
    bit_Q0 : entity work.cell3
    port map
    ( 
        clk => clk,
        T1  => T1,
        nT1 => nT1,
        R   => R,
        T2  => T(0),
        nT2 => nT(0),
        Q   => Q(0),
        nQ  => nQ(0)
    );

    --Bit Q1
    bit_Q1 : entity work.cell6
    port map
    (
        clk => clk,
        T2  => T(0),
        nT2 => nT(0),
        R   => R,
        T1  => T(1),
        nT1 => nT(1),
        Q   => Q(1),
        nQ  => nQ(1)
    );

    --Bit Q2.
    bit_Q2 : entity work.cell3
    port map
    ( 
        clk => clk,
        T1  => T(1),
        nT1 => nT(1),
        R   => R,
        T2  => T(2),
        nT2 => nT(2),
        Q   => Q(2),
        nQ  => nQ(2)
    );

    --Bit Q3
    bit_Q3 : entity work.cell6
    port map
    (
        clk => clk,
        T2  => T(2),
        nT2 => nT(2),
        R   => R,
        T1  => T(3),
        nT1 => nT(3),
        Q   => Q(3),
        nQ  => nQ(3)
    );

    --Bit Q4.
    bit_Q4 : entity work.cell3
    port map
    ( 
        clk => clk,
        T1  => T(3),
        nT1 => nT(3),
        R   => R,
        T2  => T(4),
        nT2 => nT(4),
        Q   => Q(4),
        nQ  => nQ(4)
    );

    --Bit Q5
    bit_Q5 : entity work.cell6
    port map
    (
        clk => clk,
        T2  => T(4),
        nT2 => nT(4),
        R   => R,
        T1  => open,
        nT1 => open,
        Q   => Q(5),
        nQ  => nQ(5)
    );
    
end structural;
