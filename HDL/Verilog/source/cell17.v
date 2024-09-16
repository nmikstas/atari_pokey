`timescale 1ns / 10ps

//**********************************************Cell 17*********************************************

module cell17
(
    input  enp,
    input  clk,
    input  Shift,
    input  Set,
    input  D,
    output Q 
);

    reg  Qint;
    wire mux1, mux2;

    //Always update the output.
    assign Q = Qint;

    //Shift cell.
    assign mux2 = (Shift == 1'b1) ? D : Qint;
    assign mux1 = (Set == 1'b1) ? 1'b1 : mux2;

    //Load new value after slow clock rises.
    always @(posedge clk) begin
        if(enp == 1'b1) begin
            Qint <= mux1;
        end
    end
endmodule
