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

    reg Qint = 1'b0;
    reg mux1;

    //Always update the output.
    assign Q = Qint;
    
    //Shift cell.
    always @(*) begin     
        case(Shift)
            1'b1:    mux1 = D;
            default: mux1 = Qint;
        endcase
    end

    //Load new value after slow clock rises.
    always @(posedge clk) begin
        if(enp == 1'b1) begin
            Qint <= mux1;
        end
    end

endmodule
