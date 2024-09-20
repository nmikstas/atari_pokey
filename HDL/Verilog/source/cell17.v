`timescale 1ns / 10ps

//**********************************************Cell 17*********************************************

module cell17
(
    input  enp,
    input  clk,
    input  Shift,
    input  Set,
    input  D,
    output reg Q 
);

    wire mux1, mux2;

    //Shift cell.
    assign mux2 = (Shift == 1'b1) ? D : Q;
    assign mux1 = (Set == 1'b1) ? 1'b1 : mux2;

    //Load new value after slow clock rises.
    always @(posedge clk) begin
        if(enp == 1'b1) begin
            Q <= mux1;
        end
    end
endmodule
