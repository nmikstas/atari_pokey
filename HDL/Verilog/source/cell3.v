`timescale 1ns / 10ps

//**********************************************Cell 3**********************************************

module cell3
(
    input  enp,
    input  enn,
    input  clk,
    input  T1,
    input  nT1,
    input  R,
    output T2,
    output nT2,
    output Q,
    output nQ
);

    reg  muxOut;
    wire Din;
    reg  intQ;
    reg  nintQ;
    reg  norIn1;
    reg  norIn2;
    wire intT2;
    wire [1:0]muxSel;

    //Always update the outputs.
    assign T2  = intT2;
    assign nT2 = ~intT2;
    assign Q   = intQ;
    assign nQ  = nintQ;

    //Combine T1 and nT1 into a single signal;
    assign muxSel = {T1, nT1};

    //Always update mux output.
    always @(*) begin
        case(muxSel)
            2'b01:   muxOut = nintQ;
            default: muxOut = intQ;
        endcase
    end

    //Update the data NOR.
    assign Din = ~(muxOut | R);

    //Update stored data bit.
    always @(negedge clk) begin
        if(enn == 1'b1) begin
            intQ  <= Din;
            nintQ <= ~Din;
        end
    end

    //Update output flip-flops.
    always @(posedge clk) begin
        if(enp == 1'b1) begin
            norIn1 <= nT1;
            norIn2 <= intQ;
        end
    end

    //Output NOR gate.
    assign intT2 = ~(norIn1 | norIn2);
endmodule
