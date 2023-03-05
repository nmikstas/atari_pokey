--Audio control module with high pass filter.
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                     --Audio Control Entity--                                   --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity aud_control_hp is
    port 
    (
        clk         : in std_logic;
        D           : in std_logic_vector(7 downto 0);
        AUDC        : in std_logic;
        poly4In     : in std_logic;
        poly5In     : in std_logic;
        poly17In    : in std_logic;
        Timer       : in std_logic;
        nTimer      : in std_logic;
        rstAudPhase : in std_logic;
        disHiFltr   : in std_logic;
        Timerx      : in std_logic;

        AUD       : out std_logic_vector(3 downto 0);
        poly4Out  : out std_logic;
        poly5Out  : out std_logic;
        poly17Out : out std_logic
    );     
end aud_control_hp;

----------------------------------------------------------------------------------------------------
--                                  --Audio Control Architecture--                                --
----------------------------------------------------------------------------------------------------

architecture structural of aud_control_hp is

    --control signals.
    signal data : std_logic_vector(7 downto 0);
    signal ctrl : std_logic_vector(2 downto 0);
    signal V    : std_logic_vector(3 downto 0);
    signal T    : std_logic;

    --Sound DAC signals.
    signal I : std_logic;

    --Poly5 flip-flop signal.
    signal Qpoly5 : std_logic;

    --MUX signal.
    signal muxOut : std_logic;

    --High pass filter signal.
    signal QI : std_logic;

    --Combinational logic signals.
    signal nor1  : std_logic;
    signal nor2  : std_logic;
    signal nor3  : std_logic;
    signal nor4  : std_logic;
    signal nor5  : std_logic;
    signal and1  : std_logic;
    signal xnor1 : std_logic;

    --Sequential logic signals.
    signal Qnor1  : std_logic;
    signal Qnor5  : std_logic;
    signal nQnor1 : std_logic;

begin
    
    --Sound DAC.
    cell11_0: entity work.cell11
    port map
    (
        V => V,
        T => T,
        I => xnor1,
        O => AUD
    );

    --Poly5 flip-flop.
    cell2r_0: entity work.cell2r
    port map
    (
        clk => clk,
        D   => poly5In,
        Ld  => Timer,
        nLD => nTimer,
        R   => ctrl(2),
        Q   => Qpoly5
    );

    --High pass filter flip-flop.
    cell2p_0: entity work.cell2p
    port map
    (
        clk => clk,
        D   => I,
        Ld  => not Timerx,
        nLD => Timerx,
        P   => disHiFltr,
        Q   => QI
    );   
 
    --Distribute the written data to the proper control signals.
    ctrl <= data(7 downto 5);
    T    <= data(4);
    V    <= not data(3 downto 0);

    --Update the combinational signals.
    and1  <= I and ctrl(0);
    nor1  <= Qpoly5 nor nTimer;
    nor2  <= ctrl(0) nor muxOut;
    nor3  <= not(and1 or nQnor1 or nor2);
    nor4  <= Qnor1 nor Qnor5;
    nor5  <= not(nor3 or nor4 or rstAudPhase);
    xnor1 <= (not I) xnor QI;

    process(all)
    begin

        --Polynomial delay lines.
        if(falling_edge(clk)) then
            poly4Out  <= poly4In;
            poly5Out  <= poly5In;
            poly17Out <= poly17In;
        end if;

        --Always update the MUX.
        if(ctrl(1) = '1') then
            muxOut <= poly4In;
        else
            muxOut <= poly17In;
        end if;

        --Lock in write data.
        if(falling_edge(clk) and AUDC = '1') then
           data <= D;
        end if;

        --Update the sequential signals.
        if(falling_edge(clk)) then
            Qnor1  <= nor1;
            Qnor5  <= nor5; 
            nQnor1 <= not nor1;
            I      <= not nor5; 
        end if;

    end process;
end structural;