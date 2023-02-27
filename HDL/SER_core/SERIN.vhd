--Serial in module
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                        --SERIN Entity--                                        --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity serin is 
    port 
    (
        clk      : in std_logic;
        SID      : in std_logic;
        Init     : in std_logic;
        SKCTLS4  : in std_logic;
        sdiClock : in std_logic;

        D              : out std_logic_vector(7 downto 0);
        siDelay        : out std_logic;
        setFramerr     : out std_logic;
        setSdiCompl    : out std_logic;
        sdiBusy        : out std_logic;
        resyncSerClock : out std_logic
    );     
end serin;

----------------------------------------------------------------------------------------------------
--                                     --SERIN Architecture--                                     --
----------------------------------------------------------------------------------------------------

architecture structural of serin is

    --Shift register signals.
    signal ssi        : std_logic_vector(7 downto 0);
    signal DQ         : std_logic_vector(8 downto 0);
    signal ssiStopB   : std_logic;
    signal ssiStartB  : std_logic;
    signal ssiSet     : std_logic;
    signal shift      : std_logic;
    signal siDelayint : std_logic;
    signal sdiLoad    : std_logic;

    --PLA signals.
    signal sdiStopBit   : std_logic;
    signal sdinStartBit : std_logic;
    signal nFramerr     : std_logic;
    signal sdiCompl     : std_logic;
    signal preSdiSet    : std_logic;
    signal noSdiErr     : std_logic;
    signal thisState    : std_logic;
    signal nextState    : std_logic;

    --Misc. signals.
    signal sdiClk  : std_logic;
    signal nsdiClk : std_logic;
    signal framerr : std_logic;
    signal sh1     : std_logic;
    signal sh2     : std_logic;

    --Resync signals.
    signal QnoErr    : std_logic;
    signal QnClk     : std_logic;
    signal presync   : std_logic;
    signal delay1    : std_logic;
    signal delay2    : std_logic;
    signal nor1      : std_logic;
    signal nor2      : std_logic;
    signal resyncInt : std_logic;

begin

    --Always assign shift bits.
    ssiStopB <= DQ(8);
    ssi      <= DQ(7 downto 0);

    --Stop bit.
    cell25_0: entity work.cell25
    port map
    (
        clk   => clk,
        Shift => shift,
        D     => not siDelayint,
        Q     => DQ(8)
    );

    --8 data bits.
    gen: for i in 0 to 7 generate
        cell17: entity work.cell17
        port map
        (
            clk   => clk,
            Shift => shift,
            Set   => ssiSet,
            D     => DQ(i+1),
            Q     => DQ(i)
        );
    end generate gen;

    --Start bit.
    cell17_0: entity work.cell17
    port map
    (
        clk   => clk,
        Shift => shift,
        Set   => ssiSet,
        D     => DQ(0),
        Q     => ssiStartB
    );

    --Serial data in PLA.
    serin_pla_0: entity work.serin_pla
    port map
    (
        sdiStopBit   => sdiStopBit,
        sdinStartBit => sdinStartBit,
        sdiQ1        => thisState,
        sdiBusy      => sdiBusy,
        nFramer      => nFramerr,
        sdiCompl     => sdiCompl,
        sdiD1        => nextState,
        preSdiSet    => preSdiSet,
        noSdiErr     => noSdiErr
    );

    --State register.
    cell2p_0: entity work.cell2p
    port map
    (
        clk => clk,
        D   => nextState,
        Ld  => sdiClk,
        nLD => nsdiClk,
        P   => Init,
        Q   => thisState
    );

    --Misc. assignmants.
    nsdiClk <= not sdiClk;
    sdiLoad <= sdiCompl nor nsdiClk;
    ssiSet  <= preSdiSet nor nsdiClk;

    --Always assign output signals.
    siDelay        <= siDelayint;
    resyncSerClock <= resyncInt;

    process(all)
    begin

        --Clock delays.
        if(falling_edge(clk)) then
            sdiClk <= sh2;
            sh2    <= sh1;
            sh1    <= shift;
            shift  <= sdiClock;
        end if;

        --Update PLA flip-flops.
        if(falling_edge(clk)) then
            sdiStopBit   <= ssiStopB;
            sdinStartBit <= not ssiStartB;
        end if;

        --Lock in the serial data.
        if(rising_edge(clk) and sdiLoad = '1') then
            D <= ssi;
        end if;
       
        --Get the input serial bit.
        if(falling_edge(clk)) then
            siDelayint <= not SID;
        end if;

        --setFramerr and setsdiCompl signals.
        framerr <= nFramerr nor nsdiClk;

        if(falling_edge(clk)) then
            setSdiCompl <= not sdiLoad;
            setFramerr  <= framerr;
        end if;

        --Resync flip-flops.
        if(rising_edge(clk)) then
            delay1 <= not siDelayInt;
            delay2 <= not delay1;
            QnoErr <= noSdiErr;
            QnClk  <= nsdiClk; 
        end if;

        --Resync combinational logic.
        presync <= QnoErr nor QnClk;
        nor1    <= delay1 nor delay2;
        
        --Resync latch.
        resyncInt <= not(nor1 or (not SKCTLS4) or nor2);
        nor2      <= resyncInt nor presync;

    end process;
end structural;
