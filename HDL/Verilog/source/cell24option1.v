`timescale 1ns / 10ps

//*****************************************Cell 24 Option 1*****************************************

module cell24option1
(
    input  enn,
    input  clk,
    input  D,
    input  WR,
    input  Ld,
    input  CR,
    input  nCR,
    output nBOR
);

    reg  nDout;
    reg  muxOut;
    reg  bt;
    wire nbt;
    wire [2:0]muxSel;

    //Capture incomming data bit.
    always @(negedge clk) begin
        if(enn == 1'b1) begin
            if(WR == 1'b1) begin
                nDout <= ~D;
            end

            bt <= muxOut;
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

    //Output.
    assign nBOR = Ld | nbt | nCR;
endmodule
