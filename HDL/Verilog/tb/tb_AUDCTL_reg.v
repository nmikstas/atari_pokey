`timescale 1ns / 10ps

module tb_AUDCTL_reg;
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
    reg  wren = 1'b0;
    reg  [7:0]D = 8'b00000000;
    wire sel15Khz;
    wire disHiFltr2;
    wire disHiFltr1;
    wire ch4Bits16;
    wire ch2Bits16;
    wire enFastClk3;
    wire enFastClk1;
    wire sel9bitPoly;

    AUDCTL_reg ar(enn, clk, wren, D, sel15Khz, disHiFltr2, disHiFltr1, ch4Bits16,
                  ch2Bits16, enFastClk3, enFastClk1, sel9bitPoly);

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
    @(posedge enp)
    D <= 8'b11110001;
    #100
    wren <= 1'b1;
    @(posedge enp)
    #150
    wren <= 1'b0;
      
    #2000
    @(posedge enp)
    D <= 8'b00000100;
    #100
    wren <= 1'b1;
    @(posedge enp)
    #150
    wren <= 1'b0;

    #2000
    @(posedge enp)
    D <= 8'b00000011;
    #100
    wren <= 1'b1;
    @(posedge enp)
    #150
    wren <= 1'b0;

    #2000
    @(posedge enp)
    D <= 8'b11111001;
    #100
    wren <= 1'b1;
    @(posedge enp)
    #150
    wren <= 1'b0;

    #10000
    $stop;
    //----------------------------------------------------------------------------------------------

    end
endmodule
