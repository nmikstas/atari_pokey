`timescale 1ns / 10ps

//*******************************************Audio Control******************************************

module aud_control
(
    input  enn,
    input  clk,
    input  [7:0]D,
    input  AUDC,
    input  poly4In,
    input  poly5In,
    input  poly17In,
    input  Timer,
    input  rstAudPhase,
    output [3:0]AUD,
    output reg poly4Out,
    output reg poly5Out,
    output reg poly17Out
);

    //control signals.
    reg  [7:0]data;
    wire [2:0]ctrl;
    wire [3:0]V;
    wire T;

    //Sound DAC signals.
    reg I;

    //Poly5 flip-flop signal.
    wire Qpoly5;

    //MUX signal.
    wire muxOut;

    //Combinational logic signals.
    wire nor1, nor2, nor3, nor5, and1;
    reg  nor4;

    //Sequential logic signals.
    reg nQnor1;

    //Sound DAC.
    cell11 c11(V, T, I, AUD);

    //Poly5 flip-flop.
    cell2r c2r(enn, clk, poly5In, Timer, ctrl[2], Qpoly5);

    //Distribute the written data to the proper control signals.
    assign ctrl = data[7:5];
    assign T    = data[4];
    assign V    = ~data[3:0];

    //Update the combinational signals.
    assign and1 = I & ctrl[0];
    assign nor1 = ~(Qpoly5 | ~Timer);
    assign nor2 = ~(ctrl[0] | muxOut);
    assign nor3 = ~(and1 | nQnor1 | nor2);
    assign nor5 = ~(nor3 | nor4 | rstAudPhase);

    //Always update the MUX.
    assign muxOut = (ctrl[1] == 1'b1) ? poly4In : poly17In;

    always @(negedge clk) begin
        if(enn == 1'b1) begin
            //Polynomial delay lines.
            poly4Out  <= poly4In;
            poly5Out  <= poly5In;
            poly17Out <= poly17In;

            //Lock in write data.
            if(AUDC == 1'b1) begin
                data <= D;
            end

            //Update the sequential signals.
            nQnor1 <= ~nor1;
            I      <= ~nor5;
            nor4   <= ~(nor1 | nor5);
        end
    end
endmodule
