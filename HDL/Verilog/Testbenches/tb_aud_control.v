`timescale 1ns / 10ps

module tb_aud_control;
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
    //Clock pulse generator signals.
    reg  init     = 1'b0;
    reg  sel15Khz = 1'b0;
    wire audClock;
    wire keybClk;

    //Polynomial signals.
    reg  sel9bitPoly = 1'b0;
    wire [7:0]rndNum;
    wire poly4bit;
    wire poly5bit;
    wire poly917bit;

    //Audio frequency control signals.
    reg  [7:0]D         = 8'b00000000;
    reg  Addr0w         = 1'b0;
    reg  Addr2w         = 1'b0;
    reg  Addr4w         = 1'b0;
    reg  Addr6w         = 1'b0;
    reg  Addr9w         = 1'b0;
    reg  enFastClk1     = 1'b0;
    reg  enFastClk3     = 1'b0;
    reg  ch2Bits16      = 1'b0;
    reg  ch4Bits16      = 1'b0;
    reg  resyncTwoTones = 1'b0;
    reg  resyncSerClk   = 1'b0;
    wire [4:1]Timer;
    wire rstAudPhase;

    //Polynomial delay chain.
    wire [3:1]poly4;
    wire [3:1]poly5;
    wire [3:1]poly17;

    //aoudio channel signals.
    reg  [4:1]AUDC = 4'b0000;
    wire [3:0]AUD1;
    wire [3:0]AUD2;
    wire [3:0]AUD3;
    wire [3:0]AUD4;
    reg  dis1 = 1'b0;
    reg  dis2 = 1'b1;

    //Audio addition signals.
    reg [4:0]AUD12;
    reg [4:0]AUD34;
    reg [5:0]AUDOut;

    clock_gen_core cgc(enn, clk, init, sel15Khz, audClock, keybClk);
    poly_core pc(enn, clk, init, sel9bitPoly, rndNum, poly4bit, poly5bit, poly917bit);
    freq_control fc(enn, enp, clk, audClock, D, Addr0w, Addr2w, Addr4w, Addr6w,
                    Addr9w, enFastClk1, enFastClk3, ch2Bits16, ch4Bits16, resyncTwoTones,
                    resyncSerClk, Timer, rstAudPhase);

    //Channel 1 audio control.
    aud_control_hp  ac1(enn, clk, D, AUDC[1], poly4bit, poly5bit, poly917bit, Timer[1],
                        rstAudPhase, dis1, ~Timer[3], AUD1, poly4[1], poly5[1], poly17[1]);

    //Channel 2 audio control.
    aud_control_hp ac2(enn, clk, D, AUDC[2], poly4[1], poly5[1], poly17[1], Timer[2],
                       rstAudPhase, dis2, ~Timer[4], AUD2, poly4[2], poly5[2], poly17[2]);

    //Channel 3 audio control.
    aud_control ac3(enn, clk, D, AUDC[3], poly4[2], poly5[2], poly17[2], Timer[3],
                    rstAudPhase, AUD3, poly4[3], poly5[3], poly17[3]);

    //Channel 4 audio control.
    aud_control ac4(.enn(enn), .clk(clk), .D(D), .AUDC(AUDC[4]), .poly4In(poly4[3]),
                    .poly5In(poly5[3]), .poly17In(poly17[3]), .Timer(Timer[4]),
                    .rstAudPhase(rstAudPhase), .AUD(AUD4), .poly4Out(), .poly5Out(),
                    .poly17Out());

    //----------------------------------------------------------------------------------------------

    always #c_50 clk = !clk;        //50MHz clock generator.
    always #c_179 clk179 = !clk179; //1.512MHz clock generator.

    //Positive edge detector.
    always @(posedge clk) begin
        Qprep <= clk179; //Protect against metastability.
        Qedgp <= Qprep;
    end

    //Negative edge detector.
    always @(negedge clk) begin
        Qpren <= clk179; //Protect against metastability.
        Qedgn <= Qpren;
    end

    //Generate positive and negative edge pulses for slow clock.
    assign enp =  Qprep & ~Qedgp;
    assign enn = ~Qpren &  Qedgn;

    //Add all the audio channels together.
    always @(posedge clk) begin
        AUD12  <= {1'b0, AUD1}  + {1'b0, AUD2};  
        AUD34  <= {1'b0, AUD3}  + {1'b0, AUD4};    
        AUDOut <= {1'b0, AUD34} + {1'b0, AUD12};
    end
    
    initial begin

    //----------------------------------------------------------------------------------------------
    //Put test sequence here.

    //@(posedge clk179)
    //@(posedge enp)

    //@(negedge clk179)
    //@(negedge enn)

    //Reset audio config registers.
    @(posedge enp)
    D <= 8'b10000000;
    @(posedge enp)
    AUDC[1] <= 1'b1;
    @(posedge enp)
    AUDC[1] <= 1'b0;
    @(posedge enp)
    AUDC[2] <= 1'b1;
    @(posedge enp)
    AUDC[2] <= 1'b0;
    @(posedge enp)
    AUDC[3] <= 1'b1;
    @(posedge enp)
    AUDC[3] <= 1'b0;
    @(posedge enp)
    AUDC[4] <= 1'b1;
    @(posedge enp)
    AUDC[4] <= 1'b0;
    @(posedge enp)
    D <= 8'b00000000;

    //Initialize clock pulse generator.
    #2000
    @(negedge enn)
    init <= 1'b1;
    #9000
    @(negedge enn)
    init <= 1'b0;

    //Load counter register 1.
    #2000
    @(negedge enn)
    D <= 8'b00011111;
    @(posedge enp)
    Addr0w <= 1'b1;
    @(negedge enn)
    D <= 8'b00000000;
    @(posedge enp)
    Addr0w <= 1'b0;

    //Load counter register 2.
    #2000
    @(negedge enn)
    D <= 8'b00010000;
    @(posedge enp)
    Addr2w <= 1'b1;
    @(negedge enn)
    D <= 8'b00000000;
    @(posedge enp)
    Addr2w <= 1'b0;

    //Load counter register 3.
    #2000
    @(negedge enn)
    D <= 8'b00100000;
    @(posedge enp)
    Addr4w <= 1'b1;
    @(negedge enn)
    D <= 8'b00000000;
    @(posedge enp)
    Addr4w <= 1'b0;

    //Load counter register 4.
    #2000
    @(negedge enn)
    D <= 8'b01000000;
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

    //Load audio channel 1 configuration.
    #2000
    @(posedge enp)
    D <= 8'b11000011;
    AUDC[1] <= 1'b1;
    @(posedge enp)
    D <= 8'b00000000;
    AUDC[1] <= 1'b0;

    //Load audio channel 2 configuration.
    #2000
    @(posedge enp)
    D <= 8'b11100010;
    AUDC[2] <= 1'b1;
    @(posedge enp)
    D <= 8'b00000000;
    AUDC[2] <= 1'b0;

    //Load audio channel 3 configuration.
    #2000
    @(posedge enp)
    D <= 8'b01100001;
    AUDC[3] <= 1'b1;
    @(posedge enp)
    D <= 8'b00000000;
    AUDC[3] <= 1'b0;

    //Load audio channel 4 configuration.
    #2000
    @(posedge enp)
    D <= 8'b11101111;
    AUDC[4] <= 1'b1;
    @(posedge enp)
    D <= 8'b00000000;
    AUDC[4] <= 1'b0;

    //Load audio channel 4 configuration.
    #10000000
    @(posedge enp)
    D <= 8'b11101111;
    AUDC[4] <= 1'b1;
    @(posedge enp)
    D <= 8'b00000000;
    AUDC[4] <= 1'b0;

    #10000000

    @(AUD4 == 4'b1111);
    @(AUD4 == 4'b0000);
    @(posedge enp)
    D <= 8'b11101110;
    AUDC[4] <= 1'b1;
    @(posedge enp)
    D <= 8'b00000000;
    AUDC[4] <= 1'b0;

    @(AUD4 == 4'b1110);
    @(AUD4 == 4'b0000);
    @(posedge enp)
    D <= 8'b11101101;
    AUDC[4] <= 1'b1;
    @(posedge enp)
    D <= 8'b00000000;
    AUDC[4] <= 1'b0;

    @(AUD4 == 4'b1101);
    @(AUD4 == 4'b0000);
    @(posedge enp)
    D <= 8'b11101100;
    AUDC[4] <= 1'b1;
    @(posedge enp)
    D <= 8'b00000000;
    AUDC[4] <= 1'b0;

    @(AUD4 == 4'b1100);
    @(AUD4 == 4'b0000);
    @(posedge enp)
    D <= 8'b11101011;
    AUDC[4] <= 1'b1;
    @(posedge enp)
    D <= 8'b00000000;
    AUDC[4] <= 1'b0;

    @(AUD4 == 4'b1011);
    @(AUD4 == 4'b0000);
    @(posedge enp)
    D <= 8'b11101010;
    AUDC[4] <= 1'b1;
    @(posedge enp)
    D <= 8'b00000000;
    AUDC[4] <= 1'b0;

    @(AUD4 == 4'b1010);
    @(AUD4 == 4'b0000);
    @(posedge enp)
    D <= 8'b11101000;
    AUDC[4] <= 1'b1;
    @(posedge enp)
    D <= 8'b00000000;
    AUDC[4] <= 1'b0;

    @(AUD4 == 4'b1000);
    @(AUD4 == 4'b0000);
    @(posedge enp)
    D <= 8'b11100111;
    AUDC[4] <= 1'b1;
    @(posedge enp)
    D <= 8'b00000000;
    AUDC[4] <= 1'b0;

    @(AUD4 == 4'b0111);
    @(AUD4 == 4'b0000);
    @(posedge enp)
    D <= 8'b11000110;
    AUDC[4] <= 1'b1;
    @(posedge enp)
    D <= 8'b00000000;
    AUDC[4] <= 1'b0;

    @(AUD4 == 4'b0110);
    @(AUD4 == 4'b0000);
    @(posedge enp)
    D <= 8'b11000101;
    AUDC[4] <= 1'b1;
    @(posedge enp)
    D <= 8'b00000000;
    AUDC[4] <= 1'b0;

    @(AUD4 == 4'b0101);
    @(AUD4 == 4'b0000);
    @(posedge enp)
    D <= 8'b11000100;
    AUDC[4] <= 1'b1;
    @(posedge enp)
    D <= 8'b00000000;
    AUDC[4] <= 1'b0;

    @(AUD4 == 4'b0100);
    @(AUD4 == 4'b0000);
    @(posedge enp)
    D <= 8'b11000011;
    AUDC[4] <= 1'b1;
    @(posedge enp)
    D <= 8'b00000000;
    AUDC[4] <= 1'b0;

    @(AUD4 == 4'b0011);
    @(AUD4 == 4'b0000);
    @(posedge enp)
    D <= 8'b10000010;
    AUDC[4] <= 1'b1;
    @(posedge enp)
    D <= 8'b00000000;
    AUDC[4] <= 1'b0;

    @(AUD4 == 4'b0010);
    @(AUD4 == 4'b0000);
    @(posedge enp)
    D <= 8'b10000001;
    AUDC[4] <= 1'b1;
    @(posedge enp)
    D <= 8'b00000000;
    AUDC[4] <= 1'b0;

    @(AUD4 == 4'b0001);
    @(AUD4 == 4'b0000);
    @(posedge enp)
    D <= 8'b10000000;
    AUDC[4] <= 1'b1;
    @(posedge enp)
    D <= 8'b00000000;
    AUDC[4] <= 1'b0;

    #10000000
    @(posedge enp)
    D <= 8'b01100111;
    AUDC[4] <= 1'b1;
    @(posedge enp)
    D <= 8'b00000000;
    AUDC[4] <= 1'b0;

    #10000000
    @(posedge enp)
    D <= 8'b11101111;
    AUDC[4] <= 1'b1;
    @(posedge enp)
    D <= 8'b00000000;
    AUDC[4] <= 1'b0;

    #10000000
    $stop;
    //----------------------------------------------------------------------------------------------

    end
endmodule
