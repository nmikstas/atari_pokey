`timescale 1 ns/1 ns

module tb;
    reg sdiStopBit   = 1'b0;
    reg sdinStartBit = 1'b0;
    reg sdiQ1        = 1'b0;

    wire sdiBusy;
    wire nFramer;
    wire sdiCompl;
    wire sdiD1;
    wire preSdiSet;
    wire noSdiErr;

    SERIN_PLA dut(.sdiStopBit(sdiStopBit), .sdinStartBit(sdinStartBit), .sdiQ1(sdiQ1), .sdiBusy(sdiBusy),
              .nFramer(nFramer), .sdiCompl(sdiCompl), .sdiD1(sdiD1), .preSdiSet(preSdiSet), .noSdiErr(noSdiErr));

    initial begin
    
    #5 {sdiQ1, sdiStopBit, sdinStartBit} = 3'b001;
    #5 {sdiQ1, sdiStopBit, sdinStartBit} = 3'b010;
    #5 {sdiQ1, sdiStopBit, sdinStartBit} = 3'b011;
    #5 {sdiQ1, sdiStopBit, sdinStartBit} = 3'b100;
    #5 {sdiQ1, sdiStopBit, sdinStartBit} = 3'b101;
    #5 {sdiQ1, sdiStopBit, sdinStartBit} = 3'b110;
    #5 {sdiQ1, sdiStopBit, sdinStartBit} = 3'b111;

    end
endmodule
