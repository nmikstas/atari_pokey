--Serial clock generator module.
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                --Serial Clock Generator Entity--                               --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SER_clock_gen is
    port 
    (
        clk          : in std_logic;
        SKCTLS       : in std_logic_vector(6 downto 4);
        resyncSerClk : in std_logic;
        Timer2       : in std_logic;
        Timer4       : in std_logic;
        BCLK_in      : in std_logic;

        BCLK_out : out std_logic;
        sdiClock : out std_logic;
        sdoClock : out std_logic;
        OCLK     : out std_logic
    );     
end SER_clock_gen;

----------------------------------------------------------------------------------------------------
--                             --Serial Clock Generator Architecture--                            --
----------------------------------------------------------------------------------------------------

--Binary decrement with borrow delay.
architecture structural of SER_clock_gen is

    --Cell2 signals.
    signal T4        : std_logic;
    signal T2        : std_logic;
    signal TogldTmr4 : std_logic;
    signal TogldTmr2 : std_logic;
    signal nor2      : std_logic;

    --sdi signals.
    signal nmux1  : std_logic;
    signal presdi : std_logic;
    signal nsdi   : std_logic;
    signal Qsdi   : std_logic;
    signal Qnmux1 : std_logic;

    --sdo signals.
    signal mux4    : std_logic;
    signal OCLKint : std_logic;
    signal nOCLK   : std_logic;
    signal Qmux4   : std_logic;
    signal QnOCLK  : std_logic;

    --BCLK signals.
    signal nor1    : std_logic;
    signal preBCLK : std_logic;
    signal QBCLK   : std_logic;
    
    --Mux signals.
    signal mux1 : std_logic;
    signal mux2 : std_logic;
    signal mux3 : std_logic;
  
begin

    --Timer 4 flip-flop.
    cell2pr_0 : entity work.cell2pr
    port map
    ( 
        clk => clk,
        D   => TogldTmr4,
        Ld  => Timer4,
        nLD => not Timer4,
        P   => resyncSerClk,
        R   => nor2,
        Q   => T4
    );

    --Timer 2 flip-flop.
    cell2r_0 : entity work.cell2r
    port map
    ( 
        clk => clk,
        D   => TogldTmr2,
        Ld  => Timer2,
        nLD => not Timer2,
        R   => nor2,
        Q   => T2
    );

    --Always assign cell 2 outputs.
    TogldTmr4 <= not T4;
    TogldTmr2 <= not T2;

    --Always assign outputs.
    OCLK <= OCLKint;

    process(all)
    begin

        --sdiClock output.
        nsdi     <= not presdi;
        sdiClock <= Qsdi nor Qnmux1;

        if(falling_edge(clk)) then
            presdi <= nmux1;
            Qsdi   <= nsdi;
            Qnmux1 <= nmux1;
        end if;        

        --sdoClock output.
        nOCLK    <= not OCLKint;
        sdoClock <= Qmux4 nor QnOCLK;

        if(falling_edge(clk)) then
            OCLKint <= mux4;
            Qmux4   <= mux4;
            QnOCLK  <= nOCLK;
        end if;

        --BCLK signals.
        if(falling_edge(clk)) then
            preBCLK <= nmux1;
            QBCLK   <= BCLK_in;
        end if;
       
        BCLK_out <= not(preBCLK or SKCTLS(4) or nor1);
        nor1     <= SKCTLS(4) nor SKCTLS(5);
        nor2     <= (not nor1) nor SKCTLS(6);
        nmux1    <= not mux1;

        --MUX 1.
        if(nor1 = '1') then
            mux1 <= QBCLK;
        else
            mux1 <= TogldTmr4;
        end if;

        --MUX 2.
        if(SKCTLS(5) = '1') then
            mux2 <= TogldTmr4;
        else
            mux2 <= QBCLK;
        end if;

        --MUX 3.
        if(SKCTLS(5) = '1') then
            mux3 <= TogldTmr2;
        else
            mux3 <= TogldTmr4;
        end if;

        --MUX 4.
        if(SKCTLS(6) = '1') then
            mux4 <= mux3;
        else
            mux4 <= mux2;
        end if;

    end process;
end structural;
