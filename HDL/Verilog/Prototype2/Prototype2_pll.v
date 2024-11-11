module Prototype2_pll(PACKAGEPIN,
                      PLLOUTCORE,
                      PLLOUTGLOBAL,
                      RESET);

inout PACKAGEPIN;
input RESET;    /* To initialize the simulation properly, the RESET signal (Active Low) must be asserted at the beginning of the simulation */ 
output PLLOUTCORE;
output PLLOUTGLOBAL;

SB_PLL40_PAD Prototype2_pll_inst(.PACKAGEPIN(PACKAGEPIN),
                                 .PLLOUTCORE(PLLOUTCORE),
                                 .PLLOUTGLOBAL(PLLOUTGLOBAL),
                                 .EXTFEEDBACK(),
                                 .DYNAMICDELAY(),
                                 .RESETB(RESET),
                                 .BYPASS(1'b0),
                                 .LATCHINPUTVALUE(),
                                 .LOCK(),
                                 .SDI(),
                                 .SDO(),
                                 .SCLK());

//\\ Fin=100, Fout=60;
defparam Prototype2_pll_inst.DIVR = 4'b0100;
defparam Prototype2_pll_inst.DIVF = 7'b0101111;
defparam Prototype2_pll_inst.DIVQ = 3'b100;
defparam Prototype2_pll_inst.FILTER_RANGE = 3'b010;
defparam Prototype2_pll_inst.FEEDBACK_PATH = "SIMPLE";
defparam Prototype2_pll_inst.DELAY_ADJUSTMENT_MODE_FEEDBACK = "FIXED";
defparam Prototype2_pll_inst.FDA_FEEDBACK = 4'b0000;
defparam Prototype2_pll_inst.DELAY_ADJUSTMENT_MODE_RELATIVE = "FIXED";
defparam Prototype2_pll_inst.FDA_RELATIVE = 4'b0000;
defparam Prototype2_pll_inst.SHIFTREG_DIV_MODE = 2'b00;
defparam Prototype2_pll_inst.PLLOUT_SELECT = "GENCLK";
defparam Prototype2_pll_inst.ENABLE_ICEGATE = 1'b0;

endmodule
