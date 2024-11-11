`timescale 1ns / 10ps

module tb_freq_control;
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
    reg [7:0]D = 8'b00000000;
    reg Addr0w = 1'b0;
    reg Addr2w = 1'b0;
    reg Addr4w = 1'b0;
    reg Addr6w = 1'b0;
    reg Addr9w = 1'b0;
    reg enFastClk1 = 1'b0;
    reg enFastClk3 = 1'b1;
    reg ch2Bits16 = 1'b1;
    reg ch4Bits16 = 1'b1;
    reg resyncTwoTones = 1'b0;
    reg resyncSerClk = 1'b0;
    wire [4:1]Timer;
    wire rstAudPhase;

    //Clock pulse generator signals.
    reg init = 1'b0;
    reg sel15Khz = 1'b0;
    wire audClock;
    wire keybClk;

    clock_gen_core cgc(enn, clk, init, sel15Khz, audClock, keybClk);     

    freq_control fc(enn, enp, clk, audClock, D, Addr0w, Addr2w, Addr4w, Addr6w, Addr9w,
                    enFastClk1, enFastClk3, ch2Bits16, ch4Bits16, resyncTwoTones,
                    resyncSerClk, Timer, rstAudPhase);

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
    //Set resync flip-flops into a known state.
    @(posedge enp)
    Addr9w <= 1'b1;
    @(posedge enp)
    Addr9w <= 1'b0;

    #20000;

    //Initialize clock pulse generator.
    #2000;
    @(negedge enn)
    init <= 1'b1;
    #9000;
    @(negedge enn)
    init <= 1'b0;

    //Load counter register 1.
    #2000;
    @(negedge enn)
    D <= 8'b00101100;
    @(posedge enp)
    Addr0w <= 1'b1;
    @(negedge enn)
    D <= 8'b00000000;
    @(posedge enp)
    Addr0w <= 1'b0;

    //Load counter register 2.
    #2000;
    @(negedge enn)
    D <= 8'b00000001;
    @(posedge enp)
    Addr2w <= 1'b1;
    @(negedge enn)
    D <= 8'b00000000;
    @(posedge enp)
    Addr2w <= 1'b0;

    //Load counter register 3.
    #2000;
    @(negedge enn)
    D <= 8'b00000100;
    @(posedge enp)
    Addr4w <= 1'b1;
    @(negedge enn)
    D <= 8'b00000000;
    @(posedge enp)
    Addr4w <= 1'b0;

    //Load counter register 4.
    #2000;
    @(negedge enn)
    D <= 8'b00001000;
    @(posedge enp)
    Addr6w <= 1'b1;
    @(negedge enn)
    D <= 8'b00000000;
    @(posedge enp)
    Addr6w <= 1'b0;

    //Set resync flip-flops into a known state.
    #2000;
    @(posedge enp)
    Addr9w <= 1'b1;
    @(posedge enp)
    Addr9w <= 1'b0;

    //resync.
    #200000;
    @(posedge enp)
    Addr9w <= 1'b1;
    @(posedge enp)
    Addr9w <= 1'b0;

    #20000000
    $stop;
    //----------------------------------------------------------------------------------------------

    end
endmodule