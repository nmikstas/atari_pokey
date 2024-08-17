--Audio clock and keyboard clock generator
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                   --Clock Generator Entity--                                   --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity clock_gen_core is
    port 
    (
        clk      : in  std_logic;
        init     : in  std_logic;
        sel15Khz : in  std_logic;
        audClock : out std_logic;
        keybClk  : out std_logic
    );     
end clock_gen_core;

----------------------------------------------------------------------------------------------------
--                                --Clock Generator Architecture--                                --
----------------------------------------------------------------------------------------------------

architecture structural of clock_gen_core is

    signal khz64      : std_logic;  --64 KHz clock.
    signal hsync      : std_logic;  --15 KHz clock.
    signal clkMuxOut  : std_logic;
    signal dClk       : std_logic;

    --15KHz LFSR structure.
    signal lfsr15k0    : std_logic;
    signal lfsr15k0Out : std_logic;
    signal lfsr15k     : std_logic_vector(6 downto 1);
    signal lfsr15kIn   : std_logic;
    signal nor15k      : std_logic;
    signal feedback15k : std_logic;
    signal d15k        : std_logic;

    --64KHz LFSR structure.
    signal lfsr64k     : std_logic_vector(4 downto 0);
    signal lfsr64kIn   : std_logic;
    signal nor64k      : std_logic;
    signal feedback64k : std_logic;
    signal d64k        : std_logic;

begin
    
    process(all)
    begin

        ------------------------------------15KHz LFSR Structure------------------------------------

        --Bit 0 of the shift register.
        if(falling_edge(clk))then
            lfsr15k0 <= feedback15k nor nor15k;
        end if;

        --Output of bit 0.
        lfsr15k0Out <= lfsr15k0 nor init;

        --Bit 1 of the shift register.
        if(falling_edge(clk))then
            lfsr15k(1) <= lfsr15k0Out;
        end if;

        --Remaining 5 bits of the shift register.
        for i in 6 downto 2 loop
            if falling_edge(clk) then
                lfsr15k(i) <= lfsr15k(i - 1);
            end if;
        end loop;

        --Output flip flop.
        if falling_edge(clk) then
            d15k <= nor15k;
        end if;

        --NORed shift register values.
        nor15k <= not((not lfsr15k0Out) or lfsr15k(1) or lfsr15k(2) or (not lfsr15k(3)) or
                  lfsr15k(4) or lfsr15k(5) or (not lfsr15k(6)));

        --XNOR feedback.
        feedback15k <= lfsr15k(6) xnor lfsr15k(5);

        --------------------------------------64KHz LFSR Structure--------------------------------------

        --Input to the shift register.
        lfsr64kIn <= init or feedback64k or nor64k;

        --Bit 0 of the shift register.
        --Note: Init signal is tied to phase 2 of the clock so it is not asynchronous.
        if falling_edge(clk) then
            lfsr64k(0) <= lfsr64kIn;
        end if;

        --Remaining 4 bits of the shift register.
        for i in 1 to 4 loop
            if falling_edge(clk) then
                lfsr64k(i) <= lfsr64k(i - 1);
            end if;
        end loop;

        --NORed shift register values.
        nor64k <= not(lfsr64k(0) or (not lfsr64k(1)) or lfsr64k(2) or lfsr64k(3) or lfsr64k(4));

        --XOR feedback.
        feedback64k <= lfsr64k(2) xor lfsr64k(4);

        --Output flip flop.
        if falling_edge(clk) then
            d64k <= nor64k;
        end if;

        ------------------------------------------Output Logic------------------------------------------

        --Tie the output of the two clocks to the frequency select MUX.
        khz64 <= d64k;
        hsync <= d15k;

        --Frequency select MUX. Select audio frequency of 64KHz or 15KHz.
        if sel15Khz = '0' then
            clkMuxOut <= khz64;
        else
            clkMuxOut <= hsync;
        end if;

        --Output clock flip-flop;
        if falling_edge(clk) then
            dClk <= clkMuxOut;
        end if;

         --Connect the internal signals to the outputs.
        keybClk  <= not hsync;
        audClock <= dClk;
    end process;

end structural;