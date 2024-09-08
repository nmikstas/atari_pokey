`timescale 1ns / 10ps

//**********************************************Cell 6**********************************************

module cell6
(
    input  enp,
    input  enn,
    input  clk,
    input  T2,
    input  R,
    output reg T1,
    output Q,
    output nQ
);
    reg  intQ;
    
    //Always update the outputs.
    assign Q  = intQ;
    assign nQ = ~intQ;

    //Update stored data bit.
    always @(posedge clk) begin
        if(enp == 1'b1) begin
            intQ <= ~(~(intQ ^ T2) | R);
        end
    end

    //Update output flip-flops.
    always @(negedge clk) begin
        if(enn == 1'b1) begin
            T1 <= T2 & ~intQ;
        end
    end
endmodule
