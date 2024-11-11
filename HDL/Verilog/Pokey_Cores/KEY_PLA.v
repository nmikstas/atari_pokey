`timescale 1ns / 1ns

//********************************************* KEY PLA ********************************************

module KEY_PLA
(
    input iKR1,
    input keyQ0,
    input keyQ1,
    input debComp,
    output keyD0,
    output keyD1,
    output nLdComp,
    output nLdKbus
);

    wire m1, m2, m3, m4, m5, m6, m7, m8;

    assign m1 = ~(~iKR1 | debComp);
    assign m2 = ~(keyQ0 | keyQ1 | ~debComp);
    assign m3 = ~(keyQ1 | ~debComp);
    assign m4 = ~(keyQ0 | keyQ1);
    assign m5 = ~(~iKR1 | keyQ1);
    assign m6 = ~(~iKR1 | keyQ0 | ~keyQ1 | debComp);
    assign m7 = ~(~iKR1 | ~keyQ0 | ~keyQ1);
    assign m8 = ~(iKR1 | keyQ0 | ~debComp);
        
    assign keyD0   = ~(m8 | m7 | m2 | m1);
    assign keyD1   = ~(m6 | m5 | m4 | m3);
    assign nLdComp = ~m7;
    assign nLdKbus = ~m6;

endmodule
