`timescale 1ns / 1ns

//******************************************* SEROUT PLA *******************************************

module SEROUT_PLA
(
    input  sdoQ1,
    input  sdoDloaded,
    input  sdoEmpty,
    output sdoFinish,
    output sdoD1,
    output sdonShiftEn,
    output preSdoLoad
);

    wire m1, m2, m3;

    assign m1 = ~(~sdoQ1 | sdoDloaded);
    assign m2 = ~(sdoQ1 | ~sdoEmpty);
    assign m3 = ~(sdoDloaded | sdoEmpty);

    assign sdoFinish   = ~sdoQ1;
    assign sdoD1       = ~(m1 | m2 | m3);
    assign sdonShiftEn = ~m2;
    assign preSdoLoad  = ~(m1 | m3);
    
endmodule
