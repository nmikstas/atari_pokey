`timescale 1ns / 10ps

//**********************************************Cell 2pr********************************************

module cell2pr
(
    input  enn,
    input  clk,
    input  D,
    input  Ld,
    input  P,
    input  R,
    output Q
);

    wire muxOut, nor1;
    reg  nQ;

    //MUX output.
    assign muxOut = (Ld == 1'b1) ? D : Q;

    //NOR gate.
    assign nor1 = ~(muxOut | P);

    //Update stored data bit.
    always @(negedge clk) begin
        if(enn == 1'b1) begin
            nQ <= nor1;
        end
    end

    //Output.
    assign Q = ~(R | nQ);
endmodule
