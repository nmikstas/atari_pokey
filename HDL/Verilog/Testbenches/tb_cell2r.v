`timescale 1ns / 10ps

module tb_cell2r;
    localparam c_50 = 20 / 2;           //50MHz half cycle.
    localparam c_179 = 558.7247666 / 2; //1.79MHz half cycle.

    //Slow clock and edge detectors.
    reg clk    = 1'b0;
    reg clk179 = 1'b0;
    reg Qprep  = 1'b0;
    reg Qpren  = 1'b0;
    reg Qedgp  = 1'b0;
    reg Qedgn  = 1'b0;
    wire enp, enn;

    //----------------------------------------------------------------------------------------------
    //Put regs, wires and DUT here.
    reg  D   = 1'b1;
    reg  Ld  = 1'b0;
    reg  nLd = 1'b1;
    reg  R   = 1'b0;
    wire Q;

    cell2r dut(enn, clk, D, Ld, nLd, R, Q);

    //----------------------------------------------------------------------------------------------

    always #c_50 clk = !clk;        //50MHz clock generator.
    always #c_179 clk179 = !clk179; //1.512MHz clock generator.

    //Positive edge detector.
    always @(posedge clk) begin
        Qprep  <= clk179; //Protect against metastability.
        Qedgp  <= Qprep;
    end

    //Negative edge detector.
    always @(negedge clk) begin
        Qpren  <= clk179; //Protect against metastability.
        Qedgn  <= Qpren;
    end

    //Generate positive and negative edge pulses for slow clock.
    assign enp =  Qprep & ~Qedgp;
    assign enn = ~Qpren &  Qedgn;
    
    initial begin

    //----------------------------------------------------------------------------------------------
    //Put test sequence here.
    #5000
    @(negedge clk179) //Slow clock transitions to negative.
    @(negedge enn)    //Clock must propogate through logic.
    Ld  <= 1'b1;
    nLd <= 1'b0;

    @(negedge clk179) //Slow clock transitions to negative.
    @(negedge enn)    //Clock must propogate through logic.
    Ld  <= 1'b0;
    nLd <= 1'b1;

    #5000
    @(negedge clk179) //Slow clock transitions to negative.
    @(negedge enn)    //Clock must propogate through logic.
    R <= 1'b1;

    @(negedge clk179) //Slow clock transitions to negative.
    @(negedge enn)    //Clock must propogate through logic.
    R <= 1'b0;

    #5000
    D <= 1'b0;

    @(negedge clk179) //Slow clock transitions to negative.
    @(negedge enn)    //Clock must propogate through logic.
    Ld  <= 1'b1;
    nLd <= 1'b0;

    @(negedge clk179) //Slow clock transitions to negative.
    @(negedge enn)    //Clock must propogate through logic.
    Ld  <= 1'b0;
    nLd <= 1'b1;

    //----------------------------------------------------------------------------------------------

    end
endmodule