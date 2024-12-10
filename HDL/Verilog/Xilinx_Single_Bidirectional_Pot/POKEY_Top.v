`timescale 1ns / 1ps

module POKEY_Top
(
    //Main clocks.
    /*
    //**********For use with a high frequency system clock**********
    input sysclk,
    input clk179,
    //**************************************************************
    */
    
    //*****************For use with Atari PCB clock*****************
    input clk,
    //**************************************************************

    //Read/write and enable signals.
    input [1:0]cs,
    input rw,

    //IRQ.
    output irq,

    //Data and address lines.
    inout [7:0]d,
    input [3:0]a,

    //Digital audio out.
    output reg [5:0]audio,

    //Potentiometer signals.
    inout [7:0]p,
    output dump,

    //Keyboard scan signals.
    output [5:0]k,
    input [2:1]kr,

    //Serial port signals.
    input sid,
    input bclki,
    output bclko,
    output sod,
    output oclk,
    
    //Dalat bus enable
    output en
);

    //clock and enable signals.
    wire enn, enp;
    
    /*
    //**********For use with a high frequency system clock**********
    wire clk;
    reg  [2:0] pren = 3'b000;
    reg  [2:0] prep = 3'b000;
    reg  [3:0]Aint;
    reg  [7:0]Dataw;
    //**************************************************************
    */
    
    //*****************For use with Atari PCB clock*****************
    wire [7:0]Dataw;
    wire [3:0]Aint;
    //**************************************************************
    
    wire [7:0]pint;
    wire [7:0]Datar;
    wire readEn;
    wire Addr0w, Addr1w, Addr2w, Addr3w, Addr4w, Addr5w, Addr6w, Addr7w,
         Addr8w, Addr9w, AddrAw, AddrBw, AddrDw, AddrEw, AddrFw;
    wire [7:0]Data0r, Data1r, Data2r, Data3r, Data4r, Data5r, Data6r,
         Data7r, Data8r, Data9r, DataAr, DataDr, DataEr, DataFr;
    
    //Audio signals.
    wire [3:0]AUD1, AUD2, AUD3, AUD4;
    reg  [4:0]AUD12, AUD34;
    
    //Frequency control signals.
    wire [4:1]Timer;
    wire resyncTwoTones, resyncSerClk, rstAudPhase;
    
    //Audio control signals.
    wire [2:0]poly4, poly5, poly17;
    
    //SKCTLS signals.
    wire [7:0]SKCTLS;
    wire init;
    
    //AUDCTL signals.
    wire sel15Khz, disHiFltr2, disHiFltr1, ch4Bits16, ch2Bits16, 
         enFastClk3, enFastClk1, sel9bitPoly;
         
    //Clock generator signals.
    wire audClock, keybClk;
    
    //Polynomial signals.
    wire poly4bit, poly5bit, poly917bit;
    
    //SKSTAT signals.
    wire sdiOvrun, keyOvrun, setFramer, kShift, keyDown, sdiBusy, siDelay;
    
    //IRQ signals.
    wire setBreak, setKey, setSdiCompl, setSdoCompl, sdoFinish;
    
    //Serial signals.
    reg sidInt;
    
    //////////////////////////////////////Top Level Circuits///////////////////////////////////////

    /*
    //**********For use with a high frequency system clock**********
    //Turn the 12MHz clock into a 60MHz clock.
    clk_wiz_0 clk_0(.clk_out1(clk), .clk_in1(sysclk));

    //Enable pulse generation.
    always@(negedge clk) begin
        pren[0] <= clk179;
        pren[1] <= pren[0];
        pren[2] <= pren[1];
    end
    
    always@(posedge clk) begin
        prep[0] <= clk179;
        prep[1] <= prep[0];
        prep[2] <= prep[1];
    end
    
    assign enn = ~pren[1] &  pren[2];
    assign enp =  prep[1] & ~prep[2];
    
    //retime the address bits.
    always @(posedge clk179) begin
        Aint <= a;
    end
    
    //Retime input data bits.
    always @(negedge clk179) begin
        Dataw <= d;
    end
    //**************************************************************
    */
    
    //*****************For use with Atari PCB clock*****************
    assign enn   = 1'b1;
    assign enp   = 1'b1;
    assign Aint  = a;
    assign Dataw = d;
    //**************************************************************
    
    //Assign outout data bits.
    assign d = (readEn == 1'b1) ? Datar : 8'bzzzzzzzz;
    
    //Assign data bus enable.
    assign en = ~(~cs[0] & cs[1]);
    
    //Assign POT data bits.
    assign p = (dump == 1'b1) ? 8'b00000000 : 8'bzzzzzzzz;
    assign pint = ~p;
    
    //Metastability serial register.
    always @(negedge clk) begin
        sidInt <= sid;
    end
    
    //Add all the audio signals together.
    always @(posedge clk) begin
        AUD12 <= {1'b0, AUD1}  + {1'b0, AUD2};  
        AUD34 <= {1'b0, AUD3}  + {1'b0, AUD4};    
        audio <= {1'b0, AUD34} + {1'b0, AUD12};
    end
    
    ///////////////////////////////////POKEY Registers and Cores///////////////////////////////////
    
    //IO core.
    IO_core _io_core(enp, clk, rw, cs, Aint, Data0r, Data1r, Data2r, Data3r, Data4r, Data5r,
                     Data6r, Data7r, Data8r, Data9r, DataAr, DataDr, DataEr, DataFr, Datar,
                     readEn, Addr0w, Addr1w, Addr2w, Addr3w, Addr4w, Addr5w, Addr6w, Addr7w,
                     Addr8w, Addr9w, AddrAw, AddrBw, AddrDw, AddrEw, AddrFw);    
    
    //Serial and keyboard control register.
    SKCTLS_reg _skctls_reg(enn, clk, AddrFw, Dataw, SKCTLS, init);
    
    //Audio control register.
    AUDCTL_reg _audctl_reg(enn, clk, Addr8w, Dataw, sel15Khz, disHiFltr2, disHiFltr1,
                           ch4Bits16, ch2Bits16, enFastClk3, enFastClk1, sel9bitPoly);
    
    //Serial and keyboard status register.
    SKSTAT_reg _skstat_reg(enn, clk, sdiOvrun, keyOvrun, setFramer, kShift,
                           keyDown, sdiBusy, siDelay, AddrAw, DataFr);

    //IRQ core.
    IRQ_core _irq_core(enn, enp, clk, AddrEw, Dataw, setBreak, setKey, setSdiCompl, setSdoCompl,
                       sdoFinish, Timer[4], Timer[2], Timer[1], irq, DataEr, keyOvrun, sdiOvrun);
    
    //Clock generator core.
    clock_gen_core _clock_gen_core(enn, clk, init, sel15Khz, audClock, keybClk);
    
    //Polynomial core.
    poly_core _poly_core(enn, clk, init, sel9bitPoly, DataAr, poly4bit, poly5bit, poly917bit);
    
    //Potentiometer core.
    POT_core _pot_core(enn, enp, clk, AddrBw, SKCTLS[2], keybClk, pint, dump, Data0r,
                       Data1r, Data2r, Data3r, Data4r, Data5r, Data6r, Data7r, Data8r);

    //Keyboard core.
    KEY_core _key_core(enn, enp, clk, keybClk, kr, SKCTLS[1:0], setKey,
                       kShift, setBreak, keyDown, Data9r, k);

    //Frequency control core.
    freq_control _freq_control(enn, enp, clk, audClock, Dataw, Addr0w, Addr2w, Addr4w, Addr6w,
                               Addr9w, enFastClk1, enFastClk3, ch2Bits16, ch4Bits16,
                               resyncTwoTones, resyncSerClk, Timer, rstAudPhase);

    //Audio control channel 1.
    aud_control_hp _aud1(enn, clk, Dataw, Addr1w, poly4bit, poly5bit, poly917bit, Timer[1],
                         rstAudPhase, disHiFltr1, Timer[3], AUD1, poly4[0], poly5[0], poly17[0]);
    
    //Audio control channel 2.
    aud_control_hp _aud2(enn, clk, Dataw, Addr3w, poly4[0], poly5[0], poly17[0], Timer[2],
                         rstAudPhase, disHiFltr2, Timer[4], AUD2, poly4[1], poly5[1], poly17[1]);
    
    //Audio control channel 3.
    aud_control _aud3(enn, clk, Dataw, Addr5w, poly4[1], poly5[1], poly17[1], Timer[3],
                      rstAudPhase, AUD3, poly4[2], poly5[2], poly17[2]);
                      
    //Audio control channel 4.
    aud_control _aud4(.enn(enn), .clk(clk), .D(Dataw), .AUDC(Addr7w), .poly4In(poly4[2]),
                      .poly5In(poly5[2]), .poly17In(poly17[2]), .Timer(Timer[4]),
                      .rstAudPhase(rstAudPhase), .AUD(AUD4), .poly4Out(), .poly5Out(),
                      .poly17Out());

    //Serial core.
    SER_core _ser_core(enn, enp, clk, Dataw, SKCTLS[7:3], sidInt, AddrDw, init, Timer[1],
                       Timer[2], Timer[4], bclki, bclko, oclk, sod, siDelay, setFramer,
                       setSdiCompl, sdiBusy, resyncSerClk, resyncTwoTones, sdoFinish,
                       setSdoCompl, DataDr);
endmodule
