`timescale 1ns / 10ps

//**********************************************POT_core********************************************

module POT_core
(
    input  enn,
    input  enp,
    input  clk,
    input  POTGO,
    input  fastScan,
    input  keybClk,
    input  [7:0]p,
    output reg dump,
    output reg [7:0]POT0,
    output reg [7:0]POT1,
    output reg [7:0]POT2,
    output reg [7:0]POT3,
    output reg [7:0]POT4,
    output reg [7:0]POT5,
    output reg [7:0]POT6,
    output reg [7:0]POT7,
    output reg [7:0]ALLPOT
);

    //clock register.
    reg nPotClk;

    //Lower decrement counter signals.
    reg  nor1   = 1'b1;
    reg  delay1 = 1'b0; //Setting these to known values will eliminate
    reg  delay2 = 1'b0; //the need for a junk write when starting in
    reg  nor4   = 1'b0; //fast scan mode.
    wire potPreset;
    
    //Pot load signals.
    reg  [7:0]nQp;
    wire [7:0]Ld;
    
    //Decrement counter signals.
    wire [7:0]Q;
    wire [7:0]nQ;
    wire [2:0]CR_BOR1;
    wire [2:0]CR_BOR2;

    wire bor;
    wire count;

    //----------- Decrement Counter Lower Nibble ----------
    cell23 b0(enp, clk, potPreset, ~nPotClk,   Q[0], nQ[0], CR_BOR1[0]);
    cell23 b1(enp, clk, potPreset, CR_BOR1[0], Q[1], nQ[1], CR_BOR1[1]);
    cell23 b2(enp, clk, potPreset, CR_BOR1[1], Q[2], nQ[2], CR_BOR1[2]);
    cell23 b3(.enp(enp), .clk(clk), .P(potPreset), .CR(CR_BOR1[2]), .Q(Q[3]), .nQ(nQ[3]), .BOR());

    //Carry/borrow signal.
    assign bor = ~(nPotClk | Q[0] | Q[1] | Q[2] | Q[3]);

    //---------- Decrement Counter Upper Nibble ----------
    cell23 b4(enp, clk, potPreset, bor,        Q[4], nQ[4], CR_BOR2[0]);
    cell23 b5(enp, clk, potPreset, CR_BOR2[0], Q[5], nQ[5], CR_BOR2[1]);
    cell23 b6(enp, clk, potPreset, CR_BOR2[1], Q[6], nQ[6], CR_BOR2[2]);
    cell23 b7(.enp(enp), .clk(clk), .P(potPreset), .CR(CR_BOR2[2]), .Q(Q[7]), .nQ(nQ[7]), .BOR());

    //Count complete signal.
    assign count = ~(~Q[0] | ~Q[1] | Q[2] | ~Q[3] | ~Q[4] | Q[5] | Q[6] | Q[7]);

    //Preset counter signal.
    assign potPreset = ~nor1;

    //---------- Pot load signals ----------
    assign Ld[0] = ~(nQp[0] | nor4);
    assign Ld[1] = ~(nQp[1] | nor4);
    assign Ld[2] = ~(nQp[2] | nor4);
    assign Ld[3] = ~(nQp[3] | nor4);
    assign Ld[4] = ~(nQp[4] | nor4);
    assign Ld[5] = ~(nQp[5] | nor4);
    assign Ld[6] = ~(nQp[6] | nor4);
    assign Ld[7] = ~(nQp[7] | nor4);

    always@(posedge(clk)) begin
        if(enp == 1'b1) begin
            //Clock flip-flop.
            nPotClk <= ~(~keybClk | fastScan);
        
             //Dump latch.
             nor4 <= ~(delay2 | ~(count | nor4));

             //Dump transistor signal.
             dump <= ~(~nor4 | fastScan);
        
            //Enable in flip-flop.
            nQp <= ~p;
        end
    end

    always@(negedge(clk)) begin
        if(enn == 1'b1) begin
            //POTGO latch.
            nor1 <= ~(POTGO | ~(delay2 | nor1));

            //POTGO delay line.
            delay1 <= potPreset;
            delay2 <= delay1;
      
            //Potentiometer count and status registers.
            if(Ld[0] == 1'b1) begin
                POT0 <= nQ;
            end
            if(Ld[1] == 1'b1) begin
                POT1 <= nQ;
            end
            if(Ld[2] == 1'b1) begin
                POT2 <= nQ;
            end
            if(Ld[3] == 1'b1) begin
                POT3 <= nQ;
            end
            if(Ld[4] == 1'b1) begin
                POT4 <= nQ;
            end
            if(Ld[5] == 1'b1) begin
                POT5 <= nQ;
            end
            if(Ld[6] == 1'b1) begin
                POT6 <= nQ;
            end
            if(Ld[7] == 1'b1) begin
                POT7 <= nQ;
            end
        
            ALLPOT <= Ld;
        end
    end
endmodule
