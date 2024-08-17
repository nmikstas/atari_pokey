`timescale 1ns / 1ns

//***************************************Clock Generator Core***************************************

module clock_gen_core
(
    input  enn,
    input  clk,
    input  init,
    input  sel15Khz,
    output audClock,
    output keybClk
);

    wire khz64; //64 KHz clock.
    wire hsync; //15 KHz clock.
    reg  clkMuxOut;
    reg  dClk;

    //15KHz LFSR structure.
    reg  lfsr15k0;
    wire lfsr15k0Out;
    reg  [6:1]lfsr15k;
    wire lfsr15kIn;
    wire nor15k;
    wire feedback15k;
    reg  d15k;

    //64KHz LFSR structure.
    reg  [4:0]lfsr64k;
    wire lfsr64kIn;
    wire nor64k;
    wire feedback64k;
    reg  d64k;

    //Counting integer.
    integer i;

    always @(negedge clk) begin
        if(enn == 1'b1) begin

        //***********************************15KHz LFSR Structure***********************************

        //Bit 0 of the shift register.    
        lfsr15k0 <= ~(feedback15k | nor15k);

        //Bit 0 of the shift register.
        lfsr15k0 <= ~(feedback15k | nor15k);
        
        //Bit 1 of the shift register.
        lfsr15k[1] <= lfsr15k0Out;
        
        //Remaining 5 bits of the shift register.
        for(i = 6; i >= 2; i = i - 1) begin
            lfsr15k[i] <= lfsr15k[i - 1];
        end

        //Output flip flop.
        d15k <= nor15k;
        


        //***********************************64KHz LFSR Structure***********************************

        //Bit 0 of the shift register.
        //Note: Init signal is tied to phase 2 of the clock so it is not asynchronous.
        lfsr64k[0] <= lfsr64kIn;

        //Remaining 4 bits of the shift register.
        for(i = 1; i <= 4; i = i + 1) begin
            lfsr64k[i] <= lfsr64k[i - 1];
        end

        //Output flip flop.
        d64k <= nor64k;
        
        //***************************************Output Logic***************************************

        //Output clock flip-flop;
        dClk <= clkMuxOut;
        


        end
    end

    //*************************************15KHz LFSR Structure*************************************

    //Output of bit 0.
    assign lfsr15k0Out = ~(lfsr15k0 | init);

    //NORed shift register values.
    assign nor15k = ~(~lfsr15k0Out | lfsr15k[1] | lfsr15k[2] | ~lfsr15k[3] | lfsr15k[4] |
        lfsr15k[5] | ~lfsr15k[6]);

    //XNOR feedback.
    assign feedback15k = ~(lfsr15k[6] ^ lfsr15k[5]);


    //*************************************64KHz LFSR Structure*************************************

    //Input to the shift register.
    assign lfsr64kIn = init | feedback64k | nor64k;

    //NORed shift register values.
    assign nor64k = ~(lfsr64k[0] | ~lfsr64k[1] | lfsr64k[2] | lfsr64k[3] | lfsr64k[4]);

    //XOR feedback.
    assign feedback64k = lfsr64k[2] ^ lfsr64k[4];

    //*****************************************Output Logic*****************************************

    //Tie the output of the two clocks to the frequency select MUX.
    assign khz64 = d64k;
    assign hsync = d15k;

    //Frequency select MUX. Select audio frequency of 64KHz or 15KHz.
    always @(*) begin 
        case(sel15Khz)
            1'b0:    clkMuxOut = khz64;    
            default: clkMuxOut = hsync; 
        endcase
    end

     //Connect the internal signals to the outputs.
     assign keybClk  = ~hsync;
     assign audClock = dClk;

endmodule
