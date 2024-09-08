`timescale 1ns / 10ps

module tb_POT_core;
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
    //Pot scan signals.
    reg  POTGO    = 1'b0;
    reg  fastScan = 1'b0;
    reg  [7:0]P   = 8'b11111111;  
    
    wire dump;
    wire [7:0]POT0;
    wire [7:0]POT1;
    wire [7:0]POT2;
    wire [7:0]POT3;
    wire [7:0]POT4;
    wire [7:0]POT5;
    wire [7:0]POT6;
    wire [7:0]POT7;
    wire [7:0]ALLPOT;

    //Clock gen signals.
    reg  init     = 1'b0;
    reg  sel15Khz = 1'b0;
    wire audClock;
    wire keybClk;

    clock_gen_core cg(enn, clk, init, sel15Khz, audClock, keybClk);
    POT_core dut(enn, enp, clk, POTGO, fastScan, keybClk, P, dump, POT0, POT1, POT2, POT3, POT4, POT5, POT6, POT7, ALLPOT);

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

    //@(posedge clk179)
    //@(posedge enp)

    //@(negedge clk179)
    //@(negedge enn)

    #2000
    @(negedge enn)
    init <= 1'b1;
    #10000
    @(negedge enn)
    init <= 1'b0;

    #3000
    @(posedge enp)
    POTGO <= 1'b1;
    @(posedge enp)
    POTGO <= 1'b0;
        
    //Slow scan test.
    #1500000
    @(negedge enn)
    P[5] <= 1'b0;

    #700000
    @(negedge enn)
    P[4] <= 1'b0;

    #2500000
    @(negedge enn)
    P[0] <= 1'b0;

    #2000000
    @(negedge enn)
    P[7] <= 1'b0;

    #1500000
    @(negedge enn)
    P[2] <= 1'b0;

    #3000000
    @(negedge enn)
    P[6] <= 1'b0;

    #2700000
    @(negedge enn)
    P[1] <= 1'b0;

    //Fast scan test.
    #1000000
    @(negedge enn)
    fastScan <= 1'b1;
    P <= 8'b11111111;

    #3000
    @(posedge enp)
    POTGO <= 1'b1;
    @(posedge enp)
    POTGO <= 1'b0;

    #15000
    @(negedge enn)
    P[3] <= 1'b0;

    #5000
    @(negedge enn)
    P[0] <= 1'b0;

    #7000
    @(negedge enn)
    P[1] <= 1'b0;

    #3000
    @(negedge enn)
    P[2] <= 1'b0;

    #2500
    @(negedge enn)
    P[6] <= 1'b0;

    #5500
    @(negedge enn)
    P[4] <= 1'b0;

    #15500
    @(negedge enn)
    P[7] <= 1'b0;

    #500000
    $stop;
    //----------------------------------------------------------------------------------------------

    end
endmodule
