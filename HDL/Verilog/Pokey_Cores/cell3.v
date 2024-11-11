`timescale 1ns / 10ps

//**********************************************Cell 3**********************************************

module cell3
(
    input  enp,
    input  enn,
    input  clk,
    input  T1,
    input  R,
    output reg T2,
    output Q,
    output nQ
);
    reg  intQ;

    //Always update the outputs.    
    assign Q  = intQ;
    assign nQ = ~intQ;

    //Update stored data bit.
    always @(negedge clk) begin
        if(enn == 1'b1) begin
            intQ <= ~(~(intQ ^ T1) | R);
        end
    end

    //Update output flip-flops.
    always @(posedge clk) begin
        if(enp == 1'b1) begin
            T2 <= T1 & ~intQ;
        end
    end
endmodule
