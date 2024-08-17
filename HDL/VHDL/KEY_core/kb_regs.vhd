--Keyboard count compare and register module
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                    --Keyboard Regs Entity--                                    --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity kb_regs is
    port 
    (
        clk        : in std_logic;
        nkbScanDis : in std_logic;
        qkeybClk   : in std_logic;
        kbCmpLd    : in std_logic;
        kbCodeLd   : in std_logic;
        shiftIn    : in std_logic;
        controlIn  : in std_logic;

        match : out std_logic;
        oQ    : out std_logic_vector(5 downto 0);
        nQ    : out std_logic_vector(5 downto 0);
        D     : out std_logic_vector(7 downto 0)
    );     
end kb_regs;

----------------------------------------------------------------------------------------------------
--                                 --Keyboard Regs Architecture--                                 --
----------------------------------------------------------------------------------------------------

--Binary decrement with borrow delay.
architecture structural of kb_regs is

    signal QD : std_logic_vector(5 downto 0);
    signal C  : std_logic_vector(5 downto 0);
    signal Q  : std_logic_vector(5 downto 0);
  
begin

    --Decrement counter.
    kb_count_reg_0 : entity work.kb_count_reg
    port map
    ( 
        clk => clk,
        T1  => not qkeybClk,
        nT1 => qkeybClk,
        R   => not nkbScanDis,
        Q   => Q,
        nQ  => nQ
    );

    --Compare registers.
    gen: for i in 0 to 5 generate
        cell4: entity work.cell4
        port map
        (
            clk => clk,
            D   => Q(i),
            Ld  => kbCmpLd,
            nLd => not kbCmpLd,
            Q   => QD(i),
            C   => C(i)
        );
    end generate gen;

    --Always update outputs.
    match <= not(C(0) or C(1) or C(2) or C(3) or C(4) or C(5));
    oQ <= Q;

    process(all)
    begin

        --Read registers.
        if(rising_edge(clk) and kbCodeLd = '1') then
            D(5 downto 0) <= QD;
            D(6) <= shiftIn;
            D(7) <= controlIn;
        end if;

    end process;
end structural;
