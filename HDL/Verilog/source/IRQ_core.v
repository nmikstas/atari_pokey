`timescale 1ns / 10ps

//*********************************************IRQ Core*********************************************

module IRQ_core
(
    input  enn,
    input  enp,
    input  clk,
    input  IRQEN,
    input  [7:0]Dw,
    input  setBreak,
    input  setKey,
    input  setSdiCompl,
    input  setSdoCompl,
    input  sdoFinish,
    input  Timer4,
    input  Timer2,
    input  Timer1,
    output reg IRQ,
    output [7:0]Dr,
    output keyOvrun,
    output sdiOvrun
);
    
    wire [7:0]nors;
    reg  [7:0]nirqst;
    reg  [7:0]Dirq;
    reg  qnor3;

    assign nors[0] = ~(nirqst[0] | Timer1);
    assign nors[1] = ~(nirqst[1] | Timer2);
    assign nors[2] = ~(nirqst[2] | Timer4);
    assign nors[3] = ~(Dirq[3]   | sdoFinish);
    assign nors[4] = ~(nirqst[4] | setSdoCompl);
    assign nors[5] = ~(nirqst[5] | setSdiCompl);
    assign nors[6] = ~(nirqst[6] | setKey);
    assign nors[7] = ~(nirqst[7] | setBreak);

    assign Dr[7:4] = ~nirqst[7:4];
    assign Dr[3]   = nirqst[3];
    assign Dr[2:0] = ~nirqst[2:0];

    assign keyOvrun = setKey      & nirqst[6];
    assign sdiOvrun = setSdiCompl & nirqst[5];

    always @(negedge clk) begin
        if(enn == 1'b1) begin
            if(IRQEN == 1'b1) begin
                Dirq <= ~Dw;
            end

            nirqst[0] <= ~(nors[0] | Dirq[0]);
            nirqst[1] <= ~(nors[1] | Dirq[1]);
            nirqst[2] <= ~(nors[2] | Dirq[2]);
            nirqst[3] <= sdoFinish;
            nirqst[4] <= ~(nors[4] | Dirq[4]);
            nirqst[5] <= ~(nors[5] | Dirq[5]);
            nirqst[6] <= ~(nors[6] | Dirq[6]);
            nirqst[7] <= ~(nors[7] | Dirq[7]);
            qnor3     <= nors[3];
        end
    end

    always @(posedge clk) begin
        if(enp == 1'b1) begin
            IRQ <= nirqst[7] | nirqst[6] | nirqst[5] | nirqst[4] | 
                   qnor3     | nirqst[2] | nirqst[1] | nirqst[0];
        end
    end
endmodule
