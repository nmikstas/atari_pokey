`timescale 1ns / 10ps

//**********************************************KEY_core********************************************

module KEY_core
(
    input  enn,
    input  enp,
    input  clk,
    input  keybClk,
    input  [2:1]KR,
    input  [1:0]SKCTLS,
    output reg setKey,
    output kShift,
    output reg setBreak,
    output keyDown,
    output reg [7:0]D,
    output [5:0]K
);

    //Interconnect signals.
    reg  qkeybClk;
    reg  shift;
    reg  control;
    wire match, kbCodeLd, kbCmpLd, enBreak;
    wire [5:0]oQ;
    wire [5:0]nQ;

    //State machine signals.
    wire [1:0]keyD;
    wire [1:0]keyQ;
    wire nLdComp, nLdKbus, iKR1, debComp, intLd;

    //Binary decrement with borrow delay.
    wire [5:0]QD;
    wire [5:0]C;
    wire [5:0]Q;
    wire [4:0]T;
    wire [4:0]nT;

    //Keyboard code signals.
    wire nKR2, enControl, enShift;

    //Break detect signals.
    reg  qMuxOut;
    reg  qLoop;
    reg  qLoop2;
    wire muxOut, nqLoop, preBreak;

    //******************************************Sub-modules*****************************************

    //--------------------------Keyboard State Machine--------------------------

    //Keyboard control PLA.
    KEY_PLA kb_pla(iKR1, keyQ[0], keyQ[1], debComp, keyD[0], keyD[1], nLdComp, nLdKbus);

    //State registers.
    cell2p b0(enn, clk, keyD[0], ~keybClk, keybClk, ~SKCTLS[1], keyQ[0]);
    cell2p b1(enn, clk, keyD[1], ~keybClk, keybClk, ~SKCTLS[1], keyQ[1]);    

    //------------------------Count, compare and register-----------------------

    //Bits Q0-Q5.
    cell3 qb0(enp, enn, clk, ~qkeybClk, qkeybClk, ~SKCTLS[1], T[0], nT[0], Q[0], nQ[0]);
    cell6 qb1(enp, enn, clk, T[0], nT[0], ~SKCTLS[1], T[1], nT[1], Q[1], nQ[1]);
    cell3 qb2(enp, enn, clk, T[1], nT[1], ~SKCTLS[1], T[2], nT[2], Q[2], nQ[2]);
    cell6 qb3(enp, enn, clk, T[2], nT[2], ~SKCTLS[1], T[3], nT[3], Q[3], nQ[3]);
    cell3 qb4(enp, enn, clk, T[3], nT[3], ~SKCTLS[1], T[4], nT[4], Q[4], nQ[4]);
    cell6 qb5(.enp(enp), .enn(enn), .clk(clk), .T2(T[4]), .nT2(nT[4]), .R(~SKCTLS[1]), .T1(), .nT1(), .Q(Q[5]), .nQ(nQ[5])); 

    //Compare registers.
    cell4 c0(enp, clk, Q[0], kbCmpLd, ~kbCmpLd, QD[0], C[0]);
    cell4 c1(enp, clk, Q[1], kbCmpLd, ~kbCmpLd, QD[1], C[1]);
    cell4 c2(enp, clk, Q[2], kbCmpLd, ~kbCmpLd, QD[2], C[2]);
    cell4 c3(enp, clk, Q[3], kbCmpLd, ~kbCmpLd, QD[3], C[3]);
    cell4 c4(enp, clk, Q[4], kbCmpLd, ~kbCmpLd, QD[4], C[4]);
    cell4 c5(enp, clk, Q[5], kbCmpLd, ~kbCmpLd, QD[5], C[5]); 

    //***************************************Combinational Logic*************************************

    //--------------------------Keyboard State Machine--------------------------
    //Debounce enable/disable.
    assign debComp = ~(~SKCTLS[0] | match);

    //Key down status.
    assign keyDown = ~keyQ[1];

    //KR1 status.
    assign iKR1 = ~KR[1];

    //Keyboard compare register load signal.
    assign kbCmpLd = ~(nLdComp | keybClk);

    //Read data register load signal.
    assign intLd = ~(nLdKbus | keybClk);
    assign kbCodeLd = intLd;

    //--------------------Output and shift and control detect-------------------
    //always update output K values.
    assign K = nQ;

    //Control enable(Q = "000000").
    assign enControl = ~(Q[5] | Q[4] | Q[3] | Q[2] | Q[1] | Q[0] | keybClk);

    //Shift enable(Q = "010000").
    assign enShift = ~(Q[5] | nQ[4] | Q[3] | Q[2] | Q[1] | Q[0] | keybClk);

    //Break enable(Q = "110000").
    assign enBreak = ~(nQ[5] | nQ[4] | Q[3] | Q[2] | Q[1] | Q[0] | keybClk);

    //Control and shift output signals.
    assign nKR2 = ~KR[2];

    //------------------------Count, compare and register-----------------------
    //Always update outputs.
    assign match = ~(C[0] | C[1] | C[2] | C[3] | C[4] | C[5]);
    assign oQ = Q;

    //-------------------------------Break detect-------------------------------
    //Always update mux output.
    assign muxOut = (enBreak == 1'b1) ? KR[2] : nqLoop;
    assign nqLoop = ~qLoop;
    assign preBreak = ~(qLoop2 | muxOut);

    //---------------------------------Top level--------------------------------
    assign kShift = shift;
    
    //***************************************Sequential Logic*************************************

    always@(negedge(clk)) begin
        if(enn == 1'b1) begin

            //----------------------Keyboard State Machine----------------------
            //setKey interrupt signal.
            setKey <= intLd;

            //Delay keyboard by one clock cycle.
            qkeybClk <= keybClk;

            //----------------Output and shift and control detect---------------
            if(enControl == 1'b1) begin
                control <= nKR2;
            end

            if(enShift == 1'b1) begin
                shift <= nKR2;
            end

            //---------------------------Break detect---------------------------
            //loop signals.
            qLoop <= ~qMuxOut;
        
            //preBreak logic.
            qLoop2 <= ~qMuxOut;

            //Output.
            setBreak <= preBreak;
        end
    end
    
    always@(posedge(clk)) begin
        if(enp == 1'b1) begin

            //--------------------Count, compare and register-------------------
            //Read registers.
            if(kbCodeLd == 1'b1) begin
                D <= {control, shift, QD};
            end

            //---------------------------Break detect---------------------------
            //loop signals.
            qMuxOut <= muxOut;   
        end
    end
endmodule
