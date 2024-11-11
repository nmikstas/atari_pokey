`timescale 1ns / 10ps

module tb_cell25;
    localparam c_50 = 20 / 2;     //50MHz half cycle.
    localparam c_15 = 661.38 / 2; //1.512MHz half cycle.

    reg clk   = 1'b0;
    reg Shift = 1'b0;
    reg D     = 1'b0;

    wire Q;

    //Slow clock and edge detectors.
    reg clk15 = 1'b0;
    reg Qprep = 1'b0;
    reg Qpren = 1'b0;
    reg Qedgp = 1'b0;
    reg Qedgn = 1'b0;
    wire p, n;

    cell25 dut(p, clk, Shift, D, Q);

    always #c_50 clk = !clk;     //50MHz clock generator.
    always #c_15 clk15 = !clk15; //1.512MHz clock generator.

    //Positive edge detector.
    always @(posedge clk) begin
        Qprep  <= clk15; //Protect against metastability.
        Qedgp  <= Qprep;
    end

    //Negative edge detector.
    always @(negedge clk) begin
        Qpren  <= clk15; //Protect against metastability.
        Qedgn  <= Qpren;
    end

    //Generate positive and negative edge pulses for slow clock.
    assign p =  Qprep & ~Qedgp;
    assign n = ~Qpren &  Qedgn;
    
    initial begin

    //Put a data bit on the input
    #(c_15*2) //Get to the ballpark of the time we want to transition.

    @(negedge clk15) //Slow clock transitions to negative.
    @(negedge n) //Clock must propogate through logic befor signal will change in real life.
    Shift <= 1'b1;
    D = 1'b1;

    @(negedge clk15); 
    @(negedge n);
    Shift = 1'b0;
    
    end
endmodule
