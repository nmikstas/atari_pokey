`timescale 1ns / 10ps

module tb_cell11;
    reg [3:0]V = 4'b0000;
    reg T = 1'b0;
    reg I = 1'b0;

    wire [3:0]O;

    cell11 dut(V, T, I, O);

    initial begin
    
    #5 V <= 4'b0110;
    #5 I <= 1'b1;
    #5 I <= 1'b0;
    #5 T <= 1'b1;
    #5 V <= 4'b1010;
    #5 V <= 4'b1011;


    end
endmodule
