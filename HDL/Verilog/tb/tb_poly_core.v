`timescale 1ns / 10ps

module tb_poly_core;
    localparam c_50 = 20 / 2;           //50MHz half cycle.
    localparam c_179 = 558.7247666 / 2; //1.79MHz half cycle.

    //Clocks and edge detectors.
    reg clk    = 1'b0;
    reg clk179 = 1'b0;
    reg Qprep  = 1'b0;
    reg Qpren  = 1'b0;
    reg Qedgp  = 1'b0;
    reg Qedgn  = 1'b0;
    wire enp, enn;

    reg  init = 1'b0;
    reg  sel9bitPoly = 1'b0;
    wire [7:0]rndNum;
    wire poly4bit, poly5bit, poly917bit;

    poly_core dut(enn, clk, init, sel9bitPoly, rndNum, poly4bit, poly5bit, poly917bit);

    always #c_50 clk = !clk;        //50MHz clock generator.
    always #c_179 clk179 = !clk179; //1.79MHz clock generator.

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

        #5000;
        @(negedge clk179) //Slow clock transitions to negative.
        @(negedge enn)    //Clock must propogate through logic.
        init <= 1'b1;

        #20000;
        @(negedge clk179)
        @(negedge enn)
        init <= 1'b0;

        #200000
        @(negedge clk179)
        @(negedge enn)
        sel9bitPoly <= 1'b0;

        #250000
        $stop;

    end

endmodule
