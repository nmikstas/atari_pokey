`timescale 1ns / 10ps

//*********************************************Cell 23**********************************************

module cell23
(
    input  enp,
    input  clk,
    input  P,
    input  CR,
    output Q,
    output nQ,
    output BOR
);

    reg  Qout;
    wire Qint;

    //Assign output signals.
    assign Q   = Qint;
    assign nQ  = ~Qint;
    assign BOR = ~(~CR | Qint);

    //Assign internal signals.
    assign Qint = Qout | P;

    //Decrement flip-flop
    always@(posedge(clk)) begin
        if(enp == 1'b1) begin
            Qout <= CR ^ Qint;
        end
    end
endmodule
