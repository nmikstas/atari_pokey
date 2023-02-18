--Test bench for the POKEY serial out PLA register.
--Written by Nick Mikstas

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_serout_pla is
end tb_serout_pla;

architecture behavioral of tb_serout_pla is

    signal thisState  : std_logic := '0';
    signal sdoDloaded : std_logic := '0';
    signal sdoEmpty   : std_logic := '0';

    signal sdoFinish   : std_logic;
    signal sdonShiftEn : std_logic;
    signal preSdoLoad  : std_logic;
    signal nextState   : std_logic;

begin

    SEROUT_PLA_0 : entity work.SEROUT_PLA
    port map
    ( 
        sdoQ1       => thisState,
        sdoDloaded  => sdoDloaded,
        sdoEmpty    => sdoEmpty,
        sdoFinish   => sdoFinish,
        sdoD1       => nextState,
        sdonShiftEn => sdonShiftEn,
        preSdoLoad  => preSdoLoad
    );

    process
    begin

        wait for 1000 ns;
        thisState  <= '0';
        sdoDloaded <= '0';
        sdoEmpty   <= '1';

        wait for 1000 ns;
        thisState  <= '0';
        sdoDloaded <= '1';
        sdoEmpty   <= '0';

        wait for 1000 ns;
        thisState  <= '0';
        sdoDloaded <= '1';
        sdoEmpty   <= '1';

        wait for 1000 ns;
        thisState  <= '1';
        sdoDloaded <= '0';
        sdoEmpty   <= '0';

        wait for 1000 ns;
        thisState  <= '1';
        sdoDloaded <= '0';
        sdoEmpty   <= '1';

        wait for 1000 ns;
        thisState  <= '1';
        sdoDloaded <= '1';
        sdoEmpty   <= '0';

        wait for 1000 ns;
        thisState  <= '1';
        sdoDloaded <= '1';
        sdoEmpty   <= '1';

        

        wait for 1000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;