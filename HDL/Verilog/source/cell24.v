`timescale 1ns / 10ps

//**********************************************Cell 24*********************************************

module cell24
(
    input  enn,
    input  clk,
    input  D,
    input  WR,
    input  Ld,
    input  CR,
    output BOR
);

    reg  nDout, bt;
    wire muxOut;

    //Capture incomming data bit.
    always @(negedge clk) begin
        if(enn == 1'b1) begin
            if(WR == 1'b1) begin
                nDout <= ~D;
            end

            //Capture internal bata bit.
            bt <= muxOut;
        end
    end

    //Mux to the input of the decrement flip-flop.
    assign muxOut = (Ld == 1'b1) ? nDout : (CR ^ bt);

    //Output.
    assign BOR = ~Ld & bt & CR;
endmodule
