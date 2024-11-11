`timescale 1ns / 10ps

module tb_IO_core;
    localparam c_50 = 20 / 2;           //50MHz half cycle.
    localparam c_179 = 558.7247666 / 2; //1.79MHz half cycle.

    //Slow clock and edge detectors.
    reg clk    = 1'b0;
    reg clk179 = 1'b0;
    reg Qprep  = 1'b0;
    reg Qpren  = 1'b0;
    reg Qedgp  = 1'b0;
    reg Qedgn  = 1'b0;
    wire enp, enn;

    //----------------------------------------------------------------------------------------------
    //Put regs, wires and DUT here.
    reg  init        = 1'b0;
    reg  sel9bitPoly = 1'b0;
    wire [7:0]rndNum;
    wire poly4bit;
    wire poly5bit;
    wire poly917bit;

    reg RW      = 1'bZ;
    reg [1:0]CS = 2'bZZ;
    reg [3:0]A  = 4'bZZZZ;
    reg [3:0]Aint;

    wire Addr0w, Addr1w, Addr2w, Addr3w, Addr4w, Addr5w, Addr6w, Addr7w;
    wire Addr8w, Addr9w, AddrAw, AddrBw, AddrDw, AddrEw, AddrFw, readEn;
    wire [7:0]Datar;

    reg [7:0]Data0r = 8'b11110000;
    reg [7:0]Data1r = 8'b00001111;
    reg [7:0]Data2r = 8'b01010101;
    reg [7:0]Data3r = 8'b10101010;
    reg [7:0]Data4r = 8'b11001100;
    reg [7:0]Data5r = 8'b00110011;
    reg [7:0]Data6r = 8'b10011001;
    reg [7:0]Data7r = 8'b01100110;
    reg [7:0]Data8r = 8'b10000001;
    reg [7:0]Data9r = 8'b11100011;
    reg [7:0]DataDr = 8'b00011100;
    reg [7:0]DataEr = 8'b00000001;
    reg [7:0]DataFr = 8'b10000000;

    poly_core pc(enn, clk, init, sel9bitPoly, rndNum, poly4bit, poly5bit, poly917bit);

    IO_core ioc(enp, clk, RW, CS, Aint, Data0r, Data1r, Data2r, Data3r, Data4r, Data5r,
                Data6r, Data7r, Data8r, Data9r, rndNum, DataDr, DataEr, DataFr, Datar,
                readEn,  Addr0w, Addr1w, Addr2w, Addr3w, Addr4w, Addr5w, Addr6w, Addr7w,
                Addr8w, Addr9w, AddrAw, AddrBw, AddrDw, AddrEw, AddrFw);
    
    //----------------------------------------------------------------------------------------------

    always #c_50 clk = !clk;        //50MHz clock generator.
    always #c_179 clk179 = !clk179; //1.512MHz clock generator.

    //Positive edge detector.
    always @(posedge clk) begin
        Qprep  <= clk179; //Protect against metastability.
        Qedgp  <= Qprep;
    end

    //Negative edge detector.
    always @(negedge clk) begin
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

    initial begin

    //----------------------------------------------------------------------------------------------
    //Put test sequence here.

    //@(posedge clk179)
    //@(posedge enp)

    //@(negedge clk179)
    //@(negedge enn)

    #5000
    @(negedge enn)

    init <= 1'b1;
    #20000
    @(negedge enn)

    init <= 1'b0;

    #3000;
    @(negedge clk179)
    CS[0] <= 1'b0;
    CS[1] <= 1'b1;
    RW    <= 1'b1;
    A     <= 4'b1010;
    @(posedge clk179)#30
    A     <= 4'b1100;
    @(negedge clk179)
    CS[0] <= 1'b1;
    CS[1] <= 1'b1;
    RW    <= 1'b0;

    #1000
    @(negedge clk179)
    CS[0] <= 1'b0;
    CS[1] <= 1'b1;
    RW    <= 1'b0;
    A     <= 4'b0000;
    @(posedge clk179)#30
    A     <= 4'b1100;
    @(negedge clk179)
    CS[0] <= 1'b1;
    CS[1] <= 1'b1;
    RW    <= 1'b0;

    #1000
    @(negedge clk179)
    CS[0] <= 1'b0;
    CS[1] <= 1'b1;
    RW    <= 1'b0;
    A     <= 4'b0001;
    @(posedge clk179)#30
    A     <= 4'b1100;
    @(negedge clk179)
    CS[0] <= 1'b1;
    CS[1] <= 1'b1;
    RW    <= 1'b0;

    #1000
    @(negedge clk179)
    CS[0] <= 1'b0;
    CS[1] <= 1'b1;
    RW    <= 1'b0;
    A     <= 4'b0010;
    @(posedge clk179)#30
    A     <= 4'b1100;
    @(negedge clk179)
    CS[0] <= 1'b1;
    CS[1] <= 1'b1;
    RW    <= 1'b0;

    #1000
    @(negedge clk179)
    CS[0] <= 1'b0;
    CS[1] <= 1'b1;
    RW    <= 1'b0;
    A     <= 4'b0011;
    @(posedge clk179)#30
    A     <= 4'b1100;
    @(negedge clk179)
    CS[0] <= 1'b1;
    CS[1] <= 1'b1;
    RW    <= 1'b0;

    #1000
    @(negedge clk179)
    CS[0] <= 1'b0;
    CS[1] <= 1'b1;
    RW    <= 1'b0;
    A     <= 4'b0100;
    @(posedge clk179)#30
    A     <= 4'b1100;
    @(negedge clk179)
    CS[0] <= 1'b1;
    CS[1] <= 1'b1;
    RW    <= 1'b0;

    #1000
    @(negedge clk179)
    CS[0] <= 1'b0;
    CS[1] <= 1'b1;
    RW    <= 1'b0;
    A     <= 4'b0101;
    @(posedge clk179)#30
    A     <= 4'b1100;
    @(negedge clk179)
    CS[0] <= 1'b1;
    CS[1] <= 1'b1;
    RW    <= 1'b0;

    #1000
    @(negedge clk179)
    CS[0] <= 1'b0;
    CS[1] <= 1'b1;
    RW    <= 1'b0;
    A     <= 4'b0110;
    @(posedge clk179)#30
    A     <= 4'b1100;
    @(negedge clk179)
    CS[0] <= 1'b1;
    CS[1] <= 1'b1;
    RW    <= 1'b0;

    #1000
    @(negedge clk179)
    CS[0] <= 1'b0;
    CS[1] <= 1'b1;
    RW    <= 1'b0;
    A     <= 4'b0111;
    @(posedge clk179)#30
    A     <= 4'b1100;
    @(negedge clk179)
    CS[0] <= 1'b1;
    CS[1] <= 1'b1;
    RW    <= 1'b0;

    #1000
    @(negedge clk179)
    CS[0] <= 1'b0;
    CS[1] <= 1'b1;
    RW    <= 1'b0;
    A     <= 4'b1000;
    @(posedge clk179)#30
    A     <= 4'b1100;
    @(negedge clk179)
    CS[0] <= 1'b1;
    CS[1] <= 1'b1;
    RW    <= 1'b0;

    #1000
    @(negedge clk179)
    CS[0] <= 1'b0;
    CS[1] <= 1'b1;
    RW    <= 1'b0;
    A     <= 4'b1001;
    @(posedge clk179)#30
    A     <= 4'b1100;
    @(negedge clk179)
    CS[0] <= 1'b1;
    CS[1] <= 1'b1;
    RW    <= 1'b0;

    #1000
    @(negedge clk179)
    CS[0] <= 1'b0;
    CS[1] <= 1'b1;
    RW    <= 1'b0;
    A     <= 4'b1010;
    @(posedge clk179)#30
    A     <= 4'b1100;
    @(negedge clk179)
    CS[0] <= 1'b1;
    CS[1] <= 1'b1;
    RW    <= 1'b0;

    #1000
    @(negedge clk179)
    CS[0] <= 1'b0;
    CS[1] <= 1'b1;
    RW    <= 1'b0;
    A     <= 4'b1011;
    @(posedge clk179)#30
    A     <= 4'b1100;
    @(negedge clk179)
    CS[0] <= 1'b1;
    CS[1] <= 1'b1;
    RW    <= 1'b0;

    #1000
    @(negedge clk179)
    CS[0] <= 1'b0;
    CS[1] <= 1'b1;
    RW    <= 1'b0;
    A     <= 4'b1101;
    @(posedge clk179)#30
    A     <= 4'b1100;
    @(negedge clk179)
    CS[0] <= 1'b1;
    CS[1] <= 1'b1;
    RW    <= 1'b0;

    #1000
    @(negedge clk179)
    CS[0] <= 1'b0;
    CS[1] <= 1'b1;
    RW    <= 1'b0;
    A     <= 4'b1110;
    @(posedge clk179)#30
    A     <= 4'b1100;
    @(negedge clk179)
    CS[0] <= 1'b1;
    CS[1] <= 1'b1;
    RW    <= 1'b0;

    #1000
    @(negedge clk179)
    CS[0] <= 1'b0;
    CS[1] <= 1'b1;
    RW    <= 1'b0;
    A     <= 4'b1111;
    @(posedge clk179)#30
    A     <= 4'b1100;
    @(negedge clk179)
    CS[0] <= 1'b1;
    CS[1] <= 1'b1;
    RW    <= 1'b0;

    //Read functions.
    #3000;
    @(posedge clk179)#30
    CS[0] <= 1'b0;
    CS[1] <= 1'b1;
    RW    <= 1'b1;
    A     <= 4'b1100;

    @(negedge clk179)
    A <= 4'b0000;
    @(posedge clk179)#30
    A <= 4'b1100;
    @(negedge clk179)
    A <= 4'b0001;
    @(posedge clk179)#30
    A <= 4'b1100;
    @(negedge clk179)
    A <= 4'b0010;
    @(posedge clk179)#30
    A <= 4'b1100;
    @(negedge clk179)
    A <= 4'b0011;
    @(posedge clk179)#30
    A <= 4'b1100;
    @(negedge clk179)
    A <= 4'b0100;
    @(posedge clk179)#30
    A <= 4'b1100;
    @(negedge clk179)
    A <= 4'b0101;
    @(posedge clk179)#30
    A <= 4'b1100;
    @(negedge clk179)
    A <= 4'b0100;
    @(posedge clk179)#30
    A <= 4'b1100;
    @(negedge clk179)
    A <= 4'b0101;
    @(posedge clk179)#30
    A <= 4'b1100;
    @(negedge clk179)
    A <= 4'b0110;
    @(posedge clk179)#30
    A <= 4'b1100;
    @(negedge clk179)
    A <= 4'b0111;
    @(posedge clk179)#30
    A <= 4'b1100;
    @(negedge clk179)
    A <= 4'b1000;
    @(posedge clk179)#30
    A <= 4'b1100;
    @(negedge clk179)
    A <= 4'b1001;
    @(posedge clk179)#30
    A <= 4'b1100;
    @(negedge clk179)
    A <= 4'b1010;
    @(posedge clk179)#30
    A <= 4'b1100;
    @(negedge clk179)
    A <= 4'b1101;
    @(posedge clk179)#30
    A <= 4'b1100;
    @(negedge clk179)
    A <= 4'b1110;
    @(posedge clk179)#30
    A <= 4'b1100;
    @(negedge clk179)
    A <= 4'b1111;
    @(posedge clk179)#30
    A <= 4'b1100;

    #10000
    $stop;
    //----------------------------------------------------------------------------------------------

    end
endmodule
