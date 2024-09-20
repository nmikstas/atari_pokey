`timescale 1ns / 10ps

//**********************************************IO Core*********************************************

module IO_core
(
    input  enp,
    input  clk,
    input  RW,
    input  [1:0]CS,
    input  [3:0]A,
    input  [7:0]Data0r,
    input  [7:0]Data1r,
    input  [7:0]Data2r,
    input  [7:0]Data3r,
    input  [7:0]Data4r,
    input  [7:0]Data5r,
    input  [7:0]Data6r,
    input  [7:0]Data7r,
    input  [7:0]Data8r,
    input  [7:0]Data9r,
    input  [7:0]DataAr,
    input  [7:0]DataDr,
    input  [7:0]DataEr,
    input  [7:0]DataFr,
    output reg [7:0]Datar,
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

    reg [7:0]Data0Q;
    reg [7:0]Data1Q;
    reg [7:0]Data2Q;
    reg [7:0]Data3Q;
    reg [7:0]Data4Q;
    reg [7:0]Data5Q;
    reg [7:0]Data6Q;
    reg [7:0]Data7Q;
    reg [7:0]Data8Q;
    reg [7:0]Data9Q;
    reg [7:0]DataAQ;
    reg [7:0]DataDQ;
    reg [7:0]DataEQ;
    reg [7:0]DataFQ;

    reg [3:0]AQ;
    reg [3:0]Ar;
    reg writeEn2;

    wire nwriteEn;

    assign readEn   = RW & ~CS[0] & CS[1];
    assign nwriteEn = RW | CS[0] | ~CS[1];

    //MUX out based on captured address.
    always @(*) begin
        case(Ar)
            4'b0000: Datar = Data0Q; 
            4'b0001: Datar = Data1Q; 
            4'b0010: Datar = Data2Q;
            4'b0011: Datar = Data3Q;
            4'b0100: Datar = Data4Q;
            4'b0101: Datar = Data5Q;
            4'b0110: Datar = Data6Q;
            4'b0111: Datar = Data7Q;
            4'b1000: Datar = Data8Q;
            4'b1001: Datar = Data9Q;
            4'b1010: Datar = DataAQ;
            4'b1101: Datar = DataDQ;
            4'b1110: Datar = DataEQ;
            4'b1111: Datar = DataFQ;
            default: Datar = 8'b11111111;
        endcase
    end
    
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

    always @(posedge clk) begin
        if(enp == 1'b1) begin
            
            //Always lock in the address.
            if(nwriteEn == 1'b0) begin
                AQ <= A;
            end
       
            writeEn2 <= nwriteEn;
            Ar <= A;
        
            //Re-time the output data so we have plenty of time on the negative clock edge.
            Data0Q <= Data0r;
            Data1Q <= Data1r;
            Data2Q <= Data2r;
            Data3Q <= Data3r;
            Data4Q <= Data4r;
            Data5Q <= Data5r;
            Data6Q <= Data6r;
            Data7Q <= Data7r;
            Data8Q <= Data8r;
            Data9Q <= Data9r;
            DataAQ <= DataAr;
            DataDQ <= DataDr;
            DataEQ <= DataEr;
            DataFQ <= DataFr;
        end
    end
endmodule
