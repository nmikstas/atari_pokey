`timescale 1ns / 10ps

//********************************************* Cell 25 ********************************************

module cell25
(
    input  enp,
    input  clk,
    input  Shift,
    input  D,
    output Q 
);

    reg  Qint = 1'b0;
    wire mux1;

    //Always update the output.
    assign Q = Qint;
    
    //Shift cell.
    assign mux1 = (Shift == 1'b1) ? D : Qint;

    //Load new value after slow clock rises.
    always @(posedge clk) begin
        if(enp == 1'b1) begin
            Qint <= mux1;
        end
    end
endmodule
