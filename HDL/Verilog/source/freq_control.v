`timescale 1ns / 10ps

//*****************************************Frequency Control****************************************

module freq_control
(
    input enn,
    input enp,
    input clk,
    input audClock,
    input [7:0]D,
    input Addr0w,
    input Addr2w,
    input Addr4w,
    input Addr6w,
    input Addr9w,
    input enFastClk1,
    input enFastClk3,
    input ch2Bits16,
    input ch4Bits16,
    input resyncTwoTones,
    input resyncSerClk,
    output [4:1]Timer,
    output rstAudPhase
);

    //Multi-bit signals.
    reg  [4:1]Qbor;
    reg  [4:1]intTimer;
    reg  [4:1]cntrLd;
    wire [4:1]nBOR;
    wire [4:1]CR;
    wire [4:1]norb;
    wire [4:1]mux;
    
    //Resync signals.
    reg  presync, rst, rstDelay, resync;
    wire nor1, nor2, reload12, reload34;
    
    //Channel signals.
    wire [6:0]CR_BOR_1;
    wire [6:0]CR_BOR_2;
    wire [6:0]CR_BOR_3;
    wire [6:0]CR_BOR_4;
    
    //Channel 1 frequency counter.
    cell24option1 t1_b7(enn, clk, D[7], Addr0w, cntrLd[1], CR_BOR_1[6], nBOR[1]);
    cell24        t1_b6(enn, clk, D[6], Addr0w, cntrLd[1], CR_BOR_1[5], CR_BOR_1[6]);
    cell24        t1_b5(enn, clk, D[5], Addr0w, cntrLd[1], CR_BOR_1[4], CR_BOR_1[5]);
    cell20        t1_b4(enn, clk, D[4], Addr0w, cntrLd[1], CR_BOR_1[3], CR_BOR_1[4]);
    cell24        t1_b3(enn, clk, D[3], Addr0w, cntrLd[1], CR_BOR_1[2], CR_BOR_1[3]);
    cell24        t1_b2(enn, clk, D[2], Addr0w, cntrLd[1], CR_BOR_1[1], CR_BOR_1[2]);
    cell24        t1_b1(enn, clk, D[1], Addr0w, cntrLd[1], CR_BOR_1[0], CR_BOR_1[1]);
    cell20        t1_b0(enn, clk, D[0], Addr0w, cntrLd[1], CR[1],       CR_BOR_1[0]);

    //Channel 2 frequency counter.
    cell24option1 t2_b7(enn, clk, D[7], Addr2w, cntrLd[2], CR_BOR_2[6], nBOR[2]);
    cell24        t2_b6(enn, clk, D[6], Addr2w, cntrLd[2], CR_BOR_2[5], CR_BOR_2[6]);
    cell24        t2_b5(enn, clk, D[5], Addr2w, cntrLd[2], CR_BOR_2[4], CR_BOR_2[5]);
    cell20        t2_b4(enn, clk, D[4], Addr2w, cntrLd[2], CR_BOR_2[3], CR_BOR_2[4]);
    cell24        t2_b3(enn, clk, D[3], Addr2w, cntrLd[2], CR_BOR_2[2], CR_BOR_2[3]);
    cell24        t2_b2(enn, clk, D[2], Addr2w, cntrLd[2], CR_BOR_2[1], CR_BOR_2[2]);
    cell24        t2_b1(enn, clk, D[1], Addr2w, cntrLd[2], CR_BOR_2[0], CR_BOR_2[1]);
    cell20        t2_b0(enn, clk, D[0], Addr2w, cntrLd[2], CR[2],       CR_BOR_2[0]);

    //Channel 3 frequency counter.
    cell24option1 t3_b7(enn, clk, D[7], Addr4w, cntrLd[3], CR_BOR_3[6], nBOR[3]);
    cell24        t3_b6(enn, clk, D[6], Addr4w, cntrLd[3], CR_BOR_3[5], CR_BOR_3[6]);
    cell24        t3_b5(enn, clk, D[5], Addr4w, cntrLd[3], CR_BOR_3[4], CR_BOR_3[5]);
    cell20        t3_b4(enn, clk, D[4], Addr4w, cntrLd[3], CR_BOR_3[3], CR_BOR_3[4]);
    cell24        t3_b3(enn, clk, D[3], Addr4w, cntrLd[3], CR_BOR_3[2], CR_BOR_3[3]);
    cell24        t3_b2(enn, clk, D[2], Addr4w, cntrLd[3], CR_BOR_3[1], CR_BOR_3[2]);
    cell24        t3_b1(enn, clk, D[1], Addr4w, cntrLd[3], CR_BOR_3[0], CR_BOR_3[1]);
    cell20        t3_b0(enn, clk, D[0], Addr4w, cntrLd[3], CR[3],       CR_BOR_3[0]);

    //Channel 4 frequency counter.
    cell24option1 t4_b7(enn, clk, D[7], Addr6w, cntrLd[4], CR_BOR_4[6], nBOR[4]);
    cell24        t4_b6(enn, clk, D[6], Addr6w, cntrLd[4], CR_BOR_4[5], CR_BOR_4[6]);
    cell24        t4_b5(enn, clk, D[5], Addr6w, cntrLd[4], CR_BOR_4[4], CR_BOR_4[5]);
    cell20        t4_b4(enn, clk, D[4], Addr6w, cntrLd[4], CR_BOR_4[3], CR_BOR_4[4]);
    cell24        t4_b3(enn, clk, D[3], Addr6w, cntrLd[4], CR_BOR_4[2], CR_BOR_4[3]);
    cell24        t4_b2(enn, clk, D[2], Addr6w, cntrLd[4], CR_BOR_4[1], CR_BOR_4[2]);
    cell24        t4_b1(enn, clk, D[1], Addr6w, cntrLd[4], CR_BOR_4[0], CR_BOR_4[1]);
    cell20        t4_b0(enn, clk, D[0], Addr6w, cntrLd[4], CR[4],       CR_BOR_4[0]);

    //Assign internal signals to outputs.
    assign Timer = intTimer;

    //-------------------------------------- Resync Circuitry --------------------------------------
    assign nor1 = ~(nor2 | Addr9w);
    assign nor2 = ~(presync | resync);

    assign rstAudPhase = rst | rstDelay;

    assign reload12 = resyncTwoTones | resync;
    assign reload34 = resyncSerClk   | resync;

    //------------------------------------ Channel 1 Circuitry -------------------------------------
    //Update the MUX.
    assign mux[1] = (ch2Bits16 == 1'b0) ? norb[1] : norb[2];

    //Carry assignment.
    assign CR[1] = ~(~(enFastClk1 | audClock | cntrLd[1]) | cntrLd[1]);

    //Borrow/load circuits.
    assign norb[1] = ~(Qbor[1] | reload12);

    //------------------------------------ Channel 2 Circuitry -------------------------------------
    //Update the MUX.
    assign mux[2] = (ch2Bits16 == 1'b0) ? audClock : intTimer[1];

    //Carry assignment.
    assign CR[2] = ~(~(mux[2] | cntrLd[2]) | cntrLd[2]);

    //Borrow/load circuits.
    assign norb[2] = ~(Qbor[2] | reload12);

    //------------------------------------ Channel 3 Circuitry -------------------------------------
    //Update the MUX.
    assign mux[3] = (ch4Bits16 == 1'b0) ? norb[3] : norb[4];
    
    //Carry assignment.
    assign CR[3] = ~(~(enFastClk3 | audClock | cntrLd[3]) | cntrLd[3]);
        
    //Borrow/load circuits.
    assign norb[3] = ~(Qbor[3] | reload34);

    //------------------------------------ Channel 4 Circuitry -------------------------------------
    //Update the MUX.
    assign mux[4] = (ch4Bits16 == 1'b0) ? audClock : intTimer[3];

    //Carry assignment.
    assign CR[4] = ~(~(mux[4] | cntrLd[4]) | cntrLd[4]);

    //Borrow/load circuits.
    assign norb[4] = ~(Qbor[4] | reload34);
    
    always@(negedge(clk)) begin
        if(enn == 1'b1) begin
            //Generate timer signal.
            intTimer <= norb;
       
            //---------------------------------- Resync Circuitry ----------------------------------
            presync <= nor1;
        
            //-------------------------------- Channel Circuitry ---------------------------------
            cntrLd[1] <= reload12 | mux[1];
            cntrLd[2] <= reload12 | norb[2];
            cntrLd[3] <= reload34 | mux[3];
            cntrLd[4] <= reload34 | norb[4];
        end
    end

    always@(posedge(clk)) begin
        if(enp == 1'b1) begin
            //Capture borrow signal.    
            Qbor <= nBOR;

            //---------------------------------- Resync Circuitry ----------------------------------
            //rstAudPhase <= not presync;
            rst      <= ~presync; //Adds in a strobe extender to fully reset audio control.
            rstDelay <= rst;
            resync   <= ~presync;
        end
    end
endmodule
