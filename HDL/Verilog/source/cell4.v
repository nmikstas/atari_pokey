`timescale 1ns / 10ps

//**********************************************Cell 4**********************************************

module cell4
(
    input  enp,
    input  clk,
    input  D,
    input  Ld,
    output reg Q,
    output C
);

    wire en;
    reg  nQ;
       
    //Flip-flop bit compare storage.
    always @(posedge clk) begin
        if(enp == 1'b1) begin
            if(Ld == 1'b1) begin
                Q  <= D;
                nQ <= ~D;
            end
        end
    end

    //Output compare bit.
    assign C = ~(nQ ^ D);
endmodule
