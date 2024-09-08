`timescale 1ns / 10ps

//**********************************************Cell 6**********************************************

module cell6
(
    input  enp,
    input  enn,
    input  clk,
    input  T2,
    input  nT2,
    input  R,
    output T1,
    output nT1,
    output Q,
    output nQ
);

    reg  muxOut;
    wire Din;
    reg  intQ;
    reg  nintQ;
    reg  norIn1;
    reg  norIn2;
    wire intT1;
    wire [1:0]muxSel;

    //Always update the outputs.
    assign T1  = intT1;
    assign nT1 = ~intT1;
    assign Q   = intQ;
    assign nQ  = nintQ;

    //Combine T2 and nT2 into a single signal;
    assign muxSel = {T2, nT2};

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
    always @(posedge clk) begin
        if(enp == 1'b1) begin
            intQ  <= Din;
            nintQ <= ~Din;
        end
    end

    //Update output flip-flops.
    always @(negedge clk) begin
        if(enn == 1'b1) begin
            norIn1 <= nT2;
            norIn2 <= intQ;
        end
    end

    //Output NOR gate.
    assign intT1 = ~(norIn1 | norIn2);
endmodule