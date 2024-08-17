`timescale 1ns / 10ps

module tb_cell16;
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
    reg Shift = 1'b0;
    reg R     = 1'b0;    
    reg D     = 1'b1;
    wire Q; 

    cell16 dut(enp, clk, Shift, R, D, Q);

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
    #1000
    @(negedge clk179) //Slow clock transitions to negative.
    @(negedge enn)   //Clock must propogate through logic befor signal will change in real life.
    Shift <= 1'b1;

    @(negedge clk179) //Slow clock transitions to negative.
    @(negedge enn)   //Clock must propogate through logic befor signal will change in real life.
    Shift <= 1'b0;

    #1000
    @(negedge clk179) //Slow clock transitions to negative.
    @(negedge enn)   //Clock must propogate through logic befor signal will change in real life.
    R <= 1'b1;

    @(negedge clk179) //Slow clock transitions to negative.
    @(negedge enn)   //Clock must propogate through logic befor signal will change in real life.
    R <= 1'b0;

    #1000
    D <= 1'b1;

    #1000
    @(negedge clk179) //Slow clock transitions to negative.
    @(negedge enn)   //Clock must propogate through logic befor signal will change in real life.
    Shift <= 1'b1;

    @(negedge clk179) //Slow clock transitions to negative.
    @(negedge enn)   //Clock must propogate through logic befor signal will change in real life.
    Shift <= 1'b0;


    //----------------------------------------------------------------------------------------------

    end
endmodule
