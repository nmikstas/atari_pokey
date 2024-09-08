`timescale 1ns / 10ps

module tb_KEY_core;
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
    reg  KR1 = 1'b1;
    reg  KR2 = 1'b1;
    wire setKey;
    wire kShift;
    wire setBreak;
    wire keyDown;
    wire [7:0]D;
    wire [5:0]K;
    
    reg  init = 1'b0;
    reg  sel15Khz = 1'b0;
    wire audClock;
    wire keybClk;

    clock_gen_core cgc(enn, clk, init, sel15Khz, audClock, keybClk);

    KEY_core kc(enn, enp, clk, keybClk, {KR2, KR1}, {~init, ~init}, setKey, kShift, setBreak, keyDown, D, K);

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

    //Initialize clock pulse generator core.
    #2000
    @(negedge enn)
    init <= 1'b1;
    #10000;
    @(negedge enn)
    init <= 1'b0;

    //Wait until control, break and shift key statuses become valid.
    @(kShift == 1'b0)

    //Strobe the break interrupt.
    @(K == 6'b001111)
    @(negedge keybClk)
    KR2 <= 1'b0;
    @(negedge keybClk)
    KR2 <= 1'b1;

    //Set the control key.
    @(K == 6'b111111)
    @(negedge keybClk) 
    KR2 <= 1'b0;
    @(negedge enn)
    KR2 <= 1'b1;

    //Set the shift key.
    @(K == 6'b101111)
    @(negedge keybClk); 
    KR2 <= 1'b0;
    @(negedge enn)
    KR2 <= 1'b1;

    //Press key.
    @(K == 6'b101010)
    @(negedge keybClk)
    KR1 <= 1'b0;
    @(negedge enn)
    KR1 <= 1'b1;

    //Debounce key press.
    @(negedge keybClk)
    @(negedge keybClk)
    @(K == 6'b101010)
    @(negedge keybClk)
    KR1 <= 1'b0;
    @(negedge enn)
    KR1 <= 1'b1;

    //Release key.
    @(negedge keybClk)
    @(negedge keybClk)
    @(K == 6'b101010)
    @(negedge keybClk)

    //Debounce key release.
    @(negedge keybClk)
    @(negedge keybClk)
    @(K == 6'b101010)
    @(negedge keybClk)

    //Wait for next key press.
    @(negedge keybClk)
    @(negedge keybClk)
    @(K == 6'b101010)
    @(negedge keybClk)

    //Press key along with shift and control key.
    @(negedge keybClk)
    @(negedge keybClk)
    @(K == 6'b000111)
    @(negedge keybClk)
    KR1 <= 1'b0;
    @(negedge enn)
    KR1 <= 1'b1;

    //Press shift key.
    @(negedge keybClk)
    @(negedge keybClk)
    @(K == 6'b101111)
    @(negedge keybClk)
    KR2 <= 1'b0;
    @(negedge enn)
    KR2 <= 1'b1;

    //Press control key.
    @(negedge keybClk)
    @(negedge keybClk)
    @(K == 6'b111111)
    @(negedge keybClk)
    KR2 <= 1'b0;
    @(negedge enn)
    KR2 <= 1'b1;

    //Debounce key press.
    @(negedge keybClk)
    @(negedge keybClk)
    @(K == 6'b000111)
    @(negedge keybClk)
    KR1 <= 1'b0;
    @(negedge enn)
    KR1 <= 1'b1;

    #10000000
    $stop;
    //----------------------------------------------------------------------------------------------
    end
endmodule
