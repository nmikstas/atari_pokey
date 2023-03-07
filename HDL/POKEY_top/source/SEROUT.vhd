--Serial out module
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                        --SEROUT Entity--                                       --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity serout is
    port 
    (
        clk          : in std_logic;
        D            : in std_logic_vector(7 downto 0);
        AddrDw       : in std_logic;
        Init         : in std_logic;
        sdoClock     : in std_logic;
        SKCTLS7      : in std_logic;
        SKCTLS3      : in std_logic;
        Timer1       : in std_logic;
        Timer2       : in std_logic;

        resync2Tones   : out std_logic;       
        sdoFinish      : out std_logic;
        setSdoComplete : out std_logic;
        SOD            : out std_logic
    );     
end serout;

----------------------------------------------------------------------------------------------------
--                                     --SEROUT Architecture--                                    --
----------------------------------------------------------------------------------------------------

architecture structural of serout is

    --Feedback logic.
    signal sdoComplInt : std_logic;

    --Shift and data register signals.
    signal Load      : std_logic;
    signal Shift     : std_logic;
    signal Empty     : std_logic;
    signal DshiftOut : std_logic; 

    --Serial out PLA signals.
    signal thisState   : std_logic;
    signal nextState   : std_logic;
    signal sdoDloaded  : std_logic;
    signal ssoEmpty    : std_logic;
    signal sdonShiftEn : std_logic;
    signal preSdoLoad  : std_logic;

    --State machine signals.
    signal nor1      : std_logic;
    signal nor2      : std_logic;
    signal QLoad     : std_logic;
    signal QClock    : std_logic;
    signal nsdoClock : std_logic;
    signal preShift1 : std_logic;
    signal preShift2 : std_logic;

    --Two tone signals.
    signal Qshift    : std_logic;
    signal Qs7       : std_logic;
    signal nor3      : std_logic;
    signal and1      : std_logic;
    signal Qand1     : std_logic;
    signal QTimer2   : std_logic;
    signal toneCntrl : std_logic;
    signal nor4      : std_logic;
    signal nnor4     : std_logic;
    signal mux1      : std_logic;
    signal mux2      : std_logic;
    signal ns3       : std_logic;
    signal nmux1     : std_logic;
    signal Qns3      : std_logic;
    signal Qnmux1    : std_logic;

begin

    --Shift and data registers.
    SEROUT_shift_module_0 : entity work.SEROUT_shift_module
    port map
    ( 
        clk       => clk,
        D         => D,
        AddrDw    => AddrDw,
        Load      => Load,
        Shift     => Shift,
        Empty     => Empty,
        DshiftOut => DshiftOut
    );

    --Serial out PLA.
    SEROUT_PLA_0 : entity work.SEROUT_PLA
    port map
    ( 
        sdoQ1       => thisState,
        sdoDloaded  => sdoDloaded,
        sdoEmpty    => ssoEmpty,
        sdoFinish   => sdoFinish,
        sdoD1       => nextState,
        sdonShiftEn => sdonShiftEn,
        preSdoLoad  => preSdoLoad
    );

    --State register.
    cell2p_0: entity work.cell2p
    port map
    (
        clk => clk,
        D   => nextState,
        Ld  => sdoClock,
        nLD => nsdoClock,
        P   => Init,
        Q   => thisState
    );

    --Assign signals.
    setSdoComplete <= sdoComplInt;
    nsdoClock      <= not sdoClock;

    --State machine latch.
    nor1 <= not(nor2 or Init or sdoComplInt);
    nor2 <= AddrDw nor nor1;
    Load <= QLoad nor QClock;

    process(all)
    begin

        --State machine signals.
        if(falling_edge(clk)) then
            sdoDloaded  <= nor2;
            ssoEmpty    <= not Empty;
            preShift1   <= sdonShiftEn nor nsdoClock;
            preShift2   <= preShift1;
            Shift       <= preShift2;
            sdoComplInt <= Load;
        end if;

        if(rising_edge(clk)) then
            QLoad  <= preSdoLoad;
            QClock <= nsdoClock;
        end if;

        --Two tone signals.
        if(rising_edge(clk)) then
            Qshift  <= DshiftOut;
            Qs7     <= SKCTLS7;
            Qand1   <= and1;
            QTimer2 <= Timer2;
            Qns3    <= ns3;
            Qnmux1  <= nmux1;
        end if;

        --Serial out pin.
        if(falling_edge(clk)) then
            SOD <= not mux2;
        end if;

        nor3      <= Qshift nor Qs7;
        and1      <= Timer1 and nor3;
        toneCntrl <= Qand1 nor QTimer2;

        --Two tone MUXs.
        if(toneCntrl = '1') then
            mux1 <= nor4;
        else
            mux1 <= nnor4;
        end if;

        if(SKCTLS3 = '1') then
            mux2 <= nnor4;
        else
            mux2 <= nor3;
        end if;

        ns3          <= not SKCTLS3;
        resync2Tones <= toneCntrl nor ns3;
        nmux1        <= not mux1;
        nor4         <= Qns3 nor Qnmux1;
        nnor4        <= not nor4;

    end process;
end structural;
