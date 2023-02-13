--Serial Out Shift Module
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                 --SEROUT_Shift_Module Entity--                                 --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SEROUT_Shift_Module is
    port 
    (
        clk    : in std_logic;
        D      : in std_logic_vector(7 downto 0);
        AddrDw : in std_logic;
        Load   : in std_logic;
        Shift  : in std_logic;

        Empty     : out std_logic;
        DshiftOut : out std_logic
    );     
end SEROUT_Shift_Module;

----------------------------------------------------------------------------------------------------
--                              --SEROUT_Shift_Module Architecture--                              --
----------------------------------------------------------------------------------------------------

architecture structural of SEROUT_Shift_Module is

    signal QD       : std_logic_vector(7 downto 0);
    signal Qout     : std_logic_vector(9 downto 1);
    signal shiftOut : std_logic;
    
begin

    --Start bit 0.
    cell_16_0 : entity work.cell_16
    port map
    ( 
        clk   => clk,
        Shift => Shift, 
        R     => Load, 
        D     => Qout(1),
        Q     => shiftOut
    );

    --Data bit 1.
    cell_15_1 : entity work.cell_15
    port map
    ( 
        clk   => clk,
        Shift => Shift,
        Load  => Load,
        DIn   => QD(0),
        D     => Qout(2),
        Q     => Qout(1)
    );

    --Data bit 2.
    cell_15_2 : entity work.cell_15
    port map
    ( 
        clk   => clk,
        Shift => Shift,
        Load  => Load,
        DIn   => QD(1),
        D     => Qout(3),
        Q     => Qout(2)
    );

    --Data bit 3.
    cell_15_3 : entity work.cell_15
    port map
    ( 
        clk   => clk,
        Shift => Shift,
        Load  => Load,
        DIn   => QD(2),
        D     => Qout(4),
        Q     => Qout(3)
    );

    --Data bit 4.
    cell_15_4 : entity work.cell_15
    port map
    ( 
        clk   => clk,
        Shift => Shift,
        Load  => Load,
        DIn   => QD(3),
        D     => Qout(5),
        Q     => Qout(4)
    );

    --Data bit 5.
    cell_15_5 : entity work.cell_15
    port map
    ( 
        clk   => clk,
        Shift => Shift,
        Load  => Load,
        DIn   => QD(4),
        D     => Qout(6),
        Q     => Qout(5)
    );

    --Data bit 6.
    cell_15_6 : entity work.cell_15
    port map
    ( 
        clk   => clk,
        Shift => Shift,
        Load  => Load,
        DIn   => QD(5),
        D     => Qout(7),
        Q     => Qout(6)
    );

    --Data bit 7.
    cell_15_7 : entity work.cell_15
    port map
    ( 
        clk   => clk,
        Shift => Shift,
        Load  => Load,
        DIn   => QD(6),
        D     => Qout(8),
        Q     => Qout(7)
    );

    --Data bit 8.
    cell_15_8 : entity work.cell_15
    port map
    ( 
        clk   => clk,
        Shift => Shift,
        Load  => Load,
        DIn   => QD(7),
        D     => Qout(9),
        Q     => Qout(8)
    );

    --Data bit 9.
    cell_17_9 : entity work.cell_17
    port map
    ( 
        clk   => clk,
        Shift => Shift,
        Set   => Load,
        D     => '0',
        Q     => Qout(9)
    );

    --Update the "empty" signal.
    Empty <= not(Qout(9) or Qout(8) or Qout(7) or Qout(6) or Qout(5) or Qout(4) or Qout(3) or Qout(2) or Qout(1));

    process(all)
    begin

        --Update the output serial data and input parallel data.
        if(falling_edge(clk)) then
            DshiftOut <= not shiftOut;

            if(AddrDw = '1') then
                QD <= D;
            end if;
        end if;

    end process;
end structural;

