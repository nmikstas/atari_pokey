`timescale 1ns / 10ps

//**********************************************Cell 20*********************************************

module cell20
(
    input  enn,
    input  clk,
    input  D,
    input  WR,
    input  Ld,
    input  CR,
    output BOR
);

    reg  nDout, bt, or1Q;
    wire muxOut;

    //Capture incomming data bit.
    always @(negedge clk) begin
        if(enn == 1'b1) begin
            if(WR == 1'b1) begin
                nDout <= ~D;
            end

            //Internal bits.
            bt   <= muxOut;
            or1Q <= ~Ld & bt & CR;
        end
    end

    //Mux to the input of the decrement flip-flop.
    assign muxOut = (Ld == 1'b1) ? nDout : (CR ^ bt);

    //Output.
    assign BOR = ~Ld & or1Q;    
endmodule
