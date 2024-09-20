`timescale 1ns / 10ps

//******************************************SKSTAT Register*****************************************

module SKSTAT_reg
(
    input  enn,
    input  clk,
    input  sdiOvrun,
    input  keyOvrun,
    input  setFramer,
    input  kShift,
    input  keyDown,
    input  sdiBusy,
    input  siDelay,
    input  addrAw,
    output [7:0]Dout
);

    reg  qnor3, qnor4, qnor5;
    reg  qnor1 = 1'b1; //Need these to allow write strobe to clear outputs.
    reg  nor2  = 1'b1;
    wire nor1, nor3, nor4, nor5, reset, frameOut, keyOut, sdiOut;
    
    //Reset circuit.
    assign nor1  = ~(reset | addrAw);
    assign reset = ~(nor1 | nor2);

    //Output circuits.
    assign nor3 = ~(sdiOvrun  | sdiOut);
    assign nor4 = ~(keyOvrun  | keyOut);
    assign nor5 = ~(setFramer | frameOut);

    assign sdiOut   = ~(qnor3 | reset);
    assign keyOut   = ~(qnor4 | reset);
    assign frameOut = ~(qnor5 | reset);

    assign Dout[7] = ~frameOut;
    assign Dout[6] = ~keyOut;
    assign Dout[5] = ~sdiOut;
    assign Dout[4] = ~siDelay;
    assign Dout[3] = ~kShift;
    assign Dout[2] = ~keyDown;
    assign Dout[1] = ~sdiBusy;
    assign Dout[0] = 1'b1;

    always @(negedge clk) begin
        if(enn == 1'b1) begin
            qnor1 <= nor1;
            nor2 <= ~qnor1;
            qnor3 <= nor3;
            qnor4 <= nor4;
            qnor5 <= nor5;
        end
    end
endmodule
