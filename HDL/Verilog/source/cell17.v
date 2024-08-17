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

    reg Qint, mux1, mux2;

    //Always update the output.
    assign Q = Qint;

    //Shift cell.
    always @(*) begin
        case(Shift)
            1'b1:    mux2 = D;
            default: mux2 = Qint;
        endcase
    
        case(Set)
            1'b1:    mux1 = 1'b1;
            default: mux1 = mux2;
        endcase   
    end

    //Load new value after slow clock rises.
    always @(posedge clk) begin
        if(enp == 1'b1) begin
            Qint <= mux1;
        end
    end

endmodule
