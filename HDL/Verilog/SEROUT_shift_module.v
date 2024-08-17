`timescale 1ns / 10ps

//****************************************SEROUT_shift_module***************************************

module SEROUT_shift_module
(
    input  enp,
    input  enn,
    input  clk,
    input  [7:0]D,
    input  AddrDw,
    input  Load,
    input  Shift,
    output Empty,
    output reg DshiftOut
);

    reg  [7:0]QD;
    wire [9:1]Qout;
    reg  shiftOut;

    cell16 s0(enp, clk, Shift, Load, Qout[1], shiftOut);       //Start bit 0.
    cell15 s1(enp, clk, Shift, Load, QD[0], Qout[2], Qout[1]); //Data bit 1.
    cell15 s2(enp, clk, Shift, Load, QD[1], Qout[3], Qout[2]); //Data bit 2.
    cell15 s3(enp, clk, Shift, Load, QD[2], Qout[4], Qout[3]); //Data bit 3.
    cell15 s4(enp, clk, Shift, Load, QD[3], Qout[5], Qout[4]); //Data bit 4.
    cell15 s5(enp, clk, Shift, Load, QD[4], Qout[6], Qout[5]); //Data bit 5.
    cell15 s6(enp, clk, Shift, Load, QD[5], Qout[7], Qout[6]); //Data bit 6.
    cell15 s7(enp, clk, Shift, Load, QD[6], Qout[8], Qout[7]); //Data bit 7.
    cell15 s8(enp, clk, Shift, Load, QD[7], Qout[9], Qout[8]); //Data bit 8.
    cell17 s9(enp, clk, Shift, Load, 1'b0, Qout[9]);           //Stop bit 9.

    //Update the "empty" signal.
    assign Empty = ~(Qout[9] | Qout[8] | Qout[7] | Qout[6] | Qout[5] | Qout[4] | Qout[3] | Qout[2] | Qout[1]);

    always @(negedge clk) begin
        if(enn == 1'b1) begin
            DshiftOut <= ~shiftOut;

            if(AddrDw == 1'b1) begin
                QD <= D;
            end
        end
    end

endmodule
