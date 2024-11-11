`timescale 1ns / 10ps

module tb;
    reg iKR1 = 1'b0;
    reg keyQ0 = 1'b0;
    reg keyQ1 = 1'b0;
    reg debComp = 1'b0;

    wire keyD0, keyD1, nLdComp, nLdKbus;

    KEY_PLA dut(iKR1, keyQ0, keyQ1, debComp, keyD0, keyD1, nLdComp, nLdKbus);

    initial begin
    
    #5 {debComp, keyQ1, keyQ0, iKR1} = 4'b0001;
    #5 {debComp, keyQ1, keyQ0, iKR1} = 4'b0010;
    #5 {debComp, keyQ1, keyQ0, iKR1} = 4'b0011;
    #5 {debComp, keyQ1, keyQ0, iKR1} = 4'b0100;
    #5 {debComp, keyQ1, keyQ0, iKR1} = 4'b0101;
    #5 {debComp, keyQ1, keyQ0, iKR1} = 4'b0110;
    #5 {debComp, keyQ1, keyQ0, iKR1} = 4'b0111;
    #5 {debComp, keyQ1, keyQ0, iKR1} = 4'b1000;
    #5 {debComp, keyQ1, keyQ0, iKR1} = 4'b1001;
    #5 {debComp, keyQ1, keyQ0, iKR1} = 4'b1010;
    #5 {debComp, keyQ1, keyQ0, iKR1} = 4'b1011;
    #5 {debComp, keyQ1, keyQ0, iKR1} = 4'b1100;
    #5 {debComp, keyQ1, keyQ0, iKR1} = 4'b1101;
    #5 {debComp, keyQ1, keyQ0, iKR1} = 4'b1110;
    #5 {debComp, keyQ1, keyQ0, iKR1} = 4'b1111;

    end
endmodule
