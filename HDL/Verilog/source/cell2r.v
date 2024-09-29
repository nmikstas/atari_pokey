`timescale 1ns / 10ps

//**********************************************Cell 2r*********************************************

module cell2r
(
    input  enn,
    input  clk,
    input  D,
    input  Ld,
    input  R,
    output Q
);

    wire muxOut;
    reg  nQ;
    
    //MUX output.
    assign muxOut = (Ld == 1'b1) ? D : Q;

    //Update stored data bit.
    always @(negedge clk) begin
        if(enn == 1'b1) begin
            nQ <= muxOut;
        end
    end

    //Output and feedback.
    assign Q = ~(R | ~nQ);
endmodule
