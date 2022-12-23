--IRQ core
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                      --IRQ Core Entity--                                       --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity irq_core is
    port 
    (
        clk         : in  std_logic;
        IRQEN       : in  std_logic;
        Dw          : in  std_logic_vector(7 downto 0);
        setBreak    : in  std_logic;
        setKey      : in  std_logic;
        setSdiCompl : in  std_logic;
        setSdoCompl : in  std_logic;
        sdoFinish   : in  std_logic;
        Timer4      : in  std_logic;
        Timer2      : in  std_logic;
        Timer1      : in  std_logic;
        IRQ         : out std_logic;
        Dr          : out std_logic_vector(7 downto 0);
        keyOvrun    : out std_logic;
        sdiOvrun    : out std_logic
    );     
end irq_core;

----------------------------------------------------------------------------------------------------
--                                   --IRQ Core Architecture--                                   --
----------------------------------------------------------------------------------------------------

architecture structural of irq_core is

    signal Dirq   : std_logic_vector(7 downto 0);
    signal nirqst : std_logic_vector(7 downto 0);
    signal irqInt : std_logic;

    --IRQ bit 0 signals.
    signal ff1L0  : std_logic;
    signal ff1R0  : std_logic;
    signal ff2L0  : std_logic;
    signal ff2R0  : std_logic;
    signal irq0FB : std_logic;

    --IRQ bit 1 signals.
    signal ff1L1  : std_logic;
    signal ff1R1  : std_logic;
    signal ff2L1  : std_logic;
    signal ff2R1  : std_logic;
    signal irq1FB : std_logic;

    --IRQ bit 2 signals.
    signal ff1L2  : std_logic;
    signal ff1R2  : std_logic;
    signal ff2L2  : std_logic;
    signal ff2R2  : std_logic;
    signal irq2FB : std_logic;

    --IRQ bit 3 signals.
    signal ff1L3   : std_logic;
    signal ff1R3   : std_logic;
    signal irqOut3 : std_logic;

    --IRQ bit 4 signals.
    signal ff1L4  : std_logic;
    signal ff1R4  : std_logic;
    signal ff2L4  : std_logic;
    signal ff2R4  : std_logic;
    signal irq4FB : std_logic;

    --IRQ bit 5 signals.
    signal ff1L5  : std_logic;
    signal ff1R5  : std_logic;
    signal ff2L5  : std_logic;
    signal ff2R5  : std_logic;
    signal irq5FB : std_logic;

    --IRQ bit 6 signals.
    signal ff1L6  : std_logic;
    signal ff1R6  : std_logic;
    signal ff2L6  : std_logic;
    signal ff2R6  : std_logic;
    signal irq6FB : std_logic;

    --IRQ bit 7 signals.
    signal ff1L7  : std_logic;
    signal ff1R7  : std_logic;
    signal ff2L7  : std_logic;
    signal ff2R7  : std_logic;
    signal irq7FB : std_logic;
begin
    
    process(all)
    begin

        --------------------------------------Input Flip-Flops--------------------------------------

        if falling_edge(clk) and (IRQEN = '1') then
            Dirq <= not Dw;
        end if;

        ---------------------------------------IRQ Bit 0 Logic--------------------------------------

        if falling_edge(clk) then
            ff1L0 <= Dirq(0);
            ff1R0 <= irq0FB;
        end if;

        nirqst(0) <= ff1L0 nor ff1R0;

        if rising_edge(clk) then
            ff2L0 <= Timer1;
            ff2R0 <= nirqst(0);
        end if;

        irq0FB <= ff2L0 nor ff2R0;

        ---------------------------------------IRQ Bit 1 Logic--------------------------------------

        if falling_edge(clk) then
            ff1L1 <= Dirq(1);
            ff1R1 <= irq1FB;
        end if;

        nirqst(1) <= ff1L1 nor ff1R1;

        if rising_edge(clk) then
            ff2L1 <= Timer2;
            ff2R1 <= nirqst(1);
        end if;

        irq1FB <= ff2L1 nor ff2R1;

        ---------------------------------------IRQ Bit 2 Logic--------------------------------------

        if falling_edge(clk) then
            ff1L2 <= Dirq(2);
            ff1R2 <= irq2FB;
        end if;

        nirqst(2) <= ff1L2 nor ff1R2;

        if rising_edge(clk) then
            ff2L2 <= Timer4;
            ff2R2 <= nirqst(2);
        end if;

        irq2FB <= ff2L2 nor ff2R2;

        ---------------------------------------IRQ Bit 3 Logic--------------------------------------

        if falling_edge(clk) then
            ff1L3 <= Dirq(3);
            ff1R3 <= sdoFinish;
            nirqst(3) <= not sdoFinish;
        end if;

        irqOut3 <= ff1L3 nor ff1R3;

        ---------------------------------------IRQ Bit 4 Logic--------------------------------------

        if falling_edge(clk) then
            ff1L4 <= Dirq(4);
            ff1R4 <= irq4FB;
        end if;

        nirqst(4) <= ff1L4 nor ff1R4;

        if rising_edge(clk) then
            ff2L4 <= setSdoCompl;
            ff2R4 <= nirqst(4);
        end if;

        irq4FB <= ff2L4 nor ff2R4;

        ---------------------------------------IRQ Bit 5 Logic--------------------------------------

        if falling_edge(clk) then
            ff1L5 <= Dirq(5);
            ff1R5 <= irq5FB;
        end if;

        nirqst(5) <= ff1L5 nor ff1R5;

        if rising_edge(clk) then
            ff2L5 <= setSdiCompl;
            ff2R5 <= nirqst(5);
        end if;

        irq5FB   <= ff2L5 nor ff2R5;

        ---------------------------------------IRQ Bit 6 Logic--------------------------------------

        if falling_edge(clk) then
            ff1L6 <= Dirq(6);
            ff1R6 <= irq6FB;
        end if;

        nirqst(6) <= ff1L6 nor ff1R6;

        if rising_edge(clk) then
            ff2L6 <= setKey;
            ff2R6 <= nirqst(6);
        end if;

        irq6FB   <= ff2L6 nor ff2R6;

        ---------------------------------------IRQ Bit 7 Logic--------------------------------------

        if falling_edge(clk) then
            ff1L7 <= Dirq(7);
            ff1R7 <= irq7FB;
        end if;

        nirqst(7) <= ff1L7 nor ff1R7;

        if rising_edge(clk) then
            ff2L7 <= setBreak;
            ff2R7 <= nirqst(7);
        end if;

        irq7FB <= ff2L7 nor ff2R7;

        ----------------------------------------IRQ Pin Logic---------------------------------------

        irqInt <= nirqst(0) or nirqst(1) or nirqst(2) or nirqst(4) or
                  nirqst(5) or nirqst(6) or nirqst(7) or irqOut3;
        IRQ    <= irqInt; --Nees to tie to nmos on output to make active low IRQ.

        -------------------------------------IRQ Status Outputs-------------------------------------

        sdiOvrun <= nirqst(5) and setSdiCompl;
        keyOvrun <= nirqst(6) and setKey;
        Dr       <= not nirqst;

    end process;
end structural;
