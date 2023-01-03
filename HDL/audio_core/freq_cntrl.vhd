--Frequency control register
--Written by Nick Mikstas

----------------------------------------------------------------------------------------------------
--                                  --Frequency Control Entity--                                  --
----------------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity freq_cntrl_reg is
    port 
    (
        clk   : in std_logic;
        D     : in std_logic_vector(7 downto 0);
        WR    : in std_logic;

        decEn : in std_logic;
        Ld    : in std_logic;
        
        nBOR  : out std_logic
    );     
end freq_cntrl_reg;

----------------------------------------------------------------------------------------------------
--                               --Frequency Control Architecture--                               --
----------------------------------------------------------------------------------------------------

--Binary decrement with borrow delay.
architecture structural of freq_cntrl_reg is

    signal CR_BOR   : std_logic_vector(6 downto 0);
    signal nCR_nBOR : std_logic_vector(6 downto 0);
    signal nor1     : std_logic;
    signal nor2     : std_logic;

begin

    --Data bit D7.
    bit_7 : entity work.cell24option1
    port map
    ( 
        clk  => clk,
        D    => D(7),
        WR   => WR,
        Ld   => Ld,
        CR   => CR_BOR(6),
        nCR  => nCR_nBOR(6),
        nBOR => nBOR
    );

    --Data bit D6.
    bit_6 : entity work.cell24
    port map
    (
        clk  => clk,
        D    => D(6),
        WR   => WR,
        Ld   => Ld,
        CR   => CR_BOR(5),
        nCR  => nCR_nBOR(5),
        BOR  => CR_BOR(6),
        nBOR => nCR_nBOR(6)
    );

    --Data bit D5.
    bit_5 : entity work.cell24
    port map
    (
        clk  => clk,
        D    => D(5),
        WR   => WR,
        Ld   => Ld,
        CR   => CR_BOR(4),
        nCR  => nCR_nBOR(4),
        BOR  => CR_BOR(5),
        nBOR => nCR_nBOR(5)
    );

    --Data bit D4.
    bit_4: entity work.cell20
    port map
    (
        clk  => clk,
        D    => D(4),
        WR   => WR,
        Ld   => Ld,
        CR   => CR_BOR(3),
        nCR  => nCR_nBOR(3),
        BOR  => CR_BOR(4),
        nBOR => nCR_nBOR(4)
    );     

    --Data bit D3.
    bit_3 : entity work.cell24
    port map
    (
        clk  => clk,
        D    => D(3),
        WR   => WR,
        Ld   => Ld,
        CR   => CR_BOR(2),
        nCR  => nCR_nBOR(2),
        BOR  => CR_BOR(3),
        nBOR => nCR_nBOR(3)
    );

    --Data bit D2.
    bit_2 : entity work.cell24
    port map
    (
        clk  => clk,
        D    => D(2),
        WR   => WR,
        Ld   => Ld,
        CR   => CR_BOR(1),
        nCR  => nCR_nBOR(1),
        BOR  => CR_BOR(2),
        nBOR => nCR_nBOR(2)
    );

    --Data bit D1.
    bit_1 : entity work.cell24
    port map
    (
        clk  => clk,
        D    => D(1),
        WR   => WR,
        Ld   => Ld,
        CR   => CR_BOR(0),
        nCR  => nCR_nBOR(0),
        BOR  => CR_BOR(1),
        nBOR => nCR_nBOR(1)
    );

    --Data bit D0.
    bit_0: entity work.cell20
    port map
    (
        clk  => clk,
        D    => D(0),
        WR   => WR,
        Ld   => Ld,
        CR   => nor2,
        nCR  => nor1,
        BOR  => CR_BOR(0),
        nBOR => nCR_nBOR(0)
    ); 

    process(all)
    begin
        
        nor1 <= not(decEn or Ld);
        nor2 <= not(nor1 or Ld);

    end process;
end structural;