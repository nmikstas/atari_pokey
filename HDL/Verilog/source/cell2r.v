`timescale 1ns / 10ps

//**********************************************Cell 2r*********************************************

module cell2r
(
    input  enn,
    input  clk,
    input  D,
    input  Ld,
    input  nLd,
    input  R,
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
    assign nor1 = ~muxOut;

    //Update stored data bit.
    always @(negedge clk) begin
        if(enn == 1'b1) begin
            nQ <= nor1;
        end
    end

    //Output and feedback.
    assign intQ = ~(R | nQ);
    assign Q    = intQ;

endmodule