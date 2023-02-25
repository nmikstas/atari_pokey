--Test bench for the POKEY serial in PLA.
--Written by Nick Mikstas

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity tb_serin_pla is
end tb_serin_pla;

architecture behavioral of tb_serin_pla is

    signal thisState    : std_logic := '0';
    signal sdiStopBit   : std_logic := '0';
    signal sdinStartBit : std_logic := '0';

    signal sdiBusy   : std_logic;
    signal nFramer   : std_logic;
    signal sdiCompl  : std_logic;
    signal preSdiSet : std_logic;
    signal noSdiErr  : std_logic;
    signal nextState : std_logic;

begin

    SERIN_PLA_0 : entity work.SERIN_PLA
    port map
    ( 
        sdiStopBit   => sdiStopBit,
        sdinStartBit => sdinStartBit,
        sdiQ1        => thisState,
        sdiBusy      => sdiBusy,
        nFramer      => nFramer,
        sdiCompl     => sdiCompl,
        sdiD1        => nextState,
        preSdiSet    => preSdiSet,
        noSdiErr     => noSdiErr
    );

    process
    begin

        wait for 1000 ns;
        thisState    <= '0';
        sdiStopBit   <= '0';
        sdinStartBit <= '1';

        wait for 1000 ns;
        thisState    <= '0';
        sdiStopBit   <= '1';
        sdinStartBit <= '0';
       
        wait for 1000 ns;
        thisState    <= '0';
        sdiStopBit   <= '1';
        sdinStartBit <= '1';

        wait for 1000 ns;
        thisState    <= '1';
        sdiStopBit   <= '0';
        sdinStartBit <= '0';

        wait for 1000 ns;
        thisState    <= '1';
        sdiStopBit   <= '0';
        sdinStartBit <= '1';

        wait for 1000 ns;
        thisState    <= '1';
        sdiStopBit   <= '1';
        sdinStartBit <= '0';

        wait for 1000 ns;
        thisState    <= '1';
        sdiStopBit   <= '1';
        sdinStartBit <= '1';

        wait for 1000 ns;
        std.env.stop; --End the simulation.
    end process;

end behavioral;