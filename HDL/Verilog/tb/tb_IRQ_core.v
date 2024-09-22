`timescale 1ns / 10ps

module tb_IRQ_core;
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
    reg  IRQEN       = 1'b0;
    reg  [7:0]Dw     = 8'b00000000;
    reg  setBreak    = 1'b0;
    reg  setKey      = 1'b0;
    reg  setSdiCompl = 1'b0;
    reg  setSdoCompl = 1'b0;
    reg  sdoFinish   = 1'b0;
    reg  Timer4      = 1'b0;
    reg  Timer2      = 1'b0;
    reg  Timer1      = 1'b0;
    wire IRQ;
    wire [7:0]Dr;
    wire keyOvrun;
    wire sdiOvrun;

    IRQ_core IRQc(enn, enp, clk, IRQEN, Dw, setBreak, setKey, setSdiCompl, setSdoCompl,
                  sdoFinish, Timer4, Timer2, Timer1, IRQ, Dr, keyOvrun, sdiOvrun);

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

    //Disable all the IRQs.
    #5000
    @(posedge enp)
    IRQEN <= 1'b1;
    @(posedge enp)
    IRQEN <= 1'b0;

    //Activate all IRQ signals. IRQ line should not go high.
    #1000
    @(negedge enn)
        setBreak    <= 1'b1;
        setKey      <= 1'b1;
        setSdiCompl <= 1'b1;
        setSdoCompl <= 1'b1;
        sdoFinish   <= 1'b1;
        Timer4      <= 1'b1;
        Timer2      <= 1'b1;
        Timer1      <= 1'b1;

    //Turn off all IRQ signals.
    @(negedge enn)
        setBreak    <= 1'b0;
        setKey      <= 1'b0;
        setSdiCompl <= 1'b0;
        setSdoCompl <= 1'b0;
        sdoFinish   <= 1'b1;
        Timer4      <= 1'b0;
        Timer2      <= 1'b0;
        Timer1      <= 1'b0;       

    //--------------------------------------Test Timer 1 IRQ--------------------------------------
    #1000

    //Enable IRQ.
    @(negedge enn)
    Dw <= 8'b00000001;
    @(posedge enp)
    IRQEN <= 1'b1;
    @(posedge enp)
    IRQEN <= 1'b0;
    @(negedge enn)
    Dw <= 8'b00000000;

    //Send an IRQ.
    #1000
    @(negedge enn)
    Timer1 <= 1'b1;
    @(negedge enn)
    Timer1 <= 1'b0;

    //Clear IRQ signal.
    #1000
    @(negedge enn)
    Dw <= 8'b00000000;
    @(posedge enp)
    IRQEN <= 1'b1;
    @(posedge enp)
    IRQEN <= 1'b0;

    //--------------------------------------Test Timer 2 IRQ--------------------------------------
    #1000

    //Enable IRQ.
    @(negedge enn)
    Dw <= 8'b00000010;
    @(posedge enp)
    IRQEN <= 1'b1;
    @(posedge enp)
    IRQEN <= 1'b0;
    @(negedge enn)
    Dw <= 8'b00000000;

    //Send an IRQ.
    #1000
    @(negedge enn)
    Timer2 <= 1'b1;
    @(negedge enn)
    Timer2 <= 1'b0;

    //Clear IRQ signal.
    #1000
    @(negedge enn)
    Dw <= 8'b00000000;
    @(posedge enp)
    IRQEN <= 1'b1;
    @(posedge enp)
    IRQEN <= 1'b0;

    //--------------------------------------Test Timer 4 IRQ--------------------------------------
    #1000

    //Enable IRQ.
    @(negedge enn)
    Dw <= 8'b00000100;
    @(posedge enp)
    IRQEN <= 1'b1;
    @(posedge enp)
    IRQEN <= 1'b0;
    @(negedge enn)
    Dw <= 8'b00000000;

    //Send an IRQ.
    #1000
    @(negedge enn)
    Timer4 <= 1'b1;
    @(negedge enn)
    Timer4 <= 1'b0;

    //Clear IRQ signal.
    #1000
    @(negedge enn)
    Dw <= 8'b00000000;
    @(posedge enp)
    IRQEN <= 1'b1;
    @(posedge enp)
    IRQEN <= 1'b0;      

    //-------------------------------------Test sdo Finish IRQ------------------------------------
    #1000

    //Enable IRQ.
    @(negedge enn)
    Dw <= 8'b00001000;
    @(posedge enp)
    IRQEN <= 1'b1;
    @(posedge enp)
    IRQEN <= 1'b0;
    @(negedge enn)
    Dw <= 8'b00000000;

    //Send an IRQ.
    #1000
    @(negedge enn)
    sdoFinish <= 1'b0;
    @(negedge enn)
    sdoFinish <= 1'b1;

    //Clear IRQ signal.
    #1000
    @(negedge enn)
    Dw <= 8'b00000000;
    @(posedge enp)
    IRQEN <= 1'b1;
    @(posedge enp)
    IRQEN <= 1'b0;

    //------------------------------------Test Sdo Complete IRQ-----------------------------------
    #1000

    //Enable IRQ.
    @(negedge enn)
    Dw <= 8'b00010000;
    @(posedge enp)
    IRQEN <= 1'b1;
    @(posedge enp)
    IRQEN <= 1'b0;
    @(negedge enn)
    Dw <= 8'b00000000;

    //Send an IRQ.
    #1000
    @(negedge enn)
    setSdoCompl <= 1'b1;
    @(negedge enn)
    setSdoCompl <= 1'b0;

    //Clear IRQ signal.
    #1000
    @(negedge enn)
    Dw <= 8'b00000000;
    @(posedge enp)
    IRQEN <= 1'b1;
    @(posedge enp)
    IRQEN <= 1'b0;

    //------------------------------------Test Sdi Complete IRQ-----------------------------------
    #1000

    //Enable IRQ.
    @(negedge enn)
    Dw <= 8'b00100000;
    @(posedge enp)
    IRQEN <= 1'b1;
    @(posedge enp)
    IRQEN <= 1'b0;
    @(negedge enn)
    Dw <= 8'b00000000;

    //Send an IRQ.
    #1000
    @(negedge enn)
    setSdiCompl <= 1'b1;
    @(negedge enn)
    setSdiCompl <= 1'b0;

    //Generate sdi overun.
    #1000
    @(negedge enn)
    setSdiCompl <= 1'b1;
    @(negedge enn)
    setSdiCompl <= 1'b0;

    //Clear IRQ signal.
    #1000
    @(negedge enn)
    Dw <= 8'b00000000;
    @(posedge enp)
    IRQEN <= 1'b1;
    @(posedge enp)
    IRQEN <= 1'b0;

    //----------------------------------------Test Key IRQ----------------------------------------
    #1000

    //Enable IRQ.
    @(negedge enn)
    Dw <= 8'b01000000;
    @(posedge enp)
    IRQEN <= 1'b1;
    @(posedge enp)
    IRQEN <= 1'b0;
    @(negedge enn)
    Dw <= 8'b00000000;

    //Send an IRQ.
    #1000
    @(negedge enn)
    setKey <= 1'b1;
    @(negedge enn)
    setKey <= 1'b0;

    //Generate key overun.
    #1000
    @(negedge enn)
    setKey <= 1'b1;
    @(negedge enn)
    setKey <= 1'b0;

    //Clear IRQ signal.
    #1000
    @(negedge enn)
    Dw <= 8'b00000000;
    @(posedge enp)
    IRQEN <= 1'b1;
    @(posedge enp)
    IRQEN <= 1'b0;

    //---------------------------------------Test Break IRQ---------------------------------------
    #1000

    //Enable IRQ.
    @(negedge enn)
    Dw <= 8'b10000000;
    @(posedge enp)
    IRQEN <= 1'b1;
    @(posedge enp)
    IRQEN <= 1'b0;
    @(negedge enn)
    Dw <= 8'b00000000;

    //Send an IRQ.
    #1000
    @(negedge enn)
    setBreak <= 1'b1;
    @(negedge enn)
    setBreak <= 1'b0;

    //Clear IRQ signal.
    #1000
    @(negedge enn)
    Dw <= 8'b00000000;
    @(posedge enp)
    IRQEN <= 1'b1;
    @(posedge enp)
    IRQEN <= 1'b0; 

    #10000
    $stop;
    //----------------------------------------------------------------------------------------------
    end
endmodule
