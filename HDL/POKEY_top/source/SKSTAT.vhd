library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SKSTAT is
    port 
    (
        clk       : in std_logic;
        sdiOvrun  : in std_logic;
        keyOvrun  : in std_logic;
        setFramer : in std_logic;
        kShift    : in std_logic;
        keyDown   : in std_logic;
        sdiBusy   : in std_logic;
        siDelay   : in std_logic;
        addrAw    : in std_logic;

        Dout      : out std_logic_vector(7 downto 0)
    );     
end SKSTAT;

architecture structural of SKSTAT is

    signal nor1     : std_logic;
    signal qnor1    : std_logic := '1'; --Need these to allow write strobe to clear outputs.
    signal nor2     : std_logic := '1';
    signal nor3     : std_logic;
    signal qnor3    : std_logic;
    signal nor4     : std_logic;
    signal qnor4    : std_logic;
    signal nor5     : std_logic;
    signal qnor5    : std_logic;
    signal reset    : std_logic;
    signal frameOut : std_logic;
    signal keyOut   : std_logic;
    signal sdiOut   : std_logic;
    
begin

    process(all)
    begin
        
        --Reset circuit.
        nor1  <= reset nor addrAw;
        reset <= nor1 nor nor2;

        if(falling_edge(clk)) then
            qnor1 <= nor1;
        end if;

        if(falling_edge(clk)) then
            nor2 <= not qnor1;
        end if;

        --Output circuits.
        nor3 <= sdiOvrun  nor sdiOut;
        nor4 <= keyOvrun  nor keyOut;
        nor5 <= setFramer nor frameOut;

        if(falling_edge(clk)) then
            qnor3 <= nor3;
            qnor4 <= nor4;
            qnor5 <= nor5;
        end if;

        sdiOut   <= qnor3 nor reset;
        keyOut   <= qnor4 nor reset;
        frameOut <= qnor5 nor reset;

        Dout(7) <= not frameOut;
        Dout(6) <= not keyOut;
        Dout(5) <= not sdiOut;
        Dout(4) <= not siDelay;
        Dout(3) <= not kShift;
        Dout(2) <= not keyDown;
        Dout(1) <= not sdiBusy;
        Dout(0) <= '1' ;

    end process;
end structural;