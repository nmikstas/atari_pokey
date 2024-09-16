`timescale 1ns / 10ps

//**********************************************SER_core********************************************

module SER_core
(
    input  enn,
    input  enp,
    input  clk,
    input  [7:0]Dw,
    input  [7:3]SKCTLS,
    input  SID,
    input  AddrDw,
    input  Init,
    input  Timer1,
    input  Timer2,
    input  Timer4,
    input  BCLK_in,
    output BCLK_out,
    output OCLK,
    output reg SOD,
    output siDelay,
    output reg setFramerr,
    output reg setSdiCompl,
    output sdiBusy,
    output resyncSerClk,
    output reg resync2Tones,
    output sdoFinish,
    output setSdoCompl,
    output reg [7:0]Dr
);

    //Cell2 signals.
    wire T4, T2, TogldTmr4, TogldTmr2, nor2;

    //sdi signals.
    reg  Qsdi, Qnmux1, presdi;
    wire nmux1, nsdi;

    //sdo signals.
    reg  OCLKint, Qmux4, QnOCLK;
    wire mux4, nOCLK;

    //BCLK signals.
    reg  preBCLK, QBCLK;
    wire nor1;
    
    //Mux signals.
    wire mux1, mux2, mux3;

    //internal signals.
    wire sdiClock, sdoClock;
        
    //Shift register signals.
    reg  shift, siDelayInt;
    wire [7:0]ssi;
    wire [8:0]DQ;
    wire ssiStopB, ssiStartB, ssiSet, sdiLoad;

    //SERIN PLA signals.
    reg  sdiStopBit, sdinStartBit;
    wire nFramerr, sdiCompl, preSdiSet, noSdiErr, ithisState, inextState;

    //Misc. signals.
    reg  sdiClk, sh1, sh2;
    wire nsdiClk, framerr;

    //Resync signals.
    reg  delay1, delay2, QnoErr, QnClk, resyncSerClkInt;
    wire presync, _nor1, _nor2, resyncInt;

    //Serial out shift module signals.
    reg  [7:0]oQD;
    wire [9:1]Qout;
    wire shiftOut;

    //Feedback logic.
    reg  sdoComplInt;

    //Shift and data register signals.
    reg  DshiftOut, oShift;
    wire Load, Empty;

    //Serial out PLA signals. 
    reg  sdoDloaded, ssoEmpty; 
    wire othisState, onextState, sdonShiftEn, preSdoLoad;

    //State machine signals.
    reg  preShift1, preShift2, QLoad, QClock; 
    wire _nor1_, _nor2_, nsdoClock;

    //Two tone signals.
    reg  Qshift, Qs7, Qand1, QTimer2, Qns3, _Qnmux1;
    wire nor3, and1, toneCntrl, nor4, nnor4, _mux1, _mux2, ns3, _nmux1;

    //******************************************Sub-modules*****************************************

    //--------------------------Serial Clock Generator--------------------------
    //Timer 4 flip-flop.
    cell2pr t4(enn, clk, TogldTmr4, Timer4, ~Timer4, resyncInt, nor2, T4);

    //Timer 2 flip-flop.
    cell2r t2(enn, clk, TogldTmr2, Timer2, ~Timer2, nor2, T2);

    //-------------------------------Serial Input-------------------------------
    //Start bit.
    cell17 ibstart(enp, clk, shift, ssiSet, DQ[0], ssiStartB);

    //8 data bits.
    cell17 ib0(enp, clk, shift, ssiSet, DQ[1], DQ[0]);
    cell17 ib1(enp, clk, shift, ssiSet, DQ[2], DQ[1]);
    cell17 ib2(enp, clk, shift, ssiSet, DQ[3], DQ[2]);
    cell17 ib3(enp, clk, shift, ssiSet, DQ[4], DQ[3]);
    cell17 ib4(enp, clk, shift, ssiSet, DQ[5], DQ[4]);
    cell17 ib5(enp, clk, shift, ssiSet, DQ[6], DQ[5]);
    cell17 ib6(enp, clk, shift, ssiSet, DQ[7], DQ[6]);
    cell17 ib7(enp, clk, shift, ssiSet, DQ[8], DQ[7]);

    //Stop bit.
    cell25 ibstop(enp, clk, shift, ~siDelayint, DQ[8]);

    //Serial data in PLA.
    serin_pla ipla(sdiStopBit, sdinStartBit, ithisState, sdiBusy, nFramerr, sdiCompl, inextState, preSdiSet, noSdiErr);

    //State register.
    cell2p istate(enn, clk, inextState, sdiClk, Init, ithisState);

    //-------------------------------Serial Output------------------------------
    //Start bit.
    cell16 obstart(enp, clk, oShift, Load, Qout[1], shiftOut);

    //8 data bits.
    cell15 ob0(enp, clk, oShift, Load, oQD[0], Qout[2], Qout[1]);
    cell15 ob1(enp, clk, oShift, Load, oQD[1], Qout[3], Qout[2]);
    cell15 ob2(enp, clk, oShift, Load, oQD[2], Qout[4], Qout[3]);
    cell15 ob3(enp, clk, oShift, Load, oQD[3], Qout[5], Qout[4]);
    cell15 ob4(enp, clk, oShift, Load, oQD[4], Qout[6], Qout[5]);
    cell15 ob5(enp, clk, oShift, Load, oQD[5], Qout[7], Qout[6]);
    cell15 ob6(enp, clk, oShift, Load, oQD[6], Qout[8], Qout[7]);
    cell15 ob7(enp, clk, oShift, Load, oQD[7], Qout[9], Qout[8]);
    
    //Stop bit.
    cell17 obstop(enp, clk, oShift, Load, 1'b0, Qout[9]);

    //Serial out PLA.
    SEROUT_PLA opla(othisState, sdoDloaded, ssoEmpty, sdoFinish, onextState, sdonShiftEn, preSdoLoad);

    //State register.
    cell2p ostate(enn, clk, onextState, sdoClock, nsdoClock, Init, othisState);

    //**************************************Combinational Logic*************************************

    //--------------------------Serial Clock Generator--------------------------
    //Always assign cell 2 outputs.
    assign TogldTmr4 = ~T4;
    assign TogldTmr2 = ~T2;

    //Always assign outputs.
    assign OCLK = OCLKint;

    //sdiClock output.
    assign nsdi     = ~presdi;
    assign sdiClock = ~(Qsdi | Qnmux1);

    //sdoClock output.
    assign nOCLK    = ~OCLKint;
    assign sdoClock = ~(Qmux4 | QnOCLK);

    assign BCLK_out = ~(preBCLK | SKCTLS[4] | nor1);
    assign nor1     = ~(SKCTLS[4] | SKCTLS[5]);
    assign nor2     = ~(~nor1 | SKCTLS[6]);
    assign nmux1    = ~mux1;

    //MUX outputs.
    assign mux1 = (nor1 == 1'b1) ? QBCLK : TogldTmr4;
    assign mux2 = (SKCTLS[5] == 1'b1) ? TogldTmr4 : QBCLK;
    assign mux3 = (SKCTLS[5] == 1'b1) ? TogldTmr2 : TogldTmr4;
    assign mux4 = (SKCTLS[6] == 1'b1) ? mux3 : mux2;

    //-------------------------------Serial Input-------------------------------
    //Always assign shift bits.
    assign ssiStopB = DQ[8];
    assign ssi      = DQ[7:0];

    //Misc. assignmants.
    assign nsdiClk = ~sdiClk;
    assign sdiLoad = ~(sdiCompl | nsdiClk);
    assign ssiSet  = ~(preSdiSet | nsdiClk);

    //Always assign output signals.
    assign siDelay      = siDelayint;
    assign resyncSerClk = resyncSerClkInt;

    //setFramerr and setsdiCompl signals.
    assign framerr = ~(nFramerr | nsdiClk);

    //Resync combinational logic.
    assign presync = ~(QnoErr | QnClk);
    assign _nor1   = ~(delay1 | delay2);
        
    //Resync latch.
    assign resyncInt = ~(_nor1 | ~SKCTLS[4] | _nor2);
    assign _nor2     = ~(resyncInt | presync);

    //-------------------------------Serial Output------------------------------
    //Update the "empty" signal.
    assign Empty = ~(Qout[9] | Qout[8] | Qout[7] | Qout[6] | Qout[5] | Qout[4] | Qout[3] | Qout[2] | Qout[1]);

    //Assign signals.
    assign setSdoCompl = sdoComplInt;
    assign nsdoClock   = ~sdoClock;

    //State machine latch.
    assign _nor1_ = ~(_nor2_ | Init | sdoComplInt);
    assign _nor2_ = ~(AddrDw | _nor1_);
    assign Load   = ~(QLoad | QClock);

    assign nor3      = ~(Qshift | Qs7);
    assign and1      = Timer1 & nor3;
    assign toneCntrl = ~(Qand1 | QTimer2);

    //Two tone MUXs.
    assign _mux1 = (toneCntrl == 1'b1) ? nor4 : nnor4;
    assign _mux2 = (SKCTLS[3] == 1'b1) ? nnor4 : nor3;

    assign ns3    = ~SKCTLS[3];
    assign _nmux1 = ~_mux1;
    assign nor4   = ~(Qns3 | _Qnmux1);
    assign nnor4  = ~nor4;

    //****************************************Sequential Logic***********)**************************

    always@(negedge(clk)) begin
        if(enn == 1'b1) begin

            //----------------------Serial Clock Generator----------------------
            //sdiClock output.
            presdi <= nmux1;
            Qsdi   <= nsdi;
            Qnmux1 <= nmux1;
        
            //sdoClock output.
            OCLKint <= mux4;
            Qmux4   <= mux4;
            QnOCLK  <= nOCLK;

            //BCLK signals.
            preBCLK <= nmux1;
            QBCLK   <= BCLK_in;

            //---------------------------Serial Input---------------------------
            //Clock delays.
            sdiClk <= sh2;
            sh2    <= sh1;
            sh1    <= shift;
            shift  <= sdiClock;

            //Update PLA flip-flops.
            sdiStopBit   <= ssiStopB;
            sdinStartBit <= ~ssiStartB;

            //Get the input serial bit.
            siDelayInt  <= ~SID;
            setSdiCompl <= sdiLoad;
            setFramerr  <= framerr;
        
            //---------------------------Serial Output--------------------------
            //Update the output serial data and input parallel data.
            DshiftOut <= ~shiftOut;

            if(AddrDw == 1'b1) begin
                oQD <= Dw;
            end
        
            //State machine signals.
            sdoDloaded  <= _nor2_;
            ssoEmpty    <= ~Empty;
            preShift1   <= ~(sdonShiftEn | nsdoClock);
            preShift2   <= preShift1;
            oShift      <= preShift2;
            sdoComplInt <= Load;
        
            //Serial out pin.
            SOD <= ~_mux2;
        end
    end

    always@(posedge(clk)) begin
        if(enp == 1'b1) begin
            //----------------------Serial Clock Generator----------------------
            resyncSerClkInt <= resyncInt;

            //---------------------------Serial Input--------------------------
            //Lock in the serial data.
            if(sdiLoad == 1'b1) begin
                Dr <= ssi;
            end

            //Resync flip-flops.
            delay1 <= ~siDelayInt;
            delay2 <= ~delay1;
            QnoErr <= noSdiErr;
            QnClk  <= nsdiClk; 

            //---------------------------Serial Output--------------------------   
            QLoad  <= preSdoLoad;
            QClock <= nsdoClock;
        
            //Two tone signals.
            resync2Tones <= ~(toneCntrl | ns3);
            Qshift       <= DshiftOut;
            Qs7          <= SKCTLS[7];
            Qand1        <= and1;
            QTimer2      <= Timer2;
            Qns3         <= ns3;
            _Qnmux1      <= _nmux1;
        end
    end
endmodule
