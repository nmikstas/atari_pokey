`timescale 1ns / 10ps

//**********************************************Cell 2p*********************************************

module cell2p
(
    input  enn,
    input  clk,
    input  D,
    input  Ld,
    input  nLd,
    input  P,
    output Q
);

    reg  muxOut;
    wire nor1;
    reg  nQ;
    wire intQ;
    wire [1:0]muxSel;

    //MUX output.
    assign muxSel = {Ld, nLd};

    always @(*) begin
        case(muxSel)
            2'b01:   muxOut = intQ;
            default: muxOut = D;
        endcase
    end

    //NOR gate.
    assign nor1 = ~(muxOut | P);

    //Update stored data bit.
    always @(negedge clk) begin
        if(enn == 1'b1) begin
            nQ <= nor1;
        end
    end

    //Output and feedback.
    assign intQ = ~nQ;
    assign Q    = intQ;

endmodule
