`timescale 1ns / 1ns

//******************************************Polynomial Core*****************************************

module poly_core
(
    input  enn,
    input  clk,
    input  Init,
    input  sel9bitPoly,
    output [7:0]rndNum,
    output poly4bit,
    output poly5bit,
    output poly917bit
);
    //Main delay lines of the polynomials.
    reg [2:0]lfsr4bit;
    reg [3:0]lfsr5bit;
    reg [7:0]lfsr9bit;
    reg [7:0]lfsr17bit;

    //MSBs of the 4 and 5 bit polynomials.
    wire lfsr5msb;
    reg  lfsr4msb;
    
    //Outputs of the polynoimial feedbacks.
    wire feedback4, feedback5, feedback917;
    reg  nfeedback4, nfeedback5;

    //9/17 polynomial switching structure.
    reg  swDelay;          //1 clock delay on 9 to 17 bit switch.
    wire [2:0]nors;        //3 nors in 9/17 poly structure.
    reg  [2:0]norsDelayed; //Delayed output of 3 nors.
    wire swOut;            //Output of 9/17 poly switch.

    //Counting integer
    integer i;

    always @(negedge clk) begin
        if(enn == 1'b1) begin

            //****************************9/17 Bit Polynomial Structure*****************************

            //Update the 9-bit polynomial delay line.
            for(i = 6; i >= 0; i = i - 1) begin
                lfsr9bit[i] <= lfsr9bit[i + 1];
            end

            lfsr9bit[7] <= swOut;

            //Update the 17-bit polynomial delay line.
            for(i = 6; i >= 0; i = i - 1) begin
                lfsr17bit[i] <= lfsr17bit[i + 1];
            end

            lfsr17bit[7] <= feedback917;
 
            //Middle nor gate.
            swDelay <= sel9bitPoly;

            //9/17 bit polynomial switch delay.
            norsDelayed <= nors;

            //******************************5 Bit Polynomial Structure******************************

            nfeedback5 <= ~feedback5;

            //Update the 5-bit polynomial delay line.
            for(i = 2; i >= 0; i = i - 1) begin
                lfsr5bit[i] <= lfsr5bit[i + 1];
            end

            lfsr5bit[3] <= lfsr5msb;
        
            //*******************************4 Bit Polynomial Structure******************************

            //---CODE THAT MATCHES THE HARDWARE SCHEMATIC---
            lfsr4msb <= ~(~feedback4 | Init);
            //----------------------------------------------

            //--------CODE THAT MATCHES MAME OUTOUT---------
            //nfeedback4 <= ~feedback4;
            //----------------------------------------------
        
             //Update the 4-bit polynomial delay line.
            for(i = 1; i >= 0; i = i - 1) begin
                lfsr4bit[i] <= lfsr4bit[i + 1];
            end
 
            lfsr4bit[2] <= lfsr4msb;
        end
    end

    //********************************9/17 Bit Polynomial Structure*********************************

    //Assign random number out.
    assign rndNum = ~lfsr9bit;

    //Assign 9/17 bit polynomial feedback.
    assign feedback917 = ~(~lfsr9bit[5] ^ ~lfsr9bit[0]);

    //Assign 9/17 bit polynomial bit out.
    assign poly917bit = lfsr9bit[0];

    //Top nor gate.
    assign nors[0] = ~(lfsr17bit[0] | sel9bitPoly);

    assign nors[1] = ~(swDelay | ~sel9bitPoly);

    //Bottom nor gate.
    assign nors[2] = ~(~sel9bitPoly | feedback917);

    //Assign switch output.
    assign swOut = ~(Init | norsDelayed[0] | norsDelayed[1] | norsDelayed[2]);

    //**********************************5 Bit Polynomial Structure**********************************

    //Update the output bit.
    assign poly5bit = ~lfsr5bit[0];

    //Update the feeback.
    assign feedback5 = ~(lfsr5bit[0] ^ lfsr5bit[2]);

    assign lfsr5msb = ~(nfeedback5 | Init);

    //***********************************4 Bit Polynomial Structure**********************************

    //Update the output bit.
    assign poly4bit = lfsr4bit[0];

    //Update the feeback.
    assign feedback4 = ~(lfsr4bit[0] ^ lfsr4bit[1]);

    //--------CODE THAT MATCHES MAME OUTOUT---------
    //assign lfsr4msb = ~(nfeedback4 | Init);
    //----------------------------------------------

endmodule
