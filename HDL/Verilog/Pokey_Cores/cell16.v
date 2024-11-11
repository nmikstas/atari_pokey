`timescale 1ns / 10ps

//**********************************************Cell 16*********************************************

module cell16
(
    input  enp,
    input  clk,
    input  Shift,
    input  R,
    input  D,
    output Q 
);

    wire mux1, mux2;
    reg  Qint;

    //Always update the output.
    assign Q = Qint;

    //Shift cell.
    assign mux2 = (Shift == 1'b1) ? D : Qint;
    assign mux1 = (R == 1'b1) ? 1'b0 : mux2;
    
    //Load new value after slow clock rises.
    always @(posedge clk) begin
        if(enp == 1'b1) begin
            Qint <= mux1;
        end
    end

endmodule
