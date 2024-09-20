`timescale 1ns / 10ps

module tb_SER_core;
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
    //Frequency control signals.
    reg  [7:0]D     = 8'b00000000;
    reg  Addr0w     = 1'b0;
    reg  Addr2w     = 1'b0;
    reg  Addr4w     = 1'b0;
    reg  Addr6w     = 1'b0;
    reg  Addr9w     = 1'b0;
    reg  enFastClk1 = 1'b0;
    reg  enFastClk3 = 1'b1;
    reg  ch2Bits16  = 1'b0;
    reg  ch4Bits16  = 1'b1;
    wire resyncSerClk;
    wire [4:1]Timer;
    wire rstAudPhase;
    wire resyncTwoTones;

    //Clock pulse generator signals.
    reg  init     = 1'b0;
    reg  sel15Khz = 1'b0;
    wire audClock;
    wire keybClk;

    //SER_core signals.
    reg  [7:0]Dw     = 8'b00000000;
    reg  [7:3]SKCTLS = 5'b00000;
    reg  SID         = 1'b1;
    reg  AddrDw      = 1'b0;
    reg  BCLK_in     = 1'b0;
    wire BCLK_out;
    wire OCLK;
    wire SOD;
    wire siDelay;
    wire setFramerr;
    wire setSdiCompl;
    wire sdiBusy;
    wire sdoFinish;
    wire [7:0]Dr;
    
    //BCLK_in clock signal.
    reg [2:0]counter = 3'b000;

    //Audio clock generator.
    clock_gen_core cgc(enn, clk, init, sel15Khz, audClock, keybClk); 

    //Audio frequency control.
    freq_control fc(enn, enp, clk, audClock, D, Addr0w, Addr2w, Addr4w, Addr6w, Addr9w,
                    enFastClk1, enFastClk3, ch2Bits16, ch4Bits16, resyncTwoTones, resyncSerClk,
                    Timer, rstAudPhase);

    //Serial core.
    SER_core sc(enn, enp, clk, Dw, SKCTLS, SID, AddrDw, init, Timer[1], Timer[2], Timer[4], 
                BCLK_in, BCLK_out, OCLK, SOD, siDelay, setFramerr, setSdiCompl, sdiBusy, 
                resyncSerClk, resyncTwoTones, sdoFinish, setSdoCompl, Dr);

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

    always @(negedge clk) begin
        if(enn == 1'b1) begin
            counter <= counter + 1'b1;
            if(counter >= 3'b100) begin
                BCLK_in <= 1'b0;
            end
            else begin
                BCLK_in <= 1'b1;
            end
        end
    end
    
    initial begin

    //----------------------------------------------------------------------------------------------
    //Put test sequence here.

    //@(posedge clk179)
    //@(posedge enp)

    //@(negedge clk179)
    //@(negedge enn)

    //Set resync flip-flops into a known state.
    #10000
    @(posedge enp)
    Addr9w <= 1'b1;
    @(posedge enp)
    Addr9w <= 1'b0;

    //Initialize clock pulse generator.
    @(negedge enn)
    init <= 1'b1;
    #9000
    @(negedge enn)
    init <= 1'b0;

    //Load counter register 1.
    @(negedge enn)
    D <= 8'b00000111;
    @(posedge enp)
    Addr0w <= 1'b1;
    @(negedge enn)
    D <= 8'b00000000;
    @(posedge enp)
    Addr0w <= 1'b0;

    //Load counter register 2.
    @(negedge enn)
    D <= 8'b00010000;
    @(posedge enp)
    Addr2w <= 1'b1;
    @(negedge enn)
    D <= 8'b00000000;
    @(posedge enp)
    Addr2w <= 1'b0;

    //Load counter register 3.
    @(negedge enn)
    D <= 8'b00000010;
    @(posedge enp)
    Addr4w <= 1'b1;
    @(negedge enn)
    D <= 8'b00000000;
    @(posedge enp)
    Addr4w <= 1'b0;

    //Load counter register 4.
    @(negedge enn)
    D <= 8'b00000000;
    @(posedge enp)
    Addr6w <= 1'b1;
    @(negedge enn)
    D <= 8'b00000000;
    @(posedge enp)
    Addr6w <= 1'b0;

    //Set resync flip-flops into a known state.
    #2000
    @(posedge enp)
    Addr9w <= 1'b1;
    @(posedge enp)
    Addr9w <= 1'b0;

    //Change clock config for async receive.
    #2000;
    @(negedge enn)
    SKCTLS <= 5'b00010;

    //Begin async receiving data.
    #10000
    SID <= 1'b0; //Start bit.
    #10000
    SID <= 1'b1;
    #10000
    SID <= 1'b1;
    #10000
    SID <= 1'b0;
    #10000
    SID <= 1'b1;
    #10000
    SID <= 1'b0;
    #10000
    SID <= 1'b0;
    #10000
    SID <= 1'b0;
    #10000
    SID <= 1'b1;
    #10000
    SID <= 1'b0; //Causes frame error. Should be a stop bit.
    #10000
    SID <= 1'b1;

    //Receive a second byte "11111111".
    #10000
    SID <= 1'b0;
    #10000
    SID <= 1'b1;

    //Wait for second byte to finish transmitting.
    #100000

    //Change clock config for async receive.
    #2000
    @(negedge enn)
    SKCTLS <= 5'b00100;

    //Receive a synchronous byte.
    @(negedge sc.sdiClock)
    #5000
    SID <= 1'b0;
    @(negedge sc.sdiClock)
    #5000
    SID <= 1'b1;
    @(negedge sc.sdiClock)
    #5000
    SID <= 1'b0;
    @(negedge sc.sdiClock)
    #5000
    SID <= 1'b1;
    @(negedge sc.sdiClock)
    #5000
    SID <= 1'b0;
    @(negedge sc.sdiClock)
    #5000
    SID <= 1'b1;
    @(negedge sc.sdiClock)
    #5000
    SID <= 1'b0;
    @(negedge sc.sdiClock)
    #5000
    SID <= 1'b1;
    @(negedge sc.sdiClock)
    #5000
    SID <= 1'b0;
    @(negedge sc.sdiClock)
    #5000
    SID <= 1'b1;


    #200000
    $stop;
    //----------------------------------------------------------------------------------------------

    end
endmodule
