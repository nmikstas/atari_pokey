`timescale 1ns / 10ps

//**********************************************Cell 2p*********************************************

module cell2p
(
    input  enn,
    input  clk,
    input  D,
    input  Ld,
    input  P,
    output Q
);

    wire muxOut;
    wire or1;
    reg  intQ;

    //MUX output.
    assign muxOut = (Ld == 1'b1) ? D : intQ;

    //OR gate.
    assign or1 = muxOut | P;

    //Update stored data bit.
    always @(negedge clk) begin
        if(enn == 1'b1) begin
            intQ <= or1;
        end
    end

    //Output.
    assign Q = intQ;
endmodule
