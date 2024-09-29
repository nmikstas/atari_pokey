`timescale 1ns / 10ps

module tb_SKSTAT_reg;
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
    reg  sdiOvrun  = 1'b0;
    reg  keyOvrun  = 1'b0;
    reg  setFramer = 1'b0;
    reg  kShift    = 1'b0;
    reg  keyDown   = 1'b0;
    reg  sdiBusy   = 1'b0;
    reg  siDelay   = 1'b0;
    reg  addrAw    = 1'b0;
    wire [7:0]Dout;

    SKSTAT_reg sk(enn, clk, sdiOvrun, keyOvrun, setFramer, kShift,
                  keyDown, sdiBusy, siDelay, addrAw, Dout);

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

    #2000;
    @(posedge enp)
    addrAw <= 1'b1;
    @(posedge enp)
    addrAw <= 1'b0;

    @(posedge enp)
    @(posedge enp)
    sdiOvrun <= 1'b1;
    @(posedge enp)
    sdiOvrun <= 1'b0;

    @(posedge enp)
    @(posedge enp)
    keyOvrun <= 1'b1;
    @(posedge enp)
    keyOvrun <= 1'b0;

    @(posedge enp)
    @(posedge enp)
    setFramer <= 1'b1;
    @(posedge enp)
    setFramer <= 1'b0;

    @(posedge enp)
    @(posedge enp)
    addrAw <= 1'b1;
    @(posedge enp)
    addrAw <= 1'b0;

    @(posedge enp)
    @(posedge enp)
    @(posedge enp)
    kShift  <= 1'b1;
    keyDown <= 1'b1;
    sdiBusy <= 1'b1;
    siDelay <= 1'b1;

    #1000
    $stop;
    //----------------------------------------------------------------------------------------------

    end
endmodule