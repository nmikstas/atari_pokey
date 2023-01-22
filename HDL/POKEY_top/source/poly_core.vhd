--Random number generator
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                               --Random Number Generator Entity--                               --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity poly_core is
    port 
    (
        clk         : in  std_logic;
        Init        : in  std_logic;
        sel9bitPoly : in  std_logic;
        rndNum      : out std_logic_vector(7 downto 0);
        poly4bit    : out std_logic;
        poly5bit    : out std_logic;
        poly917bit  : out std_logic
    );     
end poly_core;

----------------------------------------------------------------------------------------------------
--                            --Random Number Generator Architecture--                            --
----------------------------------------------------------------------------------------------------

architecture structural of poly_core is

    --Main delay lines of the polynomials.
    signal lfsr4bit  : std_logic_vector(2 downto 0);
    signal lfsr5bit  : std_logic_vector(3 downto 0);
    signal lfsr9bit  : std_logic_vector(7 downto 0);
    signal lfsr17bit : std_logic_vector(7 downto 0);

    --MSBs of the 4 and 5 bit polynomials.
    signal lfsr5msb : std_logic;
    signal lfsr4msb : std_logic;
    
    --Outputs of the polynoimial feedbacks.
    signal feedback4   : std_logic;
    signal nfeedback4  : std_logic;
    signal feedback5   : std_logic;
    signal nfeedback5  : std_logic;
    signal feedback917 : std_logic;

    --9/17 polynomial switching structure.
    signal swDelay     : std_logic;                    --1 clock delay on 9 to 17 bit switch.
    signal nors        : std_logic_vector(2 downto 0); --3 nors in 9/17 poly structure.
    signal norsDelayed : std_logic_vector(2 downto 0); --Delayed output of 3 nors.
    signal swOut       : std_logic;                    --Output of 9/17 poly switch.

begin
    
    process(all)
    begin

        -------------------------------9/17 Bit Polynomial Structure--------------------------------
    
        --Update the 9-bit polynomial delay line.
        for i in 6 downto 0 loop
            if falling_edge(clk) then
                lfsr9bit(i) <= lfsr9bit(i + 1);
            end if;
        end loop;

        if falling_edge(clk) then
            lfsr9bit(7) <= swOut;
        end if;

        --Assign random number out.
        rndNum <= not lfsr9bit;

        --Assign 9/17 bit polynomial feedback.
        feedback917 <= (not lfsr9bit(5)) xnor (not lfsr9bit(0));

        --Assign 9/17 bit polynomial bit out.
        poly917bit <= lfsr9bit(0);

        --Update the 17-bit polynomial delay line.
        for i in 6 downto 0 loop
            if falling_edge(clk) then
                lfsr17bit(i) <= lfsr17bit(i + 1);
            end if;
        end loop;

        if falling_edge(clk) then
            lfsr17bit(7) <= feedback917;
        end if;

        --Top nor gate.
        nors(0) <= lfsr17bit(0) nor sel9bitPoly;

        --Middle nor gate.
        if falling_edge(clk) then
            swDelay <= sel9bitPoly;
        end if;

        nors(1) <= swDelay nor (not sel9bitPoly);

        --Bottom nor gate.
        nors(2) <= (not sel9bitPoly) nor feedback917;

        --9/17 bit polynomial switch delay.
        if falling_edge(clk) then
            norsDelayed <= nors;
        end if;

        --Assign switch output.
        swOut <= not(Init or norsDelayed(0) or norsDelayed(1) or norsDelayed(2));

        --------------------------------5 Bit Polynomial Structure----------------------------------
 
        --Update the output bit.
        poly5bit <= not lfsr5bit(0);

        --Update the feeback.
        feedback5 <= lfsr5bit(0) xnor lfsr5bit(2);

        if falling_edge(clk) then
            nfeedback5 <= not feedback5;
        end if;

        --Update the 5-bit polynomial delay line.
        for i in 2 downto 0 loop
            if falling_edge(clk) then
                lfsr5bit(i) <= lfsr5bit(i + 1);
            end if;
        end loop;

        lfsr5msb <= nfeedback5 nor Init;
        
        if falling_edge(clk) then
            lfsr5bit(3) <= lfsr5msb;
        end if;

        --------------------------------4 Bit Polynomial Structure----------------------------------

        --Update the output bit.
        poly4bit <= lfsr4bit(0);

        --Update the feeback.
        feedback4 <= lfsr4bit(0) xnor lfsr4bit(1);

        ----CODE THAT MATCHES THE HARDWARE SCHEMATIC----
        --if falling_edge(clk) then
        --    lfsr4msb <= (not feedback4) nor Init;
        --end if;
        ------------------------------------------------

        --ALTERNATE TO ABOVE CODE. MATCHES MAME OUTOUT--
        if falling_edge(clk) then
            nfeedback4 <= not feedback4;
        end if;
        lfsr4msb <= nfeedback4 nor Init;
        ------------------------------------------------

        --Update the 4-bit polynomial delay line.
        for i in 1 downto 0 loop
            if falling_edge(clk) then
                lfsr4bit(i) <= lfsr4bit(i + 1);
            end if;
        end loop;
 
        if falling_edge(clk) then
            lfsr4bit(2) <= lfsr4msb;
        end if;

    end process;
end structural;

