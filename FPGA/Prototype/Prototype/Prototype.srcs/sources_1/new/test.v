`timescale 1ns / 1ps

//**********************************************IO Core*********************************************

module test
(
    input  clk,
    input  clk179,
    input  RW,
    input  [1:0]CS,
    input  [3:0]A,
   
    output readEn, 
    output Addr0w,
    output Addr1w,
    output Addr2w,
    output Addr3w,
    output Addr4w,
    output Addr5w,
    output Addr6w,
    output Addr7w,
    output Addr8w,
    output Addr9w,
    output AddrAw,
    output AddrBw,
    output AddrDw,
    output AddrEw,
    output AddrFw
);


    reg [3:0]AQ;
    reg [3:0]Aint;
    reg writeEn2;
    wire nwriteEn;
    
    wire clk60;
    wire clk200;
    
    reg Qprep  = 1'b0;
    reg Qpren  = 1'b0;
    reg Qedgp  = 1'b0;
    reg Qedgn  = 1'b0;
    wire enp, enn;
    
    clk_wiz_0 c0(clk60, clk200, clk);
    
    //Positive edge detector.
    always @(posedge clk60) begin
        Qprep  <= clk179; //Protect against metastability.
        Qedgp  <= Qprep;
    end

    //Negative edge detector.
    always @(negedge clk60) begin
        Qpren  <= clk179; //Protect against metastability.
        Qedgn  <= Qpren;
    end

    //Generate positive and negative edge pulses for slow clock.
    assign enp =  Qprep & ~Qedgp;
    assign enn = ~Qpren &  Qedgn;

    //Retime address inputs.
    always @(posedge clk179) begin
        Aint <= A;
    end

    assign readEn   = RW & ~CS[0] & CS[1];
    assign nwriteEn = RW | CS[0] | ~CS[1];

    
    assign Addr0w = ~(writeEn2 |  AQ[0] |  AQ[1] |  AQ[2] |  AQ[3]);
    assign Addr1w = ~(writeEn2 | ~AQ[0] |  AQ[1] |  AQ[2] |  AQ[3]);
    assign Addr2w = ~(writeEn2 |  AQ[0] | ~AQ[1] |  AQ[2] |  AQ[3]);
    assign Addr3w = ~(writeEn2 | ~AQ[0] | ~AQ[1] |  AQ[2] |  AQ[3]);
    assign Addr4w = ~(writeEn2 |  AQ[0] |  AQ[1] | ~AQ[2] |  AQ[3]);
    assign Addr5w = ~(writeEn2 | ~AQ[0] |  AQ[1] | ~AQ[2] |  AQ[3]);
    assign Addr6w = ~(writeEn2 |  AQ[0] | ~AQ[1] | ~AQ[2] |  AQ[3]);
    assign Addr7w = ~(writeEn2 | ~AQ[0] | ~AQ[1] | ~AQ[2] |  AQ[3]);
    assign Addr8w = ~(writeEn2 |  AQ[0] |  AQ[1] |  AQ[2] | ~AQ[3]);
    assign Addr9w = ~(writeEn2 | ~AQ[0] |  AQ[1] |  AQ[2] | ~AQ[3]);
    assign AddrAw = ~(writeEn2 |  AQ[0] | ~AQ[1] |  AQ[2] | ~AQ[3]);
    assign AddrBw = ~(writeEn2 | ~AQ[0] | ~AQ[1] |  AQ[2] | ~AQ[3]);
    assign AddrDw = ~(writeEn2 | ~AQ[0] |  AQ[1] | ~AQ[2] | ~AQ[3]);
    assign AddrEw = ~(writeEn2 |  AQ[0] | ~AQ[1] | ~AQ[2] | ~AQ[3]);
    assign AddrFw = ~(writeEn2 | ~AQ[0] | ~AQ[1] | ~AQ[2] | ~AQ[3]);

    always @(posedge clk60) begin
        if(enp == 1'b1) begin
            
            //Always lock in the address.
            if(nwriteEn == 1'b0) begin
                AQ <= Aint;
            end
       
            writeEn2 <= nwriteEn;
    
        end
    end
endmodule

