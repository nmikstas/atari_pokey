`timescale 1ns / 10ps

//**********************************************Cell 15*********************************************

module cell15
(
    input  enp,
    input  clk,
    input  Shift,
    input  Load,
    input  DIn,
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
    
        case(Load)
            1'b1:    mux1 = DIn;
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
