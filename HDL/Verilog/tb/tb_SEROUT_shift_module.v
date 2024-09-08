`timescale 1ns / 10ps

module tb_SEROUT_shift_module;
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

    reg  [7:0]D = 8'b11001001;
    reg  AddrDw = 1'b0;
    reg  Load   = 1'b0;
    reg  Shift  = 1'b0;
    wire Empty;
    wire DshiftOut;

    SEROUT_shift_module dut(enp, enn, clk, D, AddrDw, Load, Shift, Empty, DshiftOut);


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

    //@(negedge clk179) //Slow clock transitions to negative.
    //@(negedge enn)    //Clock must propogate through logic.

    //Load write register.
    #1000;
    @(posedge clk179)
    @(negedge enp)
    AddrDw <= 1'b1;
    @(posedge clk179)
    @(negedge enp)
    AddrDw <= 1'b0;
        
    //Transfer contents of write register to the shift register.
    @(posedge clk179)
    @(negedge enp)
    Load <= 1'b1;
    @(posedge clk179)
    @(negedge enp)
    Load <= 1'b0;

    //Shift out.
    #1000;
    @(negedge clk179)
    @(negedge enn)
    Shift <= 1'b1;
    @(negedge clk179)
    @(negedge enn)
    Shift <= 1'b0;

    @(negedge clk179)
    @(negedge enn)
    Shift <= 1'b1;
    @(negedge clk179)
    @(negedge enn)
    Shift <= 1'b0;

    @(negedge clk179)
    @(negedge enn)
    Shift <= 1'b1;
    @(negedge clk179)
    @(negedge enn)
    Shift <= 1'b0;

    @(negedge clk179)
    @(negedge enn)
    Shift <= 1'b1;
    @(negedge clk179)
    @(negedge enn)
    Shift <= 1'b0;

    @(negedge clk179)
    @(negedge enn)
    Shift <= 1'b1;
    @(negedge clk179)
    @(negedge enn)
    Shift <= 1'b0;

    @(negedge clk179)
    @(negedge enn)
    Shift <= 1'b1;
    @(negedge clk179)
    @(negedge enn)
    Shift <= 1'b0;

    @(negedge clk179)
    @(negedge enn)
    Shift <= 1'b1;
    @(negedge clk179)
    @(negedge enn)
    Shift <= 1'b0;

    @(negedge clk179)
    @(negedge enn)
    Shift <= 1'b1;
    @(negedge clk179)
    @(negedge enn)
    Shift <= 1'b0;

    
    @(negedge clk179)
    @(negedge enn)
    Shift <= 1'b1;
    @(negedge clk179)
    @(negedge enn)
    Shift <= 1'b0;

    @(negedge clk179)
    @(negedge enn)
    Shift <= 1'b1;
    @(negedge clk179)
    @(negedge enn)
    Shift <= 1'b0;
                
    #2000;
    $stop;

    //----------------------------------------------------------------------------------------------

    end
endmodule
