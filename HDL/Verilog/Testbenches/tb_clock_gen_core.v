`timescale 1ns / 10ps

module tb_clock_core_gen;
    localparam c_50 = 20 / 2;           //50MHz half cycle.
    localparam c_179 = 558.7247666 / 2; //1.79MHz half cycle.

    //Clocks and edge detectors.
    reg clk    = 1'b0;
    reg clk179 = 1'b0;
    reg Qprep  = 1'b0;
    reg Qpren  = 1'b0;
    reg Qedgp  = 1'b0;
    reg Qedgn  = 1'b0;
    wire p, n;

    reg  init;
    reg  sel15Khz = 1'b1;
    wire audClock;
    wire keybClk;

    clock_gen_core dut(n, clk, init, sel15Khz, audClock, keybClk);

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
    assign p =  Qprep & ~Qedgp;
    assign n = ~Qpren &  Qedgn;
    
    initial begin

        #5000;
        @(negedge clk179) //Slow clock transitions to negative.
        @(negedge n) //Clock must propogate through logic before signal will change in real life.
        init <= 1'b1;

        #20000;
        @(negedge clk179)
        @(negedge n)
        init <= 1'b0;

        #200000;
        @(negedge clk179)
        @(negedge n)
        sel15Khz <= 1'b0;

        #250000;
        $stop;
    end
endmodule
