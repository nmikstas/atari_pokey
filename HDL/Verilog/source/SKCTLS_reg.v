`timescale 1ns / 10ps

//******************************************SKCTLS Register*****************************************

module SKCTLS_reg
(
    input  enn,
    input  clk,
    input  wren,
    input  [7:0]D,
    output reg [7:0]SKCTLS,
    output init
);

    assign init = ~(SKCTLS[0] | SKCTLS[1]);

    always @(negedge clk) begin
        if(enn == 1'b1) begin
            if(wren == 1'b1) begin
                SKCTLS <= D;
            end
        end
    end
endmodule
