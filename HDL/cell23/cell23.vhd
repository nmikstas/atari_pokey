--Cell 23
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                       --Cell 23 Entity--                                       --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cell23 is
    port 
    (
        clk  : in  std_logic;
        P    : in  std_logic;
        CR   : in  std_logic;
        BOR  : out std_logic;
        Q    : out std_logic;
        Qnot : out std_logic
    );     
end cell23;

----------------------------------------------------------------------------------------------------
--                                    --Cell 23 Architecture--                                    --
----------------------------------------------------------------------------------------------------

--Binary decrement with no borrow delay.
architecture structural of cell23 is

    signal dint    : std_logic;
    signal Qint    : std_logic;
    signal QnotInt : std_logic;

begin
    
    process(clk, P, CR)
    begin

        Q    <= Qint;
        Qnot <= QnotInt;

        QnotInt <= dint nor P;
        Qint    <= (not QnotInt);
        BOR     <= Qint nor (not CR);

        --Always load the internal flip-flop.
        if rising_edge(clk) then
            if CR = '1' then
                dint <= (not Qint);
            else
                dint <= (not QnotInt);
            end if;
        end if;

    end process;
end structural;
