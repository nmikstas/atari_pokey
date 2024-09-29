`timescale 1ns / 10ps

//******************************************AUDCTL Register*****************************************

module AUDCTL_reg
(
    input  enn,
    input  clk,
    input  wren,
    input  [7:0]D,
    output reg sel15Khz,
    output reg disHiFltr2,
    output reg disHiFltr1,
    output reg ch4Bits16,
    output reg ch2Bits16,
    output reg enFastClk3,
    output reg enFastClk1,
    output reg sel9bitPoly
);

    always @(negedge clk) begin
        if(enn == 1'b1) begin
            if(wren == 1'b1) begin
                sel15Khz    <=  D[0];
                disHiFltr2  <= ~D[1];
                disHiFltr1  <= ~D[2];
                ch4Bits16   <=  D[3];
                ch2Bits16   <=  D[4];
                enFastClk3  <=  D[5];
                enFastClk1  <=  D[6];
                sel9bitPoly <=  D[7];
            end
        end
    end
endmodule
