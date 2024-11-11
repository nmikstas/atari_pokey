`timescale 1ns / 10ps

//**********************************************Cell 11*********************************************

module cell11
(
    input  [3:0]V,
    input  T,
    input  I,
    output [3:0]O
);

    wire m;

    assign m = ~(T | I);
    assign O[0] = ~(V[0] | m);
    assign O[1] = ~(V[1] | m);
    assign O[2] = ~(V[2] | m);
    assign O[3] = ~(V[3] | m);

endmodule
