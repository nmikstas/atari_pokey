`timescale 1ns / 1ns

//******************************************** SERIN PLA *******************************************

module SERIN_PLA
(
    input  sdiStopBit,
    input  sdinStartBit,
    input  sdiQ1,
    output sdiBusy,
    output nFramer,
    output sdiCompl,
    output sdiD1,
    output preSdiSet,
    output noSdiErr
);

    wire m1, m2, m3, m4, m5;

    assign m1 = ~(sdiStopBit | ~sdiQ1);
    assign m2 = ~(sdinStartBit | sdiQ1);
    assign m3 = ~(~sdiStopBit | ~sdinStartBit | sdiQ1);
    assign m4 = ~(sdiStopBit | ~sdinStartBit | sdiQ1);
    assign m5 = ~(~sdiQ1 | ~sdiStopBit); 

    assign sdiBusy   = ~sdiQ1;
    assign nFramer   = ~m4;
    assign sdiCompl  = ~(m4 | m3);
    assign sdiD1     = ~(m2 | m1);
    assign preSdiSet = ~m1;
    assign noSdiErr  = ~(m3 | m5);

endmodule
