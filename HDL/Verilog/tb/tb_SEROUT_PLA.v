`timescale 1 ns/1 ns

module tb;
    reg sdoQ1 = 1'b0;
    reg sdoDloaded = 1'b0;
    reg sdoEmpty = 1'b0;

    wire sdoFinish, sdoD1, sdonShiftEn, preSdoLoad;

    SEROUT_PLA dut(sdoQ1, sdoDloaded, sdoEmpty, sdoFinish, sdoD1, sdonShiftEn, preSdoLoad);

    initial begin
    
    #5 {sdoQ1, sdoDloaded, sdoEmpty} = 3'b001;
    #5 {sdoQ1, sdoDloaded, sdoEmpty} = 3'b010;
    #5 {sdoQ1, sdoDloaded, sdoEmpty} = 3'b011;
    #5 {sdoQ1, sdoDloaded, sdoEmpty} = 3'b100;
    #5 {sdoQ1, sdoDloaded, sdoEmpty} = 3'b101;
    #5 {sdoQ1, sdoDloaded, sdoEmpty} = 3'b110;
    #5 {sdoQ1, sdoDloaded, sdoEmpty} = 3'b111;

    end
endmodule
