`timescale 1ns / 10ps

//**********************************************Cell 20*********************************************

module cell20
(
    input  enn,
    input  clk,
    input  D,
    input  WR,
    input  Ld,
    input  CR,
    input  nCR,
    output BOR,
    output nBOR
);

    reg  nDout;
    reg  muxOut;
    reg  bt;
    wire nbt;
    wire nor1;
    reg nor1Q;
    wire nor2;
    wire [2:0]muxSel;

    //Capture incomming data bit.
    always @(negedge clk) begin
        if(enn == 1'b1) begin
            if(WR == 1'b1) begin
                nDout <= ~D;
            end

            bt <= muxOut;
            nor1Q <= nor1; //Second NOR gate.
        end
    end

    //Mux to the input of the decrement flip-flop.
    assign muxSel = {Ld, CR, nCR};

    always @(*) begin
        case(muxSel)
            3'b010:  muxOut = nbt;
            3'b001:  muxOut = bt;
            default: muxOut = nDout;
        endcase
    end

    //Decrement flip-flop.
    assign nbt = ~bt;

    //First NOR gate.
    assign nor1 = ~(Ld | nbt | nCR);

    assign nor2 = ~(Ld | nor1Q);

    //Outputs.
    assign BOR = ~(Ld | nor2);
    assign nBOR = nor2;
    
endmodule
