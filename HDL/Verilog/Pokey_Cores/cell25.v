`timescale 1ns / 10ps

//********************************************* Cell 25 ********************************************

module cell25
(
    input  enp,
    input  clk,
    input  Shift,
    input  D,
    output reg Q 
);

    wire mux1;
    
    //Shift cell.
    assign mux1 = (Shift == 1'b1) ? D : Q;

    //Load new value after slow clock rises.
    always @(posedge clk) begin
        if(enp == 1'b1) begin
            Q <= mux1;
        end
    end
endmodule
