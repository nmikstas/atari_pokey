// Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2020.2 (win64) Build 3064766 Wed Nov 18 09:12:45 MST 2020
// Date        : Sun Sep 29 15:01:18 2024
// Host        : LAPTOP-DTPKTC7I running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               D:/work/Arcade+Projects/atari_pokey/FPGA/Prototype/Prototype/Prototype.sim/sim_1/synth/func/xsim/tb_POKEY_Top_func_synth.v
// Design      : POKEY_Top
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module AUDCTL_reg
   (sel15Khz,
    disHiFltr2,
    disHiFltr1,
    ch4Bits16,
    ch2Bits16,
    enFastClk3,
    enFastClk1,
    sel9bitPoly,
    D,
    enFastClk1_reg_0,
    Q,
    clk_out,
    disHiFltr2_reg_0,
    disHiFltr1_reg_0,
    swDelay);
  output sel15Khz;
  output disHiFltr2;
  output disHiFltr1;
  output ch4Bits16;
  output ch2Bits16;
  output enFastClk3;
  output enFastClk1;
  output sel9bitPoly;
  output [0:0]D;
  input enFastClk1_reg_0;
  input [5:0]Q;
  input clk_out;
  input disHiFltr2_reg_0;
  input disHiFltr1_reg_0;
  input swDelay;

  wire [0:0]D;
  wire [5:0]Q;
  wire ch2Bits16;
  wire ch4Bits16;
  wire clk_out;
  wire disHiFltr1;
  wire disHiFltr1_reg_0;
  wire disHiFltr2;
  wire disHiFltr2_reg_0;
  wire enFastClk1;
  wire enFastClk1_reg_0;
  wire enFastClk3;
  wire sel15Khz;
  wire sel9bitPoly;
  wire swDelay;

  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    ch2Bits16_reg
       (.C(clk_out),
        .CE(enFastClk1_reg_0),
        .D(Q[2]),
        .Q(ch2Bits16),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    ch4Bits16_reg
       (.C(clk_out),
        .CE(enFastClk1_reg_0),
        .D(Q[1]),
        .Q(ch4Bits16),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    disHiFltr1_reg
       (.C(clk_out),
        .CE(enFastClk1_reg_0),
        .D(disHiFltr1_reg_0),
        .Q(disHiFltr1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    disHiFltr2_reg
       (.C(clk_out),
        .CE(enFastClk1_reg_0),
        .D(disHiFltr2_reg_0),
        .Q(disHiFltr2),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    enFastClk1_reg
       (.C(clk_out),
        .CE(enFastClk1_reg_0),
        .D(Q[4]),
        .Q(enFastClk1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    enFastClk3_reg
       (.C(clk_out),
        .CE(enFastClk1_reg_0),
        .D(Q[3]),
        .Q(enFastClk3),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \norsDelayed[1]_i_1 
       (.I0(sel9bitPoly),
        .I1(swDelay),
        .O(D));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    sel15Khz_reg
       (.C(clk_out),
        .CE(enFastClk1_reg_0),
        .D(Q[0]),
        .Q(sel15Khz),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    sel9bitPoly_reg
       (.C(clk_out),
        .CE(enFastClk1_reg_0),
        .D(Q[5]),
        .Q(sel9bitPoly),
        .R(1'b0));
endmodule

module IO_core
   (enp,
    \DataFQ_reg[4]_0 ,
    E,
    Q,
    nDout,
    p_2_in,
    nDout_0,
    nDout_1,
    \AQ_reg[1]_0 ,
    nDout_2,
    \AQ_reg[1]_1 ,
    \AQ_reg[3]_0 ,
    \AQ_reg[3]_1 ,
    p_18_in,
    \AQ_reg[1]_2 ,
    \AQ_reg[3]_2 ,
    \AQ_reg[3]_3 ,
    \DataFQ_reg[4]_1 ,
    d_OBUF,
    \AQ_reg[3]_4 ,
    \AQ_reg[3]_5 ,
    \AQ_reg[3]_6 ,
    clk_out,
    \DataFQ_reg[4]_2 ,
    enn,
    qnor5,
    qnor4,
    qnor3,
    qreset,
    \Data0Q_reg[7]_0 ,
    rw_IBUF,
    cs_IBUF,
    \Data0Q_reg[7]_1 ,
    \Data1Q_reg[7]_0 ,
    \Data2Q_reg[7]_0 ,
    \Data3Q_reg[7]_0 ,
    \Data4Q_reg[7]_0 ,
    \Data5Q_reg[7]_0 ,
    \Data6Q_reg[7]_0 ,
    \Data7Q_reg[7]_0 ,
    D,
    \Data9Q_reg[7]_0 ,
    \DataAQ_reg[7]_0 ,
    \DataDQ_reg[7]_0 ,
    \DataEQ_reg[7]_0 ,
    keyQ_1,
    ithisState,
    \Ar_reg[3]_0 );
  output enp;
  output [0:0]\DataFQ_reg[4]_0 ;
  output [0:0]E;
  output [0:0]Q;
  output nDout;
  output p_2_in;
  output nDout_0;
  output nDout_1;
  output \AQ_reg[1]_0 ;
  output nDout_2;
  output [0:0]\AQ_reg[1]_1 ;
  output [0:0]\AQ_reg[3]_0 ;
  output [0:0]\AQ_reg[3]_1 ;
  output p_18_in;
  output [0:0]\AQ_reg[1]_2 ;
  output [0:0]\AQ_reg[3]_2 ;
  output [0:0]\AQ_reg[3]_3 ;
  output \DataFQ_reg[4]_1 ;
  output [7:0]d_OBUF;
  output \AQ_reg[3]_4 ;
  output \AQ_reg[3]_5 ;
  output \AQ_reg[3]_6 ;
  input clk_out;
  input [1:0]\DataFQ_reg[4]_2 ;
  input enn;
  input qnor5;
  input qnor4;
  input qnor3;
  input qreset;
  input [1:0]\Data0Q_reg[7]_0 ;
  input rw_IBUF;
  input [1:0]cs_IBUF;
  input [7:0]\Data0Q_reg[7]_1 ;
  input [7:0]\Data1Q_reg[7]_0 ;
  input [7:0]\Data2Q_reg[7]_0 ;
  input [7:0]\Data3Q_reg[7]_0 ;
  input [7:0]\Data4Q_reg[7]_0 ;
  input [7:0]\Data5Q_reg[7]_0 ;
  input [7:0]\Data6Q_reg[7]_0 ;
  input [7:0]\Data7Q_reg[7]_0 ;
  input [7:0]D;
  input [7:0]\Data9Q_reg[7]_0 ;
  input [7:0]\DataAQ_reg[7]_0 ;
  input [7:0]\DataDQ_reg[7]_0 ;
  input [7:0]\DataEQ_reg[7]_0 ;
  input keyQ_1;
  input ithisState;
  input [3:0]\Ar_reg[3]_0 ;

  wire AQ;
  wire \AQ_reg[1]_0 ;
  wire [0:0]\AQ_reg[1]_1 ;
  wire [0:0]\AQ_reg[1]_2 ;
  wire [0:0]\AQ_reg[3]_0 ;
  wire [0:0]\AQ_reg[3]_1 ;
  wire [0:0]\AQ_reg[3]_2 ;
  wire [0:0]\AQ_reg[3]_3 ;
  wire \AQ_reg[3]_4 ;
  wire \AQ_reg[3]_5 ;
  wire \AQ_reg[3]_6 ;
  wire \AQ_reg_n_0_[0] ;
  wire [3:0]Ar;
  wire [3:0]\Ar_reg[3]_0 ;
  wire [7:0]D;
  wire [7:0]Data0Q;
  wire [1:0]\Data0Q_reg[7]_0 ;
  wire [7:0]\Data0Q_reg[7]_1 ;
  wire [7:0]Data1Q;
  wire [7:0]\Data1Q_reg[7]_0 ;
  wire [7:0]Data2Q;
  wire [7:0]\Data2Q_reg[7]_0 ;
  wire [7:0]Data3Q;
  wire [7:0]\Data3Q_reg[7]_0 ;
  wire [7:0]Data4Q;
  wire [7:0]\Data4Q_reg[7]_0 ;
  wire [7:0]Data5Q;
  wire [7:0]\Data5Q_reg[7]_0 ;
  wire [7:0]Data6Q;
  wire [7:0]\Data6Q_reg[7]_0 ;
  wire [7:0]Data7Q;
  wire [7:0]\Data7Q_reg[7]_0 ;
  wire [7:0]Data8Q;
  wire [7:0]Data9Q;
  wire [7:0]\Data9Q_reg[7]_0 ;
  wire [7:0]DataAQ;
  wire [7:0]\DataAQ_reg[7]_0 ;
  wire [7:0]DataDQ;
  wire [7:0]\DataDQ_reg[7]_0 ;
  wire [7:0]DataEQ;
  wire [7:0]\DataEQ_reg[7]_0 ;
  wire [7:1]DataFQ;
  wire [0:0]\DataFQ_reg[4]_0 ;
  wire \DataFQ_reg[4]_1 ;
  wire [1:0]\DataFQ_reg[4]_2 ;
  wire [7:5]DataFr;
  wire [0:0]E;
  wire [0:0]Q;
  wire clk_out;
  wire [1:0]cs_IBUF;
  wire \d_IOBUF[0]_inst_i_2_n_0 ;
  wire \d_IOBUF[0]_inst_i_3_n_0 ;
  wire \d_IOBUF[0]_inst_i_4_n_0 ;
  wire \d_IOBUF[0]_inst_i_5_n_0 ;
  wire \d_IOBUF[1]_inst_i_2_n_0 ;
  wire \d_IOBUF[1]_inst_i_3_n_0 ;
  wire \d_IOBUF[1]_inst_i_4_n_0 ;
  wire \d_IOBUF[1]_inst_i_5_n_0 ;
  wire \d_IOBUF[1]_inst_i_6_n_0 ;
  wire \d_IOBUF[1]_inst_i_7_n_0 ;
  wire \d_IOBUF[2]_inst_i_2_n_0 ;
  wire \d_IOBUF[2]_inst_i_3_n_0 ;
  wire \d_IOBUF[2]_inst_i_4_n_0 ;
  wire \d_IOBUF[2]_inst_i_5_n_0 ;
  wire \d_IOBUF[2]_inst_i_6_n_0 ;
  wire \d_IOBUF[2]_inst_i_7_n_0 ;
  wire \d_IOBUF[3]_inst_i_2_n_0 ;
  wire \d_IOBUF[3]_inst_i_3_n_0 ;
  wire \d_IOBUF[3]_inst_i_4_n_0 ;
  wire \d_IOBUF[3]_inst_i_5_n_0 ;
  wire \d_IOBUF[3]_inst_i_6_n_0 ;
  wire \d_IOBUF[3]_inst_i_7_n_0 ;
  wire \d_IOBUF[4]_inst_i_2_n_0 ;
  wire \d_IOBUF[4]_inst_i_3_n_0 ;
  wire \d_IOBUF[4]_inst_i_4_n_0 ;
  wire \d_IOBUF[4]_inst_i_5_n_0 ;
  wire \d_IOBUF[4]_inst_i_6_n_0 ;
  wire \d_IOBUF[4]_inst_i_7_n_0 ;
  wire \d_IOBUF[5]_inst_i_2_n_0 ;
  wire \d_IOBUF[5]_inst_i_3_n_0 ;
  wire \d_IOBUF[5]_inst_i_4_n_0 ;
  wire \d_IOBUF[5]_inst_i_5_n_0 ;
  wire \d_IOBUF[5]_inst_i_6_n_0 ;
  wire \d_IOBUF[5]_inst_i_7_n_0 ;
  wire \d_IOBUF[6]_inst_i_2_n_0 ;
  wire \d_IOBUF[6]_inst_i_3_n_0 ;
  wire \d_IOBUF[6]_inst_i_4_n_0 ;
  wire \d_IOBUF[6]_inst_i_5_n_0 ;
  wire \d_IOBUF[6]_inst_i_6_n_0 ;
  wire \d_IOBUF[6]_inst_i_7_n_0 ;
  wire \d_IOBUF[7]_inst_i_3_n_0 ;
  wire \d_IOBUF[7]_inst_i_4_n_0 ;
  wire \d_IOBUF[7]_inst_i_6_n_0 ;
  wire \d_IOBUF[7]_inst_i_7_n_0 ;
  wire \d_IOBUF[7]_inst_i_8_n_0 ;
  wire \d_IOBUF[7]_inst_i_9_n_0 ;
  wire [7:0]d_OBUF;
  wire enn;
  wire enp;
  wire ithisState;
  wire keyQ_1;
  wire nDout;
  wire nDout_0;
  wire nDout_1;
  wire nDout_2;
  wire p_0_in16_in;
  wire p_0_in22_in;
  wire p_18_in;
  wire p_2_in;
  wire qnor3;
  wire qnor4;
  wire qnor5;
  wire qreset;
  wire rw_IBUF;
  wire writeEn2;
  wire writeEn2_i_1_n_0;

  LUT5 #(
    .INIT(32'h00000020)) 
    \AQ[3]_i_1 
       (.I0(\Data0Q_reg[7]_0 [0]),
        .I1(\Data0Q_reg[7]_0 [1]),
        .I2(cs_IBUF[1]),
        .I3(cs_IBUF[0]),
        .I4(rw_IBUF),
        .O(AQ));
  FDRE #(
    .INIT(1'b0)) 
    \AQ_reg[0] 
       (.C(clk_out),
        .CE(AQ),
        .D(\Ar_reg[3]_0 [0]),
        .Q(\AQ_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AQ_reg[1] 
       (.C(clk_out),
        .CE(AQ),
        .D(\Ar_reg[3]_0 [1]),
        .Q(p_0_in22_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AQ_reg[2] 
       (.C(clk_out),
        .CE(AQ),
        .D(\Ar_reg[3]_0 [2]),
        .Q(p_0_in16_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AQ_reg[3] 
       (.C(clk_out),
        .CE(AQ),
        .D(\Ar_reg[3]_0 [3]),
        .Q(Q),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Ar_reg[0] 
       (.C(clk_out),
        .CE(enp),
        .D(\Ar_reg[3]_0 [0]),
        .Q(Ar[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Ar_reg[1] 
       (.C(clk_out),
        .CE(enp),
        .D(\Ar_reg[3]_0 [1]),
        .Q(Ar[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Ar_reg[2] 
       (.C(clk_out),
        .CE(enp),
        .D(\Ar_reg[3]_0 [2]),
        .Q(Ar[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Ar_reg[3] 
       (.C(clk_out),
        .CE(enp),
        .D(\Ar_reg[3]_0 [3]),
        .Q(Ar[3]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    \Data0Q[7]_i_1 
       (.I0(\Data0Q_reg[7]_0 [0]),
        .I1(\Data0Q_reg[7]_0 [1]),
        .O(enp));
  FDRE #(
    .INIT(1'b0)) 
    \Data0Q_reg[0] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data0Q_reg[7]_1 [0]),
        .Q(Data0Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data0Q_reg[1] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data0Q_reg[7]_1 [1]),
        .Q(Data0Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data0Q_reg[2] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data0Q_reg[7]_1 [2]),
        .Q(Data0Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data0Q_reg[3] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data0Q_reg[7]_1 [3]),
        .Q(Data0Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data0Q_reg[4] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data0Q_reg[7]_1 [4]),
        .Q(Data0Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data0Q_reg[5] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data0Q_reg[7]_1 [5]),
        .Q(Data0Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data0Q_reg[6] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data0Q_reg[7]_1 [6]),
        .Q(Data0Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data0Q_reg[7] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data0Q_reg[7]_1 [7]),
        .Q(Data0Q[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data1Q_reg[0] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data1Q_reg[7]_0 [0]),
        .Q(Data1Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data1Q_reg[1] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data1Q_reg[7]_0 [1]),
        .Q(Data1Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data1Q_reg[2] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data1Q_reg[7]_0 [2]),
        .Q(Data1Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data1Q_reg[3] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data1Q_reg[7]_0 [3]),
        .Q(Data1Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data1Q_reg[4] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data1Q_reg[7]_0 [4]),
        .Q(Data1Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data1Q_reg[5] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data1Q_reg[7]_0 [5]),
        .Q(Data1Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data1Q_reg[6] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data1Q_reg[7]_0 [6]),
        .Q(Data1Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data1Q_reg[7] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data1Q_reg[7]_0 [7]),
        .Q(Data1Q[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data2Q_reg[0] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data2Q_reg[7]_0 [0]),
        .Q(Data2Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data2Q_reg[1] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data2Q_reg[7]_0 [1]),
        .Q(Data2Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data2Q_reg[2] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data2Q_reg[7]_0 [2]),
        .Q(Data2Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data2Q_reg[3] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data2Q_reg[7]_0 [3]),
        .Q(Data2Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data2Q_reg[4] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data2Q_reg[7]_0 [4]),
        .Q(Data2Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data2Q_reg[5] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data2Q_reg[7]_0 [5]),
        .Q(Data2Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data2Q_reg[6] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data2Q_reg[7]_0 [6]),
        .Q(Data2Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data2Q_reg[7] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data2Q_reg[7]_0 [7]),
        .Q(Data2Q[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data3Q_reg[0] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data3Q_reg[7]_0 [0]),
        .Q(Data3Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data3Q_reg[1] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data3Q_reg[7]_0 [1]),
        .Q(Data3Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data3Q_reg[2] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data3Q_reg[7]_0 [2]),
        .Q(Data3Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data3Q_reg[3] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data3Q_reg[7]_0 [3]),
        .Q(Data3Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data3Q_reg[4] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data3Q_reg[7]_0 [4]),
        .Q(Data3Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data3Q_reg[5] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data3Q_reg[7]_0 [5]),
        .Q(Data3Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data3Q_reg[6] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data3Q_reg[7]_0 [6]),
        .Q(Data3Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data3Q_reg[7] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data3Q_reg[7]_0 [7]),
        .Q(Data3Q[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data4Q_reg[0] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data4Q_reg[7]_0 [0]),
        .Q(Data4Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data4Q_reg[1] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data4Q_reg[7]_0 [1]),
        .Q(Data4Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data4Q_reg[2] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data4Q_reg[7]_0 [2]),
        .Q(Data4Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data4Q_reg[3] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data4Q_reg[7]_0 [3]),
        .Q(Data4Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data4Q_reg[4] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data4Q_reg[7]_0 [4]),
        .Q(Data4Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data4Q_reg[5] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data4Q_reg[7]_0 [5]),
        .Q(Data4Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data4Q_reg[6] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data4Q_reg[7]_0 [6]),
        .Q(Data4Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data4Q_reg[7] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data4Q_reg[7]_0 [7]),
        .Q(Data4Q[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data5Q_reg[0] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data5Q_reg[7]_0 [0]),
        .Q(Data5Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data5Q_reg[1] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data5Q_reg[7]_0 [1]),
        .Q(Data5Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data5Q_reg[2] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data5Q_reg[7]_0 [2]),
        .Q(Data5Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data5Q_reg[3] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data5Q_reg[7]_0 [3]),
        .Q(Data5Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data5Q_reg[4] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data5Q_reg[7]_0 [4]),
        .Q(Data5Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data5Q_reg[5] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data5Q_reg[7]_0 [5]),
        .Q(Data5Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data5Q_reg[6] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data5Q_reg[7]_0 [6]),
        .Q(Data5Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data5Q_reg[7] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data5Q_reg[7]_0 [7]),
        .Q(Data5Q[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data6Q_reg[0] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data6Q_reg[7]_0 [0]),
        .Q(Data6Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data6Q_reg[1] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data6Q_reg[7]_0 [1]),
        .Q(Data6Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data6Q_reg[2] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data6Q_reg[7]_0 [2]),
        .Q(Data6Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data6Q_reg[3] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data6Q_reg[7]_0 [3]),
        .Q(Data6Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data6Q_reg[4] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data6Q_reg[7]_0 [4]),
        .Q(Data6Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data6Q_reg[5] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data6Q_reg[7]_0 [5]),
        .Q(Data6Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data6Q_reg[6] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data6Q_reg[7]_0 [6]),
        .Q(Data6Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data6Q_reg[7] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data6Q_reg[7]_0 [7]),
        .Q(Data6Q[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data7Q_reg[0] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data7Q_reg[7]_0 [0]),
        .Q(Data7Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data7Q_reg[1] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data7Q_reg[7]_0 [1]),
        .Q(Data7Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data7Q_reg[2] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data7Q_reg[7]_0 [2]),
        .Q(Data7Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data7Q_reg[3] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data7Q_reg[7]_0 [3]),
        .Q(Data7Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data7Q_reg[4] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data7Q_reg[7]_0 [4]),
        .Q(Data7Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data7Q_reg[5] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data7Q_reg[7]_0 [5]),
        .Q(Data7Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data7Q_reg[6] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data7Q_reg[7]_0 [6]),
        .Q(Data7Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data7Q_reg[7] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data7Q_reg[7]_0 [7]),
        .Q(Data7Q[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data8Q_reg[0] 
       (.C(clk_out),
        .CE(enp),
        .D(D[0]),
        .Q(Data8Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data8Q_reg[1] 
       (.C(clk_out),
        .CE(enp),
        .D(D[1]),
        .Q(Data8Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data8Q_reg[2] 
       (.C(clk_out),
        .CE(enp),
        .D(D[2]),
        .Q(Data8Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data8Q_reg[3] 
       (.C(clk_out),
        .CE(enp),
        .D(D[3]),
        .Q(Data8Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data8Q_reg[4] 
       (.C(clk_out),
        .CE(enp),
        .D(D[4]),
        .Q(Data8Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data8Q_reg[5] 
       (.C(clk_out),
        .CE(enp),
        .D(D[5]),
        .Q(Data8Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data8Q_reg[6] 
       (.C(clk_out),
        .CE(enp),
        .D(D[6]),
        .Q(Data8Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data8Q_reg[7] 
       (.C(clk_out),
        .CE(enp),
        .D(D[7]),
        .Q(Data8Q[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data9Q_reg[0] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data9Q_reg[7]_0 [0]),
        .Q(Data9Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data9Q_reg[1] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data9Q_reg[7]_0 [1]),
        .Q(Data9Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data9Q_reg[2] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data9Q_reg[7]_0 [2]),
        .Q(Data9Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data9Q_reg[3] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data9Q_reg[7]_0 [3]),
        .Q(Data9Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data9Q_reg[4] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data9Q_reg[7]_0 [4]),
        .Q(Data9Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data9Q_reg[5] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data9Q_reg[7]_0 [5]),
        .Q(Data9Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data9Q_reg[6] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data9Q_reg[7]_0 [6]),
        .Q(Data9Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Data9Q_reg[7] 
       (.C(clk_out),
        .CE(enp),
        .D(\Data9Q_reg[7]_0 [7]),
        .Q(Data9Q[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataAQ_reg[0] 
       (.C(clk_out),
        .CE(enp),
        .D(\DataAQ_reg[7]_0 [0]),
        .Q(DataAQ[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataAQ_reg[1] 
       (.C(clk_out),
        .CE(enp),
        .D(\DataAQ_reg[7]_0 [1]),
        .Q(DataAQ[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataAQ_reg[2] 
       (.C(clk_out),
        .CE(enp),
        .D(\DataAQ_reg[7]_0 [2]),
        .Q(DataAQ[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataAQ_reg[3] 
       (.C(clk_out),
        .CE(enp),
        .D(\DataAQ_reg[7]_0 [3]),
        .Q(DataAQ[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataAQ_reg[4] 
       (.C(clk_out),
        .CE(enp),
        .D(\DataAQ_reg[7]_0 [4]),
        .Q(DataAQ[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataAQ_reg[5] 
       (.C(clk_out),
        .CE(enp),
        .D(\DataAQ_reg[7]_0 [5]),
        .Q(DataAQ[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataAQ_reg[6] 
       (.C(clk_out),
        .CE(enp),
        .D(\DataAQ_reg[7]_0 [6]),
        .Q(DataAQ[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataAQ_reg[7] 
       (.C(clk_out),
        .CE(enp),
        .D(\DataAQ_reg[7]_0 [7]),
        .Q(DataAQ[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataDQ_reg[0] 
       (.C(clk_out),
        .CE(enp),
        .D(\DataDQ_reg[7]_0 [0]),
        .Q(DataDQ[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataDQ_reg[1] 
       (.C(clk_out),
        .CE(enp),
        .D(\DataDQ_reg[7]_0 [1]),
        .Q(DataDQ[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataDQ_reg[2] 
       (.C(clk_out),
        .CE(enp),
        .D(\DataDQ_reg[7]_0 [2]),
        .Q(DataDQ[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataDQ_reg[3] 
       (.C(clk_out),
        .CE(enp),
        .D(\DataDQ_reg[7]_0 [3]),
        .Q(DataDQ[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataDQ_reg[4] 
       (.C(clk_out),
        .CE(enp),
        .D(\DataDQ_reg[7]_0 [4]),
        .Q(DataDQ[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataDQ_reg[5] 
       (.C(clk_out),
        .CE(enp),
        .D(\DataDQ_reg[7]_0 [5]),
        .Q(DataDQ[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataDQ_reg[6] 
       (.C(clk_out),
        .CE(enp),
        .D(\DataDQ_reg[7]_0 [6]),
        .Q(DataDQ[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataDQ_reg[7] 
       (.C(clk_out),
        .CE(enp),
        .D(\DataDQ_reg[7]_0 [7]),
        .Q(DataDQ[7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataEQ_reg[0] 
       (.C(clk_out),
        .CE(enp),
        .D(\DataEQ_reg[7]_0 [0]),
        .Q(DataEQ[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataEQ_reg[1] 
       (.C(clk_out),
        .CE(enp),
        .D(\DataEQ_reg[7]_0 [1]),
        .Q(DataEQ[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataEQ_reg[2] 
       (.C(clk_out),
        .CE(enp),
        .D(\DataEQ_reg[7]_0 [2]),
        .Q(DataEQ[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataEQ_reg[3] 
       (.C(clk_out),
        .CE(enp),
        .D(\DataEQ_reg[7]_0 [3]),
        .Q(DataEQ[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataEQ_reg[4] 
       (.C(clk_out),
        .CE(enp),
        .D(\DataEQ_reg[7]_0 [4]),
        .Q(DataEQ[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataEQ_reg[5] 
       (.C(clk_out),
        .CE(enp),
        .D(\DataEQ_reg[7]_0 [5]),
        .Q(DataEQ[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataEQ_reg[6] 
       (.C(clk_out),
        .CE(enp),
        .D(\DataEQ_reg[7]_0 [6]),
        .Q(DataEQ[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataEQ_reg[7] 
       (.C(clk_out),
        .CE(enp),
        .D(\DataEQ_reg[7]_0 [7]),
        .Q(DataEQ[7]),
        .R(1'b0));
  LUT2 #(
    .INIT(4'hE)) 
    \DataFQ[5]_i_1 
       (.I0(p_2_in),
        .I1(qnor3),
        .O(DataFr[5]));
  LUT2 #(
    .INIT(4'hE)) 
    \DataFQ[6]_i_1 
       (.I0(p_2_in),
        .I1(qnor4),
        .O(DataFr[6]));
  LUT2 #(
    .INIT(4'hE)) 
    \DataFQ[7]_i_1 
       (.I0(p_2_in),
        .I1(qnor5),
        .O(DataFr[7]));
  LUT6 #(
    .INIT(64'hAAAAAAAEAAAAAAAA)) 
    \DataFQ[7]_i_2 
       (.I0(qreset),
        .I1(p_0_in22_in),
        .I2(writeEn2),
        .I3(\AQ_reg_n_0_[0] ),
        .I4(p_0_in16_in),
        .I5(Q),
        .O(p_2_in));
  FDRE #(
    .INIT(1'b0)) 
    \DataFQ_reg[1] 
       (.C(clk_out),
        .CE(enp),
        .D(ithisState),
        .Q(DataFQ[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataFQ_reg[2] 
       (.C(clk_out),
        .CE(enp),
        .D(keyQ_1),
        .Q(DataFQ[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataFQ_reg[3] 
       (.C(clk_out),
        .CE(enp),
        .D(\DataFQ_reg[4]_2 [0]),
        .Q(DataFQ[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataFQ_reg[4] 
       (.C(clk_out),
        .CE(enp),
        .D(\DataFQ_reg[4]_2 [1]),
        .Q(\DataFQ_reg[4]_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataFQ_reg[5] 
       (.C(clk_out),
        .CE(enp),
        .D(DataFr[5]),
        .Q(DataFQ[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataFQ_reg[6] 
       (.C(clk_out),
        .CE(enp),
        .D(DataFr[6]),
        .Q(DataFQ[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \DataFQ_reg[7] 
       (.C(clk_out),
        .CE(enp),
        .D(DataFr[7]),
        .Q(DataFQ[7]),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0008000000000000)) 
    \Dirq[7]_i_1 
       (.I0(enn),
        .I1(p_0_in22_in),
        .I2(writeEn2),
        .I3(\AQ_reg_n_0_[0] ),
        .I4(p_0_in16_in),
        .I5(Q),
        .O(E));
  LUT6 #(
    .INIT(64'h0800000000000000)) 
    \SKCTLS[7]_i_1 
       (.I0(enn),
        .I1(p_0_in22_in),
        .I2(writeEn2),
        .I3(\AQ_reg_n_0_[0] ),
        .I4(p_0_in16_in),
        .I5(Q),
        .O(\AQ_reg[1]_1 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \d_IOBUF[0]_inst_i_1 
       (.I0(\d_IOBUF[0]_inst_i_2_n_0 ),
        .I1(\d_IOBUF[0]_inst_i_3_n_0 ),
        .I2(Ar[3]),
        .I3(\d_IOBUF[0]_inst_i_4_n_0 ),
        .I4(Ar[2]),
        .I5(\d_IOBUF[0]_inst_i_5_n_0 ),
        .O(d_OBUF[0]));
  LUT4 #(
    .INIT(16'hFCBB)) 
    \d_IOBUF[0]_inst_i_2 
       (.I0(DataEQ[0]),
        .I1(Ar[1]),
        .I2(DataDQ[0]),
        .I3(Ar[0]),
        .O(\d_IOBUF[0]_inst_i_2_n_0 ));
  LUT5 #(
    .INIT(32'hFCBBFC88)) 
    \d_IOBUF[0]_inst_i_3 
       (.I0(DataAQ[0]),
        .I1(Ar[1]),
        .I2(Data9Q[0]),
        .I3(Ar[0]),
        .I4(Data8Q[0]),
        .O(\d_IOBUF[0]_inst_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \d_IOBUF[0]_inst_i_4 
       (.I0(Data7Q[0]),
        .I1(Data6Q[0]),
        .I2(Ar[1]),
        .I3(Data5Q[0]),
        .I4(Ar[0]),
        .I5(Data4Q[0]),
        .O(\d_IOBUF[0]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \d_IOBUF[0]_inst_i_5 
       (.I0(Data3Q[0]),
        .I1(Data2Q[0]),
        .I2(Ar[1]),
        .I3(Data1Q[0]),
        .I4(Ar[0]),
        .I5(Data0Q[0]),
        .O(\d_IOBUF[0]_inst_i_5_n_0 ));
  MUXF8 \d_IOBUF[1]_inst_i_1 
       (.I0(\d_IOBUF[1]_inst_i_2_n_0 ),
        .I1(\d_IOBUF[1]_inst_i_3_n_0 ),
        .O(d_OBUF[1]),
        .S(Ar[3]));
  MUXF7 \d_IOBUF[1]_inst_i_2 
       (.I0(\d_IOBUF[1]_inst_i_4_n_0 ),
        .I1(\d_IOBUF[1]_inst_i_5_n_0 ),
        .O(\d_IOBUF[1]_inst_i_2_n_0 ),
        .S(Ar[2]));
  MUXF7 \d_IOBUF[1]_inst_i_3 
       (.I0(\d_IOBUF[1]_inst_i_6_n_0 ),
        .I1(\d_IOBUF[1]_inst_i_7_n_0 ),
        .O(\d_IOBUF[1]_inst_i_3_n_0 ),
        .S(Ar[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \d_IOBUF[1]_inst_i_4 
       (.I0(Data3Q[1]),
        .I1(Data2Q[1]),
        .I2(Ar[1]),
        .I3(Data1Q[1]),
        .I4(Ar[0]),
        .I5(Data0Q[1]),
        .O(\d_IOBUF[1]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \d_IOBUF[1]_inst_i_5 
       (.I0(Data7Q[1]),
        .I1(Data6Q[1]),
        .I2(Ar[1]),
        .I3(Data5Q[1]),
        .I4(Ar[0]),
        .I5(Data4Q[1]),
        .O(\d_IOBUF[1]_inst_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFCBBFC88)) 
    \d_IOBUF[1]_inst_i_6 
       (.I0(DataAQ[1]),
        .I1(Ar[1]),
        .I2(Data9Q[1]),
        .I3(Ar[0]),
        .I4(Data8Q[1]),
        .O(\d_IOBUF[1]_inst_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hAFA0CFCF)) 
    \d_IOBUF[1]_inst_i_7 
       (.I0(DataFQ[1]),
        .I1(DataEQ[1]),
        .I2(Ar[1]),
        .I3(DataDQ[1]),
        .I4(Ar[0]),
        .O(\d_IOBUF[1]_inst_i_7_n_0 ));
  MUXF8 \d_IOBUF[2]_inst_i_1 
       (.I0(\d_IOBUF[2]_inst_i_2_n_0 ),
        .I1(\d_IOBUF[2]_inst_i_3_n_0 ),
        .O(d_OBUF[2]),
        .S(Ar[3]));
  MUXF7 \d_IOBUF[2]_inst_i_2 
       (.I0(\d_IOBUF[2]_inst_i_4_n_0 ),
        .I1(\d_IOBUF[2]_inst_i_5_n_0 ),
        .O(\d_IOBUF[2]_inst_i_2_n_0 ),
        .S(Ar[2]));
  MUXF7 \d_IOBUF[2]_inst_i_3 
       (.I0(\d_IOBUF[2]_inst_i_6_n_0 ),
        .I1(\d_IOBUF[2]_inst_i_7_n_0 ),
        .O(\d_IOBUF[2]_inst_i_3_n_0 ),
        .S(Ar[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \d_IOBUF[2]_inst_i_4 
       (.I0(Data3Q[2]),
        .I1(Data2Q[2]),
        .I2(Ar[1]),
        .I3(Data1Q[2]),
        .I4(Ar[0]),
        .I5(Data0Q[2]),
        .O(\d_IOBUF[2]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \d_IOBUF[2]_inst_i_5 
       (.I0(Data7Q[2]),
        .I1(Data6Q[2]),
        .I2(Ar[1]),
        .I3(Data5Q[2]),
        .I4(Ar[0]),
        .I5(Data4Q[2]),
        .O(\d_IOBUF[2]_inst_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFCBBFC88)) 
    \d_IOBUF[2]_inst_i_6 
       (.I0(DataAQ[2]),
        .I1(Ar[1]),
        .I2(Data9Q[2]),
        .I3(Ar[0]),
        .I4(Data8Q[2]),
        .O(\d_IOBUF[2]_inst_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hAFA0CFCF)) 
    \d_IOBUF[2]_inst_i_7 
       (.I0(DataFQ[2]),
        .I1(DataEQ[2]),
        .I2(Ar[1]),
        .I3(DataDQ[2]),
        .I4(Ar[0]),
        .O(\d_IOBUF[2]_inst_i_7_n_0 ));
  MUXF8 \d_IOBUF[3]_inst_i_1 
       (.I0(\d_IOBUF[3]_inst_i_2_n_0 ),
        .I1(\d_IOBUF[3]_inst_i_3_n_0 ),
        .O(d_OBUF[3]),
        .S(Ar[3]));
  MUXF7 \d_IOBUF[3]_inst_i_2 
       (.I0(\d_IOBUF[3]_inst_i_4_n_0 ),
        .I1(\d_IOBUF[3]_inst_i_5_n_0 ),
        .O(\d_IOBUF[3]_inst_i_2_n_0 ),
        .S(Ar[2]));
  MUXF7 \d_IOBUF[3]_inst_i_3 
       (.I0(\d_IOBUF[3]_inst_i_6_n_0 ),
        .I1(\d_IOBUF[3]_inst_i_7_n_0 ),
        .O(\d_IOBUF[3]_inst_i_3_n_0 ),
        .S(Ar[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \d_IOBUF[3]_inst_i_4 
       (.I0(Data3Q[3]),
        .I1(Data2Q[3]),
        .I2(Ar[1]),
        .I3(Data1Q[3]),
        .I4(Ar[0]),
        .I5(Data0Q[3]),
        .O(\d_IOBUF[3]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \d_IOBUF[3]_inst_i_5 
       (.I0(Data7Q[3]),
        .I1(Data6Q[3]),
        .I2(Ar[1]),
        .I3(Data5Q[3]),
        .I4(Ar[0]),
        .I5(Data4Q[3]),
        .O(\d_IOBUF[3]_inst_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFCBBFC88)) 
    \d_IOBUF[3]_inst_i_6 
       (.I0(DataAQ[3]),
        .I1(Ar[1]),
        .I2(Data9Q[3]),
        .I3(Ar[0]),
        .I4(Data8Q[3]),
        .O(\d_IOBUF[3]_inst_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hAFA0CFCF)) 
    \d_IOBUF[3]_inst_i_7 
       (.I0(DataFQ[3]),
        .I1(DataEQ[3]),
        .I2(Ar[1]),
        .I3(DataDQ[3]),
        .I4(Ar[0]),
        .O(\d_IOBUF[3]_inst_i_7_n_0 ));
  MUXF8 \d_IOBUF[4]_inst_i_1 
       (.I0(\d_IOBUF[4]_inst_i_2_n_0 ),
        .I1(\d_IOBUF[4]_inst_i_3_n_0 ),
        .O(d_OBUF[4]),
        .S(Ar[3]));
  MUXF7 \d_IOBUF[4]_inst_i_2 
       (.I0(\d_IOBUF[4]_inst_i_4_n_0 ),
        .I1(\d_IOBUF[4]_inst_i_5_n_0 ),
        .O(\d_IOBUF[4]_inst_i_2_n_0 ),
        .S(Ar[2]));
  MUXF7 \d_IOBUF[4]_inst_i_3 
       (.I0(\d_IOBUF[4]_inst_i_6_n_0 ),
        .I1(\d_IOBUF[4]_inst_i_7_n_0 ),
        .O(\d_IOBUF[4]_inst_i_3_n_0 ),
        .S(Ar[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \d_IOBUF[4]_inst_i_4 
       (.I0(Data3Q[4]),
        .I1(Data2Q[4]),
        .I2(Ar[1]),
        .I3(Data1Q[4]),
        .I4(Ar[0]),
        .I5(Data0Q[4]),
        .O(\d_IOBUF[4]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \d_IOBUF[4]_inst_i_5 
       (.I0(Data7Q[4]),
        .I1(Data6Q[4]),
        .I2(Ar[1]),
        .I3(Data5Q[4]),
        .I4(Ar[0]),
        .I5(Data4Q[4]),
        .O(\d_IOBUF[4]_inst_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFCBBFC88)) 
    \d_IOBUF[4]_inst_i_6 
       (.I0(DataAQ[4]),
        .I1(Ar[1]),
        .I2(Data9Q[4]),
        .I3(Ar[0]),
        .I4(Data8Q[4]),
        .O(\d_IOBUF[4]_inst_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hAFA0CFCF)) 
    \d_IOBUF[4]_inst_i_7 
       (.I0(\DataFQ_reg[4]_0 ),
        .I1(DataEQ[4]),
        .I2(Ar[1]),
        .I3(DataDQ[4]),
        .I4(Ar[0]),
        .O(\d_IOBUF[4]_inst_i_7_n_0 ));
  MUXF8 \d_IOBUF[5]_inst_i_1 
       (.I0(\d_IOBUF[5]_inst_i_2_n_0 ),
        .I1(\d_IOBUF[5]_inst_i_3_n_0 ),
        .O(d_OBUF[5]),
        .S(Ar[3]));
  MUXF7 \d_IOBUF[5]_inst_i_2 
       (.I0(\d_IOBUF[5]_inst_i_4_n_0 ),
        .I1(\d_IOBUF[5]_inst_i_5_n_0 ),
        .O(\d_IOBUF[5]_inst_i_2_n_0 ),
        .S(Ar[2]));
  MUXF7 \d_IOBUF[5]_inst_i_3 
       (.I0(\d_IOBUF[5]_inst_i_6_n_0 ),
        .I1(\d_IOBUF[5]_inst_i_7_n_0 ),
        .O(\d_IOBUF[5]_inst_i_3_n_0 ),
        .S(Ar[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \d_IOBUF[5]_inst_i_4 
       (.I0(Data3Q[5]),
        .I1(Data2Q[5]),
        .I2(Ar[1]),
        .I3(Data1Q[5]),
        .I4(Ar[0]),
        .I5(Data0Q[5]),
        .O(\d_IOBUF[5]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \d_IOBUF[5]_inst_i_5 
       (.I0(Data7Q[5]),
        .I1(Data6Q[5]),
        .I2(Ar[1]),
        .I3(Data5Q[5]),
        .I4(Ar[0]),
        .I5(Data4Q[5]),
        .O(\d_IOBUF[5]_inst_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFCBBFC88)) 
    \d_IOBUF[5]_inst_i_6 
       (.I0(DataAQ[5]),
        .I1(Ar[1]),
        .I2(Data9Q[5]),
        .I3(Ar[0]),
        .I4(Data8Q[5]),
        .O(\d_IOBUF[5]_inst_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hAFA0CFCF)) 
    \d_IOBUF[5]_inst_i_7 
       (.I0(DataFQ[5]),
        .I1(DataEQ[5]),
        .I2(Ar[1]),
        .I3(DataDQ[5]),
        .I4(Ar[0]),
        .O(\d_IOBUF[5]_inst_i_7_n_0 ));
  MUXF8 \d_IOBUF[6]_inst_i_1 
       (.I0(\d_IOBUF[6]_inst_i_2_n_0 ),
        .I1(\d_IOBUF[6]_inst_i_3_n_0 ),
        .O(d_OBUF[6]),
        .S(Ar[3]));
  MUXF7 \d_IOBUF[6]_inst_i_2 
       (.I0(\d_IOBUF[6]_inst_i_4_n_0 ),
        .I1(\d_IOBUF[6]_inst_i_5_n_0 ),
        .O(\d_IOBUF[6]_inst_i_2_n_0 ),
        .S(Ar[2]));
  MUXF7 \d_IOBUF[6]_inst_i_3 
       (.I0(\d_IOBUF[6]_inst_i_6_n_0 ),
        .I1(\d_IOBUF[6]_inst_i_7_n_0 ),
        .O(\d_IOBUF[6]_inst_i_3_n_0 ),
        .S(Ar[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \d_IOBUF[6]_inst_i_4 
       (.I0(Data3Q[6]),
        .I1(Data2Q[6]),
        .I2(Ar[1]),
        .I3(Data1Q[6]),
        .I4(Ar[0]),
        .I5(Data0Q[6]),
        .O(\d_IOBUF[6]_inst_i_4_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \d_IOBUF[6]_inst_i_5 
       (.I0(Data7Q[6]),
        .I1(Data6Q[6]),
        .I2(Ar[1]),
        .I3(Data5Q[6]),
        .I4(Ar[0]),
        .I5(Data4Q[6]),
        .O(\d_IOBUF[6]_inst_i_5_n_0 ));
  LUT5 #(
    .INIT(32'hFCBBFC88)) 
    \d_IOBUF[6]_inst_i_6 
       (.I0(DataAQ[6]),
        .I1(Ar[1]),
        .I2(Data9Q[6]),
        .I3(Ar[0]),
        .I4(Data8Q[6]),
        .O(\d_IOBUF[6]_inst_i_6_n_0 ));
  LUT5 #(
    .INIT(32'hAFA0CFCF)) 
    \d_IOBUF[6]_inst_i_7 
       (.I0(DataFQ[6]),
        .I1(DataEQ[6]),
        .I2(Ar[1]),
        .I3(DataDQ[6]),
        .I4(Ar[0]),
        .O(\d_IOBUF[6]_inst_i_7_n_0 ));
  MUXF8 \d_IOBUF[7]_inst_i_1 
       (.I0(\d_IOBUF[7]_inst_i_3_n_0 ),
        .I1(\d_IOBUF[7]_inst_i_4_n_0 ),
        .O(d_OBUF[7]),
        .S(Ar[3]));
  MUXF7 \d_IOBUF[7]_inst_i_3 
       (.I0(\d_IOBUF[7]_inst_i_6_n_0 ),
        .I1(\d_IOBUF[7]_inst_i_7_n_0 ),
        .O(\d_IOBUF[7]_inst_i_3_n_0 ),
        .S(Ar[2]));
  MUXF7 \d_IOBUF[7]_inst_i_4 
       (.I0(\d_IOBUF[7]_inst_i_8_n_0 ),
        .I1(\d_IOBUF[7]_inst_i_9_n_0 ),
        .O(\d_IOBUF[7]_inst_i_4_n_0 ),
        .S(Ar[2]));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \d_IOBUF[7]_inst_i_6 
       (.I0(Data3Q[7]),
        .I1(Data2Q[7]),
        .I2(Ar[1]),
        .I3(Data1Q[7]),
        .I4(Ar[0]),
        .I5(Data0Q[7]),
        .O(\d_IOBUF[7]_inst_i_6_n_0 ));
  LUT6 #(
    .INIT(64'hAFA0CFCFAFA0C0C0)) 
    \d_IOBUF[7]_inst_i_7 
       (.I0(Data7Q[7]),
        .I1(Data6Q[7]),
        .I2(Ar[1]),
        .I3(Data5Q[7]),
        .I4(Ar[0]),
        .I5(Data4Q[7]),
        .O(\d_IOBUF[7]_inst_i_7_n_0 ));
  LUT5 #(
    .INIT(32'hFCBBFC88)) 
    \d_IOBUF[7]_inst_i_8 
       (.I0(DataAQ[7]),
        .I1(Ar[1]),
        .I2(Data9Q[7]),
        .I3(Ar[0]),
        .I4(Data8Q[7]),
        .O(\d_IOBUF[7]_inst_i_8_n_0 ));
  LUT5 #(
    .INIT(32'hAFA0CFCF)) 
    \d_IOBUF[7]_inst_i_9 
       (.I0(DataFQ[7]),
        .I1(DataEQ[7]),
        .I2(Ar[1]),
        .I3(DataDQ[7]),
        .I4(Ar[0]),
        .O(\d_IOBUF[7]_inst_i_9_n_0 ));
  LUT6 #(
    .INIT(64'h0020000000000000)) 
    \data[7]_i_1 
       (.I0(enn),
        .I1(Q),
        .I2(p_0_in22_in),
        .I3(writeEn2),
        .I4(\AQ_reg_n_0_[0] ),
        .I5(p_0_in16_in),
        .O(\AQ_reg[3]_0 ));
  LUT6 #(
    .INIT(64'h0000000000200000)) 
    \data[7]_i_1__0 
       (.I0(enn),
        .I1(Q),
        .I2(p_0_in22_in),
        .I3(writeEn2),
        .I4(\AQ_reg_n_0_[0] ),
        .I5(p_0_in16_in),
        .O(\AQ_reg[3]_1 ));
  LUT6 #(
    .INIT(64'h0002000000000000)) 
    \data[7]_i_1__1 
       (.I0(enn),
        .I1(Q),
        .I2(p_0_in22_in),
        .I3(writeEn2),
        .I4(\AQ_reg_n_0_[0] ),
        .I5(p_0_in16_in),
        .O(\AQ_reg[3]_2 ));
  LUT6 #(
    .INIT(64'h0000000000020000)) 
    \data[7]_i_1__2 
       (.I0(enn),
        .I1(Q),
        .I2(p_0_in22_in),
        .I3(writeEn2),
        .I4(\AQ_reg_n_0_[0] ),
        .I5(p_0_in16_in),
        .O(\AQ_reg[3]_3 ));
  LUT1 #(
    .INIT(2'h1)) 
    delay2_i_1
       (.I0(\DataFQ_reg[4]_0 ),
        .O(\DataFQ_reg[4]_1 ));
  LUT6 #(
    .INIT(64'h0000002000000000)) 
    nDout_i_1
       (.I0(enn),
        .I1(Q),
        .I2(p_0_in22_in),
        .I3(writeEn2),
        .I4(\AQ_reg_n_0_[0] ),
        .I5(p_0_in16_in),
        .O(nDout));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    nDout_i_1__0
       (.I0(enn),
        .I1(Q),
        .I2(p_0_in22_in),
        .I3(writeEn2),
        .I4(\AQ_reg_n_0_[0] ),
        .I5(p_0_in16_in),
        .O(nDout_0));
  LUT6 #(
    .INIT(64'h0000000000000020)) 
    nDout_i_1__1
       (.I0(enn),
        .I1(Q),
        .I2(p_0_in16_in),
        .I3(\AQ_reg_n_0_[0] ),
        .I4(writeEn2),
        .I5(p_0_in22_in),
        .O(nDout_1));
  LUT6 #(
    .INIT(64'h0000000000000002)) 
    nDout_i_1__2
       (.I0(enn),
        .I1(Q),
        .I2(p_0_in22_in),
        .I3(writeEn2),
        .I4(\AQ_reg_n_0_[0] ),
        .I5(p_0_in16_in),
        .O(nDout_2));
  LUT4 #(
    .INIT(16'hFFDF)) 
    nor1_i_2
       (.I0(p_0_in22_in),
        .I1(writeEn2),
        .I2(\AQ_reg_n_0_[0] ),
        .I3(p_0_in16_in),
        .O(p_18_in));
  LUT6 #(
    .INIT(64'h0200000000000000)) 
    \oQD[7]_i_1 
       (.I0(enn),
        .I1(p_0_in22_in),
        .I2(writeEn2),
        .I3(\AQ_reg_n_0_[0] ),
        .I4(p_0_in16_in),
        .I5(Q),
        .O(\AQ_reg[1]_2 ));
  LUT5 #(
    .INIT(32'h00000020)) 
    presync_i_1
       (.I0(Q),
        .I1(p_0_in16_in),
        .I2(\AQ_reg_n_0_[0] ),
        .I3(writeEn2),
        .I4(p_0_in22_in),
        .O(\AQ_reg[3]_6 ));
  LUT5 #(
    .INIT(32'h00020000)) 
    qreset_i_1
       (.I0(Q),
        .I1(p_0_in16_in),
        .I2(\AQ_reg_n_0_[0] ),
        .I3(writeEn2),
        .I4(p_0_in22_in),
        .O(\AQ_reg[3]_4 ));
  LUT5 #(
    .INIT(32'h00000080)) 
    sdoDloaded_i_2
       (.I0(Q),
        .I1(p_0_in16_in),
        .I2(\AQ_reg_n_0_[0] ),
        .I3(writeEn2),
        .I4(p_0_in22_in),
        .O(\AQ_reg[3]_5 ));
  LUT6 #(
    .INIT(64'h0000000200000000)) 
    sel15Khz_i_1
       (.I0(enn),
        .I1(p_0_in22_in),
        .I2(writeEn2),
        .I3(\AQ_reg_n_0_[0] ),
        .I4(p_0_in16_in),
        .I5(Q),
        .O(\AQ_reg[1]_0 ));
  LUT3 #(
    .INIT(8'hEF)) 
    writeEn2_i_1
       (.I0(rw_IBUF),
        .I1(cs_IBUF[0]),
        .I2(cs_IBUF[1]),
        .O(writeEn2_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    writeEn2_reg
       (.C(clk_out),
        .CE(enp),
        .D(writeEn2_i_1_n_0),
        .Q(writeEn2),
        .R(1'b0));
endmodule

module IRQ_core
   (irq_OBUF,
    nor4,
    nor3,
    \nirqst_reg[7]_0 ,
    D,
    \Dirq_reg[3]_0 ,
    enn,
    qnor3_reg_0,
    clk_out,
    enp,
    setKey,
    p_2_in,
    qnor4,
    setSdiCompl,
    qnor3,
    Q,
    setSdoCompl,
    setBreak,
    \Dirq_reg[7]_0 ,
    E,
    \nirqst_reg[3]_0 );
  output irq_OBUF;
  output nor4;
  output nor3;
  output [7:0]\nirqst_reg[7]_0 ;
  output [7:0]D;
  output [0:0]\Dirq_reg[3]_0 ;
  input enn;
  input qnor3_reg_0;
  input clk_out;
  input enp;
  input setKey;
  input p_2_in;
  input qnor4;
  input setSdiCompl;
  input qnor3;
  input [2:0]Q;
  input setSdoCompl;
  input setBreak;
  input [7:0]\Dirq_reg[7]_0 ;
  input [0:0]E;
  input [0:0]\nirqst_reg[3]_0 ;

  wire [7:0]D;
  wire [0:0]\Dirq_reg[3]_0 ;
  wire [7:0]\Dirq_reg[7]_0 ;
  wire \Dirq_reg_n_0_[0] ;
  wire \Dirq_reg_n_0_[7] ;
  wire [0:0]E;
  wire IRQ0;
  wire IRQ_i_2_n_0;
  wire [2:0]Q;
  wire clk_out;
  wire enn;
  wire enp;
  wire irq_OBUF;
  wire [0:0]\nirqst_reg[3]_0 ;
  wire [7:0]\nirqst_reg[7]_0 ;
  wire \nirqst_reg_n_0_[0] ;
  wire nor3;
  wire nor4;
  wire p_0_in;
  wire p_11_in;
  wire [7:0]p_13_out;
  wire p_1_in;
  wire p_2_in;
  wire p_2_in_1;
  wire p_3_in;
  wire p_3_in1_in;
  wire p_4_in;
  wire p_5_in;
  wire p_5_in3_in;
  wire p_7_in;
  wire p_9_in;
  wire qnor3;
  wire qnor3_0;
  wire qnor3_reg_0;
  wire qnor4;
  wire setBreak;
  wire setKey;
  wire setSdiCompl;
  wire setSdoCompl;

  LUT1 #(
    .INIT(2'h1)) 
    \DataEQ[0]_i_1 
       (.I0(\nirqst_reg_n_0_[0] ),
        .O(\nirqst_reg[7]_0 [0]));
  LUT1 #(
    .INIT(2'h1)) 
    \DataEQ[1]_i_1 
       (.I0(p_5_in),
        .O(\nirqst_reg[7]_0 [1]));
  LUT1 #(
    .INIT(2'h1)) 
    \DataEQ[2]_i_1 
       (.I0(p_4_in),
        .O(\nirqst_reg[7]_0 [2]));
  LUT1 #(
    .INIT(2'h1)) 
    \DataEQ[4]_i_1 
       (.I0(p_3_in),
        .O(\nirqst_reg[7]_0 [4]));
  LUT1 #(
    .INIT(2'h1)) 
    \DataEQ[5]_i_1 
       (.I0(p_2_in_1),
        .O(\nirqst_reg[7]_0 [5]));
  LUT1 #(
    .INIT(2'h1)) 
    \DataEQ[6]_i_1 
       (.I0(p_0_in),
        .O(\nirqst_reg[7]_0 [6]));
  LUT1 #(
    .INIT(2'h1)) 
    \DataEQ[7]_i_1 
       (.I0(p_1_in),
        .O(\nirqst_reg[7]_0 [7]));
  LUT1 #(
    .INIT(2'h1)) 
    \Dirq[0]_i_1 
       (.I0(\Dirq_reg[7]_0 [0]),
        .O(D[0]));
  LUT1 #(
    .INIT(2'h1)) 
    \Dirq[3]_i_1 
       (.I0(\Dirq_reg[7]_0 [3]),
        .O(D[3]));
  LUT1 #(
    .INIT(2'h1)) 
    \Dirq[4]_i_1 
       (.I0(\Dirq_reg[7]_0 [4]),
        .O(D[4]));
  LUT1 #(
    .INIT(2'h1)) 
    \Dirq[5]_i_1 
       (.I0(\Dirq_reg[7]_0 [5]),
        .O(D[5]));
  LUT1 #(
    .INIT(2'h1)) 
    \Dirq[6]_i_1 
       (.I0(\Dirq_reg[7]_0 [6]),
        .O(D[6]));
  LUT1 #(
    .INIT(2'h1)) 
    \Dirq[7]_i_2 
       (.I0(\Dirq_reg[7]_0 [7]),
        .O(D[7]));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Dirq_reg[0] 
       (.C(clk_out),
        .CE(E),
        .D(D[0]),
        .Q(\Dirq_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Dirq_reg[1] 
       (.C(clk_out),
        .CE(E),
        .D(D[1]),
        .Q(p_3_in1_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Dirq_reg[2] 
       (.C(clk_out),
        .CE(E),
        .D(D[2]),
        .Q(p_5_in3_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Dirq_reg[3] 
       (.C(clk_out),
        .CE(E),
        .D(D[3]),
        .Q(\Dirq_reg[3]_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Dirq_reg[4] 
       (.C(clk_out),
        .CE(E),
        .D(D[4]),
        .Q(p_7_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Dirq_reg[5] 
       (.C(clk_out),
        .CE(E),
        .D(D[5]),
        .Q(p_9_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Dirq_reg[6] 
       (.C(clk_out),
        .CE(E),
        .D(D[6]),
        .Q(p_11_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Dirq_reg[7] 
       (.C(clk_out),
        .CE(E),
        .D(D[7]),
        .Q(\Dirq_reg_n_0_[7] ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hFFFFFFFE)) 
    IRQ_i_1
       (.I0(p_5_in),
        .I1(p_4_in),
        .I2(p_1_in),
        .I3(\nirqst_reg_n_0_[0] ),
        .I4(IRQ_i_2_n_0),
        .O(IRQ0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    IRQ_i_2
       (.I0(p_3_in),
        .I1(qnor3_0),
        .I2(p_0_in),
        .I3(p_2_in_1),
        .O(IRQ_i_2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    IRQ_reg
       (.C(clk_out),
        .CE(enp),
        .D(IRQ0),
        .Q(irq_OBUF),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    disHiFltr1_i_1
       (.I0(\Dirq_reg[7]_0 [2]),
        .O(D[2]));
  LUT1 #(
    .INIT(2'h1)) 
    disHiFltr2_i_1
       (.I0(\Dirq_reg[7]_0 [1]),
        .O(D[1]));
  LUT3 #(
    .INIT(8'h0E)) 
    \nirqst[0]_i_1 
       (.I0(Q[0]),
        .I1(\nirqst_reg_n_0_[0] ),
        .I2(\Dirq_reg_n_0_[0] ),
        .O(p_13_out[0]));
  LUT3 #(
    .INIT(8'h0E)) 
    \nirqst[1]_i_1 
       (.I0(Q[1]),
        .I1(p_5_in),
        .I2(p_3_in1_in),
        .O(p_13_out[1]));
  LUT3 #(
    .INIT(8'h0E)) 
    \nirqst[2]_i_1 
       (.I0(Q[2]),
        .I1(p_4_in),
        .I2(p_5_in3_in),
        .O(p_13_out[2]));
  LUT3 #(
    .INIT(8'h0E)) 
    \nirqst[4]_i_1 
       (.I0(setSdoCompl),
        .I1(p_3_in),
        .I2(p_7_in),
        .O(p_13_out[4]));
  LUT3 #(
    .INIT(8'h0E)) 
    \nirqst[5]_i_1 
       (.I0(setSdiCompl),
        .I1(p_2_in_1),
        .I2(p_9_in),
        .O(p_13_out[5]));
  LUT3 #(
    .INIT(8'h0E)) 
    \nirqst[6]_i_1 
       (.I0(setKey),
        .I1(p_0_in),
        .I2(p_11_in),
        .O(p_13_out[6]));
  LUT3 #(
    .INIT(8'h0E)) 
    \nirqst[7]_i_1 
       (.I0(setBreak),
        .I1(p_1_in),
        .I2(\Dirq_reg_n_0_[7] ),
        .O(p_13_out[7]));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \nirqst_reg[0] 
       (.C(clk_out),
        .CE(enn),
        .D(p_13_out[0]),
        .Q(\nirqst_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \nirqst_reg[1] 
       (.C(clk_out),
        .CE(enn),
        .D(p_13_out[1]),
        .Q(p_5_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \nirqst_reg[2] 
       (.C(clk_out),
        .CE(enn),
        .D(p_13_out[2]),
        .Q(p_4_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \nirqst_reg[3] 
       (.C(clk_out),
        .CE(enn),
        .D(\nirqst_reg[3]_0 ),
        .Q(\nirqst_reg[7]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \nirqst_reg[4] 
       (.C(clk_out),
        .CE(enn),
        .D(p_13_out[4]),
        .Q(p_3_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \nirqst_reg[5] 
       (.C(clk_out),
        .CE(enn),
        .D(p_13_out[5]),
        .Q(p_2_in_1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \nirqst_reg[6] 
       (.C(clk_out),
        .CE(enn),
        .D(p_13_out[6]),
        .Q(p_0_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \nirqst_reg[7] 
       (.C(clk_out),
        .CE(enn),
        .D(p_13_out[7]),
        .Q(p_1_in),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h7770)) 
    qnor3_i_1
       (.I0(p_2_in_1),
        .I1(setSdiCompl),
        .I2(p_2_in),
        .I3(qnor3),
        .O(nor3));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    qnor3_reg
       (.C(clk_out),
        .CE(enn),
        .D(qnor3_reg_0),
        .Q(qnor3_0),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h7770)) 
    qnor4_i_1
       (.I0(p_0_in),
        .I1(setKey),
        .I2(p_2_in),
        .I3(qnor4),
        .O(nor4));
endmodule

module KEY_core
   (keyQ_1,
    setKey,
    setBreak,
    shift_reg_0,
    k_OBUF,
    \D_reg[7]_0 ,
    enn,
    clk_out,
    enp,
    keybClk,
    d15k,
    kr_IBUF,
    Q,
    Q_reg);
  output keyQ_1;
  output setKey;
  output setBreak;
  output [0:0]shift_reg_0;
  output [5:0]k_OBUF;
  output [7:0]\D_reg[7]_0 ;
  input enn;
  input clk_out;
  input enp;
  input keybClk;
  input d15k;
  input [2:1]kr_IBUF;
  input [1:0]Q;
  input [1:0]Q_reg;

  wire [7:0]\D_reg[7]_0 ;
  wire [1:0]Q;
  wire Q_0;
  wire Q_1;
  wire Q_2;
  wire Q_3;
  wire Q_4;
  wire Q_5;
  wire [1:0]Q_reg;
  wire T_0;
  wire T_1;
  wire T_2;
  wire T_3;
  wire T_4;
  wire b0_n_1;
  wire b0_n_2;
  wire c0_n_0;
  wire c0_n_1;
  wire c1_n_0;
  wire c2_n_0;
  wire c3_n_0;
  wire c4_n_0;
  wire c4_n_1;
  wire c5_n_0;
  wire c5_n_1;
  wire clk_out;
  wire control;
  wire d15k;
  wire debComp__5;
  wire enn;
  wire enp;
  wire kShift;
  wire [5:0]k_OBUF;
  wire keyQ_0;
  wire keyQ_1;
  wire keybClk;
  wire [2:1]kr_IBUF;
  wire preBreak;
  wire qLoop;
  wire qMuxOut;
  wire qb0_n_2;
  wire qb0_n_4;
  wire qb1_n_3;
  wire qb2_n_3;
  wire qb3_n_3;
  wire qb4_n_3;
  wire qb5_n_1;
  wire qb5_n_4;
  wire qb5_n_5;
  wire qkeybClk;
  wire setBreak;
  wire setKey;
  wire [0:0]shift_reg_0;

  FDRE #(
    .INIT(1'b0)) 
    \D_reg[0] 
       (.C(clk_out),
        .CE(c5_n_1),
        .D(c0_n_0),
        .Q(\D_reg[7]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \D_reg[1] 
       (.C(clk_out),
        .CE(c5_n_1),
        .D(c1_n_0),
        .Q(\D_reg[7]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \D_reg[2] 
       (.C(clk_out),
        .CE(c5_n_1),
        .D(c2_n_0),
        .Q(\D_reg[7]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \D_reg[3] 
       (.C(clk_out),
        .CE(c5_n_1),
        .D(c3_n_0),
        .Q(\D_reg[7]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \D_reg[4] 
       (.C(clk_out),
        .CE(c5_n_1),
        .D(c4_n_0),
        .Q(\D_reg[7]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \D_reg[5] 
       (.C(clk_out),
        .CE(c5_n_1),
        .D(c5_n_0),
        .Q(\D_reg[7]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \D_reg[6] 
       (.C(clk_out),
        .CE(c5_n_1),
        .D(kShift),
        .Q(\D_reg[7]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \D_reg[7] 
       (.C(clk_out),
        .CE(c5_n_1),
        .D(control),
        .Q(\D_reg[7]_0 [7]),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \DataFQ[3]_i_1 
       (.I0(kShift),
        .O(shift_reg_0));
  cell2p_26 b0
       (.Q(Q[1]),
        .Q_reg(keyQ_1),
        .Q_reg_0(Q_reg),
        .clk_out(clk_out),
        .d15k(d15k),
        .debComp__5(debComp__5),
        .enn(enn),
        .intQ_reg_0(b0_n_1),
        .keyQ_0(keyQ_0),
        .kr_IBUF(kr_IBUF[1]),
        .\prep_reg[1] (b0_n_2));
  cell2p_27 b1
       (.Q(Q[1]),
        .clk_out(clk_out),
        .d15k(d15k),
        .debComp__5(debComp__5),
        .enn(enn),
        .intQ_reg_0(keyQ_1),
        .keyQ_0(keyQ_0),
        .kr_IBUF(kr_IBUF[1]));
  cell4 c0
       (.D(c0_n_0),
        .\D[7]_i_2 (c3_n_0),
        .Q_0(Q_0),
        .Q_3(Q_3),
        .Q_reg_0(c0_n_1),
        .Q_reg_1(b0_n_2),
        .clk_out(clk_out));
  cell4_28 c1
       (.D(c1_n_0),
        .Q_1(Q_1),
        .Q_reg_0(b0_n_2),
        .clk_out(clk_out));
  cell4_29 c2
       (.D(c2_n_0),
        .Q_2(Q_2),
        .Q_reg_0(b0_n_2),
        .clk_out(clk_out));
  cell4_30 c3
       (.D(c3_n_0),
        .Q_3(Q_3),
        .Q_reg_0(b0_n_2),
        .clk_out(clk_out));
  cell4_31 c4
       (.D(c4_n_0),
        .\D[7]_i_2 (c1_n_0),
        .Q_1(Q_1),
        .Q_4(Q_4),
        .Q_reg_0(c4_n_1),
        .Q_reg_1(b0_n_2),
        .clk_out(clk_out));
  cell4_32 c5
       (.D(c5_n_0),
        .\D[7]_i_2_0 (c2_n_0),
        .\D_reg[0] (c0_n_1),
        .\D_reg[0]_0 (c4_n_1),
        .E(c5_n_1),
        .Q(Q[0]),
        .Q_2(Q_2),
        .Q_5(Q_5),
        .Q_reg_0(b0_n_2),
        .clk_out(clk_out),
        .d15k(d15k),
        .debComp__5(debComp__5),
        .enp(enp),
        .keyQ_0(keyQ_0),
        .keyQ_1(keyQ_1),
        .kr_IBUF(kr_IBUF[1]));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    control_reg
       (.C(clk_out),
        .CE(1'b1),
        .D(qb5_n_4),
        .Q(control),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    qLoop_reg
       (.C(clk_out),
        .CE(enn),
        .D(qMuxOut),
        .Q(qLoop),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    qMuxOut_reg
       (.C(clk_out),
        .CE(enp),
        .D(qb5_n_1),
        .Q(qMuxOut),
        .R(1'b0));
  cell3 qb0
       (.Q(Q[1]),
        .Q_0(Q_0),
        .Q_1(Q_1),
        .Q_2(Q_2),
        .Q_3(Q_3),
        .T2_reg_0(qb0_n_4),
        .T_0(T_0),
        .clk_out(clk_out),
        .enn(enn),
        .enp(enp),
        .intQ_reg_0(qb0_n_2),
        .k_OBUF(k_OBUF[0]),
        .qkeybClk(qkeybClk));
  cell6 qb1
       (.Q(Q[1]),
        .Q_1(Q_1),
        .Q_2(Q_2),
        .T1_reg_0(qb1_n_3),
        .T1_reg_1(qb0_n_4),
        .T_0(T_0),
        .T_1(T_1),
        .clk_out(clk_out),
        .enn(enn),
        .enp(enp),
        .k_OBUF(k_OBUF[1]));
  cell3_33 qb2
       (.Q(Q[1]),
        .Q_2(Q_2),
        .Q_3(Q_3),
        .T2_reg_0(qb2_n_3),
        .T2_reg_1(qb1_n_3),
        .T_1(T_1),
        .T_2(T_2),
        .clk_out(clk_out),
        .enn(enn),
        .enp(enp),
        .k_OBUF(k_OBUF[2]));
  cell6_34 qb3
       (.Q(Q[1]),
        .Q_3(Q_3),
        .Q_4(Q_4),
        .T1_reg_0(qb3_n_3),
        .T1_reg_1(qb2_n_3),
        .T_2(T_2),
        .T_3(T_3),
        .clk_out(clk_out),
        .enn(enn),
        .enp(enp),
        .k_OBUF(k_OBUF[3]));
  cell3_35 qb4
       (.D(kShift),
        .Q(Q[1]),
        .Q_4(Q_4),
        .T2_reg_0(qb3_n_3),
        .T_3(T_3),
        .T_4(T_4),
        .clk_out(clk_out),
        .enn(enn),
        .enp(enp),
        .intQ_reg_0(qb4_n_3),
        .k_OBUF(k_OBUF[4]),
        .kr_IBUF(kr_IBUF[2]),
        .shift_reg(qb0_n_2),
        .shift_reg_0(qb5_n_5));
  cell6_36 qb5
       (.D(control),
        .Q(Q[1]),
        .Q_4(Q_4),
        .Q_5(Q_5),
        .T_4(T_4),
        .clk_out(clk_out),
        .control_reg(qb0_n_2),
        .d15k(d15k),
        .enn(enn),
        .enp(enp),
        .intQ_reg_0(qb5_n_4),
        .intQ_reg_1(qb5_n_5),
        .k_OBUF(k_OBUF[5]),
        .kr_IBUF(kr_IBUF[2]),
        .preBreak(preBreak),
        .qLoop(qLoop),
        .qLoop_reg(qb5_n_1));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    qkeybClk_reg
       (.C(clk_out),
        .CE(enn),
        .D(keybClk),
        .Q(qkeybClk),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    setBreak_reg
       (.C(clk_out),
        .CE(enn),
        .D(preBreak),
        .Q(setBreak),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    setKey_reg
       (.C(clk_out),
        .CE(enn),
        .D(b0_n_1),
        .Q(setKey),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    shift_reg
       (.C(clk_out),
        .CE(1'b1),
        .D(qb4_n_3),
        .Q(kShift),
        .R(1'b0));
endmodule

(* NotValidForBitStream *)
module POKEY_Top
   (sysclk,
    clk179,
    cs,
    rw,
    irq,
    d,
    a,
    audio,
    p,
    dump,
    k,
    kr,
    sid,
    bclki,
    bclko,
    sod,
    oclk,
    OE);
  input sysclk;
  input clk179;
  input [1:0]cs;
  input rw;
  output irq;
  inout [7:0]d;
  input [3:0]a;
  output [5:0]audio;
  input [7:0]p;
  output dump;
  output [5:0]k;
  input [2:1]kr;
  input sid;
  input bclki;
  output bclko;
  output sod;
  output oclk;
  output OE;

  wire [7:0]ALLPOT;
  wire [4:0]AUD12;
  wire [4:0]AUD120;
  wire [4:0]AUD34;
  wire [4:0]AUD340;
  wire [3:0]Aint;
  wire D;
  wire [7:0]DataEr;
  wire [4:4]DataFQ;
  wire [4:3]DataFr;
  wire \Dataw_reg_n_0_[0] ;
  wire \Dataw_reg_n_0_[1] ;
  wire \Dataw_reg_n_0_[2] ;
  wire \Dataw_reg_n_0_[4] ;
  wire \Dataw_reg_n_0_[5] ;
  wire \Dataw_reg_n_0_[6] ;
  wire \Dataw_reg_n_0_[7] ;
  wire Dirq;
  wire DshiftOut;
  wire I;
  wire I_6;
  wire OE;
  wire [7:0]POT0;
  wire [7:0]POT1;
  wire [7:0]POT2;
  wire [7:0]POT3;
  wire [7:0]POT4;
  wire [7:0]POT5;
  wire [7:0]POT6;
  wire [7:0]POT7;
  wire [6:0]SKCTLS;
  wire T;
  wire T_5;
  wire [4:1]Timer;
  wire _aud1_n_10;
  wire _aud1_n_11;
  wire _aud1_n_13;
  wire _aud1_n_14;
  wire _aud1_n_8;
  wire _aud1_n_9;
  wire _aud2_n_10;
  wire _aud2_n_11;
  wire _aud2_n_8;
  wire _aud2_n_9;
  wire _aud3_n_10;
  wire _aud3_n_11;
  wire _aud3_n_12;
  wire _aud3_n_14;
  wire _aud3_n_15;
  wire _aud3_n_9;
  wire _aud4_n_7;
  wire _aud4_n_8;
  wire _clock_gen_core_n_4;
  wire _freq_control_n_10;
  wire _freq_control_n_11;
  wire _freq_control_n_7;
  wire _freq_control_n_8;
  wire _freq_control_n_9;
  wire _io_core_n_10;
  wire _io_core_n_17;
  wire _io_core_n_26;
  wire _io_core_n_27;
  wire _io_core_n_28;
  wire _io_core_n_8;
  wire _irq_core_n_11;
  wire _irq_core_n_12;
  wire _irq_core_n_13;
  wire _irq_core_n_14;
  wire _irq_core_n_15;
  wire _irq_core_n_16;
  wire _irq_core_n_17;
  wire _irq_core_n_18;
  wire _irq_core_n_7;
  wire _key_core_n_10;
  wire _key_core_n_11;
  wire _key_core_n_12;
  wire _key_core_n_13;
  wire _key_core_n_14;
  wire _key_core_n_15;
  wire _key_core_n_16;
  wire _key_core_n_17;
  wire _poly_core_n_5;
  wire _ser_core_n_17;
  wire _ser_core_n_18;
  wire _ser_core_n_19;
  wire _ser_core_n_20;
  wire _ser_core_n_21;
  wire _ser_core_n_22;
  wire _ser_core_n_23;
  wire _ser_core_n_24;
  wire _ser_core_n_25;
  wire _skctls_reg_n_14;
  wire _skctls_reg_n_15;
  wire _skctls_reg_n_6;
  wire _skctls_reg_n_8;
  wire [3:0]a;
  wire [3:0]a_IBUF;
  wire audClock;
  wire [5:0]audio;
  wire \audio[0]_i_1_n_0 ;
  wire \audio[1]_i_1_n_0 ;
  wire \audio[2]_i_1_n_0 ;
  wire \audio[3]_i_1_n_0 ;
  wire \audio[4]_i_1_n_0 ;
  wire \audio[5]_i_1_n_0 ;
  wire \audio[5]_i_2_n_0 ;
  wire [5:0]audio_OBUF;
  wire bclki;
  wire bclki_IBUF;
  wire bclko;
  wire bclko_OBUF;
  wire \c11/m__0 ;
  wire \c11/m__0_0 ;
  wire \c11/m__0_2 ;
  wire \c11/m__0_4 ;
  wire ch2Bits16;
  wire ch4Bits16;
  wire clk;
  wire clk179;
  wire clk179_IBUF;
  wire clk179_IBUF_BUFG;
  wire [1:0]cs;
  wire [1:0]cs_IBUF;
  wire [7:0]d;
  wire d15k;
  wire [7:0]d_IBUF;
  wire [7:0]d_OBUF;
  wire \d_TRI[0] ;
  wire data;
  wire data_10;
  wire data_8;
  wire data_9;
  wire disHiFltr1;
  wire disHiFltr2;
  wire dump;
  wire dump_OBUF;
  wire enFastClk1;
  wire enFastClk3;
  wire enn;
  wire enp;
  wire feedback4;
  wire feedback5;
  wire init;
  wire irq;
  wire irq_OBUF;
  wire ithisState;
  wire [5:0]k;
  wire [5:0]k_OBUF;
  wire keyQ_1;
  wire keybClk;
  wire [2:1]kr;
  wire [2:1]kr_IBUF;
  wire lfsr15k0;
  wire lfsr15k0Out;
  wire nor3;
  wire nor30;
  wire nor30__0;
  wire nor30__1;
  wire nor30__2;
  wire nor3_12;
  wire nor4;
  wire nor4_1;
  wire nor4_11;
  wire nor4_3;
  wire nor4_7;
  wire nor5;
  wire [1:1]nors;
  wire oQD;
  wire oclk;
  wire oclk_OBUF;
  wire [7:0]p;
  wire p_0_in;
  wire p_0_in0_in;
  wire p_0_in8_in;
  wire p_18_in;
  wire p_1_in;
  wire p_1_in0_in;
  wire p_2_in;
  wire [3:3]p_2_out;
  wire [7:0]p_IBUF;
  wire poly17_0;
  wire poly17_1;
  wire poly17_2;
  wire poly4_0;
  wire poly4_1;
  wire poly4_2;
  wire poly4bit;
  wire poly5_0;
  wire poly5_1;
  wire poly5_2;
  wire poly5bit;
  wire poly917bit;
  wire preBCLK;
  wire \pren_reg_n_0_[0] ;
  wire \prep_reg_n_0_[0] ;
  wire \prep_reg_n_0_[2] ;
  wire qnor3;
  wire qnor4;
  wire qnor5;
  wire qreset;
  wire readEn;
  wire resync;
  wire resyncInt;
  wire resyncSerClk;
  wire resyncTwoTones;
  wire [7:0]rndNum;
  wire rstDelay;
  wire rw;
  wire rw_IBUF;
  wire sdoFinish;
  wire sel15Khz;
  wire sel9bitPoly;
  wire setBreak;
  wire setKey;
  wire setSdiCompl;
  wire setSdoCompl;
  wire sid;
  wire sid_IBUF;
  wire sod;
  wire sod_OBUF;
  wire swDelay;
  (* IBUF_LOW_PWR *) wire sysclk;
  wire \t1_b7/nDout ;
  wire \t2/muxOut ;
  wire \t2/nQ ;
  wire \t2_b7/nDout ;
  wire \t3_b7/nDout ;
  wire \t4/nQ ;
  wire \t4/nor1 ;
  wire \t4_b7/nDout ;
  wire toneCntrl;

  FDRE #(
    .INIT(1'b0)) 
    \AUD12_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(AUD120[0]),
        .Q(AUD12[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AUD12_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(AUD120[1]),
        .Q(AUD12[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AUD12_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(AUD120[2]),
        .Q(AUD12[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AUD12_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(AUD120[3]),
        .Q(AUD12[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AUD12_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(AUD120[4]),
        .Q(AUD12[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AUD34_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(AUD340[0]),
        .Q(AUD34[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AUD34_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(AUD340[1]),
        .Q(AUD34[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AUD34_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(AUD340[2]),
        .Q(AUD34[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AUD34_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(AUD340[3]),
        .Q(AUD34[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \AUD34_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(AUD340[4]),
        .Q(AUD34[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Aint_reg[0] 
       (.C(clk179_IBUF_BUFG),
        .CE(1'b1),
        .D(a_IBUF[0]),
        .Q(Aint[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Aint_reg[1] 
       (.C(clk179_IBUF_BUFG),
        .CE(1'b1),
        .D(a_IBUF[1]),
        .Q(Aint[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Aint_reg[2] 
       (.C(clk179_IBUF_BUFG),
        .CE(1'b1),
        .D(a_IBUF[2]),
        .Q(Aint[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Aint_reg[3] 
       (.C(clk179_IBUF_BUFG),
        .CE(1'b1),
        .D(a_IBUF[3]),
        .Q(Aint[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Dataw_reg[0] 
       (.C(clk179_IBUF_BUFG),
        .CE(1'b1),
        .D(d_IBUF[0]),
        .Q(\Dataw_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Dataw_reg[1] 
       (.C(clk179_IBUF_BUFG),
        .CE(1'b1),
        .D(d_IBUF[1]),
        .Q(\Dataw_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Dataw_reg[2] 
       (.C(clk179_IBUF_BUFG),
        .CE(1'b1),
        .D(d_IBUF[2]),
        .Q(\Dataw_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Dataw_reg[3] 
       (.C(clk179_IBUF_BUFG),
        .CE(1'b1),
        .D(d_IBUF[3]),
        .Q(D),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Dataw_reg[4] 
       (.C(clk179_IBUF_BUFG),
        .CE(1'b1),
        .D(d_IBUF[4]),
        .Q(\Dataw_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Dataw_reg[5] 
       (.C(clk179_IBUF_BUFG),
        .CE(1'b1),
        .D(d_IBUF[5]),
        .Q(\Dataw_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Dataw_reg[6] 
       (.C(clk179_IBUF_BUFG),
        .CE(1'b1),
        .D(d_IBUF[6]),
        .Q(\Dataw_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \Dataw_reg[7] 
       (.C(clk179_IBUF_BUFG),
        .CE(1'b1),
        .D(d_IBUF[7]),
        .Q(\Dataw_reg_n_0_[7] ),
        .R(1'b0));
  OBUF OE_OBUF_inst
       (.I(1'b1),
        .O(OE));
  aud_control_hp _aud1
       (.\AUD12_reg[1] ({_aud2_n_10,_aud2_n_11}),
        .\AUD12_reg[2] (_aud2_n_8),
        .\AUD12_reg[2]_0 (_aud2_n_9),
        .D(AUD120[2:0]),
        .E(data),
        .I_reg_0(_freq_control_n_10),
        .Q(poly4bit),
        .clk_out(clk),
        .\data_reg[2]_0 (_aud1_n_14),
        .\data_reg[3]_0 ({_aud1_n_8,_aud1_n_9,_aud1_n_10,_aud1_n_11}),
        .\data_reg[3]_1 (_aud1_n_13),
        .\data_reg[7]_0 ({\Dataw_reg_n_0_[7] ,\Dataw_reg_n_0_[6] ,\Dataw_reg_n_0_[5] ,\Dataw_reg_n_0_[4] ,D,\Dataw_reg_n_0_[2] ,\Dataw_reg_n_0_[1] ,\Dataw_reg_n_0_[0] }),
        .disHiFltr1(disHiFltr1),
        .enn(enn),
        .intQ_reg({Timer[3],Timer[1]}),
        .m__0(\c11/m__0 ),
        .m__0_0(\c11/m__0_0 ),
        .nQ_reg(_poly_core_n_5),
        .nor30(nor30),
        .nor4(nor4),
        .poly17Out_reg_0(poly917bit),
        .poly17_0(poly17_0),
        .poly4_0(poly4_0),
        .poly5_0(poly5_0),
        .poly5bit(poly5bit),
        .resync(resync),
        .rstDelay(rstDelay));
  aud_control_hp_0 _aud2
       (.\AUD12_reg[3] ({_aud1_n_8,_aud1_n_9,_aud1_n_10,_aud1_n_11}),
        .\AUD12_reg[4] (_aud1_n_13),
        .\AUD12_reg[4]_0 (_aud1_n_14),
        .D(AUD120[4:3]),
        .E(data_9),
        .I_reg_0(_freq_control_n_9),
        .Q({Timer[4],Timer[2]}),
        .clk_out(clk),
        .\data_reg[1]_0 (_aud2_n_8),
        .\data_reg[1]_1 ({_aud2_n_10,_aud2_n_11}),
        .\data_reg[2]_0 (_aud2_n_9),
        .\data_reg[7]_0 ({\Dataw_reg_n_0_[7] ,\Dataw_reg_n_0_[6] ,\Dataw_reg_n_0_[5] ,\Dataw_reg_n_0_[4] ,D,\Dataw_reg_n_0_[2] ,\Dataw_reg_n_0_[1] ,\Dataw_reg_n_0_[0] }),
        .disHiFltr2(disHiFltr2),
        .enn(enn),
        .m__0(\c11/m__0_0 ),
        .m__0_0(\c11/m__0 ),
        .nor30__0(nor30__0),
        .nor4(nor4_1),
        .poly17_0(poly17_0),
        .poly17_1(poly17_1),
        .poly4_0(poly4_0),
        .poly4_1(poly4_1),
        .poly5_0(poly5_0),
        .poly5_1(poly5_1),
        .resync(resync),
        .rstDelay(rstDelay));
  aud_control _aud3
       (.\AUD34_reg[0] ({T_5,_aud4_n_7,_aud4_n_8}),
        .D(AUD340[1:0]),
        .E(data_8),
        .I(I),
        .I_0(I_6),
        .I_reg_0(_freq_control_n_8),
        .Q(Timer[3]),
        .clk_out(clk),
        .\data_reg[1]_0 (_aud3_n_15),
        .\data_reg[2]_0 (_aud3_n_14),
        .\data_reg[4]_0 ({T,_aud3_n_9,_aud3_n_10,_aud3_n_11,_aud3_n_12}),
        .\data_reg[7]_0 ({\Dataw_reg_n_0_[7] ,\Dataw_reg_n_0_[6] ,\Dataw_reg_n_0_[5] ,\Dataw_reg_n_0_[4] ,D,\Dataw_reg_n_0_[2] ,\Dataw_reg_n_0_[1] ,\Dataw_reg_n_0_[0] }),
        .enn(enn),
        .m__0(\c11/m__0_2 ),
        .m__0_1(\c11/m__0_4 ),
        .nor30__1(nor30__1),
        .nor4(nor4_3),
        .poly17_1(poly17_1),
        .poly17_2(poly17_2),
        .poly4_1(poly4_1),
        .poly4_2(poly4_2),
        .poly5_1(poly5_1),
        .poly5_2(poly5_2),
        .resync(resync),
        .rstDelay(rstDelay));
  aud_control_1 _aud4
       (.\AUD34_reg[3] ({T,_aud3_n_9,_aud3_n_10,_aud3_n_11,_aud3_n_12}),
        .\AUD34_reg[3]_0 (_aud3_n_14),
        .\AUD34_reg[3]_1 (_aud3_n_15),
        .D(AUD340[4:2]),
        .E(data_10),
        .I(I_6),
        .I_1(I),
        .I_reg_0(_freq_control_n_7),
        .Q(Timer[4]),
        .clk_out(clk),
        .\data_reg[4]_0 ({T_5,_aud4_n_7,_aud4_n_8}),
        .\data_reg[7]_0 ({\Dataw_reg_n_0_[7] ,\Dataw_reg_n_0_[6] ,\Dataw_reg_n_0_[5] ,\Dataw_reg_n_0_[4] ,D,\Dataw_reg_n_0_[2] ,\Dataw_reg_n_0_[1] ,\Dataw_reg_n_0_[0] }),
        .enn(enn),
        .m__0(\c11/m__0_4 ),
        .m__0_0(\c11/m__0_2 ),
        .nor30__2(nor30__2),
        .nor4(nor4_7),
        .poly17_2(poly17_2),
        .poly4_2(poly4_2),
        .poly5_2(poly5_2),
        .resync(resync),
        .rstDelay(rstDelay));
  AUDCTL_reg _audctl_reg
       (.D(nors),
        .Q({\Dataw_reg_n_0_[7] ,\Dataw_reg_n_0_[6] ,\Dataw_reg_n_0_[5] ,\Dataw_reg_n_0_[4] ,D,\Dataw_reg_n_0_[0] }),
        .ch2Bits16(ch2Bits16),
        .ch4Bits16(ch4Bits16),
        .clk_out(clk),
        .disHiFltr1(disHiFltr1),
        .disHiFltr1_reg_0(_irq_core_n_16),
        .disHiFltr2(disHiFltr2),
        .disHiFltr2_reg_0(_irq_core_n_17),
        .enFastClk1(enFastClk1),
        .enFastClk1_reg_0(_io_core_n_8),
        .enFastClk3(enFastClk3),
        .sel15Khz(sel15Khz),
        .sel9bitPoly(sel9bitPoly),
        .swDelay(swDelay));
  clock_gen_core _clock_gen_core
       (.D(lfsr15k0Out),
        .Q({SKCTLS[2],_skctls_reg_n_6,SKCTLS[0]}),
        .audClock(audClock),
        .clk_out(clk),
        .d15k(d15k),
        .d15k_reg_0(_clock_gen_core_n_4),
        .enn(enn),
        .init(init),
        .keybClk(keybClk),
        .lfsr15k0(lfsr15k0),
        .sel15Khz(sel15Khz));
  freq_control _freq_control
       (.Q(Timer),
        .\Qbor_reg[4]_0 ({\prep_reg_n_0_[2] ,p_1_in}),
        .audClock(audClock),
        .ch2Bits16(ch2Bits16),
        .ch4Bits16(ch4Bits16),
        .clk_out(clk),
        .enFastClk1(enFastClk1),
        .enFastClk3(enFastClk3),
        .enn(enn),
        .enp(enp),
        .nDout(\t1_b7/nDout ),
        .nDout_0(\t2_b7/nDout ),
        .nDout_1(\t3_b7/nDout ),
        .nDout_2(\t4_b7/nDout ),
        .nDout_reg(_irq_core_n_11),
        .nDout_reg_0(_irq_core_n_12),
        .nDout_reg_1(_irq_core_n_13),
        .nDout_reg_2(_irq_core_n_14),
        .nDout_reg_3(_irq_core_n_15),
        .nDout_reg_4(_irq_core_n_16),
        .nDout_reg_5(_irq_core_n_17),
        .nDout_reg_6(_irq_core_n_18),
        .nor3(nor3_12),
        .nor30(nor30),
        .nor30__0(nor30__0),
        .nor30__1(nor30__1),
        .nor30__2(nor30__2),
        .nor3_reg(_freq_control_n_11),
        .nor4(nor4_7),
        .nor4_3(nor4_3),
        .nor4_4(nor4_1),
        .nor4_5(nor4),
        .or1Q_reg({p_1_in0_in,p_0_in}),
        .presync_reg_0(_io_core_n_28),
        .resync(resync),
        .resyncSerClk(resyncSerClk),
        .resyncTwoTones(resyncTwoTones),
        .rstDelay(rstDelay),
        .rstDelay_reg_0(_freq_control_n_7),
        .rstDelay_reg_1(_freq_control_n_8),
        .rstDelay_reg_2(_freq_control_n_9),
        .rstDelay_reg_3(_freq_control_n_10));
  IO_core _io_core
       (.\AQ_reg[1]_0 (_io_core_n_8),
        .\AQ_reg[1]_1 (_io_core_n_10),
        .\AQ_reg[1]_2 (oQD),
        .\AQ_reg[3]_0 (data_10),
        .\AQ_reg[3]_1 (data_9),
        .\AQ_reg[3]_2 (data_8),
        .\AQ_reg[3]_3 (data),
        .\AQ_reg[3]_4 (_io_core_n_26),
        .\AQ_reg[3]_5 (_io_core_n_27),
        .\AQ_reg[3]_6 (_io_core_n_28),
        .\Ar_reg[3]_0 (Aint),
        .D(ALLPOT),
        .\Data0Q_reg[7]_0 ({\prep_reg_n_0_[2] ,p_1_in}),
        .\Data0Q_reg[7]_1 (POT0),
        .\Data1Q_reg[7]_0 (POT1),
        .\Data2Q_reg[7]_0 (POT2),
        .\Data3Q_reg[7]_0 (POT3),
        .\Data4Q_reg[7]_0 (POT4),
        .\Data5Q_reg[7]_0 (POT5),
        .\Data6Q_reg[7]_0 (POT6),
        .\Data7Q_reg[7]_0 (POT7),
        .\Data9Q_reg[7]_0 ({_key_core_n_10,_key_core_n_11,_key_core_n_12,_key_core_n_13,_key_core_n_14,_key_core_n_15,_key_core_n_16,_key_core_n_17}),
        .\DataAQ_reg[7]_0 (rndNum),
        .\DataDQ_reg[7]_0 ({_ser_core_n_18,_ser_core_n_19,_ser_core_n_20,_ser_core_n_21,_ser_core_n_22,_ser_core_n_23,_ser_core_n_24,_ser_core_n_25}),
        .\DataEQ_reg[7]_0 ({DataEr[7:4],_irq_core_n_7,DataEr[2:0]}),
        .\DataFQ_reg[4]_0 (DataFQ),
        .\DataFQ_reg[4]_1 (_io_core_n_17),
        .\DataFQ_reg[4]_2 (DataFr),
        .E(Dirq),
        .Q(p_0_in8_in),
        .clk_out(clk),
        .cs_IBUF(cs_IBUF),
        .d_OBUF(d_OBUF),
        .enn(enn),
        .enp(enp),
        .ithisState(ithisState),
        .keyQ_1(keyQ_1),
        .nDout(\t4_b7/nDout ),
        .nDout_0(\t2_b7/nDout ),
        .nDout_1(\t3_b7/nDout ),
        .nDout_2(\t1_b7/nDout ),
        .p_18_in(p_18_in),
        .p_2_in(p_2_in),
        .qnor3(qnor3),
        .qnor4(qnor4),
        .qnor5(qnor5),
        .qreset(qreset),
        .rw_IBUF(rw_IBUF));
  IRQ_core _irq_core
       (.D({_irq_core_n_11,_irq_core_n_12,_irq_core_n_13,_irq_core_n_14,_irq_core_n_15,_irq_core_n_16,_irq_core_n_17,_irq_core_n_18}),
        .\Dirq_reg[3]_0 (p_0_in0_in),
        .\Dirq_reg[7]_0 ({\Dataw_reg_n_0_[7] ,\Dataw_reg_n_0_[6] ,\Dataw_reg_n_0_[5] ,\Dataw_reg_n_0_[4] ,D,\Dataw_reg_n_0_[2] ,\Dataw_reg_n_0_[1] ,\Dataw_reg_n_0_[0] }),
        .E(Dirq),
        .Q({Timer[4],Timer[2:1]}),
        .clk_out(clk),
        .enn(enn),
        .enp(enp),
        .irq_OBUF(irq_OBUF),
        .\nirqst_reg[3]_0 (sdoFinish),
        .\nirqst_reg[7]_0 ({DataEr[7:4],_irq_core_n_7,DataEr[2:0]}),
        .nor3(nor3),
        .nor4(nor4_11),
        .p_2_in(p_2_in),
        .qnor3(qnor3),
        .qnor3_reg_0(_ser_core_n_17),
        .qnor4(qnor4),
        .setBreak(setBreak),
        .setKey(setKey),
        .setSdiCompl(setSdiCompl),
        .setSdoCompl(setSdoCompl));
  KEY_core _key_core
       (.\D_reg[7]_0 ({_key_core_n_10,_key_core_n_11,_key_core_n_12,_key_core_n_13,_key_core_n_14,_key_core_n_15,_key_core_n_16,_key_core_n_17}),
        .Q({_skctls_reg_n_6,SKCTLS[0]}),
        .Q_reg({\prep_reg_n_0_[2] ,p_1_in}),
        .clk_out(clk),
        .d15k(d15k),
        .enn(enn),
        .enp(enp),
        .k_OBUF(k_OBUF),
        .keyQ_1(keyQ_1),
        .keybClk(keybClk),
        .kr_IBUF(kr_IBUF),
        .setBreak(setBreak),
        .setKey(setKey),
        .shift_reg_0(DataFr[3]));
  poly_core _poly_core
       (.D(nors),
        .Q(poly917bit),
        .clk_out(clk),
        .enn(enn),
        .feedback4(feedback4),
        .feedback5(feedback5),
        .\lfsr4bit_reg[0]_0 (poly4bit),
        .\lfsr4bit_reg[2]_0 (_skctls_reg_n_8),
        .\lfsr5bit_reg[0]_0 (_poly_core_n_5),
        .\lfsr5bit_reg[3]_0 (p_2_out),
        .\lfsr9bit_reg[7]_0 (rndNum),
        .\lfsr9bit_reg[7]_1 ({_skctls_reg_n_6,SKCTLS[0]}),
        .poly5bit(poly5bit),
        .sel9bitPoly(sel9bitPoly),
        .swDelay(swDelay));
  POT_core _pot_core
       (.D(ALLPOT),
        .\POT0_reg[7]_0 (POT0),
        .\POT1_reg[7]_0 (POT1),
        .\POT2_reg[7]_0 (POT2),
        .\POT3_reg[7]_0 (POT3),
        .\POT4_reg[7]_0 (POT4),
        .\POT5_reg[7]_0 (POT5),
        .\POT6_reg[7]_0 (POT6),
        .\POT7_reg[0]_0 ({p_1_in0_in,p_0_in}),
        .\POT7_reg[7]_0 (POT7),
        .Q(p_0_in8_in),
        .clk_out(clk),
        .dump_OBUF(dump_OBUF),
        .dump_reg_0(SKCTLS[2]),
        .enn(enn),
        .enp(enp),
        .nPotClk_reg_0(_clock_gen_core_n_4),
        .p_18_in(p_18_in),
        .p_IBUF(p_IBUF));
  SER_core _ser_core
       (.\Dr_reg[7]_0 ({_ser_core_n_18,_ser_core_n_19,_ser_core_n_20,_ser_core_n_21,_ser_core_n_22,_ser_core_n_23,_ser_core_n_24,_ser_core_n_25}),
        .DshiftOut(DshiftOut),
        .E(oQD),
        .Q_reg({\prep_reg_n_0_[2] ,p_1_in}),
        .bclki_IBUF(bclki_IBUF),
        .clk_out(clk),
        .delay2_reg_0(_io_core_n_17),
        .enn(enn),
        .enp(enp),
        .intQ_reg(sdoFinish),
        .intQ_reg_0(_ser_core_n_17),
        .ithisState(ithisState),
        .muxOut(\t2/muxOut ),
        .nQ(\t4/nQ ),
        .nQ_0(\t2/nQ ),
        .nor1(\t4/nor1 ),
        .nor3(nor3_12),
        .nor3_reg_0(_skctls_reg_n_14),
        .nor5(nor5),
        .\oQD_reg[7]_0 ({\Dataw_reg_n_0_[7] ,\Dataw_reg_n_0_[6] ,\Dataw_reg_n_0_[5] ,\Dataw_reg_n_0_[4] ,D,\Dataw_reg_n_0_[2] ,\Dataw_reg_n_0_[1] ,\Dataw_reg_n_0_[0] }),
        .oclk_OBUF(oclk_OBUF),
        .p_2_in(p_2_in),
        .preBCLK(preBCLK),
        .qnor3_reg(p_0_in0_in),
        .qnor5(qnor5),
        .resync2Tones_reg_0(_skctls_reg_n_15),
        .resyncInt(resyncInt),
        .resyncSerClk(resyncSerClk),
        .resyncSerClk_reg_0(DataFQ),
        .resyncTwoTones(resyncTwoTones),
        .sdoClock_reg_0({SKCTLS[6:3],_skctls_reg_n_6,SKCTLS[0]}),
        .sdoDloaded_reg_0(_io_core_n_27),
        .setSdiCompl(setSdiCompl),
        .setSdoCompl(setSdoCompl),
        .siDelayInt_reg_0(DataFr[4]),
        .sid_IBUF(sid_IBUF),
        .sod_OBUF(sod_OBUF),
        .toneCntrl(toneCntrl),
        .toneCntrl_reg_0(_freq_control_n_11));
  SKCTLS_reg _skctls_reg
       (.D(lfsr15k0Out),
        .DshiftOut(DshiftOut),
        .E(_io_core_n_10),
        .Q({SKCTLS[6:2],_skctls_reg_n_6,SKCTLS[0]}),
        .\SKCTLS_reg[3]_0 (_skctls_reg_n_15),
        .\SKCTLS_reg[7]_0 (_skctls_reg_n_14),
        .\SKCTLS_reg[7]_1 ({\Dataw_reg_n_0_[7] ,\Dataw_reg_n_0_[6] ,\Dataw_reg_n_0_[5] ,\Dataw_reg_n_0_[4] ,D,\Dataw_reg_n_0_[2] ,\Dataw_reg_n_0_[1] ,\Dataw_reg_n_0_[0] }),
        .bclko_OBUF(bclko_OBUF),
        .clk_out(clk),
        .feedback4(feedback4),
        .feedback4_reg(_skctls_reg_n_8),
        .feedback5(feedback5),
        .feedback5_reg(p_2_out),
        .init(init),
        .lfsr15k0(lfsr15k0),
        .muxOut(\t2/muxOut ),
        .nQ(\t4/nQ ),
        .nQ_0(\t2/nQ ),
        .nQ_reg({Timer[4],Timer[2]}),
        .nor1(\t4/nor1 ),
        .preBCLK(preBCLK),
        .resyncInt(resyncInt),
        .toneCntrl(toneCntrl));
  SKSTAT_reg _skstat_reg
       (.clk_out(clk),
        .enn(enn),
        .nor3(nor3),
        .nor4(nor4_11),
        .nor5(nor5),
        .qnor3(qnor3),
        .qnor4(qnor4),
        .qnor5(qnor5),
        .qreset(qreset),
        .qreset_reg_0(_io_core_n_26));
  IBUF \a_IBUF[0]_inst 
       (.I(a[0]),
        .O(a_IBUF[0]));
  IBUF \a_IBUF[1]_inst 
       (.I(a[1]),
        .O(a_IBUF[1]));
  IBUF \a_IBUF[2]_inst 
       (.I(a[2]),
        .O(a_IBUF[2]));
  IBUF \a_IBUF[3]_inst 
       (.I(a[3]),
        .O(a_IBUF[3]));
  LUT2 #(
    .INIT(4'h6)) 
    \audio[0]_i_1 
       (.I0(AUD34[0]),
        .I1(AUD12[0]),
        .O(\audio[0]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h8778)) 
    \audio[1]_i_1 
       (.I0(AUD34[0]),
        .I1(AUD12[0]),
        .I2(AUD12[1]),
        .I3(AUD34[1]),
        .O(\audio[1]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hF880077F077FF880)) 
    \audio[2]_i_1 
       (.I0(AUD12[0]),
        .I1(AUD34[0]),
        .I2(AUD34[1]),
        .I3(AUD12[1]),
        .I4(AUD12[2]),
        .I5(AUD34[2]),
        .O(\audio[2]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h96)) 
    \audio[3]_i_1 
       (.I0(\audio[5]_i_2_n_0 ),
        .I1(AUD12[3]),
        .I2(AUD34[3]),
        .O(\audio[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hE81717E8)) 
    \audio[4]_i_1 
       (.I0(\audio[5]_i_2_n_0 ),
        .I1(AUD34[3]),
        .I2(AUD12[3]),
        .I3(AUD12[4]),
        .I4(AUD34[4]),
        .O(\audio[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hEEE8E888)) 
    \audio[5]_i_1 
       (.I0(AUD12[4]),
        .I1(AUD34[4]),
        .I2(\audio[5]_i_2_n_0 ),
        .I3(AUD34[3]),
        .I4(AUD12[3]),
        .O(\audio[5]_i_1_n_0 ));
  LUT6 #(
    .INIT(64'hEEEEE888E8888888)) 
    \audio[5]_i_2 
       (.I0(AUD12[2]),
        .I1(AUD34[2]),
        .I2(AUD12[0]),
        .I3(AUD34[0]),
        .I4(AUD34[1]),
        .I5(AUD12[1]),
        .O(\audio[5]_i_2_n_0 ));
  OBUF \audio_OBUF[0]_inst 
       (.I(audio_OBUF[0]),
        .O(audio[0]));
  OBUF \audio_OBUF[1]_inst 
       (.I(audio_OBUF[1]),
        .O(audio[1]));
  OBUF \audio_OBUF[2]_inst 
       (.I(audio_OBUF[2]),
        .O(audio[2]));
  OBUF \audio_OBUF[3]_inst 
       (.I(audio_OBUF[3]),
        .O(audio[3]));
  OBUF \audio_OBUF[4]_inst 
       (.I(audio_OBUF[4]),
        .O(audio[4]));
  OBUF \audio_OBUF[5]_inst 
       (.I(audio_OBUF[5]),
        .O(audio[5]));
  FDRE #(
    .INIT(1'b0)) 
    \audio_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(\audio[0]_i_1_n_0 ),
        .Q(audio_OBUF[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \audio_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\audio[1]_i_1_n_0 ),
        .Q(audio_OBUF[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \audio_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(\audio[2]_i_1_n_0 ),
        .Q(audio_OBUF[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \audio_reg[3] 
       (.C(clk),
        .CE(1'b1),
        .D(\audio[3]_i_1_n_0 ),
        .Q(audio_OBUF[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \audio_reg[4] 
       (.C(clk),
        .CE(1'b1),
        .D(\audio[4]_i_1_n_0 ),
        .Q(audio_OBUF[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \audio_reg[5] 
       (.C(clk),
        .CE(1'b1),
        .D(\audio[5]_i_1_n_0 ),
        .Q(audio_OBUF[5]),
        .R(1'b0));
  IBUF bclki_IBUF_inst
       (.I(bclki),
        .O(bclki_IBUF));
  OBUF bclko_OBUF_inst
       (.I(bclko_OBUF),
        .O(bclko));
  BUFG clk179_IBUF_BUFG_inst
       (.I(clk179_IBUF),
        .O(clk179_IBUF_BUFG));
  IBUF clk179_IBUF_inst
       (.I(clk179),
        .O(clk179_IBUF));
  clk_wiz_0 clk_0
       (.clk_in1(sysclk),
        .clk_out(clk));
  IBUF \cs_IBUF[0]_inst 
       (.I(cs[0]),
        .O(cs_IBUF[0]));
  IBUF \cs_IBUF[1]_inst 
       (.I(cs[1]),
        .O(cs_IBUF[1]));
  IOBUF \d_IOBUF[0]_inst 
       (.I(d_OBUF[0]),
        .IO(d[0]),
        .O(d_IBUF[0]),
        .T(\d_TRI[0] ));
  IOBUF \d_IOBUF[1]_inst 
       (.I(d_OBUF[1]),
        .IO(d[1]),
        .O(d_IBUF[1]),
        .T(\d_TRI[0] ));
  IOBUF \d_IOBUF[2]_inst 
       (.I(d_OBUF[2]),
        .IO(d[2]),
        .O(d_IBUF[2]),
        .T(\d_TRI[0] ));
  IOBUF \d_IOBUF[3]_inst 
       (.I(d_OBUF[3]),
        .IO(d[3]),
        .O(d_IBUF[3]),
        .T(\d_TRI[0] ));
  IOBUF \d_IOBUF[4]_inst 
       (.I(d_OBUF[4]),
        .IO(d[4]),
        .O(d_IBUF[4]),
        .T(\d_TRI[0] ));
  IOBUF \d_IOBUF[5]_inst 
       (.I(d_OBUF[5]),
        .IO(d[5]),
        .O(d_IBUF[5]),
        .T(\d_TRI[0] ));
  IOBUF \d_IOBUF[6]_inst 
       (.I(d_OBUF[6]),
        .IO(d[6]),
        .O(d_IBUF[6]),
        .T(\d_TRI[0] ));
  IOBUF \d_IOBUF[7]_inst 
       (.I(d_OBUF[7]),
        .IO(d[7]),
        .O(d_IBUF[7]),
        .T(\d_TRI[0] ));
  LUT1 #(
    .INIT(2'h1)) 
    \d_IOBUF[7]_inst_i_2 
       (.I0(readEn),
        .O(\d_TRI[0] ));
  LUT3 #(
    .INIT(8'h20)) 
    \d_IOBUF[7]_inst_i_5 
       (.I0(rw_IBUF),
        .I1(cs_IBUF[0]),
        .I2(cs_IBUF[1]),
        .O(readEn));
  OBUF dump_OBUF_inst
       (.I(dump_OBUF),
        .O(dump));
  OBUF irq_OBUF_inst
       (.I(irq_OBUF),
        .O(irq));
  OBUF \k_OBUF[0]_inst 
       (.I(k_OBUF[0]),
        .O(k[0]));
  OBUF \k_OBUF[1]_inst 
       (.I(k_OBUF[1]),
        .O(k[1]));
  OBUF \k_OBUF[2]_inst 
       (.I(k_OBUF[2]),
        .O(k[2]));
  OBUF \k_OBUF[3]_inst 
       (.I(k_OBUF[3]),
        .O(k[3]));
  OBUF \k_OBUF[4]_inst 
       (.I(k_OBUF[4]),
        .O(k[4]));
  OBUF \k_OBUF[5]_inst 
       (.I(k_OBUF[5]),
        .O(k[5]));
  IBUF \kr_IBUF[1]_inst 
       (.I(kr[1]),
        .O(kr_IBUF[1]));
  IBUF \kr_IBUF[2]_inst 
       (.I(kr[2]),
        .O(kr_IBUF[2]));
  OBUF oclk_OBUF_inst
       (.I(oclk_OBUF),
        .O(oclk));
  IBUF \p_IBUF[0]_inst 
       (.I(p[0]),
        .O(p_IBUF[0]));
  IBUF \p_IBUF[1]_inst 
       (.I(p[1]),
        .O(p_IBUF[1]));
  IBUF \p_IBUF[2]_inst 
       (.I(p[2]),
        .O(p_IBUF[2]));
  IBUF \p_IBUF[3]_inst 
       (.I(p[3]),
        .O(p_IBUF[3]));
  IBUF \p_IBUF[4]_inst 
       (.I(p[4]),
        .O(p_IBUF[4]));
  IBUF \p_IBUF[5]_inst 
       (.I(p[5]),
        .O(p_IBUF[5]));
  IBUF \p_IBUF[6]_inst 
       (.I(p[6]),
        .O(p_IBUF[6]));
  IBUF \p_IBUF[7]_inst 
       (.I(p[7]),
        .O(p_IBUF[7]));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \pren_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(clk179_IBUF_BUFG),
        .Q(\pren_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \pren_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\pren_reg_n_0_[0] ),
        .Q(p_0_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \pren_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(p_0_in),
        .Q(p_1_in0_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \prep_reg[0] 
       (.C(clk),
        .CE(1'b1),
        .D(clk179_IBUF_BUFG),
        .Q(\prep_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \prep_reg[1] 
       (.C(clk),
        .CE(1'b1),
        .D(\prep_reg_n_0_[0] ),
        .Q(p_1_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \prep_reg[2] 
       (.C(clk),
        .CE(1'b1),
        .D(p_1_in),
        .Q(\prep_reg_n_0_[2] ),
        .R(1'b0));
  IBUF rw_IBUF_inst
       (.I(rw),
        .O(rw_IBUF));
  IBUF sid_IBUF_inst
       (.I(sid),
        .O(sid_IBUF));
  OBUF sod_OBUF_inst
       (.I(sod_OBUF),
        .O(sod));
endmodule

module POT_core
   (dump_OBUF,
    \POT0_reg[7]_0 ,
    \POT1_reg[7]_0 ,
    \POT2_reg[7]_0 ,
    \POT3_reg[7]_0 ,
    \POT4_reg[7]_0 ,
    \POT5_reg[7]_0 ,
    \POT6_reg[7]_0 ,
    \POT7_reg[7]_0 ,
    D,
    enp,
    clk_out,
    enn,
    nPotClk_reg_0,
    p_18_in,
    Q,
    dump_reg_0,
    \POT7_reg[0]_0 ,
    p_IBUF);
  output dump_OBUF;
  output [7:0]\POT0_reg[7]_0 ;
  output [7:0]\POT1_reg[7]_0 ;
  output [7:0]\POT2_reg[7]_0 ;
  output [7:0]\POT3_reg[7]_0 ;
  output [7:0]\POT4_reg[7]_0 ;
  output [7:0]\POT5_reg[7]_0 ;
  output [7:0]\POT6_reg[7]_0 ;
  output [7:0]\POT7_reg[7]_0 ;
  output [7:0]D;
  input enp;
  input clk_out;
  input enn;
  input nPotClk_reg_0;
  input p_18_in;
  input [0:0]Q;
  input [0:0]dump_reg_0;
  input [1:0]\POT7_reg[0]_0 ;
  input [7:0]p_IBUF;

  wire \ALLPOT[0]_i_1_n_0 ;
  wire \ALLPOT[1]_i_1_n_0 ;
  wire \ALLPOT[2]_i_1_n_0 ;
  wire \ALLPOT[3]_i_1_n_0 ;
  wire \ALLPOT[4]_i_1_n_0 ;
  wire \ALLPOT[5]_i_1_n_0 ;
  wire \ALLPOT[6]_i_1_n_0 ;
  wire \ALLPOT[7]_i_1_n_0 ;
  wire \ALLPOT[7]_i_3_n_0 ;
  wire [7:0]D;
  wire \POT0[7]_i_1_n_0 ;
  wire [7:0]\POT0_reg[7]_0 ;
  wire \POT1[7]_i_1_n_0 ;
  wire [7:0]\POT1_reg[7]_0 ;
  wire \POT2[7]_i_1_n_0 ;
  wire [7:0]\POT2_reg[7]_0 ;
  wire \POT3[7]_i_1_n_0 ;
  wire [7:0]\POT3_reg[7]_0 ;
  wire \POT4[7]_i_1_n_0 ;
  wire [7:0]\POT4_reg[7]_0 ;
  wire \POT5[7]_i_1_n_0 ;
  wire [7:0]\POT5_reg[7]_0 ;
  wire \POT6[7]_i_1_n_0 ;
  wire [7:0]\POT6_reg[7]_0 ;
  wire \POT7[7]_i_1_n_0 ;
  wire [1:0]\POT7_reg[0]_0 ;
  wire [7:0]\POT7_reg[7]_0 ;
  wire [0:0]Q;
  wire Qout;
  wire Qout_0;
  wire Qout_1;
  wire Qout_2;
  wire Qout_3;
  wire Qout_4;
  wire Qout_5;
  wire Qout_6;
  wire b0_n_2;
  wire b3_n_2;
  wire bor__3;
  wire clk_out;
  wire delay1;
  wire delay2;
  wire dump_OBUF;
  wire dump_i_1_n_0;
  wire [0:0]dump_reg_0;
  wire enn;
  wire enp;
  wire nPotClk;
  wire nPotClk_reg_0;
  wire [7:0]nQ;
  wire \nQp[0]_i_1_n_0 ;
  wire \nQp[1]_i_1_n_0 ;
  wire \nQp[2]_i_1_n_0 ;
  wire \nQp[3]_i_1_n_0 ;
  wire \nQp[4]_i_1_n_0 ;
  wire \nQp[5]_i_1_n_0 ;
  wire \nQp[6]_i_1_n_0 ;
  wire \nQp[7]_i_1_n_0 ;
  wire \nQp_reg_n_0_[0] ;
  wire nor1;
  wire nor1_i_1_n_0;
  wire nor4;
  wire p_0_in;
  wire p_0_in0_in;
  wire p_0_in1_in;
  wire p_0_in2_in;
  wire p_0_in3_in;
  wire p_0_in4_in;
  wire p_0_in5_in;
  wire p_18_in;
  wire [7:0]p_IBUF;
  wire potPreset;

  LUT1 #(
    .INIT(2'h1)) 
    \ALLPOT[0]_i_1 
       (.I0(\nQp_reg_n_0_[0] ),
        .O(\ALLPOT[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \ALLPOT[1]_i_1 
       (.I0(p_0_in5_in),
        .O(\ALLPOT[1]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \ALLPOT[2]_i_1 
       (.I0(p_0_in4_in),
        .O(\ALLPOT[2]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \ALLPOT[3]_i_1 
       (.I0(p_0_in3_in),
        .O(\ALLPOT[3]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \ALLPOT[4]_i_1 
       (.I0(p_0_in2_in),
        .O(\ALLPOT[4]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \ALLPOT[5]_i_1 
       (.I0(p_0_in1_in),
        .O(\ALLPOT[5]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \ALLPOT[6]_i_1 
       (.I0(p_0_in0_in),
        .O(\ALLPOT[6]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'h20)) 
    \ALLPOT[7]_i_1 
       (.I0(\POT7_reg[0]_0 [1]),
        .I1(\POT7_reg[0]_0 [0]),
        .I2(nor4),
        .O(\ALLPOT[7]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \ALLPOT[7]_i_3 
       (.I0(p_0_in),
        .O(\ALLPOT[7]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \ALLPOT_reg[0] 
       (.C(clk_out),
        .CE(enn),
        .D(\ALLPOT[0]_i_1_n_0 ),
        .Q(D[0]),
        .R(\ALLPOT[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \ALLPOT_reg[1] 
       (.C(clk_out),
        .CE(enn),
        .D(\ALLPOT[1]_i_1_n_0 ),
        .Q(D[1]),
        .R(\ALLPOT[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \ALLPOT_reg[2] 
       (.C(clk_out),
        .CE(enn),
        .D(\ALLPOT[2]_i_1_n_0 ),
        .Q(D[2]),
        .R(\ALLPOT[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \ALLPOT_reg[3] 
       (.C(clk_out),
        .CE(enn),
        .D(\ALLPOT[3]_i_1_n_0 ),
        .Q(D[3]),
        .R(\ALLPOT[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \ALLPOT_reg[4] 
       (.C(clk_out),
        .CE(enn),
        .D(\ALLPOT[4]_i_1_n_0 ),
        .Q(D[4]),
        .R(\ALLPOT[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \ALLPOT_reg[5] 
       (.C(clk_out),
        .CE(enn),
        .D(\ALLPOT[5]_i_1_n_0 ),
        .Q(D[5]),
        .R(\ALLPOT[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \ALLPOT_reg[6] 
       (.C(clk_out),
        .CE(enn),
        .D(\ALLPOT[6]_i_1_n_0 ),
        .Q(D[6]),
        .R(\ALLPOT[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \ALLPOT_reg[7] 
       (.C(clk_out),
        .CE(enn),
        .D(\ALLPOT[7]_i_3_n_0 ),
        .Q(D[7]),
        .R(\ALLPOT[7]_i_1_n_0 ));
  LUT4 #(
    .INIT(16'h0002)) 
    \POT0[7]_i_1 
       (.I0(\POT7_reg[0]_0 [1]),
        .I1(\POT7_reg[0]_0 [0]),
        .I2(nor4),
        .I3(\nQp_reg_n_0_[0] ),
        .O(\POT0[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT0_reg[0] 
       (.C(clk_out),
        .CE(\POT0[7]_i_1_n_0 ),
        .D(nQ[0]),
        .Q(\POT0_reg[7]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT0_reg[1] 
       (.C(clk_out),
        .CE(\POT0[7]_i_1_n_0 ),
        .D(nQ[1]),
        .Q(\POT0_reg[7]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT0_reg[2] 
       (.C(clk_out),
        .CE(\POT0[7]_i_1_n_0 ),
        .D(nQ[2]),
        .Q(\POT0_reg[7]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT0_reg[3] 
       (.C(clk_out),
        .CE(\POT0[7]_i_1_n_0 ),
        .D(nQ[3]),
        .Q(\POT0_reg[7]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT0_reg[4] 
       (.C(clk_out),
        .CE(\POT0[7]_i_1_n_0 ),
        .D(nQ[4]),
        .Q(\POT0_reg[7]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT0_reg[5] 
       (.C(clk_out),
        .CE(\POT0[7]_i_1_n_0 ),
        .D(nQ[5]),
        .Q(\POT0_reg[7]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT0_reg[6] 
       (.C(clk_out),
        .CE(\POT0[7]_i_1_n_0 ),
        .D(nQ[6]),
        .Q(\POT0_reg[7]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT0_reg[7] 
       (.C(clk_out),
        .CE(\POT0[7]_i_1_n_0 ),
        .D(nQ[7]),
        .Q(\POT0_reg[7]_0 [7]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0002)) 
    \POT1[7]_i_1 
       (.I0(\POT7_reg[0]_0 [1]),
        .I1(\POT7_reg[0]_0 [0]),
        .I2(nor4),
        .I3(p_0_in5_in),
        .O(\POT1[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT1_reg[0] 
       (.C(clk_out),
        .CE(\POT1[7]_i_1_n_0 ),
        .D(nQ[0]),
        .Q(\POT1_reg[7]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT1_reg[1] 
       (.C(clk_out),
        .CE(\POT1[7]_i_1_n_0 ),
        .D(nQ[1]),
        .Q(\POT1_reg[7]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT1_reg[2] 
       (.C(clk_out),
        .CE(\POT1[7]_i_1_n_0 ),
        .D(nQ[2]),
        .Q(\POT1_reg[7]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT1_reg[3] 
       (.C(clk_out),
        .CE(\POT1[7]_i_1_n_0 ),
        .D(nQ[3]),
        .Q(\POT1_reg[7]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT1_reg[4] 
       (.C(clk_out),
        .CE(\POT1[7]_i_1_n_0 ),
        .D(nQ[4]),
        .Q(\POT1_reg[7]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT1_reg[5] 
       (.C(clk_out),
        .CE(\POT1[7]_i_1_n_0 ),
        .D(nQ[5]),
        .Q(\POT1_reg[7]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT1_reg[6] 
       (.C(clk_out),
        .CE(\POT1[7]_i_1_n_0 ),
        .D(nQ[6]),
        .Q(\POT1_reg[7]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT1_reg[7] 
       (.C(clk_out),
        .CE(\POT1[7]_i_1_n_0 ),
        .D(nQ[7]),
        .Q(\POT1_reg[7]_0 [7]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0002)) 
    \POT2[7]_i_1 
       (.I0(\POT7_reg[0]_0 [1]),
        .I1(\POT7_reg[0]_0 [0]),
        .I2(nor4),
        .I3(p_0_in4_in),
        .O(\POT2[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT2_reg[0] 
       (.C(clk_out),
        .CE(\POT2[7]_i_1_n_0 ),
        .D(nQ[0]),
        .Q(\POT2_reg[7]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT2_reg[1] 
       (.C(clk_out),
        .CE(\POT2[7]_i_1_n_0 ),
        .D(nQ[1]),
        .Q(\POT2_reg[7]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT2_reg[2] 
       (.C(clk_out),
        .CE(\POT2[7]_i_1_n_0 ),
        .D(nQ[2]),
        .Q(\POT2_reg[7]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT2_reg[3] 
       (.C(clk_out),
        .CE(\POT2[7]_i_1_n_0 ),
        .D(nQ[3]),
        .Q(\POT2_reg[7]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT2_reg[4] 
       (.C(clk_out),
        .CE(\POT2[7]_i_1_n_0 ),
        .D(nQ[4]),
        .Q(\POT2_reg[7]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT2_reg[5] 
       (.C(clk_out),
        .CE(\POT2[7]_i_1_n_0 ),
        .D(nQ[5]),
        .Q(\POT2_reg[7]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT2_reg[6] 
       (.C(clk_out),
        .CE(\POT2[7]_i_1_n_0 ),
        .D(nQ[6]),
        .Q(\POT2_reg[7]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT2_reg[7] 
       (.C(clk_out),
        .CE(\POT2[7]_i_1_n_0 ),
        .D(nQ[7]),
        .Q(\POT2_reg[7]_0 [7]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0002)) 
    \POT3[7]_i_1 
       (.I0(\POT7_reg[0]_0 [1]),
        .I1(\POT7_reg[0]_0 [0]),
        .I2(nor4),
        .I3(p_0_in3_in),
        .O(\POT3[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT3_reg[0] 
       (.C(clk_out),
        .CE(\POT3[7]_i_1_n_0 ),
        .D(nQ[0]),
        .Q(\POT3_reg[7]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT3_reg[1] 
       (.C(clk_out),
        .CE(\POT3[7]_i_1_n_0 ),
        .D(nQ[1]),
        .Q(\POT3_reg[7]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT3_reg[2] 
       (.C(clk_out),
        .CE(\POT3[7]_i_1_n_0 ),
        .D(nQ[2]),
        .Q(\POT3_reg[7]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT3_reg[3] 
       (.C(clk_out),
        .CE(\POT3[7]_i_1_n_0 ),
        .D(nQ[3]),
        .Q(\POT3_reg[7]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT3_reg[4] 
       (.C(clk_out),
        .CE(\POT3[7]_i_1_n_0 ),
        .D(nQ[4]),
        .Q(\POT3_reg[7]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT3_reg[5] 
       (.C(clk_out),
        .CE(\POT3[7]_i_1_n_0 ),
        .D(nQ[5]),
        .Q(\POT3_reg[7]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT3_reg[6] 
       (.C(clk_out),
        .CE(\POT3[7]_i_1_n_0 ),
        .D(nQ[6]),
        .Q(\POT3_reg[7]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT3_reg[7] 
       (.C(clk_out),
        .CE(\POT3[7]_i_1_n_0 ),
        .D(nQ[7]),
        .Q(\POT3_reg[7]_0 [7]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0002)) 
    \POT4[7]_i_1 
       (.I0(\POT7_reg[0]_0 [1]),
        .I1(\POT7_reg[0]_0 [0]),
        .I2(nor4),
        .I3(p_0_in2_in),
        .O(\POT4[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT4_reg[0] 
       (.C(clk_out),
        .CE(\POT4[7]_i_1_n_0 ),
        .D(nQ[0]),
        .Q(\POT4_reg[7]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT4_reg[1] 
       (.C(clk_out),
        .CE(\POT4[7]_i_1_n_0 ),
        .D(nQ[1]),
        .Q(\POT4_reg[7]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT4_reg[2] 
       (.C(clk_out),
        .CE(\POT4[7]_i_1_n_0 ),
        .D(nQ[2]),
        .Q(\POT4_reg[7]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT4_reg[3] 
       (.C(clk_out),
        .CE(\POT4[7]_i_1_n_0 ),
        .D(nQ[3]),
        .Q(\POT4_reg[7]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT4_reg[4] 
       (.C(clk_out),
        .CE(\POT4[7]_i_1_n_0 ),
        .D(nQ[4]),
        .Q(\POT4_reg[7]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT4_reg[5] 
       (.C(clk_out),
        .CE(\POT4[7]_i_1_n_0 ),
        .D(nQ[5]),
        .Q(\POT4_reg[7]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT4_reg[6] 
       (.C(clk_out),
        .CE(\POT4[7]_i_1_n_0 ),
        .D(nQ[6]),
        .Q(\POT4_reg[7]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT4_reg[7] 
       (.C(clk_out),
        .CE(\POT4[7]_i_1_n_0 ),
        .D(nQ[7]),
        .Q(\POT4_reg[7]_0 [7]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0002)) 
    \POT5[7]_i_1 
       (.I0(\POT7_reg[0]_0 [1]),
        .I1(\POT7_reg[0]_0 [0]),
        .I2(nor4),
        .I3(p_0_in1_in),
        .O(\POT5[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT5_reg[0] 
       (.C(clk_out),
        .CE(\POT5[7]_i_1_n_0 ),
        .D(nQ[0]),
        .Q(\POT5_reg[7]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT5_reg[1] 
       (.C(clk_out),
        .CE(\POT5[7]_i_1_n_0 ),
        .D(nQ[1]),
        .Q(\POT5_reg[7]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT5_reg[2] 
       (.C(clk_out),
        .CE(\POT5[7]_i_1_n_0 ),
        .D(nQ[2]),
        .Q(\POT5_reg[7]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT5_reg[3] 
       (.C(clk_out),
        .CE(\POT5[7]_i_1_n_0 ),
        .D(nQ[3]),
        .Q(\POT5_reg[7]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT5_reg[4] 
       (.C(clk_out),
        .CE(\POT5[7]_i_1_n_0 ),
        .D(nQ[4]),
        .Q(\POT5_reg[7]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT5_reg[5] 
       (.C(clk_out),
        .CE(\POT5[7]_i_1_n_0 ),
        .D(nQ[5]),
        .Q(\POT5_reg[7]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT5_reg[6] 
       (.C(clk_out),
        .CE(\POT5[7]_i_1_n_0 ),
        .D(nQ[6]),
        .Q(\POT5_reg[7]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT5_reg[7] 
       (.C(clk_out),
        .CE(\POT5[7]_i_1_n_0 ),
        .D(nQ[7]),
        .Q(\POT5_reg[7]_0 [7]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0002)) 
    \POT6[7]_i_1 
       (.I0(\POT7_reg[0]_0 [1]),
        .I1(\POT7_reg[0]_0 [0]),
        .I2(nor4),
        .I3(p_0_in0_in),
        .O(\POT6[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT6_reg[0] 
       (.C(clk_out),
        .CE(\POT6[7]_i_1_n_0 ),
        .D(nQ[0]),
        .Q(\POT6_reg[7]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT6_reg[1] 
       (.C(clk_out),
        .CE(\POT6[7]_i_1_n_0 ),
        .D(nQ[1]),
        .Q(\POT6_reg[7]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT6_reg[2] 
       (.C(clk_out),
        .CE(\POT6[7]_i_1_n_0 ),
        .D(nQ[2]),
        .Q(\POT6_reg[7]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT6_reg[3] 
       (.C(clk_out),
        .CE(\POT6[7]_i_1_n_0 ),
        .D(nQ[3]),
        .Q(\POT6_reg[7]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT6_reg[4] 
       (.C(clk_out),
        .CE(\POT6[7]_i_1_n_0 ),
        .D(nQ[4]),
        .Q(\POT6_reg[7]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT6_reg[5] 
       (.C(clk_out),
        .CE(\POT6[7]_i_1_n_0 ),
        .D(nQ[5]),
        .Q(\POT6_reg[7]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT6_reg[6] 
       (.C(clk_out),
        .CE(\POT6[7]_i_1_n_0 ),
        .D(nQ[6]),
        .Q(\POT6_reg[7]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT6_reg[7] 
       (.C(clk_out),
        .CE(\POT6[7]_i_1_n_0 ),
        .D(nQ[7]),
        .Q(\POT6_reg[7]_0 [7]),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0002)) 
    \POT7[7]_i_1 
       (.I0(\POT7_reg[0]_0 [1]),
        .I1(\POT7_reg[0]_0 [0]),
        .I2(nor4),
        .I3(p_0_in),
        .O(\POT7[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT7_reg[0] 
       (.C(clk_out),
        .CE(\POT7[7]_i_1_n_0 ),
        .D(nQ[0]),
        .Q(\POT7_reg[7]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT7_reg[1] 
       (.C(clk_out),
        .CE(\POT7[7]_i_1_n_0 ),
        .D(nQ[1]),
        .Q(\POT7_reg[7]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT7_reg[2] 
       (.C(clk_out),
        .CE(\POT7[7]_i_1_n_0 ),
        .D(nQ[2]),
        .Q(\POT7_reg[7]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT7_reg[3] 
       (.C(clk_out),
        .CE(\POT7[7]_i_1_n_0 ),
        .D(nQ[3]),
        .Q(\POT7_reg[7]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT7_reg[4] 
       (.C(clk_out),
        .CE(\POT7[7]_i_1_n_0 ),
        .D(nQ[4]),
        .Q(\POT7_reg[7]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT7_reg[5] 
       (.C(clk_out),
        .CE(\POT7[7]_i_1_n_0 ),
        .D(nQ[5]),
        .Q(\POT7_reg[7]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT7_reg[6] 
       (.C(clk_out),
        .CE(\POT7[7]_i_1_n_0 ),
        .D(nQ[6]),
        .Q(\POT7_reg[7]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \POT7_reg[7] 
       (.C(clk_out),
        .CE(\POT7[7]_i_1_n_0 ),
        .D(nQ[7]),
        .Q(\POT7_reg[7]_0 [7]),
        .R(1'b0));
  cell23 b0
       (.D(nQ[0]),
        .Qout(Qout),
        .Qout_0(Qout_6),
        .Qout_1(Qout_4),
        .Qout_2(Qout_5),
        .clk_out(clk_out),
        .delay2(delay2),
        .enp(enp),
        .nPotClk(nPotClk),
        .nor1(nor1),
        .nor4(nor4),
        .nor4_reg(b0_n_2),
        .nor4_reg_0(b3_n_2));
  cell23_19 b1
       (.D(nQ[1]),
        .Qout(Qout_0),
        .Qout_0(Qout),
        .Qout_1(Qout_2),
        .Qout_2(Qout_1),
        .bor__3(bor__3),
        .clk_out(clk_out),
        .enp(enp),
        .nPotClk(nPotClk),
        .nor1(nor1));
  cell23_20 b2
       (.D(nQ[2]),
        .Qout(Qout_1),
        .Qout_0(Qout_0),
        .Qout_1(Qout),
        .clk_out(clk_out),
        .enp(enp),
        .nPotClk(nPotClk),
        .nor1(nor1));
  cell23_21 b3
       (.D(nQ[3]),
        .Qout(Qout_2),
        .Qout_0(Qout_1),
        .Qout_1(Qout),
        .Qout_2(Qout_0),
        .Qout_3(Qout_3),
        .Qout_reg_0(b3_n_2),
        .clk_out(clk_out),
        .enp(enp),
        .nPotClk(nPotClk),
        .nor1(nor1));
  cell23_22 b4
       (.D(nQ[4]),
        .Qout(Qout_3),
        .bor__3(bor__3),
        .clk_out(clk_out),
        .enp(enp),
        .nor1(nor1));
  cell23_23 b5
       (.D(nQ[5]),
        .Qout(Qout_4),
        .Qout_0(Qout_3),
        .bor__3(bor__3),
        .clk_out(clk_out),
        .enp(enp),
        .nor1(nor1));
  cell23_24 b6
       (.D(nQ[6]),
        .Qout(Qout_5),
        .Qout_0(Qout_4),
        .Qout_1(Qout_3),
        .bor__3(bor__3),
        .clk_out(clk_out),
        .enp(enp),
        .nor1(nor1));
  cell23_25 b7
       (.D(nQ[7]),
        .Qout(Qout_6),
        .Qout_0(Qout_5),
        .Qout_1(Qout_3),
        .Qout_2(Qout_4),
        .bor__3(bor__3),
        .clk_out(clk_out),
        .enp(enp),
        .nor1(nor1));
  LUT1 #(
    .INIT(2'h1)) 
    delay1_i_1
       (.I0(nor1),
        .O(potPreset));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    delay1_reg
       (.C(clk_out),
        .CE(enn),
        .D(potPreset),
        .Q(delay1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    delay2_reg
       (.C(clk_out),
        .CE(enn),
        .D(delay1),
        .Q(delay2),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    dump_i_1
       (.I0(nor4),
        .I1(dump_reg_0),
        .O(dump_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    dump_reg
       (.C(clk_out),
        .CE(enp),
        .D(dump_i_1_n_0),
        .Q(dump_OBUF),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    nPotClk_reg
       (.C(clk_out),
        .CE(enp),
        .D(nPotClk_reg_0),
        .Q(nPotClk),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \nQp[0]_i_1 
       (.I0(p_IBUF[0]),
        .O(\nQp[0]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \nQp[1]_i_1 
       (.I0(p_IBUF[1]),
        .O(\nQp[1]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \nQp[2]_i_1 
       (.I0(p_IBUF[2]),
        .O(\nQp[2]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \nQp[3]_i_1 
       (.I0(p_IBUF[3]),
        .O(\nQp[3]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \nQp[4]_i_1 
       (.I0(p_IBUF[4]),
        .O(\nQp[4]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \nQp[5]_i_1 
       (.I0(p_IBUF[5]),
        .O(\nQp[5]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \nQp[6]_i_1 
       (.I0(p_IBUF[6]),
        .O(\nQp[6]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \nQp[7]_i_1 
       (.I0(p_IBUF[7]),
        .O(\nQp[7]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \nQp_reg[0] 
       (.C(clk_out),
        .CE(enp),
        .D(\nQp[0]_i_1_n_0 ),
        .Q(\nQp_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \nQp_reg[1] 
       (.C(clk_out),
        .CE(enp),
        .D(\nQp[1]_i_1_n_0 ),
        .Q(p_0_in5_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \nQp_reg[2] 
       (.C(clk_out),
        .CE(enp),
        .D(\nQp[2]_i_1_n_0 ),
        .Q(p_0_in4_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \nQp_reg[3] 
       (.C(clk_out),
        .CE(enp),
        .D(\nQp[3]_i_1_n_0 ),
        .Q(p_0_in3_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \nQp_reg[4] 
       (.C(clk_out),
        .CE(enp),
        .D(\nQp[4]_i_1_n_0 ),
        .Q(p_0_in2_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \nQp_reg[5] 
       (.C(clk_out),
        .CE(enp),
        .D(\nQp[5]_i_1_n_0 ),
        .Q(p_0_in1_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \nQp_reg[6] 
       (.C(clk_out),
        .CE(enp),
        .D(\nQp[6]_i_1_n_0 ),
        .Q(p_0_in0_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \nQp_reg[7] 
       (.C(clk_out),
        .CE(enp),
        .D(\nQp[7]_i_1_n_0 ),
        .Q(p_0_in),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hE0EE)) 
    nor1_i_1
       (.I0(nor1),
        .I1(delay2),
        .I2(p_18_in),
        .I3(Q),
        .O(nor1_i_1_n_0));
  FDRE #(
    .INIT(1'b1),
    .IS_C_INVERTED(1'b1)) 
    nor1_reg
       (.C(clk_out),
        .CE(enn),
        .D(nor1_i_1_n_0),
        .Q(nor1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    nor4_reg
       (.C(clk_out),
        .CE(enp),
        .D(b0_n_2),
        .Q(nor4),
        .R(1'b0));
endmodule

module SER_core
   (nQ,
    nQ_0,
    ithisState,
    preBCLK,
    oclk_OBUF,
    DshiftOut,
    nor3,
    toneCntrl,
    sod_OBUF,
    setSdiCompl,
    resyncSerClk,
    resyncInt,
    resyncTwoTones,
    setSdoCompl,
    nor5,
    intQ_reg,
    siDelayInt_reg_0,
    intQ_reg_0,
    \Dr_reg[7]_0 ,
    enn,
    clk_out,
    nor1,
    muxOut,
    bclki_IBUF,
    enp,
    nor3_reg_0,
    toneCntrl_reg_0,
    delay2_reg_0,
    resync2Tones_reg_0,
    p_2_in,
    qnor5,
    sdoClock_reg_0,
    sdoDloaded_reg_0,
    resyncSerClk_reg_0,
    sid_IBUF,
    qnor3_reg,
    Q_reg,
    E,
    \oQD_reg[7]_0 );
  output nQ;
  output nQ_0;
  output ithisState;
  output preBCLK;
  output oclk_OBUF;
  output DshiftOut;
  output nor3;
  output toneCntrl;
  output sod_OBUF;
  output setSdiCompl;
  output resyncSerClk;
  output resyncInt;
  output resyncTwoTones;
  output setSdoCompl;
  output nor5;
  output [0:0]intQ_reg;
  output [0:0]siDelayInt_reg_0;
  output intQ_reg_0;
  output [7:0]\Dr_reg[7]_0 ;
  input enn;
  input clk_out;
  input nor1;
  input muxOut;
  input bclki_IBUF;
  input enp;
  input nor3_reg_0;
  input toneCntrl_reg_0;
  input delay2_reg_0;
  input resync2Tones_reg_0;
  input p_2_in;
  input qnor5;
  input [5:0]sdoClock_reg_0;
  input sdoDloaded_reg_0;
  input [0:0]resyncSerClk_reg_0;
  input sid_IBUF;
  input [0:0]qnor3_reg;
  input [1:0]Q_reg;
  input [0:0]E;
  input [7:0]\oQD_reg[7]_0 ;

  wire [7:0]DQ;
  wire [7:0]\Dr_reg[7]_0 ;
  wire DshiftOut;
  wire [0:0]E;
  wire Load;
  wire Q0_out;
  wire QBCLK;
  wire [1:0]Q_reg;
  wire Qint;
  wire Qout_0;
  wire Qout_1;
  wire Qout_2;
  wire Qout_3;
  wire Qout_4;
  wire Qout_6;
  wire Qout_7;
  wire SOD_i_1_n_0;
  wire bclki_IBUF;
  wire clk_out;
  wire delay2;
  wire delay2_reg_0;
  wire enn;
  wire enp;
  wire ibstart_n_0;
  wire ibstart_n_1;
  wire ibstop_n_0;
  wire [0:0]intQ_reg;
  wire intQ_reg_0;
  wire istate_n_1;
  wire istate_n_2;
  wire istate_n_3;
  wire istate_n_4;
  wire ithisState;
  wire mux1;
  wire mux1_0;
  wire mux1_1;
  wire mux1_2;
  wire mux1_3;
  wire mux1_4;
  wire mux1_5;
  wire mux1_6;
  wire mux4;
  wire muxOut;
  wire nQ;
  wire nQ_0;
  wire nmux1;
  wire nor1;
  wire nor3;
  wire nor3_reg_0;
  wire nor4;
  wire nor4_i_1__4_n_0;
  wire nor5;
  wire [7:0]\oQD_reg[7]_0 ;
  wire \oQD_reg_n_0_[0] ;
  wire \oQD_reg_n_0_[1] ;
  wire \oQD_reg_n_0_[2] ;
  wire \oQD_reg_n_0_[3] ;
  wire \oQD_reg_n_0_[4] ;
  wire \oQD_reg_n_0_[5] ;
  wire \oQD_reg_n_0_[6] ;
  wire \oQD_reg_n_0_[7] ;
  wire oShift;
  wire ob5_n_1;
  wire obstart_n_0;
  wire obstop_n_1;
  wire oclk_OBUF;
  wire ostate_n_1;
  wire ostate_n_2;
  wire p_2_in;
  wire preBCLK;
  wire preShift1;
  wire preShift2;
  wire presync;
  wire [0:0]qnor3_reg;
  wire qnor5;
  wire resync2Tones_reg_0;
  wire resyncInt;
  wire resyncSerClk;
  wire [0:0]resyncSerClk_reg_0;
  wire resyncTwoTones;
  wire sdiClk;
  wire sdiClock;
  wire sdiStopBit;
  wire sdinStartBit;
  wire sdoClock;
  wire [5:0]sdoClock_reg_0;
  wire sdoDloaded;
  wire sdoDloaded_i_1_n_0;
  wire sdoDloaded_reg_0;
  wire setFramer;
  wire setSdiCompl;
  wire setSdoCompl;
  wire sh1;
  wire sh2;
  wire shift;
  wire siDelay;
  wire siDelayInt_i_1_n_0;
  wire [0:0]siDelayInt_reg_0;
  wire sid_IBUF;
  wire sod_OBUF;
  wire ssoEmpty;
  wire t2_n_2;
  wire t4_n_3;
  wire toneCntrl;
  wire toneCntrl_reg_0;

  LUT1 #(
    .INIT(2'h1)) 
    \DataFQ[4]_i_1 
       (.I0(siDelay),
        .O(siDelayInt_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    \Dr_reg[0] 
       (.C(clk_out),
        .CE(istate_n_4),
        .D(DQ[0]),
        .Q(\Dr_reg[7]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Dr_reg[1] 
       (.C(clk_out),
        .CE(istate_n_4),
        .D(DQ[1]),
        .Q(\Dr_reg[7]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Dr_reg[2] 
       (.C(clk_out),
        .CE(istate_n_4),
        .D(DQ[2]),
        .Q(\Dr_reg[7]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Dr_reg[3] 
       (.C(clk_out),
        .CE(istate_n_4),
        .D(DQ[3]),
        .Q(\Dr_reg[7]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Dr_reg[4] 
       (.C(clk_out),
        .CE(istate_n_4),
        .D(DQ[4]),
        .Q(\Dr_reg[7]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Dr_reg[5] 
       (.C(clk_out),
        .CE(istate_n_4),
        .D(DQ[5]),
        .Q(\Dr_reg[7]_0 [5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Dr_reg[6] 
       (.C(clk_out),
        .CE(istate_n_4),
        .D(DQ[6]),
        .Q(\Dr_reg[7]_0 [6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Dr_reg[7] 
       (.C(clk_out),
        .CE(istate_n_4),
        .D(DQ[7]),
        .Q(\Dr_reg[7]_0 [7]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    DshiftOut_reg
       (.C(clk_out),
        .CE(enn),
        .D(obstart_n_0),
        .Q(DshiftOut),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    Load_reg
       (.C(clk_out),
        .CE(enp),
        .D(ostate_n_2),
        .Q(Load),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    OCLK_reg
       (.C(clk_out),
        .CE(enn),
        .D(mux4),
        .Q(oclk_OBUF),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    QBCLK_reg
       (.C(clk_out),
        .CE(enn),
        .D(bclki_IBUF),
        .Q(QBCLK),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hD1)) 
    SOD_i_1
       (.I0(nor3),
        .I1(sdoClock_reg_0[2]),
        .I2(nor4),
        .O(SOD_i_1_n_0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    SOD_reg
       (.C(clk_out),
        .CE(enn),
        .D(SOD_i_1_n_0),
        .Q(sod_OBUF),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    delay2_reg
       (.C(clk_out),
        .CE(enp),
        .D(delay2_reg_0),
        .Q(delay2),
        .R(1'b0));
  cell17 ib0
       (.D(DQ[0]),
        .Q0_out(Q0_out),
        .Q_reg_0(ibstart_n_0),
        .Q_reg_1(DQ[1]),
        .clk_out(clk_out));
  cell17_2 ib1
       (.D(DQ[1]),
        .Q0_out(Q0_out),
        .Q_reg_0(ibstart_n_0),
        .Q_reg_1(DQ[2]),
        .clk_out(clk_out));
  cell17_3 ib2
       (.D(DQ[2]),
        .Q0_out(Q0_out),
        .Q_reg_0(ibstart_n_0),
        .Q_reg_1(DQ[3]),
        .clk_out(clk_out));
  cell17_4 ib3
       (.D(DQ[3]),
        .Q0_out(Q0_out),
        .Q_reg_0(ibstart_n_0),
        .Q_reg_1(DQ[4]),
        .clk_out(clk_out));
  cell17_5 ib4
       (.D(DQ[4]),
        .Q0_out(Q0_out),
        .Q_reg_0(ibstart_n_0),
        .Q_reg_1(DQ[5]),
        .clk_out(clk_out));
  cell17_6 ib5
       (.D(DQ[5]),
        .Q0_out(Q0_out),
        .Q_reg_0(ibstart_n_0),
        .Q_reg_1(DQ[6]),
        .clk_out(clk_out));
  cell17_7 ib6
       (.D(DQ[6]),
        .Q0_out(Q0_out),
        .Q_reg_0(ibstart_n_0),
        .Q_reg_1(DQ[7]),
        .clk_out(clk_out));
  cell17_8 ib7
       (.D(DQ[7]),
        .Q0_out(Q0_out),
        .Q_reg_0(ibstart_n_0),
        .Q_reg_1(ibstop_n_0),
        .clk_out(clk_out));
  cell17_9 ibstart
       (.D(DQ[0]),
        .Q0_out(Q0_out),
        .Q_reg_0(ibstart_n_1),
        .Q_reg_1(Q_reg),
        .clk_out(clk_out),
        .\prep_reg[1] (ibstart_n_0),
        .shift(shift));
  cell25 ibstop
       (.Q_reg_0(ibstop_n_0),
        .Q_reg_1(Q_reg),
        .clk_out(clk_out),
        .shift(shift),
        .siDelay(siDelay));
  cell2p istate
       (.E(istate_n_4),
        .Q0_out(Q0_out),
        .Q_reg(Q_reg),
        .clk_out(clk_out),
        .enn(enn),
        .intQ_reg_0(ithisState),
        .intQ_reg_1(sdoClock_reg_0[1:0]),
        .sdiClk(sdiClk),
        .sdiClk_reg(istate_n_1),
        .sdiClk_reg_0(istate_n_3),
        .sdiStopBit(sdiStopBit),
        .sdiStopBit_reg(istate_n_2),
        .sdinStartBit(sdinStartBit));
  FDRE #(
    .INIT(1'b0)) 
    nor3_reg
       (.C(clk_out),
        .CE(enp),
        .D(nor3_reg_0),
        .Q(nor3),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h82)) 
    nor4_i_1__4
       (.I0(sdoClock_reg_0[2]),
        .I1(nor4),
        .I2(toneCntrl),
        .O(nor4_i_1__4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    nor4_reg
       (.C(clk_out),
        .CE(enp),
        .D(nor4_i_1__4_n_0),
        .Q(nor4),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \oQD_reg[0] 
       (.C(clk_out),
        .CE(E),
        .D(\oQD_reg[7]_0 [0]),
        .Q(\oQD_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \oQD_reg[1] 
       (.C(clk_out),
        .CE(E),
        .D(\oQD_reg[7]_0 [1]),
        .Q(\oQD_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \oQD_reg[2] 
       (.C(clk_out),
        .CE(E),
        .D(\oQD_reg[7]_0 [2]),
        .Q(\oQD_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \oQD_reg[3] 
       (.C(clk_out),
        .CE(E),
        .D(\oQD_reg[7]_0 [3]),
        .Q(\oQD_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \oQD_reg[4] 
       (.C(clk_out),
        .CE(E),
        .D(\oQD_reg[7]_0 [4]),
        .Q(\oQD_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \oQD_reg[5] 
       (.C(clk_out),
        .CE(E),
        .D(\oQD_reg[7]_0 [5]),
        .Q(\oQD_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \oQD_reg[6] 
       (.C(clk_out),
        .CE(E),
        .D(\oQD_reg[7]_0 [6]),
        .Q(\oQD_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \oQD_reg[7] 
       (.C(clk_out),
        .CE(E),
        .D(\oQD_reg[7]_0 [7]),
        .Q(\oQD_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    oShift_reg
       (.C(clk_out),
        .CE(enn),
        .D(preShift2),
        .Q(oShift),
        .R(1'b0));
  cell15 ob0
       (.Qint(Qint),
        .Qout_0(Qout_0),
        .clk_out(clk_out),
        .mux1(mux1));
  cell15_10 ob1
       (.Load(Load),
        .Q(\oQD_reg_n_0_[0] ),
        .Qint(Qint),
        .Qout_1(Qout_1),
        .clk_out(clk_out),
        .mux1(mux1),
        .mux1_0(mux1_0));
  cell15_11 ob2
       (.Load(Load),
        .Q(\oQD_reg_n_0_[1] ),
        .Qint(Qint),
        .Qout_2(Qout_2),
        .clk_out(clk_out),
        .mux1(mux1_0),
        .mux1_0(mux1_1));
  cell15_12 ob3
       (.Load(Load),
        .Q(\oQD_reg_n_0_[2] ),
        .Qint(Qint),
        .Qout_3(Qout_3),
        .clk_out(clk_out),
        .mux1(mux1_1),
        .mux1_0(mux1_2));
  cell15_13 ob4
       (.Load(Load),
        .Q(\oQD_reg_n_0_[3] ),
        .Qint(Qint),
        .Qout_4(Qout_4),
        .clk_out(clk_out),
        .mux1(mux1_2),
        .mux1_0(mux1_3));
  cell15_14 ob5
       (.Load(Load),
        .Q(\oQD_reg_n_0_[4] ),
        .Qint(Qint),
        .Qint_reg_0(ob5_n_1),
        .Qout_4(Qout_4),
        .Qout_6(Qout_6),
        .Qout_7(Qout_7),
        .clk_out(clk_out),
        .mux1(mux1_3),
        .mux1_0(mux1_4));
  cell15_15 ob6
       (.Load(Load),
        .Q(\oQD_reg_n_0_[5] ),
        .Qint(Qint),
        .Qout_6(Qout_6),
        .clk_out(clk_out),
        .mux1(mux1_4),
        .mux1_0(mux1_5));
  cell15_16 ob7
       (.Load(Load),
        .Q(\oQD_reg_n_0_[6] ),
        .Qint(Qint),
        .Qint_reg_0(Q_reg),
        .Qout_7(Qout_7),
        .clk_out(clk_out),
        .mux1(mux1_5),
        .mux1_0(mux1_6),
        .oShift(oShift));
  cell16 obstart
       (.Load(Load),
        .Qint_reg_0(obstart_n_0),
        .Qint_reg_1(Q_reg),
        .Qout_0(Qout_0),
        .clk_out(clk_out),
        .oShift(oShift));
  cell17_17 obstop
       (.Load(Load),
        .Q(\oQD_reg_n_0_[7] ),
        .Q_reg_0(obstop_n_1),
        .Q_reg_1(Q_reg),
        .Qout_0(Qout_0),
        .Qout_1(Qout_1),
        .Qout_2(Qout_2),
        .Qout_3(Qout_3),
        .clk_out(clk_out),
        .mux1(mux1_6),
        .oShift(oShift),
        .ssoEmpty_reg(ob5_n_1));
  cell2p_18 ostate
       (.clk_out(clk_out),
        .enn(enn),
        .intQ_reg_0(intQ_reg),
        .intQ_reg_1(ostate_n_1),
        .intQ_reg_2(intQ_reg_0),
        .intQ_reg_3(sdoClock_reg_0[1:0]),
        .qnor3_reg(qnor3_reg),
        .sdoClock(sdoClock),
        .sdoDloaded(sdoDloaded),
        .sdoDloaded_reg(ostate_n_2),
        .ssoEmpty(ssoEmpty));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    preShift1_reg
       (.C(clk_out),
        .CE(enn),
        .D(ostate_n_1),
        .Q(preShift1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    preShift2_reg
       (.C(clk_out),
        .CE(enn),
        .D(preShift1),
        .Q(preShift2),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    presdi_reg
       (.C(clk_out),
        .CE(enn),
        .D(nmux1),
        .Q(preBCLK),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    presync_reg
       (.C(clk_out),
        .CE(enp),
        .D(istate_n_1),
        .Q(presync),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h54)) 
    qnor5_i_1
       (.I0(setFramer),
        .I1(p_2_in),
        .I2(qnor5),
        .O(nor5));
  FDRE #(
    .INIT(1'b0)) 
    resync2Tones_reg
       (.C(clk_out),
        .CE(enp),
        .D(resync2Tones_reg_0),
        .Q(resyncTwoTones),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    resyncSerClk_reg
       (.C(clk_out),
        .CE(enp),
        .D(resyncInt),
        .Q(resyncSerClk),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    sdiClk_reg
       (.C(clk_out),
        .CE(enn),
        .D(sh2),
        .Q(sdiClk),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    sdiClock_reg
       (.C(clk_out),
        .CE(enn),
        .D(t4_n_3),
        .Q(sdiClock),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    sdiStopBit_reg
       (.C(clk_out),
        .CE(enn),
        .D(ibstop_n_0),
        .Q(sdiStopBit),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    sdinStartBit_reg
       (.C(clk_out),
        .CE(enn),
        .D(ibstart_n_1),
        .Q(sdinStartBit),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    sdoClock_reg
       (.C(clk_out),
        .CE(enn),
        .D(t2_n_2),
        .Q(sdoClock),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    sdoComplInt_reg
       (.C(clk_out),
        .CE(enn),
        .D(Load),
        .Q(setSdoCompl),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h0000FFAB)) 
    sdoDloaded_i_1
       (.I0(setSdoCompl),
        .I1(sdoClock_reg_0[1]),
        .I2(sdoClock_reg_0[0]),
        .I3(sdoDloaded),
        .I4(sdoDloaded_reg_0),
        .O(sdoDloaded_i_1_n_0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    sdoDloaded_reg
       (.C(clk_out),
        .CE(enn),
        .D(sdoDloaded_i_1_n_0),
        .Q(sdoDloaded),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    setFramerr_reg
       (.C(clk_out),
        .CE(enn),
        .D(istate_n_2),
        .Q(setFramer),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    setSdiCompl_reg
       (.C(clk_out),
        .CE(enn),
        .D(istate_n_3),
        .Q(setSdiCompl),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    sh1_reg
       (.C(clk_out),
        .CE(enn),
        .D(shift),
        .Q(sh1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    sh2_reg
       (.C(clk_out),
        .CE(enn),
        .D(sh1),
        .Q(sh2),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    shift_reg
       (.C(clk_out),
        .CE(enn),
        .D(sdiClock),
        .Q(shift),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    siDelayInt_i_1
       (.I0(sid_IBUF),
        .O(siDelayInt_i_1_n_0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    siDelayInt_reg
       (.C(clk_out),
        .CE(enn),
        .D(siDelayInt_i_1_n_0),
        .Q(siDelay),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    ssoEmpty_reg
       (.C(clk_out),
        .CE(enn),
        .D(obstop_n_1),
        .Q(ssoEmpty),
        .R(1'b0));
  cell2r t2
       (.QBCLK(QBCLK),
        .clk_out(clk_out),
        .enn(enn),
        .mux4(mux4),
        .muxOut(muxOut),
        .nQ_0(nQ_0),
        .nQ_reg_0(t2_n_2),
        .oclk_OBUF(oclk_OBUF),
        .sdoClock_reg(sdoClock_reg_0[5:4]),
        .sdoClock_reg_0(nQ));
  cell2pr t4
       (.QBCLK(QBCLK),
        .clk_out(clk_out),
        .delay2(delay2),
        .enn(enn),
        .nQ_reg_0(nQ),
        .nmux1(nmux1),
        .nor1(nor1),
        .preBCLK(preBCLK),
        .presdi_reg(t4_n_3),
        .presync(presync),
        .resyncInt(resyncInt),
        .resyncSerClk(resyncSerClk),
        .resyncSerClk_reg(resyncSerClk_reg_0),
        .sdiClock_reg(sdoClock_reg_0[4:3]));
  FDRE #(
    .INIT(1'b0)) 
    toneCntrl_reg
       (.C(clk_out),
        .CE(enp),
        .D(toneCntrl_reg_0),
        .Q(toneCntrl),
        .R(1'b0));
endmodule

module SKCTLS_reg
   (D,
    Q,
    feedback4_reg,
    feedback5_reg,
    nor1,
    muxOut,
    bclko_OBUF,
    init,
    \SKCTLS_reg[7]_0 ,
    \SKCTLS_reg[3]_0 ,
    lfsr15k0,
    feedback4,
    feedback5,
    nQ,
    nQ_reg,
    resyncInt,
    nQ_0,
    preBCLK,
    DshiftOut,
    toneCntrl,
    E,
    \SKCTLS_reg[7]_1 ,
    clk_out);
  output [0:0]D;
  output [6:0]Q;
  output [0:0]feedback4_reg;
  output [0:0]feedback5_reg;
  output nor1;
  output muxOut;
  output bclko_OBUF;
  output init;
  output \SKCTLS_reg[7]_0 ;
  output \SKCTLS_reg[3]_0 ;
  input lfsr15k0;
  input feedback4;
  input feedback5;
  input nQ;
  input [1:0]nQ_reg;
  input resyncInt;
  input nQ_0;
  input preBCLK;
  input DshiftOut;
  input toneCntrl;
  input [0:0]E;
  input [7:0]\SKCTLS_reg[7]_1 ;
  input clk_out;

  wire [0:0]D;
  wire DshiftOut;
  wire [0:0]E;
  wire [6:0]Q;
  wire [7:7]SKCTLS;
  wire \SKCTLS_reg[3]_0 ;
  wire \SKCTLS_reg[7]_0 ;
  wire [7:0]\SKCTLS_reg[7]_1 ;
  wire bclko_OBUF;
  wire clk_out;
  wire feedback4;
  wire [0:0]feedback4_reg;
  wire feedback5;
  wire [0:0]feedback5_reg;
  wire init;
  wire lfsr15k0;
  wire muxOut;
  wire nQ;
  wire nQ_0;
  wire [1:0]nQ_reg;
  wire nor1;
  wire preBCLK;
  wire resyncInt;
  wire toneCntrl;

  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \SKCTLS_reg[0] 
       (.C(clk_out),
        .CE(E),
        .D(\SKCTLS_reg[7]_1 [0]),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \SKCTLS_reg[1] 
       (.C(clk_out),
        .CE(E),
        .D(\SKCTLS_reg[7]_1 [1]),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \SKCTLS_reg[2] 
       (.C(clk_out),
        .CE(E),
        .D(\SKCTLS_reg[7]_1 [2]),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \SKCTLS_reg[3] 
       (.C(clk_out),
        .CE(E),
        .D(\SKCTLS_reg[7]_1 [3]),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \SKCTLS_reg[4] 
       (.C(clk_out),
        .CE(E),
        .D(\SKCTLS_reg[7]_1 [4]),
        .Q(Q[4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \SKCTLS_reg[5] 
       (.C(clk_out),
        .CE(E),
        .D(\SKCTLS_reg[7]_1 [5]),
        .Q(Q[5]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \SKCTLS_reg[6] 
       (.C(clk_out),
        .CE(E),
        .D(\SKCTLS_reg[7]_1 [6]),
        .Q(Q[6]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \SKCTLS_reg[7] 
       (.C(clk_out),
        .CE(E),
        .D(\SKCTLS_reg[7]_1 [7]),
        .Q(SKCTLS),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h10)) 
    bclko_OBUF_inst_i_1
       (.I0(preBCLK),
        .I1(Q[4]),
        .I2(Q[5]),
        .O(bclko_OBUF));
  LUT3 #(
    .INIT(8'h54)) 
    \lfsr15k[1]_i_1 
       (.I0(lfsr15k0),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(D));
  LUT3 #(
    .INIT(8'h54)) 
    \lfsr4bit[2]_i_1 
       (.I0(feedback4),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(feedback4_reg));
  LUT3 #(
    .INIT(8'h54)) 
    \lfsr5bit[3]_i_1 
       (.I0(feedback5),
        .I1(Q[1]),
        .I2(Q[0]),
        .O(feedback5_reg));
  LUT2 #(
    .INIT(4'h1)) 
    \lfsr64k[0]_i_2 
       (.I0(Q[0]),
        .I1(Q[1]),
        .O(init));
  LUT6 #(
    .INIT(64'h0000000000FEFF01)) 
    nQ_i_1__3
       (.I0(Q[6]),
        .I1(Q[4]),
        .I2(Q[5]),
        .I3(nQ),
        .I4(nQ_reg[1]),
        .I5(resyncInt),
        .O(nor1));
  LUT5 #(
    .INIT(32'h5556AAAA)) 
    nQ_i_1__4
       (.I0(nQ_reg[0]),
        .I1(Q[5]),
        .I2(Q[4]),
        .I3(Q[6]),
        .I4(nQ_0),
        .O(muxOut));
  LUT2 #(
    .INIT(4'h1)) 
    nor3_i_1
       (.I0(SKCTLS),
        .I1(DshiftOut),
        .O(\SKCTLS_reg[7]_0 ));
  LUT2 #(
    .INIT(4'h2)) 
    resync2Tones_i_1
       (.I0(Q[3]),
        .I1(toneCntrl),
        .O(\SKCTLS_reg[3]_0 ));
endmodule

module SKSTAT_reg
   (qreset,
    qnor3,
    qnor4,
    qnor5,
    enn,
    qreset_reg_0,
    clk_out,
    nor3,
    nor4,
    nor5);
  output qreset;
  output qnor3;
  output qnor4;
  output qnor5;
  input enn;
  input qreset_reg_0;
  input clk_out;
  input nor3;
  input nor4;
  input nor5;

  wire clk_out;
  wire enn;
  wire nor3;
  wire nor4;
  wire nor5;
  wire qnor3;
  wire qnor4;
  wire qnor5;
  wire qreset;
  wire qreset_reg_0;

  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    qnor3_reg
       (.C(clk_out),
        .CE(enn),
        .D(nor3),
        .Q(qnor3),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    qnor4_reg
       (.C(clk_out),
        .CE(enn),
        .D(nor4),
        .Q(qnor4),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    qnor5_reg
       (.C(clk_out),
        .CE(enn),
        .D(nor5),
        .Q(qnor5),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    qreset_reg
       (.C(clk_out),
        .CE(enn),
        .D(qreset_reg_0),
        .Q(qreset),
        .R(1'b0));
endmodule

module aud_control
   (poly4_2,
    poly5_2,
    poly17_2,
    nor4,
    I,
    nor30__1,
    D,
    \data_reg[4]_0 ,
    m__0,
    \data_reg[2]_0 ,
    \data_reg[1]_0 ,
    enn,
    clk_out,
    poly4_1,
    poly5_1,
    poly17_1,
    I_reg_0,
    Q,
    resync,
    rstDelay,
    \AUD34_reg[0] ,
    I_0,
    m__0_1,
    E,
    \data_reg[7]_0 );
  output poly4_2;
  output poly5_2;
  output poly17_2;
  output nor4;
  output I;
  output nor30__1;
  output [1:0]D;
  output [4:0]\data_reg[4]_0 ;
  output m__0;
  output \data_reg[2]_0 ;
  output \data_reg[1]_0 ;
  input enn;
  input clk_out;
  input poly4_1;
  input poly5_1;
  input poly17_1;
  input I_reg_0;
  input [0:0]Q;
  input resync;
  input rstDelay;
  input [2:0]\AUD34_reg[0] ;
  input I_0;
  input m__0_1;
  input [0:0]E;
  input [7:0]\data_reg[7]_0 ;

  wire [2:0]\AUD34_reg[0] ;
  wire [1:0]D;
  wire [0:0]E;
  wire I;
  wire I_0;
  wire I_reg_0;
  wire [0:0]Q;
  wire c2r_n_0;
  wire c2r_n_1;
  wire clk_out;
  wire \data_reg[1]_0 ;
  wire \data_reg[2]_0 ;
  wire [4:0]\data_reg[4]_0 ;
  wire [7:0]\data_reg[7]_0 ;
  wire \data_reg_n_0_[5] ;
  wire \data_reg_n_0_[7] ;
  wire enn;
  wire m__0;
  wire m__0_1;
  wire nQnor1;
  wire nor30__1;
  wire nor4;
  wire nor5__5;
  wire p_0_in;
  wire poly17_1;
  wire poly17_2;
  wire poly4_1;
  wire poly4_2;
  wire poly5_1;
  wire poly5_2;
  wire resync;
  wire rstDelay;

  LUT6 #(
    .INIT(64'h1F1F1FE0E0E0E0E0)) 
    \AUD34[0]_i_1 
       (.I0(\data_reg[4]_0 [4]),
        .I1(I),
        .I2(\data_reg[4]_0 [0]),
        .I3(\AUD34_reg[0] [2]),
        .I4(I_0),
        .I5(\AUD34_reg[0] [0]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h00F000F0FF870078)) 
    \AUD34[1]_i_1 
       (.I0(\data_reg[4]_0 [0]),
        .I1(\AUD34_reg[0] [0]),
        .I2(\AUD34_reg[0] [1]),
        .I3(m__0_1),
        .I4(\data_reg[4]_0 [1]),
        .I5(m__0),
        .O(D[1]));
  LUT2 #(
    .INIT(4'h1)) 
    \AUD34[4]_i_2 
       (.I0(\data_reg[4]_0 [4]),
        .I1(I),
        .O(m__0));
  LUT3 #(
    .INIT(8'hA8)) 
    \AUD34[4]_i_4 
       (.I0(\data_reg[4]_0 [2]),
        .I1(I),
        .I2(\data_reg[4]_0 [4]),
        .O(\data_reg[2]_0 ));
  LUT3 #(
    .INIT(8'hA8)) 
    \AUD34[4]_i_6 
       (.I0(\data_reg[4]_0 [1]),
        .I1(I),
        .I2(\data_reg[4]_0 [4]),
        .O(\data_reg[1]_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF888BBB8B)) 
    I_i_2__1
       (.I0(I),
        .I1(\data_reg_n_0_[5] ),
        .I2(poly17_1),
        .I3(p_0_in),
        .I4(poly4_1),
        .I5(nQnor1),
        .O(nor30__1));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    I_reg
       (.C(clk_out),
        .CE(enn),
        .D(I_reg_0),
        .Q(I),
        .R(1'b0));
  cell2r_67 c2r
       (.Q(\data_reg_n_0_[7] ),
        .clk_out(clk_out),
        .enn(enn),
        .nQ_reg_0(c2r_n_0),
        .nQ_reg_1(c2r_n_1),
        .nQnor1_reg(Q),
        .nor5__5(nor5__5),
        .poly5_1(poly5_1));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[0] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [0]),
        .Q(\data_reg[4]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[1] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [1]),
        .Q(\data_reg[4]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[2] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [2]),
        .Q(\data_reg[4]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[3] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [3]),
        .Q(\data_reg[4]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[4] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [4]),
        .Q(\data_reg[4]_0 [4]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[5] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [5]),
        .Q(\data_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[6] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [6]),
        .Q(p_0_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[7] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [7]),
        .Q(\data_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nQnor1_reg
       (.C(clk_out),
        .CE(enn),
        .D(c2r_n_1),
        .Q(nQnor1),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0002)) 
    nor4_i_2__0
       (.I0(nor30__1),
        .I1(nor4),
        .I2(resync),
        .I3(rstDelay),
        .O(nor5__5));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nor4_reg
       (.C(clk_out),
        .CE(enn),
        .D(c2r_n_0),
        .Q(nor4),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    poly17Out_reg
       (.C(clk_out),
        .CE(enn),
        .D(poly17_1),
        .Q(poly17_2),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    poly4Out_reg
       (.C(clk_out),
        .CE(enn),
        .D(poly4_1),
        .Q(poly4_2),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    poly5Out_reg
       (.C(clk_out),
        .CE(enn),
        .D(poly5_1),
        .Q(poly5_2),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "aud_control" *) 
module aud_control_1
   (nor4,
    I,
    nor30__2,
    D,
    \data_reg[4]_0 ,
    m__0,
    enn,
    clk_out,
    I_reg_0,
    Q,
    resync,
    rstDelay,
    poly5_2,
    poly17_2,
    poly4_2,
    m__0_0,
    \AUD34_reg[3] ,
    I_1,
    \AUD34_reg[3]_0 ,
    \AUD34_reg[3]_1 ,
    E,
    \data_reg[7]_0 );
  output nor4;
  output I;
  output nor30__2;
  output [2:0]D;
  output [2:0]\data_reg[4]_0 ;
  output m__0;
  input enn;
  input clk_out;
  input I_reg_0;
  input [0:0]Q;
  input resync;
  input rstDelay;
  input poly5_2;
  input poly17_2;
  input poly4_2;
  input m__0_0;
  input [4:0]\AUD34_reg[3] ;
  input I_1;
  input \AUD34_reg[3]_0 ;
  input \AUD34_reg[3]_1 ;
  input [0:0]E;
  input [7:0]\data_reg[7]_0 ;

  wire \AUD34[2]_i_2_n_0 ;
  wire \AUD34[4]_i_3_n_0 ;
  wire \AUD34[4]_i_5_n_0 ;
  wire [4:0]\AUD34_reg[3] ;
  wire \AUD34_reg[3]_0 ;
  wire \AUD34_reg[3]_1 ;
  wire [2:0]D;
  wire [0:0]E;
  wire I;
  wire I_1;
  wire I_reg_0;
  wire [0:0]Q;
  wire c2r_n_0;
  wire c2r_n_1;
  wire clk_out;
  wire [2:0]\data_reg[4]_0 ;
  wire [7:0]\data_reg[7]_0 ;
  wire \data_reg_n_0_[2] ;
  wire \data_reg_n_0_[3] ;
  wire \data_reg_n_0_[5] ;
  wire \data_reg_n_0_[7] ;
  wire enn;
  wire m__0;
  wire m__0_0;
  wire nQnor1;
  wire nor30__2;
  wire nor4;
  wire nor5__5;
  wire p_0_in;
  wire poly17_2;
  wire poly4_2;
  wire poly5_2;
  wire resync;
  wire rstDelay;

  LUT6 #(
    .INIT(64'h59A659A659A6A6A6)) 
    \AUD34[2]_i_1 
       (.I0(\AUD34[2]_i_2_n_0 ),
        .I1(\data_reg_n_0_[2] ),
        .I2(m__0),
        .I3(\AUD34_reg[3] [2]),
        .I4(I_1),
        .I5(\AUD34_reg[3] [4]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h0504040004000400)) 
    \AUD34[2]_i_2 
       (.I0(m__0),
        .I1(\data_reg[4]_0 [1]),
        .I2(m__0_0),
        .I3(\AUD34_reg[3] [1]),
        .I4(\AUD34_reg[3] [0]),
        .I5(\data_reg[4]_0 [0]),
        .O(\AUD34[2]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h59A659A659A6A6A6)) 
    \AUD34[3]_i_1 
       (.I0(\AUD34[4]_i_3_n_0 ),
        .I1(\data_reg_n_0_[3] ),
        .I2(m__0),
        .I3(\AUD34_reg[3] [3]),
        .I4(I_1),
        .I5(\AUD34_reg[3] [4]),
        .O(D[1]));
  LUT2 #(
    .INIT(4'h1)) 
    \AUD34[3]_i_2 
       (.I0(\data_reg[4]_0 [2]),
        .I1(I),
        .O(m__0));
  LUT6 #(
    .INIT(64'hE0FFE0E000E00000)) 
    \AUD34[4]_i_1 
       (.I0(\data_reg[4]_0 [2]),
        .I1(I),
        .I2(\data_reg_n_0_[3] ),
        .I3(m__0_0),
        .I4(\AUD34_reg[3] [3]),
        .I5(\AUD34[4]_i_3_n_0 ),
        .O(D[2]));
  LUT6 #(
    .INIT(64'hF4545440F4404040)) 
    \AUD34[4]_i_3 
       (.I0(m__0),
        .I1(\data_reg_n_0_[2] ),
        .I2(\AUD34_reg[3]_0 ),
        .I3(\AUD34[4]_i_5_n_0 ),
        .I4(\AUD34_reg[3]_1 ),
        .I5(\data_reg[4]_0 [1]),
        .O(\AUD34[4]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hE0E0E00000000000)) 
    \AUD34[4]_i_5 
       (.I0(\data_reg[4]_0 [2]),
        .I1(I),
        .I2(\data_reg[4]_0 [0]),
        .I3(\AUD34_reg[3] [4]),
        .I4(I_1),
        .I5(\AUD34_reg[3] [0]),
        .O(\AUD34[4]_i_5_n_0 ));
  LUT6 #(
    .INIT(64'hFFFFFFFF888BBB8B)) 
    I_i_2__2
       (.I0(I),
        .I1(\data_reg_n_0_[5] ),
        .I2(poly17_2),
        .I3(p_0_in),
        .I4(poly4_2),
        .I5(nQnor1),
        .O(nor30__2));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    I_reg
       (.C(clk_out),
        .CE(enn),
        .D(I_reg_0),
        .Q(I),
        .R(1'b0));
  cell2r_66 c2r
       (.Q(\data_reg_n_0_[7] ),
        .clk_out(clk_out),
        .enn(enn),
        .nQ_reg_0(c2r_n_0),
        .nQ_reg_1(c2r_n_1),
        .nQnor1_reg(Q),
        .nor5__5(nor5__5),
        .poly5_2(poly5_2));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[0] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [0]),
        .Q(\data_reg[4]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[1] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [1]),
        .Q(\data_reg[4]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[2] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [2]),
        .Q(\data_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[3] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [3]),
        .Q(\data_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[4] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [4]),
        .Q(\data_reg[4]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[5] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [5]),
        .Q(\data_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[6] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [6]),
        .Q(p_0_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[7] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [7]),
        .Q(\data_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nQnor1_reg
       (.C(clk_out),
        .CE(enn),
        .D(c2r_n_1),
        .Q(nQnor1),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0002)) 
    nor4_i_2
       (.I0(nor30__2),
        .I1(nor4),
        .I2(resync),
        .I3(rstDelay),
        .O(nor5__5));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nor4_reg
       (.C(clk_out),
        .CE(enn),
        .D(c2r_n_0),
        .Q(nor4),
        .R(1'b0));
endmodule

module aud_control_hp
   (poly4_0,
    poly5_0,
    poly17_0,
    nor4,
    nor30,
    D,
    \data_reg[3]_0 ,
    m__0,
    \data_reg[3]_1 ,
    \data_reg[2]_0 ,
    enn,
    clk_out,
    Q,
    poly5bit,
    poly17Out_reg_0,
    I_reg_0,
    intQ_reg,
    resync,
    rstDelay,
    nQ_reg,
    disHiFltr1,
    \AUD12_reg[2] ,
    \AUD12_reg[2]_0 ,
    \AUD12_reg[1] ,
    m__0_0,
    E,
    \data_reg[7]_0 );
  output poly4_0;
  output poly5_0;
  output poly17_0;
  output nor4;
  output nor30;
  output [2:0]D;
  output [3:0]\data_reg[3]_0 ;
  output m__0;
  output \data_reg[3]_1 ;
  output \data_reg[2]_0 ;
  input enn;
  input clk_out;
  input [0:0]Q;
  input poly5bit;
  input [0:0]poly17Out_reg_0;
  input I_reg_0;
  input [1:0]intQ_reg;
  input resync;
  input rstDelay;
  input [0:0]nQ_reg;
  input disHiFltr1;
  input \AUD12_reg[2] ;
  input \AUD12_reg[2]_0 ;
  input [1:0]\AUD12_reg[1] ;
  input m__0_0;
  input [0:0]E;
  input [7:0]\data_reg[7]_0 ;

  wire [1:0]\AUD12_reg[1] ;
  wire \AUD12_reg[2] ;
  wire \AUD12_reg[2]_0 ;
  wire [2:0]D;
  wire [0:0]E;
  wire I;
  wire I_reg_0;
  wire [0:0]Q;
  wire T;
  wire c2r_n_0;
  wire c2r_n_1;
  wire clk_out;
  wire \data_reg[2]_0 ;
  wire [3:0]\data_reg[3]_0 ;
  wire \data_reg[3]_1 ;
  wire [7:0]\data_reg[7]_0 ;
  wire \data_reg_n_0_[5] ;
  wire \data_reg_n_0_[7] ;
  wire disHiFltr1;
  wire enn;
  wire [1:0]intQ_reg;
  wire m__0;
  wire m__0_0;
  wire [0:0]nQ_reg;
  wire nQnor1;
  wire nor30;
  wire nor4;
  wire nor5__5;
  wire p_0_in;
  wire [0:0]poly17Out_reg_0;
  wire poly17_0;
  wire poly4_0;
  wire poly5_0;
  wire poly5bit;
  wire resync;
  wire rstDelay;

  LUT6 #(
    .INIT(64'hFFFFFFFF888BBB8B)) 
    I_i_2
       (.I0(I),
        .I1(\data_reg_n_0_[5] ),
        .I2(poly17Out_reg_0),
        .I3(p_0_in),
        .I4(Q),
        .I5(nQnor1),
        .O(nor30));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    I_reg
       (.C(clk_out),
        .CE(enn),
        .D(I_reg_0),
        .Q(I),
        .R(1'b0));
  cell2p_70 c2p
       (.\AUD12_reg[1] (\AUD12_reg[1] ),
        .\AUD12_reg[2] (\AUD12_reg[2] ),
        .\AUD12_reg[2]_0 (\AUD12_reg[2]_0 ),
        .D(D),
        .I(I),
        .Q({T,\data_reg[3]_0 }),
        .clk_out(clk_out),
        .\data_reg[2] (\data_reg[2]_0 ),
        .\data_reg[3] (\data_reg[3]_1 ),
        .disHiFltr1(disHiFltr1),
        .enn(enn),
        .intQ_reg_0(intQ_reg[1]),
        .m__0(m__0),
        .m__0_0(m__0_0));
  cell2r_71 c2r
       (.Q(\data_reg_n_0_[7] ),
        .clk_out(clk_out),
        .enn(enn),
        .nQ_reg_0(c2r_n_0),
        .nQ_reg_1(c2r_n_1),
        .nQ_reg_2(nQ_reg),
        .nQnor1_reg(intQ_reg[0]),
        .nor5__5(nor5__5));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[0] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [0]),
        .Q(\data_reg[3]_0 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[1] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [1]),
        .Q(\data_reg[3]_0 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[2] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [2]),
        .Q(\data_reg[3]_0 [2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[3] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [3]),
        .Q(\data_reg[3]_0 [3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[4] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [4]),
        .Q(T),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[5] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [5]),
        .Q(\data_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[6] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [6]),
        .Q(p_0_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[7] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [7]),
        .Q(\data_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nQnor1_reg
       (.C(clk_out),
        .CE(enn),
        .D(c2r_n_1),
        .Q(nQnor1),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0002)) 
    nor4_i_2__2
       (.I0(nor30),
        .I1(nor4),
        .I2(resync),
        .I3(rstDelay),
        .O(nor5__5));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nor4_reg
       (.C(clk_out),
        .CE(enn),
        .D(c2r_n_0),
        .Q(nor4),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    poly17Out_reg
       (.C(clk_out),
        .CE(enn),
        .D(poly17Out_reg_0),
        .Q(poly17_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    poly4Out_reg
       (.C(clk_out),
        .CE(enn),
        .D(Q),
        .Q(poly4_0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    poly5Out_reg
       (.C(clk_out),
        .CE(enn),
        .D(poly5bit),
        .Q(poly5_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "aud_control_hp" *) 
module aud_control_hp_0
   (poly4_1,
    poly5_1,
    poly17_1,
    nor4,
    nor30__0,
    D,
    m__0,
    \data_reg[1]_0 ,
    \data_reg[2]_0 ,
    \data_reg[1]_1 ,
    enn,
    clk_out,
    poly4_0,
    poly5_0,
    poly17_0,
    I_reg_0,
    Q,
    resync,
    rstDelay,
    \AUD12_reg[4] ,
    \AUD12_reg[4]_0 ,
    \AUD12_reg[3] ,
    m__0_0,
    disHiFltr2,
    E,
    \data_reg[7]_0 );
  output poly4_1;
  output poly5_1;
  output poly17_1;
  output nor4;
  output nor30__0;
  output [1:0]D;
  output m__0;
  output \data_reg[1]_0 ;
  output \data_reg[2]_0 ;
  output [1:0]\data_reg[1]_1 ;
  input enn;
  input clk_out;
  input poly4_0;
  input poly5_0;
  input poly17_0;
  input I_reg_0;
  input [1:0]Q;
  input resync;
  input rstDelay;
  input \AUD12_reg[4] ;
  input \AUD12_reg[4]_0 ;
  input [3:0]\AUD12_reg[3] ;
  input m__0_0;
  input disHiFltr2;
  input [0:0]E;
  input [7:0]\data_reg[7]_0 ;

  wire [3:0]\AUD12_reg[3] ;
  wire \AUD12_reg[4] ;
  wire \AUD12_reg[4]_0 ;
  wire [1:0]D;
  wire [0:0]E;
  wire I;
  wire I_reg_0;
  wire [1:0]Q;
  wire T;
  wire c2r_n_0;
  wire c2r_n_1;
  wire clk_out;
  wire \data_reg[1]_0 ;
  wire [1:0]\data_reg[1]_1 ;
  wire \data_reg[2]_0 ;
  wire [7:0]\data_reg[7]_0 ;
  wire \data_reg_n_0_[2] ;
  wire \data_reg_n_0_[3] ;
  wire \data_reg_n_0_[5] ;
  wire \data_reg_n_0_[7] ;
  wire disHiFltr2;
  wire enn;
  wire m__0;
  wire m__0_0;
  wire nQnor1;
  wire nor30__0;
  wire nor4;
  wire nor5__5;
  wire p_0_in;
  wire poly17_0;
  wire poly17_1;
  wire poly4_0;
  wire poly4_1;
  wire poly5_0;
  wire poly5_1;
  wire resync;
  wire rstDelay;

  LUT6 #(
    .INIT(64'hFFFFFFFF888BBB8B)) 
    I_i_2__0
       (.I0(I),
        .I1(\data_reg_n_0_[5] ),
        .I2(poly17_0),
        .I3(p_0_in),
        .I4(poly4_0),
        .I5(nQnor1),
        .O(nor30__0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    I_reg
       (.C(clk_out),
        .CE(enn),
        .D(I_reg_0),
        .Q(I),
        .R(1'b0));
  cell2p_68 c2p
       (.\AUD12_reg[3] (\AUD12_reg[3] ),
        .\AUD12_reg[4] (\AUD12_reg[4] ),
        .\AUD12_reg[4]_0 (\AUD12_reg[4]_0 ),
        .D(D),
        .I(I),
        .Q({T,\data_reg_n_0_[3] ,\data_reg_n_0_[2] ,\data_reg[1]_1 }),
        .clk_out(clk_out),
        .\data_reg[1] (\data_reg[1]_0 ),
        .\data_reg[2] (\data_reg[2]_0 ),
        .disHiFltr2(disHiFltr2),
        .enn(enn),
        .intQ_reg_0(Q[1]),
        .m__0(m__0),
        .m__0_0(m__0_0));
  cell2r_69 c2r
       (.Q(\data_reg_n_0_[7] ),
        .clk_out(clk_out),
        .enn(enn),
        .nQ_reg_0(c2r_n_0),
        .nQ_reg_1(c2r_n_1),
        .nQnor1_reg(Q[0]),
        .nor5__5(nor5__5),
        .poly5_0(poly5_0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[0] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [0]),
        .Q(\data_reg[1]_1 [0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[1] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [1]),
        .Q(\data_reg[1]_1 [1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[2] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [2]),
        .Q(\data_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[3] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [3]),
        .Q(\data_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[4] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [4]),
        .Q(T),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[5] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [5]),
        .Q(\data_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[6] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [6]),
        .Q(p_0_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \data_reg[7] 
       (.C(clk_out),
        .CE(E),
        .D(\data_reg[7]_0 [7]),
        .Q(\data_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nQnor1_reg
       (.C(clk_out),
        .CE(enn),
        .D(c2r_n_1),
        .Q(nQnor1),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h0002)) 
    nor4_i_2__1
       (.I0(nor30__0),
        .I1(nor4),
        .I2(resync),
        .I3(rstDelay),
        .O(nor5__5));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nor4_reg
       (.C(clk_out),
        .CE(enn),
        .D(c2r_n_0),
        .Q(nor4),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    poly17Out_reg
       (.C(clk_out),
        .CE(enn),
        .D(poly17_0),
        .Q(poly17_1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    poly4Out_reg
       (.C(clk_out),
        .CE(enn),
        .D(poly4_0),
        .Q(poly4_1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    poly5Out_reg
       (.C(clk_out),
        .CE(enn),
        .D(poly5_0),
        .Q(poly5_1),
        .R(1'b0));
endmodule

module cell15
   (Qout_0,
    Qint,
    mux1,
    clk_out);
  output Qout_0;
  input Qint;
  input mux1;
  input clk_out;

  wire Qint;
  wire Qout_0;
  wire clk_out;
  wire mux1;

  FDRE #(
    .INIT(1'b0)) 
    Qint_reg
       (.C(clk_out),
        .CE(Qint),
        .D(mux1),
        .Q(Qout_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell15" *) 
module cell15_10
   (Qout_1,
    mux1,
    Qint,
    mux1_0,
    clk_out,
    Q,
    Load);
  output Qout_1;
  output mux1;
  input Qint;
  input mux1_0;
  input clk_out;
  input [0:0]Q;
  input Load;

  wire Load;
  wire [0:0]Q;
  wire Qint;
  wire Qout_1;
  wire clk_out;
  wire mux1;
  wire mux1_0;

  LUT3 #(
    .INIT(8'hB8)) 
    Qint_i_2
       (.I0(Q),
        .I1(Load),
        .I2(Qout_1),
        .O(mux1));
  FDRE #(
    .INIT(1'b0)) 
    Qint_reg
       (.C(clk_out),
        .CE(Qint),
        .D(mux1_0),
        .Q(Qout_1),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell15" *) 
module cell15_11
   (Qout_2,
    mux1,
    Qint,
    mux1_0,
    clk_out,
    Q,
    Load);
  output Qout_2;
  output mux1;
  input Qint;
  input mux1_0;
  input clk_out;
  input [0:0]Q;
  input Load;

  wire Load;
  wire [0:0]Q;
  wire Qint;
  wire Qout_2;
  wire clk_out;
  wire mux1;
  wire mux1_0;

  LUT3 #(
    .INIT(8'hB8)) 
    Qint_i_1
       (.I0(Q),
        .I1(Load),
        .I2(Qout_2),
        .O(mux1));
  FDRE #(
    .INIT(1'b0)) 
    Qint_reg
       (.C(clk_out),
        .CE(Qint),
        .D(mux1_0),
        .Q(Qout_2),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell15" *) 
module cell15_12
   (Qout_3,
    mux1,
    Qint,
    mux1_0,
    clk_out,
    Q,
    Load);
  output Qout_3;
  output mux1;
  input Qint;
  input mux1_0;
  input clk_out;
  input [0:0]Q;
  input Load;

  wire Load;
  wire [0:0]Q;
  wire Qint;
  wire Qout_3;
  wire clk_out;
  wire mux1;
  wire mux1_0;

  LUT3 #(
    .INIT(8'hB8)) 
    Qint_i_1__0
       (.I0(Q),
        .I1(Load),
        .I2(Qout_3),
        .O(mux1));
  FDRE #(
    .INIT(1'b0)) 
    Qint_reg
       (.C(clk_out),
        .CE(Qint),
        .D(mux1_0),
        .Q(Qout_3),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell15" *) 
module cell15_13
   (Qout_4,
    mux1,
    Qint,
    mux1_0,
    clk_out,
    Q,
    Load);
  output Qout_4;
  output mux1;
  input Qint;
  input mux1_0;
  input clk_out;
  input [0:0]Q;
  input Load;

  wire Load;
  wire [0:0]Q;
  wire Qint;
  wire Qout_4;
  wire clk_out;
  wire mux1;
  wire mux1_0;

  LUT3 #(
    .INIT(8'hB8)) 
    Qint_i_1__1
       (.I0(Q),
        .I1(Load),
        .I2(Qout_4),
        .O(mux1));
  FDRE #(
    .INIT(1'b0)) 
    Qint_reg
       (.C(clk_out),
        .CE(Qint),
        .D(mux1_0),
        .Q(Qout_4),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell15" *) 
module cell15_14
   (mux1,
    Qint_reg_0,
    Qint,
    mux1_0,
    clk_out,
    Q,
    Load,
    Qout_4,
    Qout_7,
    Qout_6);
  output mux1;
  output Qint_reg_0;
  input Qint;
  input mux1_0;
  input clk_out;
  input [0:0]Q;
  input Load;
  input Qout_4;
  input Qout_7;
  input Qout_6;

  wire Load;
  wire [0:0]Q;
  wire Qint;
  wire Qint_reg_0;
  wire Qout_4;
  wire Qout_5;
  wire Qout_6;
  wire Qout_7;
  wire clk_out;
  wire mux1;
  wire mux1_0;

  LUT3 #(
    .INIT(8'hB8)) 
    Qint_i_1__2
       (.I0(Q),
        .I1(Load),
        .I2(Qout_5),
        .O(mux1));
  FDRE #(
    .INIT(1'b0)) 
    Qint_reg
       (.C(clk_out),
        .CE(Qint),
        .D(mux1_0),
        .Q(Qout_5),
        .R(1'b0));
  LUT4 #(
    .INIT(16'hFFFE)) 
    ssoEmpty_i_2
       (.I0(Qout_5),
        .I1(Qout_4),
        .I2(Qout_7),
        .I3(Qout_6),
        .O(Qint_reg_0));
endmodule

(* ORIG_REF_NAME = "cell15" *) 
module cell15_15
   (Qout_6,
    mux1,
    Qint,
    mux1_0,
    clk_out,
    Q,
    Load);
  output Qout_6;
  output mux1;
  input Qint;
  input mux1_0;
  input clk_out;
  input [0:0]Q;
  input Load;

  wire Load;
  wire [0:0]Q;
  wire Qint;
  wire Qout_6;
  wire clk_out;
  wire mux1;
  wire mux1_0;

  LUT3 #(
    .INIT(8'hB8)) 
    Qint_i_1__3
       (.I0(Q),
        .I1(Load),
        .I2(Qout_6),
        .O(mux1));
  FDRE #(
    .INIT(1'b0)) 
    Qint_reg
       (.C(clk_out),
        .CE(Qint),
        .D(mux1_0),
        .Q(Qout_6),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell15" *) 
module cell15_16
   (Qout_7,
    Qint,
    mux1,
    mux1_0,
    clk_out,
    Q,
    Load,
    Qint_reg_0,
    oShift);
  output Qout_7;
  output Qint;
  output mux1;
  input mux1_0;
  input clk_out;
  input [0:0]Q;
  input Load;
  input [1:0]Qint_reg_0;
  input oShift;

  wire Load;
  wire [0:0]Q;
  wire Qint;
  wire [1:0]Qint_reg_0;
  wire Qout_7;
  wire clk_out;
  wire mux1;
  wire mux1_0;
  wire oShift;

  LUT3 #(
    .INIT(8'hB8)) 
    Qint_i_1__4
       (.I0(Q),
        .I1(Load),
        .I2(Qout_7),
        .O(mux1));
  LUT4 #(
    .INIT(16'h2220)) 
    Qint_i_1__6
       (.I0(Qint_reg_0[0]),
        .I1(Qint_reg_0[1]),
        .I2(oShift),
        .I3(Load),
        .O(Qint));
  FDRE #(
    .INIT(1'b0)) 
    Qint_reg
       (.C(clk_out),
        .CE(Qint),
        .D(mux1_0),
        .Q(Qout_7),
        .R(1'b0));
endmodule

module cell16
   (Qint_reg_0,
    clk_out,
    Qint_reg_1,
    oShift,
    Qout_0,
    Load);
  output Qint_reg_0;
  input clk_out;
  input [1:0]Qint_reg_1;
  input oShift;
  input Qout_0;
  input Load;

  wire Load;
  wire Qint;
  wire Qint_i_1__7_n_0;
  wire Qint_reg_0;
  wire [1:0]Qint_reg_1;
  wire Qout_0;
  wire clk_out;
  wire oShift;

  LUT1 #(
    .INIT(2'h1)) 
    DshiftOut_i_1
       (.I0(Qint),
        .O(Qint_reg_0));
  LUT6 #(
    .INIT(64'hD0D0D0D0F2F0D0F0)) 
    Qint_i_1__7
       (.I0(Qint_reg_1[0]),
        .I1(Qint_reg_1[1]),
        .I2(Qint),
        .I3(oShift),
        .I4(Qout_0),
        .I5(Load),
        .O(Qint_i_1__7_n_0));
  FDRE #(
    .INIT(1'b0)) 
    Qint_reg
       (.C(clk_out),
        .CE(1'b1),
        .D(Qint_i_1__7_n_0),
        .Q(Qint),
        .R(1'b0));
endmodule

module cell17
   (D,
    Q0_out,
    Q_reg_0,
    Q_reg_1,
    clk_out);
  output [0:0]D;
  input Q0_out;
  input Q_reg_0;
  input [0:0]Q_reg_1;
  input clk_out;

  wire [0:0]D;
  wire Q0_out;
  wire Q_reg_0;
  wire [0:0]Q_reg_1;
  wire clk_out;

  FDSE #(
    .INIT(1'b1)) 
    Q_reg
       (.C(clk_out),
        .CE(Q_reg_0),
        .D(Q_reg_1),
        .Q(D),
        .S(Q0_out));
endmodule

(* ORIG_REF_NAME = "cell17" *) 
module cell17_17
   (mux1,
    Q_reg_0,
    clk_out,
    Q,
    Load,
    ssoEmpty_reg,
    Qout_1,
    Qout_0,
    Qout_3,
    Qout_2,
    Q_reg_1,
    oShift);
  output mux1;
  output Q_reg_0;
  input clk_out;
  input [0:0]Q;
  input Load;
  input ssoEmpty_reg;
  input Qout_1;
  input Qout_0;
  input Qout_3;
  input Qout_2;
  input [1:0]Q_reg_1;
  input oShift;

  wire Load;
  wire [0:0]Q;
  wire Q_i_1_n_0;
  wire Q_reg_0;
  wire [1:0]Q_reg_1;
  wire Qout_0;
  wire Qout_1;
  wire Qout_2;
  wire Qout_3;
  wire Qout_8;
  wire clk_out;
  wire mux1;
  wire oShift;
  wire ssoEmpty_reg;

  LUT5 #(
    .INIT(32'hFF22DF00)) 
    Q_i_1
       (.I0(Q_reg_1[0]),
        .I1(Q_reg_1[1]),
        .I2(oShift),
        .I3(Qout_8),
        .I4(Load),
        .O(Q_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    Q_reg
       (.C(clk_out),
        .CE(1'b1),
        .D(Q_i_1_n_0),
        .Q(Qout_8),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hB8)) 
    Qint_i_1__5
       (.I0(Q),
        .I1(Load),
        .I2(Qout_8),
        .O(mux1));
  LUT6 #(
    .INIT(64'hFFFFFFFFFFFFFFFE)) 
    ssoEmpty_i_1
       (.I0(Qout_8),
        .I1(ssoEmpty_reg),
        .I2(Qout_1),
        .I3(Qout_0),
        .I4(Qout_3),
        .I5(Qout_2),
        .O(Q_reg_0));
endmodule

(* ORIG_REF_NAME = "cell17" *) 
module cell17_2
   (D,
    Q0_out,
    Q_reg_0,
    Q_reg_1,
    clk_out);
  output [0:0]D;
  input Q0_out;
  input Q_reg_0;
  input [0:0]Q_reg_1;
  input clk_out;

  wire [0:0]D;
  wire Q0_out;
  wire Q_reg_0;
  wire [0:0]Q_reg_1;
  wire clk_out;

  FDSE #(
    .INIT(1'b1)) 
    Q_reg
       (.C(clk_out),
        .CE(Q_reg_0),
        .D(Q_reg_1),
        .Q(D),
        .S(Q0_out));
endmodule

(* ORIG_REF_NAME = "cell17" *) 
module cell17_3
   (D,
    Q0_out,
    Q_reg_0,
    Q_reg_1,
    clk_out);
  output [0:0]D;
  input Q0_out;
  input Q_reg_0;
  input [0:0]Q_reg_1;
  input clk_out;

  wire [0:0]D;
  wire Q0_out;
  wire Q_reg_0;
  wire [0:0]Q_reg_1;
  wire clk_out;

  FDSE #(
    .INIT(1'b1)) 
    Q_reg
       (.C(clk_out),
        .CE(Q_reg_0),
        .D(Q_reg_1),
        .Q(D),
        .S(Q0_out));
endmodule

(* ORIG_REF_NAME = "cell17" *) 
module cell17_4
   (D,
    Q0_out,
    Q_reg_0,
    Q_reg_1,
    clk_out);
  output [0:0]D;
  input Q0_out;
  input Q_reg_0;
  input [0:0]Q_reg_1;
  input clk_out;

  wire [0:0]D;
  wire Q0_out;
  wire Q_reg_0;
  wire [0:0]Q_reg_1;
  wire clk_out;

  FDSE #(
    .INIT(1'b1)) 
    Q_reg
       (.C(clk_out),
        .CE(Q_reg_0),
        .D(Q_reg_1),
        .Q(D),
        .S(Q0_out));
endmodule

(* ORIG_REF_NAME = "cell17" *) 
module cell17_5
   (D,
    Q0_out,
    Q_reg_0,
    Q_reg_1,
    clk_out);
  output [0:0]D;
  input Q0_out;
  input Q_reg_0;
  input [0:0]Q_reg_1;
  input clk_out;

  wire [0:0]D;
  wire Q0_out;
  wire Q_reg_0;
  wire [0:0]Q_reg_1;
  wire clk_out;

  FDSE #(
    .INIT(1'b1)) 
    Q_reg
       (.C(clk_out),
        .CE(Q_reg_0),
        .D(Q_reg_1),
        .Q(D),
        .S(Q0_out));
endmodule

(* ORIG_REF_NAME = "cell17" *) 
module cell17_6
   (D,
    Q0_out,
    Q_reg_0,
    Q_reg_1,
    clk_out);
  output [0:0]D;
  input Q0_out;
  input Q_reg_0;
  input [0:0]Q_reg_1;
  input clk_out;

  wire [0:0]D;
  wire Q0_out;
  wire Q_reg_0;
  wire [0:0]Q_reg_1;
  wire clk_out;

  FDSE #(
    .INIT(1'b1)) 
    Q_reg
       (.C(clk_out),
        .CE(Q_reg_0),
        .D(Q_reg_1),
        .Q(D),
        .S(Q0_out));
endmodule

(* ORIG_REF_NAME = "cell17" *) 
module cell17_7
   (D,
    Q0_out,
    Q_reg_0,
    Q_reg_1,
    clk_out);
  output [0:0]D;
  input Q0_out;
  input Q_reg_0;
  input [0:0]Q_reg_1;
  input clk_out;

  wire [0:0]D;
  wire Q0_out;
  wire Q_reg_0;
  wire [0:0]Q_reg_1;
  wire clk_out;

  FDSE #(
    .INIT(1'b1)) 
    Q_reg
       (.C(clk_out),
        .CE(Q_reg_0),
        .D(Q_reg_1),
        .Q(D),
        .S(Q0_out));
endmodule

(* ORIG_REF_NAME = "cell17" *) 
module cell17_8
   (D,
    Q0_out,
    Q_reg_0,
    Q_reg_1,
    clk_out);
  output [0:0]D;
  input Q0_out;
  input Q_reg_0;
  input Q_reg_1;
  input clk_out;

  wire [0:0]D;
  wire Q0_out;
  wire Q_reg_0;
  wire Q_reg_1;
  wire clk_out;

  FDSE #(
    .INIT(1'b1)) 
    Q_reg
       (.C(clk_out),
        .CE(Q_reg_0),
        .D(Q_reg_1),
        .Q(D),
        .S(Q0_out));
endmodule

(* ORIG_REF_NAME = "cell17" *) 
module cell17_9
   (\prep_reg[1] ,
    Q_reg_0,
    Q0_out,
    D,
    clk_out,
    Q_reg_1,
    shift);
  output \prep_reg[1] ;
  output Q_reg_0;
  input Q0_out;
  input [0:0]D;
  input clk_out;
  input [1:0]Q_reg_1;
  input shift;

  wire [0:0]D;
  wire Q;
  wire Q0_out;
  wire Q_reg_0;
  wire [1:0]Q_reg_1;
  wire clk_out;
  wire \prep_reg[1] ;
  wire shift;

  LUT3 #(
    .INIT(8'h20)) 
    Q_i_2
       (.I0(Q_reg_1[0]),
        .I1(Q_reg_1[1]),
        .I2(shift),
        .O(\prep_reg[1] ));
  FDSE #(
    .INIT(1'b1)) 
    Q_reg
       (.C(clk_out),
        .CE(\prep_reg[1] ),
        .D(D),
        .Q(Q),
        .S(Q0_out));
  LUT1 #(
    .INIT(2'h1)) 
    sdinStartBit_i_1
       (.I0(Q),
        .O(Q_reg_0));
endmodule

module cell20
   (\pren_reg[2] ,
    or1Q,
    clk_out,
    nDout,
    nDout_reg_0,
    Q,
    enFastClk1,
    audClock,
    or1Q_reg_0);
  output \pren_reg[2] ;
  output or1Q;
  input clk_out;
  input nDout;
  input nDout_reg_0;
  input [0:0]Q;
  input enFastClk1;
  input audClock;
  input [1:0]or1Q_reg_0;

  wire [0:0]Q;
  wire audClock;
  wire bt;
  wire clk_out;
  wire enFastClk1;
  wire muxOut;
  wire nDout;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;
  wire or1Q_i_1__2_n_0;
  wire [1:0]or1Q_reg_0;
  wire \pren_reg[2] ;

  LUT2 #(
    .INIT(4'h2)) 
    \ALLPOT[7]_i_2 
       (.I0(or1Q_reg_0[1]),
        .I1(or1Q_reg_0[0]),
        .O(\pren_reg[2] ));
  LUT5 #(
    .INIT(32'h8B8B8BB8)) 
    bt_i_1__6
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt),
        .I3(enFastClk1),
        .I4(audClock),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(\pren_reg[2] ),
        .D(muxOut),
        .Q(bt),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h00A8)) 
    or1Q_i_1__2
       (.I0(bt),
        .I1(audClock),
        .I2(enFastClk1),
        .I3(Q),
        .O(or1Q_i_1__2_n_0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    or1Q_reg
       (.C(clk_out),
        .CE(\pren_reg[2] ),
        .D(or1Q_i_1__2_n_0),
        .Q(or1Q),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell20" *) 
module cell20_39
   (or1Q,
    or1Q_reg_0,
    clk_out,
    nDout,
    nDout_reg_0,
    Q,
    CR_BOR_1_3,
    bt,
    bt_0,
    bt_1,
    or1Q_2);
  output or1Q;
  input or1Q_reg_0;
  input clk_out;
  input nDout;
  input nDout_reg_0;
  input [0:0]Q;
  input CR_BOR_1_3;
  input bt;
  input bt_0;
  input bt_1;
  input or1Q_2;

  wire CR_BOR_1_3;
  wire [0:0]Q;
  wire bt;
  wire bt_0;
  wire bt_1;
  wire bt_2;
  wire clk_out;
  wire muxOut;
  wire nDout;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;
  wire or1Q_2;
  wire or1Q_i_1__1_n_0;
  wire or1Q_reg_0;

  LUT4 #(
    .INIT(16'h8BB8)) 
    bt_i_1__2
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt_2),
        .I3(CR_BOR_1_3),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(or1Q_reg_0),
        .D(muxOut),
        .Q(bt_2),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    or1Q_i_1__1
       (.I0(bt_2),
        .I1(bt),
        .I2(bt_0),
        .I3(bt_1),
        .I4(or1Q_2),
        .I5(Q),
        .O(or1Q_i_1__1_n_0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    or1Q_reg
       (.C(clk_out),
        .CE(or1Q_reg_0),
        .D(or1Q_i_1__1_n_0),
        .Q(or1Q),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell20" *) 
module cell20_42
   (or1Q,
    or1Q_reg_0,
    clk_out,
    nDout_0,
    nDout_reg_0,
    Q,
    audClock,
    ch2Bits16,
    or1Q_reg_1);
  output or1Q;
  input or1Q_reg_0;
  input clk_out;
  input nDout_0;
  input nDout_reg_0;
  input [0:0]Q;
  input audClock;
  input ch2Bits16;
  input [0:0]or1Q_reg_1;

  wire [0:0]Q;
  wire audClock;
  wire bt;
  wire ch2Bits16;
  wire clk_out;
  wire muxOut;
  wire nDout_0;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;
  wire or1Q_i_1_n_0;
  wire or1Q_reg_0;
  wire [0:0]or1Q_reg_1;

  LUT6 #(
    .INIT(64'h8B8B8BB8B8B88BB8)) 
    bt_i_1__14
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt),
        .I3(audClock),
        .I4(ch2Bits16),
        .I5(or1Q_reg_1),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(or1Q_reg_0),
        .D(muxOut),
        .Q(bt),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout_0),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00008A80)) 
    or1Q_i_1
       (.I0(bt),
        .I1(or1Q_reg_1),
        .I2(ch2Bits16),
        .I3(audClock),
        .I4(Q),
        .O(or1Q_i_1_n_0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    or1Q_reg
       (.C(clk_out),
        .CE(or1Q_reg_0),
        .D(or1Q_i_1_n_0),
        .Q(or1Q),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell20" *) 
module cell20_46
   (or1Q,
    or1Q_reg_0,
    clk_out,
    nDout_0,
    nDout_reg_0,
    Q,
    CR_BOR_2_3,
    bt,
    bt_0,
    bt_1,
    or1Q_2);
  output or1Q;
  input or1Q_reg_0;
  input clk_out;
  input nDout_0;
  input nDout_reg_0;
  input [0:0]Q;
  input CR_BOR_2_3;
  input bt;
  input bt_0;
  input bt_1;
  input or1Q_2;

  wire CR_BOR_2_3;
  wire [0:0]Q;
  wire bt;
  wire bt_0;
  wire bt_1;
  wire bt_2;
  wire clk_out;
  wire muxOut;
  wire nDout_0;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;
  wire or1Q_2;
  wire or1Q_i_1__3_n_0;
  wire or1Q_reg_0;

  LUT4 #(
    .INIT(16'h8BB8)) 
    bt_i_1__10
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt_2),
        .I3(CR_BOR_2_3),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(or1Q_reg_0),
        .D(muxOut),
        .Q(bt_2),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout_0),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    or1Q_i_1__3
       (.I0(bt_2),
        .I1(bt),
        .I2(bt_0),
        .I3(bt_1),
        .I4(or1Q_2),
        .I5(Q),
        .O(or1Q_i_1__3_n_0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    or1Q_reg
       (.C(clk_out),
        .CE(or1Q_reg_0),
        .D(or1Q_i_1__3_n_0),
        .Q(or1Q),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell20" *) 
module cell20_50
   (or1Q,
    or1Q_reg_0,
    clk_out,
    nDout_1,
    nDout_reg_0,
    Q,
    enFastClk3,
    audClock);
  output or1Q;
  input or1Q_reg_0;
  input clk_out;
  input nDout_1;
  input nDout_reg_0;
  input [0:0]Q;
  input enFastClk3;
  input audClock;

  wire [0:0]Q;
  wire audClock;
  wire bt;
  wire clk_out;
  wire enFastClk3;
  wire muxOut;
  wire nDout_1;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;
  wire or1Q_i_1__5_n_0;
  wire or1Q_reg_0;

  LUT5 #(
    .INIT(32'h8B8B8BB8)) 
    bt_i_1__22
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt),
        .I3(enFastClk3),
        .I4(audClock),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(or1Q_reg_0),
        .D(muxOut),
        .Q(bt),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout_1),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h00A8)) 
    or1Q_i_1__5
       (.I0(bt),
        .I1(audClock),
        .I2(enFastClk3),
        .I3(Q),
        .O(or1Q_i_1__5_n_0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    or1Q_reg
       (.C(clk_out),
        .CE(or1Q_reg_0),
        .D(or1Q_i_1__5_n_0),
        .Q(or1Q),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell20" *) 
module cell20_54
   (or1Q,
    or1Q_reg_0,
    clk_out,
    nDout_1,
    nDout_reg_0,
    Q,
    CR_BOR_3_3,
    bt,
    bt_0,
    bt_1,
    or1Q_2);
  output or1Q;
  input or1Q_reg_0;
  input clk_out;
  input nDout_1;
  input nDout_reg_0;
  input [0:0]Q;
  input CR_BOR_3_3;
  input bt;
  input bt_0;
  input bt_1;
  input or1Q_2;

  wire CR_BOR_3_3;
  wire [0:0]Q;
  wire bt;
  wire bt_0;
  wire bt_1;
  wire bt_2;
  wire clk_out;
  wire muxOut;
  wire nDout_1;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;
  wire or1Q_2;
  wire or1Q_i_1__4_n_0;
  wire or1Q_reg_0;

  LUT4 #(
    .INIT(16'h8BB8)) 
    bt_i_1__18
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt_2),
        .I3(CR_BOR_3_3),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(or1Q_reg_0),
        .D(muxOut),
        .Q(bt_2),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout_1),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    or1Q_i_1__4
       (.I0(bt_2),
        .I1(bt),
        .I2(bt_0),
        .I3(bt_1),
        .I4(or1Q_2),
        .I5(Q),
        .O(or1Q_i_1__4_n_0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    or1Q_reg
       (.C(clk_out),
        .CE(or1Q_reg_0),
        .D(or1Q_i_1__4_n_0),
        .Q(or1Q),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell20" *) 
module cell20_58
   (or1Q,
    or1Q_reg_0,
    clk_out,
    nDout_2,
    nDout_reg_0,
    Q,
    audClock,
    ch4Bits16,
    or1Q_reg_1);
  output or1Q;
  input or1Q_reg_0;
  input clk_out;
  input nDout_2;
  input nDout_reg_0;
  input [0:0]Q;
  input audClock;
  input ch4Bits16;
  input [0:0]or1Q_reg_1;

  wire [0:0]Q;
  wire audClock;
  wire bt;
  wire ch4Bits16;
  wire clk_out;
  wire muxOut;
  wire nDout_2;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;
  wire or1Q_i_1__0_n_0;
  wire or1Q_reg_0;
  wire [0:0]or1Q_reg_1;

  LUT6 #(
    .INIT(64'h8B8B8BB8B8B88BB8)) 
    bt_i_1__30
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt),
        .I3(audClock),
        .I4(ch4Bits16),
        .I5(or1Q_reg_1),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(or1Q_reg_0),
        .D(muxOut),
        .Q(bt),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout_2),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00008A80)) 
    or1Q_i_1__0
       (.I0(bt),
        .I1(or1Q_reg_1),
        .I2(ch4Bits16),
        .I3(audClock),
        .I4(Q),
        .O(or1Q_i_1__0_n_0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    or1Q_reg
       (.C(clk_out),
        .CE(or1Q_reg_0),
        .D(or1Q_i_1__0_n_0),
        .Q(or1Q),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell20" *) 
module cell20_62
   (or1Q,
    or1Q_reg_0,
    clk_out,
    nDout_2,
    nDout_reg_0,
    Q,
    CR_BOR_4_3,
    bt,
    bt_0,
    bt_1,
    or1Q_2);
  output or1Q;
  input or1Q_reg_0;
  input clk_out;
  input nDout_2;
  input nDout_reg_0;
  input [0:0]Q;
  input CR_BOR_4_3;
  input bt;
  input bt_0;
  input bt_1;
  input or1Q_2;

  wire CR_BOR_4_3;
  wire [0:0]Q;
  wire bt;
  wire bt_0;
  wire bt_1;
  wire bt_2;
  wire clk_out;
  wire muxOut;
  wire nDout_2;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;
  wire or1Q_2;
  wire or1Q_i_1__6_n_0;
  wire or1Q_reg_0;

  LUT4 #(
    .INIT(16'h8BB8)) 
    bt_i_1__26
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt_2),
        .I3(CR_BOR_4_3),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(or1Q_reg_0),
        .D(muxOut),
        .Q(bt_2),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout_2),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h0000000080000000)) 
    or1Q_i_1__6
       (.I0(bt_2),
        .I1(bt),
        .I2(bt_0),
        .I3(bt_1),
        .I4(or1Q_2),
        .I5(Q),
        .O(or1Q_i_1__6_n_0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    or1Q_reg
       (.C(clk_out),
        .CE(or1Q_reg_0),
        .D(or1Q_i_1__6_n_0),
        .Q(or1Q),
        .R(1'b0));
endmodule

module cell23
   (Qout,
    D,
    nor4_reg,
    enp,
    clk_out,
    nor1,
    nor4_reg_0,
    nor4,
    delay2,
    Qout_0,
    Qout_1,
    Qout_2,
    nPotClk);
  output Qout;
  output [0:0]D;
  output nor4_reg;
  input enp;
  input clk_out;
  input nor1;
  input nor4_reg_0;
  input nor4;
  input delay2;
  input Qout_0;
  input Qout_1;
  input Qout_2;
  input nPotClk;

  wire [0:0]D;
  wire Qout;
  wire Qout_0;
  wire Qout_1;
  wire Qout_2;
  wire Qout_i_1__6_n_0;
  wire clk_out;
  wire delay2;
  wire enp;
  wire nPotClk;
  wire nor1;
  wire nor4;
  wire nor4_i_2__3_n_0;
  wire nor4_reg;
  wire nor4_reg_0;

  LUT2 #(
    .INIT(4'h2)) 
    \POT0[0]_i_1 
       (.I0(nor1),
        .I1(Qout),
        .O(D));
  LUT3 #(
    .INIT(8'hD2)) 
    Qout_i_1__6
       (.I0(nor1),
        .I1(Qout),
        .I2(nPotClk),
        .O(Qout_i_1__6_n_0));
  FDRE #(
    .INIT(1'b0)) 
    Qout_reg
       (.C(clk_out),
        .CE(enp),
        .D(Qout_i_1__6_n_0),
        .Q(Qout),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h00F1)) 
    nor4_i_1__3
       (.I0(nor4_i_2__3_n_0),
        .I1(nor4_reg_0),
        .I2(nor4),
        .I3(delay2),
        .O(nor4_reg));
  LUT5 #(
    .INIT(32'hFFFFFDFF)) 
    nor4_i_2__3
       (.I0(Qout),
        .I1(Qout_0),
        .I2(Qout_1),
        .I3(nor1),
        .I4(Qout_2),
        .O(nor4_i_2__3_n_0));
endmodule

(* ORIG_REF_NAME = "cell23" *) 
module cell23_19
   (Qout,
    D,
    bor__3,
    enp,
    clk_out,
    Qout_0,
    nor1,
    nPotClk,
    Qout_1,
    Qout_2);
  output Qout;
  output [0:0]D;
  output bor__3;
  input enp;
  input clk_out;
  input Qout_0;
  input nor1;
  input nPotClk;
  input Qout_1;
  input Qout_2;

  wire [0:0]D;
  wire Qout;
  wire Qout_0;
  wire Qout_1;
  wire Qout_2;
  wire Qout_i_1_n_0;
  wire bor__3;
  wire clk_out;
  wire enp;
  wire nPotClk;
  wire nor1;

  LUT2 #(
    .INIT(4'h2)) 
    \POT0[1]_i_1 
       (.I0(nor1),
        .I1(Qout),
        .O(D));
  LUT4 #(
    .INIT(16'hAF9F)) 
    Qout_i_1
       (.I0(Qout),
        .I1(Qout_0),
        .I2(nor1),
        .I3(nPotClk),
        .O(Qout_i_1_n_0));
  LUT6 #(
    .INIT(64'h0000000000000010)) 
    Qout_i_2
       (.I0(nPotClk),
        .I1(Qout),
        .I2(nor1),
        .I3(Qout_0),
        .I4(Qout_1),
        .I5(Qout_2),
        .O(bor__3));
  FDRE #(
    .INIT(1'b0)) 
    Qout_reg
       (.C(clk_out),
        .CE(enp),
        .D(Qout_i_1_n_0),
        .Q(Qout),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell23" *) 
module cell23_20
   (Qout,
    D,
    enp,
    clk_out,
    Qout_0,
    nor1,
    nPotClk,
    Qout_1);
  output Qout;
  output [0:0]D;
  input enp;
  input clk_out;
  input Qout_0;
  input nor1;
  input nPotClk;
  input Qout_1;

  wire [0:0]D;
  wire Qout;
  wire Qout_0;
  wire Qout_1;
  wire Qout_i_1__1_n_0;
  wire clk_out;
  wire enp;
  wire nPotClk;
  wire nor1;

  LUT2 #(
    .INIT(4'h2)) 
    \POT0[2]_i_1 
       (.I0(nor1),
        .I1(Qout),
        .O(D));
  LUT5 #(
    .INIT(32'hAFAFAF9F)) 
    Qout_i_1__1
       (.I0(Qout),
        .I1(Qout_0),
        .I2(nor1),
        .I3(nPotClk),
        .I4(Qout_1),
        .O(Qout_i_1__1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    Qout_reg
       (.C(clk_out),
        .CE(enp),
        .D(Qout_i_1__1_n_0),
        .Q(Qout),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell23" *) 
module cell23_21
   (Qout,
    D,
    Qout_reg_0,
    enp,
    clk_out,
    Qout_0,
    nor1,
    Qout_1,
    nPotClk,
    Qout_2,
    Qout_3);
  output Qout;
  output [0:0]D;
  output Qout_reg_0;
  input enp;
  input clk_out;
  input Qout_0;
  input nor1;
  input Qout_1;
  input nPotClk;
  input Qout_2;
  input Qout_3;

  wire [0:0]D;
  wire Qout;
  wire Qout_0;
  wire Qout_1;
  wire Qout_2;
  wire Qout_3;
  wire Qout_i_1__0_n_0;
  wire Qout_reg_0;
  wire clk_out;
  wire enp;
  wire nPotClk;
  wire nor1;

  LUT2 #(
    .INIT(4'h2)) 
    \POT0[3]_i_1 
       (.I0(nor1),
        .I1(Qout),
        .O(D));
  LUT6 #(
    .INIT(64'hAFAFAFAFAFAFAF9F)) 
    Qout_i_1__0
       (.I0(Qout),
        .I1(Qout_0),
        .I2(nor1),
        .I3(Qout_1),
        .I4(nPotClk),
        .I5(Qout_2),
        .O(Qout_i_1__0_n_0));
  FDRE #(
    .INIT(1'b0)) 
    Qout_reg
       (.C(clk_out),
        .CE(enp),
        .D(Qout_i_1__0_n_0),
        .Q(Qout),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hFFFF7FFF)) 
    nor4_i_3
       (.I0(Qout),
        .I1(Qout_3),
        .I2(Qout_2),
        .I3(nor1),
        .I4(Qout_0),
        .O(Qout_reg_0));
endmodule

(* ORIG_REF_NAME = "cell23" *) 
module cell23_22
   (Qout,
    D,
    enp,
    clk_out,
    nor1,
    bor__3);
  output Qout;
  output [0:0]D;
  input enp;
  input clk_out;
  input nor1;
  input bor__3;

  wire [0:0]D;
  wire Qout;
  wire Qout_i_1__2_n_0;
  wire bor__3;
  wire clk_out;
  wire enp;
  wire nor1;

  LUT2 #(
    .INIT(4'h2)) 
    \POT0[4]_i_1 
       (.I0(nor1),
        .I1(Qout),
        .O(D));
  LUT3 #(
    .INIT(8'h2D)) 
    Qout_i_1__2
       (.I0(nor1),
        .I1(Qout),
        .I2(bor__3),
        .O(Qout_i_1__2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    Qout_reg
       (.C(clk_out),
        .CE(enp),
        .D(Qout_i_1__2_n_0),
        .Q(Qout),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell23" *) 
module cell23_23
   (Qout,
    D,
    enp,
    clk_out,
    Qout_0,
    nor1,
    bor__3);
  output Qout;
  output [0:0]D;
  input enp;
  input clk_out;
  input Qout_0;
  input nor1;
  input bor__3;

  wire [0:0]D;
  wire Qout;
  wire Qout_0;
  wire Qout_i_1__5_n_0;
  wire bor__3;
  wire clk_out;
  wire enp;
  wire nor1;

  LUT2 #(
    .INIT(4'h2)) 
    \POT0[5]_i_1 
       (.I0(nor1),
        .I1(Qout),
        .O(D));
  LUT4 #(
    .INIT(16'h9FAF)) 
    Qout_i_1__5
       (.I0(Qout),
        .I1(Qout_0),
        .I2(nor1),
        .I3(bor__3),
        .O(Qout_i_1__5_n_0));
  FDRE #(
    .INIT(1'b0)) 
    Qout_reg
       (.C(clk_out),
        .CE(enp),
        .D(Qout_i_1__5_n_0),
        .Q(Qout),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell23" *) 
module cell23_24
   (Qout,
    D,
    enp,
    clk_out,
    Qout_0,
    nor1,
    bor__3,
    Qout_1);
  output Qout;
  output [0:0]D;
  input enp;
  input clk_out;
  input Qout_0;
  input nor1;
  input bor__3;
  input Qout_1;

  wire [0:0]D;
  wire Qout;
  wire Qout_0;
  wire Qout_1;
  wire Qout_i_1__4_n_0;
  wire bor__3;
  wire clk_out;
  wire enp;
  wire nor1;

  LUT2 #(
    .INIT(4'h2)) 
    \POT0[6]_i_1 
       (.I0(nor1),
        .I1(Qout),
        .O(D));
  LUT5 #(
    .INIT(32'hAFAF9FAF)) 
    Qout_i_1__4
       (.I0(Qout),
        .I1(Qout_0),
        .I2(nor1),
        .I3(bor__3),
        .I4(Qout_1),
        .O(Qout_i_1__4_n_0));
  FDRE #(
    .INIT(1'b0)) 
    Qout_reg
       (.C(clk_out),
        .CE(enp),
        .D(Qout_i_1__4_n_0),
        .Q(Qout),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell23" *) 
module cell23_25
   (Qout,
    D,
    enp,
    clk_out,
    Qout_0,
    nor1,
    Qout_1,
    bor__3,
    Qout_2);
  output Qout;
  output [0:0]D;
  input enp;
  input clk_out;
  input Qout_0;
  input nor1;
  input Qout_1;
  input bor__3;
  input Qout_2;

  wire [0:0]D;
  wire Qout;
  wire Qout_0;
  wire Qout_1;
  wire Qout_2;
  wire Qout_i_1__3_n_0;
  wire bor__3;
  wire clk_out;
  wire enp;
  wire nor1;

  LUT2 #(
    .INIT(4'h2)) 
    \POT0[7]_i_2 
       (.I0(nor1),
        .I1(Qout),
        .O(D));
  LUT6 #(
    .INIT(64'hAFAFAFAFAF9FAFAF)) 
    Qout_i_1__3
       (.I0(Qout),
        .I1(Qout_0),
        .I2(nor1),
        .I3(Qout_1),
        .I4(bor__3),
        .I5(Qout_2),
        .O(Qout_i_1__3_n_0));
  FDRE #(
    .INIT(1'b0)) 
    Qout_reg
       (.C(clk_out),
        .CE(enp),
        .D(Qout_i_1__3_n_0),
        .Q(Qout),
        .R(1'b0));
endmodule

module cell24
   (bt,
    bt_reg_0,
    clk_out,
    nDout,
    nDout_reg_0,
    Q,
    or1Q);
  output bt;
  input bt_reg_0;
  input clk_out;
  input nDout;
  input nDout_reg_0;
  input [0:0]Q;
  input or1Q;

  wire [0:0]Q;
  wire bt;
  wire bt_reg_0;
  wire clk_out;
  wire muxOut;
  wire nDout;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;

  LUT4 #(
    .INIT(16'h8BB8)) 
    bt_i_1__5
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt),
        .I3(or1Q),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(bt_reg_0),
        .D(muxOut),
        .Q(bt),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell24" *) 
module cell24_37
   (bt,
    bt_reg_0,
    clk_out,
    nDout,
    nDout_reg_0,
    Q,
    or1Q,
    bt_0);
  output bt;
  input bt_reg_0;
  input clk_out;
  input nDout;
  input nDout_reg_0;
  input [0:0]Q;
  input or1Q;
  input bt_0;

  wire [0:0]Q;
  wire bt;
  wire bt_0;
  wire bt_reg_0;
  wire clk_out;
  wire muxOut;
  wire nDout;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;

  LUT5 #(
    .INIT(32'h8BB8B8B8)) 
    bt_i_1__4
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt),
        .I3(or1Q),
        .I4(bt_0),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(bt_reg_0),
        .D(muxOut),
        .Q(bt),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell24" *) 
module cell24_38
   (bt,
    CR_BOR_1_3,
    bt_reg_0,
    clk_out,
    nDout,
    nDout_reg_0,
    Q,
    or1Q,
    bt_0,
    bt_1);
  output bt;
  output CR_BOR_1_3;
  input bt_reg_0;
  input clk_out;
  input nDout;
  input nDout_reg_0;
  input [0:0]Q;
  input or1Q;
  input bt_0;
  input bt_1;

  wire CR_BOR_1_3;
  wire [0:0]Q;
  wire bt;
  wire bt_0;
  wire bt_1;
  wire bt_reg_0;
  wire clk_out;
  wire muxOut;
  wire nDout;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;

  LUT6 #(
    .INIT(64'h8BB8B8B8B8B8B8B8)) 
    bt_i_1__3
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt),
        .I3(or1Q),
        .I4(bt_0),
        .I5(bt_1),
        .O(muxOut));
  LUT5 #(
    .INIT(32'h00008000)) 
    bt_i_2
       (.I0(bt),
        .I1(bt_1),
        .I2(bt_0),
        .I3(or1Q),
        .I4(Q),
        .O(CR_BOR_1_3));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(bt_reg_0),
        .D(muxOut),
        .Q(bt),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell24" *) 
module cell24_40
   (bt,
    bt_reg_0,
    clk_out,
    nDout,
    nDout_reg_0,
    Q,
    or1Q);
  output bt;
  input bt_reg_0;
  input clk_out;
  input nDout;
  input nDout_reg_0;
  input [0:0]Q;
  input or1Q;

  wire [0:0]Q;
  wire bt;
  wire bt_reg_0;
  wire clk_out;
  wire muxOut;
  wire nDout;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;

  LUT4 #(
    .INIT(16'h8BB8)) 
    bt_i_1__1
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt),
        .I3(or1Q),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(bt_reg_0),
        .D(muxOut),
        .Q(bt),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell24" *) 
module cell24_41
   (bt,
    CR_BOR_1_6,
    bt_reg_0,
    clk_out,
    nDout,
    nDout_reg_0,
    Q,
    or1Q,
    bt_0);
  output bt;
  output CR_BOR_1_6;
  input bt_reg_0;
  input clk_out;
  input nDout;
  input nDout_reg_0;
  input [0:0]Q;
  input or1Q;
  input bt_0;

  wire CR_BOR_1_6;
  wire [0:0]Q;
  wire bt;
  wire bt_0;
  wire bt_reg_0;
  wire clk_out;
  wire muxOut;
  wire nDout;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;

  LUT4 #(
    .INIT(16'h0080)) 
    \Qbor[1]_i_2 
       (.I0(bt),
        .I1(bt_0),
        .I2(or1Q),
        .I3(Q),
        .O(CR_BOR_1_6));
  LUT5 #(
    .INIT(32'h8BB8B8B8)) 
    bt_i_1__0
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt),
        .I3(or1Q),
        .I4(bt_0),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(bt_reg_0),
        .D(muxOut),
        .Q(bt),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell24" *) 
module cell24_43
   (bt,
    bt_reg_0,
    clk_out,
    nDout_0,
    nDout_reg_0,
    Q,
    or1Q);
  output bt;
  input bt_reg_0;
  input clk_out;
  input nDout_0;
  input nDout_reg_0;
  input [0:0]Q;
  input or1Q;

  wire [0:0]Q;
  wire bt;
  wire bt_reg_0;
  wire clk_out;
  wire muxOut;
  wire nDout_0;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;

  LUT4 #(
    .INIT(16'h8BB8)) 
    bt_i_1__13
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt),
        .I3(or1Q),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(bt_reg_0),
        .D(muxOut),
        .Q(bt),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout_0),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell24" *) 
module cell24_44
   (bt,
    bt_reg_0,
    clk_out,
    nDout_0,
    nDout_reg_0,
    Q,
    or1Q,
    bt_0);
  output bt;
  input bt_reg_0;
  input clk_out;
  input nDout_0;
  input nDout_reg_0;
  input [0:0]Q;
  input or1Q;
  input bt_0;

  wire [0:0]Q;
  wire bt;
  wire bt_0;
  wire bt_reg_0;
  wire clk_out;
  wire muxOut;
  wire nDout_0;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;

  LUT5 #(
    .INIT(32'h8BB8B8B8)) 
    bt_i_1__12
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt),
        .I3(or1Q),
        .I4(bt_0),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(bt_reg_0),
        .D(muxOut),
        .Q(bt),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout_0),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell24" *) 
module cell24_45
   (bt,
    CR_BOR_2_3,
    bt_reg_0,
    clk_out,
    nDout_0,
    nDout_reg_0,
    Q,
    or1Q,
    bt_0,
    bt_1);
  output bt;
  output CR_BOR_2_3;
  input bt_reg_0;
  input clk_out;
  input nDout_0;
  input nDout_reg_0;
  input [0:0]Q;
  input or1Q;
  input bt_0;
  input bt_1;

  wire CR_BOR_2_3;
  wire [0:0]Q;
  wire bt;
  wire bt_0;
  wire bt_1;
  wire bt_reg_0;
  wire clk_out;
  wire muxOut;
  wire nDout_0;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;

  LUT6 #(
    .INIT(64'h8BB8B8B8B8B8B8B8)) 
    bt_i_1__11
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt),
        .I3(or1Q),
        .I4(bt_0),
        .I5(bt_1),
        .O(muxOut));
  LUT5 #(
    .INIT(32'h00008000)) 
    bt_i_2__0
       (.I0(bt),
        .I1(bt_1),
        .I2(bt_0),
        .I3(or1Q),
        .I4(Q),
        .O(CR_BOR_2_3));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(bt_reg_0),
        .D(muxOut),
        .Q(bt),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout_0),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell24" *) 
module cell24_47
   (bt,
    bt_reg_0,
    clk_out,
    nDout_0,
    nDout_reg_0,
    Q,
    or1Q);
  output bt;
  input bt_reg_0;
  input clk_out;
  input nDout_0;
  input nDout_reg_0;
  input [0:0]Q;
  input or1Q;

  wire [0:0]Q;
  wire bt;
  wire bt_reg_0;
  wire clk_out;
  wire muxOut;
  wire nDout_0;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;

  LUT4 #(
    .INIT(16'h8BB8)) 
    bt_i_1__9
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt),
        .I3(or1Q),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(bt_reg_0),
        .D(muxOut),
        .Q(bt),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout_0),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell24" *) 
module cell24_48
   (bt,
    CR_BOR_2_6,
    bt_reg_0,
    clk_out,
    nDout_0,
    nDout_reg_0,
    Q,
    or1Q,
    bt_0);
  output bt;
  output CR_BOR_2_6;
  input bt_reg_0;
  input clk_out;
  input nDout_0;
  input nDout_reg_0;
  input [0:0]Q;
  input or1Q;
  input bt_0;

  wire CR_BOR_2_6;
  wire [0:0]Q;
  wire bt;
  wire bt_0;
  wire bt_reg_0;
  wire clk_out;
  wire muxOut;
  wire nDout_0;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;

  LUT4 #(
    .INIT(16'h0080)) 
    \Qbor[2]_i_2 
       (.I0(bt),
        .I1(bt_0),
        .I2(or1Q),
        .I3(Q),
        .O(CR_BOR_2_6));
  LUT5 #(
    .INIT(32'h8BB8B8B8)) 
    bt_i_1__8
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt),
        .I3(or1Q),
        .I4(bt_0),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(bt_reg_0),
        .D(muxOut),
        .Q(bt),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout_0),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell24" *) 
module cell24_51
   (bt,
    bt_reg_0,
    clk_out,
    nDout_1,
    nDout_reg_0,
    Q,
    or1Q);
  output bt;
  input bt_reg_0;
  input clk_out;
  input nDout_1;
  input nDout_reg_0;
  input [0:0]Q;
  input or1Q;

  wire [0:0]Q;
  wire bt;
  wire bt_reg_0;
  wire clk_out;
  wire muxOut;
  wire nDout_1;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;

  LUT4 #(
    .INIT(16'h8BB8)) 
    bt_i_1__21
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt),
        .I3(or1Q),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(bt_reg_0),
        .D(muxOut),
        .Q(bt),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout_1),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell24" *) 
module cell24_52
   (bt,
    bt_reg_0,
    clk_out,
    nDout_1,
    nDout_reg_0,
    Q,
    or1Q,
    bt_0);
  output bt;
  input bt_reg_0;
  input clk_out;
  input nDout_1;
  input nDout_reg_0;
  input [0:0]Q;
  input or1Q;
  input bt_0;

  wire [0:0]Q;
  wire bt;
  wire bt_0;
  wire bt_reg_0;
  wire clk_out;
  wire muxOut;
  wire nDout_1;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;

  LUT5 #(
    .INIT(32'h8BB8B8B8)) 
    bt_i_1__20
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt),
        .I3(or1Q),
        .I4(bt_0),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(bt_reg_0),
        .D(muxOut),
        .Q(bt),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout_1),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell24" *) 
module cell24_53
   (bt,
    CR_BOR_3_3,
    bt_reg_0,
    clk_out,
    nDout_1,
    nDout_reg_0,
    Q,
    or1Q,
    bt_0,
    bt_1);
  output bt;
  output CR_BOR_3_3;
  input bt_reg_0;
  input clk_out;
  input nDout_1;
  input nDout_reg_0;
  input [0:0]Q;
  input or1Q;
  input bt_0;
  input bt_1;

  wire CR_BOR_3_3;
  wire [0:0]Q;
  wire bt;
  wire bt_0;
  wire bt_1;
  wire bt_reg_0;
  wire clk_out;
  wire muxOut;
  wire nDout_1;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;

  LUT6 #(
    .INIT(64'h8BB8B8B8B8B8B8B8)) 
    bt_i_1__19
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt),
        .I3(or1Q),
        .I4(bt_0),
        .I5(bt_1),
        .O(muxOut));
  LUT5 #(
    .INIT(32'h00008000)) 
    bt_i_2__1
       (.I0(bt),
        .I1(bt_1),
        .I2(bt_0),
        .I3(or1Q),
        .I4(Q),
        .O(CR_BOR_3_3));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(bt_reg_0),
        .D(muxOut),
        .Q(bt),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout_1),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell24" *) 
module cell24_55
   (bt,
    bt_reg_0,
    clk_out,
    nDout_1,
    nDout_reg_0,
    Q,
    or1Q);
  output bt;
  input bt_reg_0;
  input clk_out;
  input nDout_1;
  input nDout_reg_0;
  input [0:0]Q;
  input or1Q;

  wire [0:0]Q;
  wire bt;
  wire bt_reg_0;
  wire clk_out;
  wire muxOut;
  wire nDout_1;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;

  LUT4 #(
    .INIT(16'h8BB8)) 
    bt_i_1__17
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt),
        .I3(or1Q),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(bt_reg_0),
        .D(muxOut),
        .Q(bt),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout_1),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell24" *) 
module cell24_56
   (bt,
    CR_BOR_3_6,
    bt_reg_0,
    clk_out,
    nDout_1,
    nDout_reg_0,
    Q,
    or1Q,
    bt_0);
  output bt;
  output CR_BOR_3_6;
  input bt_reg_0;
  input clk_out;
  input nDout_1;
  input nDout_reg_0;
  input [0:0]Q;
  input or1Q;
  input bt_0;

  wire CR_BOR_3_6;
  wire [0:0]Q;
  wire bt;
  wire bt_0;
  wire bt_reg_0;
  wire clk_out;
  wire muxOut;
  wire nDout_1;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;

  LUT4 #(
    .INIT(16'h0080)) 
    \Qbor[3]_i_2 
       (.I0(bt),
        .I1(bt_0),
        .I2(or1Q),
        .I3(Q),
        .O(CR_BOR_3_6));
  LUT5 #(
    .INIT(32'h8BB8B8B8)) 
    bt_i_1__16
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt),
        .I3(or1Q),
        .I4(bt_0),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(bt_reg_0),
        .D(muxOut),
        .Q(bt),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout_1),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell24" *) 
module cell24_59
   (bt,
    bt_reg_0,
    clk_out,
    nDout_2,
    nDout_reg_0,
    Q,
    or1Q);
  output bt;
  input bt_reg_0;
  input clk_out;
  input nDout_2;
  input nDout_reg_0;
  input [0:0]Q;
  input or1Q;

  wire [0:0]Q;
  wire bt;
  wire bt_reg_0;
  wire clk_out;
  wire muxOut;
  wire nDout_2;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;

  LUT4 #(
    .INIT(16'h8BB8)) 
    bt_i_1__29
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt),
        .I3(or1Q),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(bt_reg_0),
        .D(muxOut),
        .Q(bt),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout_2),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell24" *) 
module cell24_60
   (bt,
    bt_reg_0,
    clk_out,
    nDout_2,
    nDout_reg_0,
    Q,
    or1Q,
    bt_0);
  output bt;
  input bt_reg_0;
  input clk_out;
  input nDout_2;
  input nDout_reg_0;
  input [0:0]Q;
  input or1Q;
  input bt_0;

  wire [0:0]Q;
  wire bt;
  wire bt_0;
  wire bt_reg_0;
  wire clk_out;
  wire muxOut;
  wire nDout_2;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;

  LUT5 #(
    .INIT(32'h8BB8B8B8)) 
    bt_i_1__28
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt),
        .I3(or1Q),
        .I4(bt_0),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(bt_reg_0),
        .D(muxOut),
        .Q(bt),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout_2),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell24" *) 
module cell24_61
   (bt,
    CR_BOR_4_3,
    bt_reg_0,
    clk_out,
    nDout_2,
    nDout_reg_0,
    Q,
    or1Q,
    bt_0,
    bt_1);
  output bt;
  output CR_BOR_4_3;
  input bt_reg_0;
  input clk_out;
  input nDout_2;
  input nDout_reg_0;
  input [0:0]Q;
  input or1Q;
  input bt_0;
  input bt_1;

  wire CR_BOR_4_3;
  wire [0:0]Q;
  wire bt;
  wire bt_0;
  wire bt_1;
  wire bt_reg_0;
  wire clk_out;
  wire muxOut;
  wire nDout_2;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;

  LUT6 #(
    .INIT(64'h8BB8B8B8B8B8B8B8)) 
    bt_i_1__27
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt),
        .I3(or1Q),
        .I4(bt_0),
        .I5(bt_1),
        .O(muxOut));
  LUT5 #(
    .INIT(32'h00008000)) 
    bt_i_2__2
       (.I0(bt),
        .I1(bt_1),
        .I2(bt_0),
        .I3(or1Q),
        .I4(Q),
        .O(CR_BOR_4_3));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(bt_reg_0),
        .D(muxOut),
        .Q(bt),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout_2),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell24" *) 
module cell24_63
   (bt,
    bt_reg_0,
    clk_out,
    nDout_2,
    nDout_reg_0,
    Q,
    or1Q);
  output bt;
  input bt_reg_0;
  input clk_out;
  input nDout_2;
  input nDout_reg_0;
  input [0:0]Q;
  input or1Q;

  wire [0:0]Q;
  wire bt;
  wire bt_reg_0;
  wire clk_out;
  wire muxOut;
  wire nDout_2;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;

  LUT4 #(
    .INIT(16'h8BB8)) 
    bt_i_1__25
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt),
        .I3(or1Q),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(bt_reg_0),
        .D(muxOut),
        .Q(bt),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout_2),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell24" *) 
module cell24_64
   (bt,
    CR_BOR_4_6,
    bt_reg_0,
    clk_out,
    nDout_2,
    nDout_reg_0,
    Q,
    or1Q,
    bt_0);
  output bt;
  output CR_BOR_4_6;
  input bt_reg_0;
  input clk_out;
  input nDout_2;
  input nDout_reg_0;
  input [0:0]Q;
  input or1Q;
  input bt_0;

  wire CR_BOR_4_6;
  wire [0:0]Q;
  wire bt;
  wire bt_0;
  wire bt_reg_0;
  wire clk_out;
  wire muxOut;
  wire nDout_2;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;

  LUT4 #(
    .INIT(16'h0080)) 
    \Qbor[4]_i_2 
       (.I0(bt),
        .I1(bt_0),
        .I2(or1Q),
        .I3(Q),
        .O(CR_BOR_4_6));
  LUT5 #(
    .INIT(32'h8BB8B8B8)) 
    bt_i_1__24
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt),
        .I3(or1Q),
        .I4(bt_0),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(bt_reg_0),
        .D(muxOut),
        .Q(bt),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout_2),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
endmodule

module cell24option1
   (\prep_reg[1] ,
    bt_reg_0,
    clk_out,
    nDout,
    nDout_reg_0,
    Q,
    or1Q,
    bt,
    bt_0,
    \Qbor_reg[1] ,
    \Qbor_reg[1]_0 ,
    CR_BOR_1_6);
  output \prep_reg[1] ;
  input bt_reg_0;
  input clk_out;
  input nDout;
  input nDout_reg_0;
  input [0:0]Q;
  input or1Q;
  input bt;
  input bt_0;
  input [1:0]\Qbor_reg[1] ;
  input \Qbor_reg[1]_0 ;
  input CR_BOR_1_6;

  wire CR_BOR_1_6;
  wire [0:0]Q;
  wire [1:0]\Qbor_reg[1] ;
  wire \Qbor_reg[1]_0 ;
  wire bt;
  wire bt_0;
  wire bt_1;
  wire bt_reg_0;
  wire clk_out;
  wire muxOut;
  wire nDout;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;
  wire \prep_reg[1] ;

  LUT6 #(
    .INIT(64'hF2F2F2F2D0F2F2F2)) 
    \Qbor[1]_i_1 
       (.I0(\Qbor_reg[1] [0]),
        .I1(\Qbor_reg[1] [1]),
        .I2(\Qbor_reg[1]_0 ),
        .I3(bt_1),
        .I4(CR_BOR_1_6),
        .I5(Q),
        .O(\prep_reg[1] ));
  LUT6 #(
    .INIT(64'h8BB8B8B8B8B8B8B8)) 
    bt_i_1
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt_1),
        .I3(or1Q),
        .I4(bt),
        .I5(bt_0),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(bt_reg_0),
        .D(muxOut),
        .Q(bt_1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell24option1" *) 
module cell24option1_49
   (\prep_reg[1] ,
    bt_reg_0,
    clk_out,
    nDout_0,
    nDout_reg_0,
    Q,
    or1Q,
    bt,
    bt_0,
    \Qbor_reg[2] ,
    p_0_in11_in,
    CR_BOR_2_6);
  output \prep_reg[1] ;
  input bt_reg_0;
  input clk_out;
  input nDout_0;
  input nDout_reg_0;
  input [0:0]Q;
  input or1Q;
  input bt;
  input bt_0;
  input [1:0]\Qbor_reg[2] ;
  input p_0_in11_in;
  input CR_BOR_2_6;

  wire CR_BOR_2_6;
  wire [0:0]Q;
  wire [1:0]\Qbor_reg[2] ;
  wire bt;
  wire bt_0;
  wire bt_1;
  wire bt_reg_0;
  wire clk_out;
  wire muxOut;
  wire nDout_0;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;
  wire p_0_in11_in;
  wire \prep_reg[1] ;

  LUT6 #(
    .INIT(64'hF2F2F2F2D0F2F2F2)) 
    \Qbor[2]_i_1 
       (.I0(\Qbor_reg[2] [0]),
        .I1(\Qbor_reg[2] [1]),
        .I2(p_0_in11_in),
        .I3(bt_1),
        .I4(CR_BOR_2_6),
        .I5(Q),
        .O(\prep_reg[1] ));
  LUT6 #(
    .INIT(64'h8BB8B8B8B8B8B8B8)) 
    bt_i_1__7
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt_1),
        .I3(or1Q),
        .I4(bt),
        .I5(bt_0),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(bt_reg_0),
        .D(muxOut),
        .Q(bt_1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout_0),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell24option1" *) 
module cell24option1_57
   (\prep_reg[1] ,
    bt_reg_0,
    clk_out,
    nDout_1,
    nDout_reg_0,
    Q,
    or1Q,
    bt,
    bt_0,
    \Qbor_reg[3] ,
    p_0_in13_in,
    CR_BOR_3_6);
  output \prep_reg[1] ;
  input bt_reg_0;
  input clk_out;
  input nDout_1;
  input nDout_reg_0;
  input [0:0]Q;
  input or1Q;
  input bt;
  input bt_0;
  input [1:0]\Qbor_reg[3] ;
  input p_0_in13_in;
  input CR_BOR_3_6;

  wire CR_BOR_3_6;
  wire [0:0]Q;
  wire [1:0]\Qbor_reg[3] ;
  wire bt;
  wire bt_0;
  wire bt_1;
  wire bt_reg_0;
  wire clk_out;
  wire muxOut;
  wire nDout_1;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;
  wire p_0_in13_in;
  wire \prep_reg[1] ;

  LUT6 #(
    .INIT(64'hF2F2F2F2D0F2F2F2)) 
    \Qbor[3]_i_1 
       (.I0(\Qbor_reg[3] [0]),
        .I1(\Qbor_reg[3] [1]),
        .I2(p_0_in13_in),
        .I3(bt_1),
        .I4(CR_BOR_3_6),
        .I5(Q),
        .O(\prep_reg[1] ));
  LUT6 #(
    .INIT(64'h8BB8B8B8B8B8B8B8)) 
    bt_i_1__15
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt_1),
        .I3(or1Q),
        .I4(bt),
        .I5(bt_0),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(bt_reg_0),
        .D(muxOut),
        .Q(bt_1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout_1),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell24option1" *) 
module cell24option1_65
   (\prep_reg[1] ,
    bt_reg_0,
    clk_out,
    nDout_2,
    nDout_reg_0,
    Q,
    or1Q,
    bt,
    bt_0,
    \Qbor_reg[4] ,
    p_0_in15_in,
    CR_BOR_4_6);
  output \prep_reg[1] ;
  input bt_reg_0;
  input clk_out;
  input nDout_2;
  input nDout_reg_0;
  input [0:0]Q;
  input or1Q;
  input bt;
  input bt_0;
  input [1:0]\Qbor_reg[4] ;
  input p_0_in15_in;
  input CR_BOR_4_6;

  wire CR_BOR_4_6;
  wire [0:0]Q;
  wire [1:0]\Qbor_reg[4] ;
  wire bt;
  wire bt_0;
  wire bt_1;
  wire bt_reg_0;
  wire clk_out;
  wire muxOut;
  wire nDout_2;
  wire nDout_reg_0;
  wire nDout_reg_n_0;
  wire or1Q;
  wire p_0_in15_in;
  wire \prep_reg[1] ;

  LUT6 #(
    .INIT(64'hF2F2F2F2D0F2F2F2)) 
    \Qbor[4]_i_1 
       (.I0(\Qbor_reg[4] [0]),
        .I1(\Qbor_reg[4] [1]),
        .I2(p_0_in15_in),
        .I3(bt_1),
        .I4(CR_BOR_4_6),
        .I5(Q),
        .O(\prep_reg[1] ));
  LUT6 #(
    .INIT(64'h8BB8B8B8B8B8B8B8)) 
    bt_i_1__23
       (.I0(nDout_reg_n_0),
        .I1(Q),
        .I2(bt_1),
        .I3(or1Q),
        .I4(bt),
        .I5(bt_0),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    bt_reg
       (.C(clk_out),
        .CE(bt_reg_0),
        .D(muxOut),
        .Q(bt_1),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nDout_reg
       (.C(clk_out),
        .CE(nDout_2),
        .D(nDout_reg_0),
        .Q(nDout_reg_n_0),
        .R(1'b0));
endmodule

module cell25
   (Q_reg_0,
    clk_out,
    Q_reg_1,
    siDelay,
    shift);
  output Q_reg_0;
  input clk_out;
  input [1:0]Q_reg_1;
  input siDelay;
  input shift;

  wire Q_i_1__2_n_0;
  wire Q_reg_0;
  wire [1:0]Q_reg_1;
  wire clk_out;
  wire shift;
  wire siDelay;

  LUT5 #(
    .INIT(32'hDFFF0200)) 
    Q_i_1__2
       (.I0(Q_reg_1[0]),
        .I1(Q_reg_1[1]),
        .I2(siDelay),
        .I3(shift),
        .I4(Q_reg_0),
        .O(Q_i_1__2_n_0));
  FDRE #(
    .INIT(1'b0)) 
    Q_reg
       (.C(clk_out),
        .CE(1'b1),
        .D(Q_i_1__2_n_0),
        .Q(Q_reg_0),
        .R(1'b0));
endmodule

module cell2p
   (intQ_reg_0,
    sdiClk_reg,
    sdiStopBit_reg,
    sdiClk_reg_0,
    E,
    Q0_out,
    enn,
    clk_out,
    sdiClk,
    sdiStopBit,
    sdinStartBit,
    intQ_reg_1,
    Q_reg);
  output intQ_reg_0;
  output sdiClk_reg;
  output sdiStopBit_reg;
  output sdiClk_reg_0;
  output [0:0]E;
  output Q0_out;
  input enn;
  input clk_out;
  input sdiClk;
  input sdiStopBit;
  input sdinStartBit;
  input [1:0]intQ_reg_1;
  input [1:0]Q_reg;

  wire [0:0]E;
  wire Q0_out;
  wire [1:0]Q_reg;
  wire clk_out;
  wire enn;
  wire intQ_reg_0;
  wire [1:0]intQ_reg_1;
  wire or1;
  wire sdiClk;
  wire sdiClk_reg;
  wire sdiClk_reg_0;
  wire sdiStopBit;
  wire sdiStopBit_reg;
  wire sdinStartBit;

  LUT5 #(
    .INIT(32'h02000000)) 
    \Dr[7]_i_1 
       (.I0(Q_reg[0]),
        .I1(Q_reg[1]),
        .I2(intQ_reg_0),
        .I3(sdinStartBit),
        .I4(sdiClk),
        .O(E));
  LUT5 #(
    .INIT(32'h00002000)) 
    Q_i_1__0
       (.I0(Q_reg[0]),
        .I1(Q_reg[1]),
        .I2(sdiClk),
        .I3(intQ_reg_0),
        .I4(sdiStopBit),
        .O(Q0_out));
  LUT6 #(
    .INIT(64'hE6A2E6A2E6A2FFFF)) 
    intQ_i_1__1
       (.I0(intQ_reg_0),
        .I1(sdiClk),
        .I2(sdiStopBit),
        .I3(sdinStartBit),
        .I4(intQ_reg_1[1]),
        .I5(intQ_reg_1[0]),
        .O(or1));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    intQ_reg
       (.C(clk_out),
        .CE(enn),
        .D(or1),
        .Q(intQ_reg_0),
        .R(1'b0));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h8880)) 
    presync_i_1__0
       (.I0(sdiClk),
        .I1(sdiStopBit),
        .I2(sdinStartBit),
        .I3(intQ_reg_0),
        .O(sdiClk_reg));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h1000)) 
    setFramerr_i_1
       (.I0(sdiStopBit),
        .I1(intQ_reg_0),
        .I2(sdinStartBit),
        .I3(sdiClk),
        .O(sdiStopBit_reg));
  LUT3 #(
    .INIT(8'h08)) 
    setSdiCompl_i_1
       (.I0(sdiClk),
        .I1(sdinStartBit),
        .I2(intQ_reg_0),
        .O(sdiClk_reg_0));
endmodule

(* ORIG_REF_NAME = "cell2p" *) 
module cell2p_18
   (intQ_reg_0,
    intQ_reg_1,
    sdoDloaded_reg,
    intQ_reg_2,
    enn,
    clk_out,
    sdoClock,
    ssoEmpty,
    sdoDloaded,
    intQ_reg_3,
    qnor3_reg);
  output [0:0]intQ_reg_0;
  output intQ_reg_1;
  output sdoDloaded_reg;
  output intQ_reg_2;
  input enn;
  input clk_out;
  input sdoClock;
  input ssoEmpty;
  input sdoDloaded;
  input [1:0]intQ_reg_3;
  input [0:0]qnor3_reg;

  wire clk_out;
  wire enn;
  wire [0:0]intQ_reg_0;
  wire intQ_reg_1;
  wire intQ_reg_2;
  wire [1:0]intQ_reg_3;
  wire or1;
  wire othisState;
  wire [0:0]qnor3_reg;
  wire sdoClock;
  wire sdoDloaded;
  wire sdoDloaded_reg;
  wire ssoEmpty;

  LUT4 #(
    .INIT(16'h4500)) 
    Load_i_1
       (.I0(sdoDloaded),
        .I1(othisState),
        .I2(ssoEmpty),
        .I3(sdoClock),
        .O(sdoDloaded_reg));
  LUT6 #(
    .INIT(64'hAE22AE22AE22FFFF)) 
    intQ_i_1__2
       (.I0(othisState),
        .I1(sdoClock),
        .I2(ssoEmpty),
        .I3(sdoDloaded),
        .I4(intQ_reg_3[1]),
        .I5(intQ_reg_3[0]),
        .O(or1));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    intQ_reg
       (.C(clk_out),
        .CE(enn),
        .D(or1),
        .Q(othisState),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \nirqst[3]_i_1 
       (.I0(othisState),
        .O(intQ_reg_0));
  LUT3 #(
    .INIT(8'h40)) 
    preShift1_i_1
       (.I0(othisState),
        .I1(ssoEmpty),
        .I2(sdoClock),
        .O(intQ_reg_1));
  LUT2 #(
    .INIT(4'h2)) 
    qnor3_i_1__0
       (.I0(othisState),
        .I1(qnor3_reg),
        .O(intQ_reg_2));
endmodule

(* ORIG_REF_NAME = "cell2p" *) 
module cell2p_26
   (keyQ_0,
    intQ_reg_0,
    \prep_reg[1] ,
    enn,
    clk_out,
    Q_reg,
    debComp__5,
    kr_IBUF,
    d15k,
    Q,
    Q_reg_0);
  output keyQ_0;
  output intQ_reg_0;
  output \prep_reg[1] ;
  input enn;
  input clk_out;
  input Q_reg;
  input debComp__5;
  input [0:0]kr_IBUF;
  input d15k;
  input [0:0]Q;
  input [1:0]Q_reg_0;

  wire [0:0]Q;
  wire Q_reg;
  wire [1:0]Q_reg_0;
  wire clk_out;
  wire d15k;
  wire debComp__5;
  wire enn;
  wire intQ_i_1__4_n_0;
  wire intQ_reg_0;
  wire keyQ_0;
  wire [0:0]kr_IBUF;
  wire \prep_reg[1] ;

  LUT6 #(
    .INIT(64'h0000000020000000)) 
    Q_i_1__1
       (.I0(Q_reg_0[0]),
        .I1(Q_reg_0[1]),
        .I2(d15k),
        .I3(keyQ_0),
        .I4(Q_reg),
        .I5(kr_IBUF),
        .O(\prep_reg[1] ));
  LUT6 #(
    .INIT(64'hA6E2AAE2FFFFFFFF)) 
    intQ_i_1__4
       (.I0(keyQ_0),
        .I1(d15k),
        .I2(kr_IBUF),
        .I3(debComp__5),
        .I4(Q_reg),
        .I5(Q),
        .O(intQ_i_1__4_n_0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    intQ_reg
       (.C(clk_out),
        .CE(enn),
        .D(intQ_i_1__4_n_0),
        .Q(keyQ_0),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00040000)) 
    setKey_i_1
       (.I0(keyQ_0),
        .I1(Q_reg),
        .I2(debComp__5),
        .I3(kr_IBUF),
        .I4(d15k),
        .O(intQ_reg_0));
endmodule

(* ORIG_REF_NAME = "cell2p" *) 
module cell2p_27
   (intQ_reg_0,
    enn,
    clk_out,
    d15k,
    keyQ_0,
    debComp__5,
    kr_IBUF,
    Q);
  output intQ_reg_0;
  input enn;
  input clk_out;
  input d15k;
  input keyQ_0;
  input debComp__5;
  input [0:0]kr_IBUF;
  input [0:0]Q;

  wire [0:0]Q;
  wire clk_out;
  wire d15k;
  wire debComp__5;
  wire enn;
  wire intQ_i_1__3_n_0;
  wire intQ_reg_0;
  wire keyQ_0;
  wire [0:0]kr_IBUF;

  LUT6 #(
    .INIT(64'hAAEAAAA2FFFFFFFF)) 
    intQ_i_1__3
       (.I0(intQ_reg_0),
        .I1(d15k),
        .I2(keyQ_0),
        .I3(debComp__5),
        .I4(kr_IBUF),
        .I5(Q),
        .O(intQ_i_1__3_n_0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    intQ_reg
       (.C(clk_out),
        .CE(enn),
        .D(intQ_i_1__3_n_0),
        .Q(intQ_reg_0),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell2p" *) 
module cell2p_68
   (D,
    m__0,
    \data_reg[1] ,
    \data_reg[2] ,
    enn,
    clk_out,
    Q,
    \AUD12_reg[4] ,
    \AUD12_reg[4]_0 ,
    \AUD12_reg[3] ,
    m__0_0,
    I,
    intQ_reg_0,
    disHiFltr2);
  output [1:0]D;
  output m__0;
  output \data_reg[1] ;
  output \data_reg[2] ;
  input enn;
  input clk_out;
  input [4:0]Q;
  input \AUD12_reg[4] ;
  input \AUD12_reg[4]_0 ;
  input [3:0]\AUD12_reg[3] ;
  input m__0_0;
  input I;
  input [0:0]intQ_reg_0;
  input disHiFltr2;

  wire \AUD12[3]_i_3_n_0 ;
  wire [3:0]\AUD12_reg[3] ;
  wire \AUD12_reg[4] ;
  wire \AUD12_reg[4]_0 ;
  wire [1:0]D;
  wire I;
  wire [4:0]Q;
  wire QI;
  wire clk_out;
  wire \data_reg[1] ;
  wire \data_reg[2] ;
  wire disHiFltr2;
  wire enn;
  wire [0:0]intQ_reg_0;
  wire m__0;
  wire m__0_0;
  wire or1;

  LUT6 #(
    .INIT(64'h5FA05FA0E81717E8)) 
    \AUD12[3]_i_1 
       (.I0(\data_reg[1] ),
        .I1(\AUD12_reg[3] [2]),
        .I2(\data_reg[2] ),
        .I3(\AUD12[3]_i_3_n_0 ),
        .I4(\AUD12_reg[3] [3]),
        .I5(m__0_0),
        .O(D[0]));
  LUT4 #(
    .INIT(16'hAA28)) 
    \AUD12[3]_i_2 
       (.I0(Q[2]),
        .I1(QI),
        .I2(I),
        .I3(Q[4]),
        .O(\data_reg[2] ));
  LUT4 #(
    .INIT(16'hAA28)) 
    \AUD12[3]_i_3 
       (.I0(Q[3]),
        .I1(QI),
        .I2(I),
        .I3(Q[4]),
        .O(\AUD12[3]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'hF4545440F4404040)) 
    \AUD12[4]_i_1 
       (.I0(m__0),
        .I1(Q[3]),
        .I2(\AUD12_reg[4] ),
        .I3(\data_reg[1] ),
        .I4(\AUD12_reg[4]_0 ),
        .I5(Q[2]),
        .O(D[1]));
  LUT3 #(
    .INIT(8'h41)) 
    \AUD12[4]_i_2 
       (.I0(Q[4]),
        .I1(I),
        .I2(QI),
        .O(m__0));
  LUT6 #(
    .INIT(64'h0504040004000400)) 
    \AUD12[4]_i_4 
       (.I0(m__0),
        .I1(Q[1]),
        .I2(m__0_0),
        .I3(\AUD12_reg[3] [1]),
        .I4(\AUD12_reg[3] [0]),
        .I5(Q[0]),
        .O(\data_reg[1] ));
  LUT4 #(
    .INIT(16'hFFE2)) 
    intQ_i_1__0
       (.I0(I),
        .I1(intQ_reg_0),
        .I2(QI),
        .I3(disHiFltr2),
        .O(or1));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    intQ_reg
       (.C(clk_out),
        .CE(enn),
        .D(or1),
        .Q(QI),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell2p" *) 
module cell2p_70
   (D,
    m__0,
    \data_reg[3] ,
    \data_reg[2] ,
    enn,
    clk_out,
    I,
    intQ_reg_0,
    disHiFltr1,
    \AUD12_reg[2] ,
    \AUD12_reg[2]_0 ,
    Q,
    \AUD12_reg[1] ,
    m__0_0);
  output [2:0]D;
  output m__0;
  output \data_reg[3] ;
  output \data_reg[2] ;
  input enn;
  input clk_out;
  input I;
  input [0:0]intQ_reg_0;
  input disHiFltr1;
  input \AUD12_reg[2] ;
  input \AUD12_reg[2]_0 ;
  input [4:0]Q;
  input [1:0]\AUD12_reg[1] ;
  input m__0_0;

  wire [1:0]\AUD12_reg[1] ;
  wire \AUD12_reg[2] ;
  wire \AUD12_reg[2]_0 ;
  wire [2:0]D;
  wire I;
  wire [4:0]Q;
  wire QI;
  wire clk_out;
  wire \data_reg[2] ;
  wire \data_reg[3] ;
  wire disHiFltr1;
  wire enn;
  wire [0:0]intQ_reg_0;
  wire m__0;
  wire m__0_0;
  wire or1;

  LUT6 #(
    .INIT(64'hBE0041FFBE00BE00)) 
    \AUD12[0]_i_1 
       (.I0(Q[4]),
        .I1(I),
        .I2(QI),
        .I3(Q[0]),
        .I4(m__0_0),
        .I5(\AUD12_reg[1] [0]),
        .O(D[0]));
  LUT6 #(
    .INIT(64'h00F000F0FF870078)) 
    \AUD12[1]_i_1 
       (.I0(Q[0]),
        .I1(\AUD12_reg[1] [0]),
        .I2(\AUD12_reg[1] [1]),
        .I3(m__0_0),
        .I4(Q[1]),
        .I5(m__0),
        .O(D[1]));
  LUT6 #(
    .INIT(64'h9696969666969666)) 
    \AUD12[2]_i_1 
       (.I0(\AUD12_reg[2] ),
        .I1(\AUD12_reg[2]_0 ),
        .I2(Q[2]),
        .I3(QI),
        .I4(I),
        .I5(Q[4]),
        .O(D[2]));
  LUT3 #(
    .INIT(8'h41)) 
    \AUD12[3]_i_4 
       (.I0(Q[4]),
        .I1(I),
        .I2(QI),
        .O(m__0));
  LUT4 #(
    .INIT(16'hAA28)) 
    \AUD12[4]_i_3 
       (.I0(Q[3]),
        .I1(QI),
        .I2(I),
        .I3(Q[4]),
        .O(\data_reg[3] ));
  LUT4 #(
    .INIT(16'hAA28)) 
    \AUD12[4]_i_5 
       (.I0(Q[2]),
        .I1(QI),
        .I2(I),
        .I3(Q[4]),
        .O(\data_reg[2] ));
  LUT4 #(
    .INIT(16'hFFE2)) 
    intQ_i_1
       (.I0(I),
        .I1(intQ_reg_0),
        .I2(QI),
        .I3(disHiFltr1),
        .O(or1));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    intQ_reg
       (.C(clk_out),
        .CE(enn),
        .D(or1),
        .Q(QI),
        .R(1'b0));
endmodule

module cell2pr
   (nQ_reg_0,
    resyncInt,
    nmux1,
    presdi_reg,
    enn,
    nor1,
    clk_out,
    delay2,
    resyncSerClk_reg,
    sdiClock_reg,
    resyncSerClk,
    presync,
    QBCLK,
    preBCLK);
  output nQ_reg_0;
  output resyncInt;
  output nmux1;
  output presdi_reg;
  input enn;
  input nor1;
  input clk_out;
  input delay2;
  input [0:0]resyncSerClk_reg;
  input [1:0]sdiClock_reg;
  input resyncSerClk;
  input presync;
  input QBCLK;
  input preBCLK;

  wire QBCLK;
  wire clk_out;
  wire delay2;
  wire enn;
  wire nQ_reg_0;
  wire nmux1;
  wire nor1;
  wire preBCLK;
  wire presdi_reg;
  wire presync;
  wire resyncInt;
  wire resyncSerClk;
  wire [0:0]resyncSerClk_reg;
  wire [1:0]sdiClock_reg;

  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nQ_reg
       (.C(clk_out),
        .CE(enn),
        .D(nor1),
        .Q(nQ_reg_0),
        .R(1'b0));
  LUT4 #(
    .INIT(16'h5457)) 
    presdi_i_1
       (.I0(nQ_reg_0),
        .I1(sdiClock_reg[1]),
        .I2(sdiClock_reg[0]),
        .I3(QBCLK),
        .O(nmux1));
  LUT5 #(
    .INIT(32'hE0E0E000)) 
    resyncSerClk_i_1
       (.I0(delay2),
        .I1(resyncSerClk_reg),
        .I2(sdiClock_reg[0]),
        .I3(resyncSerClk),
        .I4(presync),
        .O(resyncInt));
  LUT5 #(
    .INIT(32'h888A8880)) 
    sdiClock_i_1
       (.I0(preBCLK),
        .I1(nQ_reg_0),
        .I2(sdiClock_reg[1]),
        .I3(sdiClock_reg[0]),
        .I4(QBCLK),
        .O(presdi_reg));
endmodule

module cell2r
   (nQ_0,
    mux4,
    nQ_reg_0,
    enn,
    muxOut,
    clk_out,
    sdoClock_reg,
    sdoClock_reg_0,
    QBCLK,
    oclk_OBUF);
  output nQ_0;
  output mux4;
  output nQ_reg_0;
  input enn;
  input muxOut;
  input clk_out;
  input [1:0]sdoClock_reg;
  input sdoClock_reg_0;
  input QBCLK;
  input oclk_OBUF;

  wire QBCLK;
  wire clk_out;
  wire enn;
  wire mux4;
  wire muxOut;
  wire nQ_0;
  wire nQ_reg_0;
  wire oclk_OBUF;
  wire [1:0]sdoClock_reg;
  wire sdoClock_reg_0;

  LUT5 #(
    .INIT(32'h74F374C0)) 
    OCLK_i_1
       (.I0(nQ_0),
        .I1(sdoClock_reg[1]),
        .I2(sdoClock_reg_0),
        .I3(sdoClock_reg[0]),
        .I4(QBCLK),
        .O(mux4));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nQ_reg
       (.C(clk_out),
        .CE(enn),
        .D(muxOut),
        .Q(nQ_0),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h8B0C8B3F00000000)) 
    sdoClock_i_1
       (.I0(nQ_0),
        .I1(sdoClock_reg[1]),
        .I2(sdoClock_reg_0),
        .I3(sdoClock_reg[0]),
        .I4(QBCLK),
        .I5(oclk_OBUF),
        .O(nQ_reg_0));
endmodule

(* ORIG_REF_NAME = "cell2r" *) 
module cell2r_66
   (nQ_reg_0,
    nQ_reg_1,
    enn,
    clk_out,
    Q,
    nQnor1_reg,
    nor5__5,
    poly5_2);
  output nQ_reg_0;
  output nQ_reg_1;
  input enn;
  input clk_out;
  input [0:0]Q;
  input [0:0]nQnor1_reg;
  input nor5__5;
  input poly5_2;

  wire [0:0]Q;
  wire clk_out;
  wire enn;
  wire muxOut;
  wire nQ;
  wire nQ_reg_0;
  wire nQ_reg_1;
  wire [0:0]nQnor1_reg;
  wire nor5__5;
  wire poly5_2;

  LUT4 #(
    .INIT(16'h88B8)) 
    nQ_i_1__2
       (.I0(poly5_2),
        .I1(nQnor1_reg),
        .I2(nQ),
        .I3(Q),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nQ_reg
       (.C(clk_out),
        .CE(enn),
        .D(muxOut),
        .Q(nQ),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h2F)) 
    nQnor1_i_1__2
       (.I0(nQ),
        .I1(Q),
        .I2(nQnor1_reg),
        .O(nQ_reg_1));
  LUT4 #(
    .INIT(16'h002F)) 
    nor4_i_1
       (.I0(nQ),
        .I1(Q),
        .I2(nQnor1_reg),
        .I3(nor5__5),
        .O(nQ_reg_0));
endmodule

(* ORIG_REF_NAME = "cell2r" *) 
module cell2r_67
   (nQ_reg_0,
    nQ_reg_1,
    enn,
    clk_out,
    Q,
    nQnor1_reg,
    nor5__5,
    poly5_1);
  output nQ_reg_0;
  output nQ_reg_1;
  input enn;
  input clk_out;
  input [0:0]Q;
  input [0:0]nQnor1_reg;
  input nor5__5;
  input poly5_1;

  wire [0:0]Q;
  wire clk_out;
  wire enn;
  wire muxOut;
  wire nQ;
  wire nQ_reg_0;
  wire nQ_reg_1;
  wire [0:0]nQnor1_reg;
  wire nor5__5;
  wire poly5_1;

  LUT4 #(
    .INIT(16'h88B8)) 
    nQ_i_1__1
       (.I0(poly5_1),
        .I1(nQnor1_reg),
        .I2(nQ),
        .I3(Q),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nQ_reg
       (.C(clk_out),
        .CE(enn),
        .D(muxOut),
        .Q(nQ),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h2F)) 
    nQnor1_i_1__1
       (.I0(nQ),
        .I1(Q),
        .I2(nQnor1_reg),
        .O(nQ_reg_1));
  LUT4 #(
    .INIT(16'h002F)) 
    nor4_i_1__0
       (.I0(nQ),
        .I1(Q),
        .I2(nQnor1_reg),
        .I3(nor5__5),
        .O(nQ_reg_0));
endmodule

(* ORIG_REF_NAME = "cell2r" *) 
module cell2r_69
   (nQ_reg_0,
    nQ_reg_1,
    enn,
    clk_out,
    Q,
    nQnor1_reg,
    nor5__5,
    poly5_0);
  output nQ_reg_0;
  output nQ_reg_1;
  input enn;
  input clk_out;
  input [0:0]Q;
  input [0:0]nQnor1_reg;
  input nor5__5;
  input poly5_0;

  wire [0:0]Q;
  wire clk_out;
  wire enn;
  wire muxOut;
  wire nQ;
  wire nQ_reg_0;
  wire nQ_reg_1;
  wire [0:0]nQnor1_reg;
  wire nor5__5;
  wire poly5_0;

  LUT4 #(
    .INIT(16'h88B8)) 
    nQ_i_1__0
       (.I0(poly5_0),
        .I1(nQnor1_reg),
        .I2(nQ),
        .I3(Q),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nQ_reg
       (.C(clk_out),
        .CE(enn),
        .D(muxOut),
        .Q(nQ),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h2F)) 
    nQnor1_i_1__0
       (.I0(nQ),
        .I1(Q),
        .I2(nQnor1_reg),
        .O(nQ_reg_1));
  LUT4 #(
    .INIT(16'h002F)) 
    nor4_i_1__1
       (.I0(nQ),
        .I1(Q),
        .I2(nQnor1_reg),
        .I3(nor5__5),
        .O(nQ_reg_0));
endmodule

(* ORIG_REF_NAME = "cell2r" *) 
module cell2r_71
   (nQ_reg_0,
    nQ_reg_1,
    enn,
    clk_out,
    Q,
    nQnor1_reg,
    nor5__5,
    nQ_reg_2);
  output nQ_reg_0;
  output nQ_reg_1;
  input enn;
  input clk_out;
  input [0:0]Q;
  input [0:0]nQnor1_reg;
  input nor5__5;
  input [0:0]nQ_reg_2;

  wire [0:0]Q;
  wire clk_out;
  wire enn;
  wire muxOut;
  wire nQ;
  wire nQ_reg_0;
  wire nQ_reg_1;
  wire [0:0]nQ_reg_2;
  wire [0:0]nQnor1_reg;
  wire nor5__5;

  LUT4 #(
    .INIT(16'h4474)) 
    nQ_i_1
       (.I0(nQ_reg_2),
        .I1(nQnor1_reg),
        .I2(nQ),
        .I3(Q),
        .O(muxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    nQ_reg
       (.C(clk_out),
        .CE(enn),
        .D(muxOut),
        .Q(nQ),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h2F)) 
    nQnor1_i_1
       (.I0(nQ),
        .I1(Q),
        .I2(nQnor1_reg),
        .O(nQ_reg_1));
  LUT4 #(
    .INIT(16'h002F)) 
    nor4_i_1__2
       (.I0(nQ),
        .I1(Q),
        .I2(nQnor1_reg),
        .I3(nor5__5),
        .O(nQ_reg_0));
endmodule

module cell3
   (Q_0,
    T_0,
    intQ_reg_0,
    k_OBUF,
    T2_reg_0,
    enn,
    clk_out,
    enp,
    Q_3,
    Q_2,
    Q_1,
    qkeybClk,
    Q);
  output Q_0;
  output T_0;
  output intQ_reg_0;
  output [0:0]k_OBUF;
  output T2_reg_0;
  input enn;
  input clk_out;
  input enp;
  input Q_3;
  input Q_2;
  input Q_1;
  input qkeybClk;
  input [0:0]Q;

  wire [0:0]Q;
  wire Q_0;
  wire Q_1;
  wire Q_2;
  wire Q_3;
  wire T2_i_1_n_0;
  wire T2_reg_0;
  wire T_0;
  wire clk_out;
  wire enn;
  wire enp;
  wire intQ_i_1__10_n_0;
  wire intQ_reg_0;
  wire [0:0]k_OBUF;
  wire qkeybClk;

  LUT2 #(
    .INIT(4'h2)) 
    T1_i_1
       (.I0(T_0),
        .I1(Q_1),
        .O(T2_reg_0));
  LUT2 #(
    .INIT(4'h1)) 
    T2_i_1
       (.I0(qkeybClk),
        .I1(Q_0),
        .O(T2_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    T2_reg
       (.C(clk_out),
        .CE(enp),
        .D(T2_i_1_n_0),
        .Q(T_0),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h90)) 
    intQ_i_1__10
       (.I0(Q_0),
        .I1(qkeybClk),
        .I2(Q),
        .O(intQ_i_1__10_n_0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    intQ_reg
       (.C(clk_out),
        .CE(enn),
        .D(intQ_i_1__10_n_0),
        .Q(Q_0),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \k_OBUF[0]_inst_i_1 
       (.I0(Q_0),
        .O(k_OBUF));
  LUT4 #(
    .INIT(16'hFFFE)) 
    qMuxOut_i_2
       (.I0(Q_0),
        .I1(Q_3),
        .I2(Q_2),
        .I3(Q_1),
        .O(intQ_reg_0));
endmodule

(* ORIG_REF_NAME = "cell3" *) 
module cell3_33
   (Q_2,
    T_2,
    k_OBUF,
    T2_reg_0,
    enn,
    clk_out,
    enp,
    T2_reg_1,
    T_1,
    Q,
    Q_3);
  output Q_2;
  output T_2;
  output [0:0]k_OBUF;
  output T2_reg_0;
  input enn;
  input clk_out;
  input enp;
  input T2_reg_1;
  input T_1;
  input [0:0]Q;
  input Q_3;

  wire [0:0]Q;
  wire Q_2;
  wire Q_3;
  wire T2_reg_0;
  wire T2_reg_1;
  wire T_1;
  wire T_2;
  wire clk_out;
  wire enn;
  wire enp;
  wire intQ_i_1__6_n_0;
  wire [0:0]k_OBUF;

  LUT2 #(
    .INIT(4'h2)) 
    T1_i_1__0
       (.I0(T_2),
        .I1(Q_3),
        .O(T2_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    T2_reg
       (.C(clk_out),
        .CE(enp),
        .D(T2_reg_1),
        .Q(T_2),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h60)) 
    intQ_i_1__6
       (.I0(Q_2),
        .I1(T_1),
        .I2(Q),
        .O(intQ_i_1__6_n_0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    intQ_reg
       (.C(clk_out),
        .CE(enn),
        .D(intQ_i_1__6_n_0),
        .Q(Q_2),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \k_OBUF[2]_inst_i_1 
       (.I0(Q_2),
        .O(k_OBUF));
endmodule

(* ORIG_REF_NAME = "cell3" *) 
module cell3_35
   (Q_4,
    T_4,
    k_OBUF,
    intQ_reg_0,
    enn,
    clk_out,
    enp,
    T2_reg_0,
    kr_IBUF,
    shift_reg,
    shift_reg_0,
    D,
    T_3,
    Q);
  output Q_4;
  output T_4;
  output [0:0]k_OBUF;
  output intQ_reg_0;
  input enn;
  input clk_out;
  input enp;
  input T2_reg_0;
  input [0:0]kr_IBUF;
  input shift_reg;
  input shift_reg_0;
  input [0:0]D;
  input T_3;
  input [0:0]Q;

  wire [0:0]D;
  wire [0:0]Q;
  wire Q_4;
  wire T2_reg_0;
  wire T_3;
  wire T_4;
  wire clk_out;
  wire enn;
  wire enp;
  wire intQ_i_1__8_n_0;
  wire intQ_reg_0;
  wire [0:0]k_OBUF;
  wire [0:0]kr_IBUF;
  wire shift_reg;
  wire shift_reg_0;

  FDRE #(
    .INIT(1'b0)) 
    T2_reg
       (.C(clk_out),
        .CE(enp),
        .D(T2_reg_0),
        .Q(T_4),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h60)) 
    intQ_i_1__8
       (.I0(Q_4),
        .I1(T_3),
        .I2(Q),
        .O(intQ_i_1__8_n_0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    intQ_reg
       (.C(clk_out),
        .CE(enn),
        .D(intQ_i_1__8_n_0),
        .Q(Q_4),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \k_OBUF[4]_inst_i_1 
       (.I0(Q_4),
        .O(k_OBUF));
  LUT6 #(
    .INIT(64'hFFFFFF7F00000040)) 
    shift_i_1
       (.I0(kr_IBUF),
        .I1(enn),
        .I2(Q_4),
        .I3(shift_reg),
        .I4(shift_reg_0),
        .I5(D),
        .O(intQ_reg_0));
endmodule

module cell4
   (D,
    Q_reg_0,
    Q_reg_1,
    Q_0,
    clk_out,
    \D[7]_i_2 ,
    Q_3);
  output [0:0]D;
  output Q_reg_0;
  input Q_reg_1;
  input Q_0;
  input clk_out;
  input [0:0]\D[7]_i_2 ;
  input Q_3;

  wire [0:0]D;
  wire [0:0]\D[7]_i_2 ;
  wire Q_0;
  wire Q_3;
  wire Q_reg_0;
  wire Q_reg_1;
  wire clk_out;

  LUT4 #(
    .INIT(16'h6FF6)) 
    \D[7]_i_4 
       (.I0(D),
        .I1(Q_0),
        .I2(\D[7]_i_2 ),
        .I3(Q_3),
        .O(Q_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    Q_reg
       (.C(clk_out),
        .CE(Q_reg_1),
        .D(Q_0),
        .Q(D),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell4" *) 
module cell4_28
   (D,
    Q_reg_0,
    Q_1,
    clk_out);
  output [0:0]D;
  input Q_reg_0;
  input Q_1;
  input clk_out;

  wire [0:0]D;
  wire Q_1;
  wire Q_reg_0;
  wire clk_out;

  FDRE #(
    .INIT(1'b0)) 
    Q_reg
       (.C(clk_out),
        .CE(Q_reg_0),
        .D(Q_1),
        .Q(D),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell4" *) 
module cell4_29
   (D,
    Q_reg_0,
    Q_2,
    clk_out);
  output [0:0]D;
  input Q_reg_0;
  input Q_2;
  input clk_out;

  wire [0:0]D;
  wire Q_2;
  wire Q_reg_0;
  wire clk_out;

  FDRE #(
    .INIT(1'b0)) 
    Q_reg
       (.C(clk_out),
        .CE(Q_reg_0),
        .D(Q_2),
        .Q(D),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell4" *) 
module cell4_30
   (D,
    Q_reg_0,
    Q_3,
    clk_out);
  output [0:0]D;
  input Q_reg_0;
  input Q_3;
  input clk_out;

  wire [0:0]D;
  wire Q_3;
  wire Q_reg_0;
  wire clk_out;

  FDRE #(
    .INIT(1'b0)) 
    Q_reg
       (.C(clk_out),
        .CE(Q_reg_0),
        .D(Q_3),
        .Q(D),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell4" *) 
module cell4_31
   (D,
    Q_reg_0,
    Q_reg_1,
    Q_4,
    clk_out,
    \D[7]_i_2 ,
    Q_1);
  output [0:0]D;
  output Q_reg_0;
  input Q_reg_1;
  input Q_4;
  input clk_out;
  input [0:0]\D[7]_i_2 ;
  input Q_1;

  wire [0:0]D;
  wire [0:0]\D[7]_i_2 ;
  wire Q_1;
  wire Q_4;
  wire Q_reg_0;
  wire Q_reg_1;
  wire clk_out;

  LUT4 #(
    .INIT(16'h6FF6)) 
    \D[7]_i_5 
       (.I0(D),
        .I1(Q_4),
        .I2(\D[7]_i_2 ),
        .I3(Q_1),
        .O(Q_reg_0));
  FDRE #(
    .INIT(1'b0)) 
    Q_reg
       (.C(clk_out),
        .CE(Q_reg_1),
        .D(Q_4),
        .Q(D),
        .R(1'b0));
endmodule

(* ORIG_REF_NAME = "cell4" *) 
module cell4_32
   (D,
    E,
    debComp__5,
    Q_reg_0,
    Q_5,
    clk_out,
    enp,
    d15k,
    kr_IBUF,
    keyQ_1,
    keyQ_0,
    Q,
    \D_reg[0] ,
    \D_reg[0]_0 ,
    \D[7]_i_2_0 ,
    Q_2);
  output [0:0]D;
  output [0:0]E;
  output debComp__5;
  input Q_reg_0;
  input Q_5;
  input clk_out;
  input enp;
  input d15k;
  input [0:0]kr_IBUF;
  input keyQ_1;
  input keyQ_0;
  input [0:0]Q;
  input \D_reg[0] ;
  input \D_reg[0]_0 ;
  input [0:0]\D[7]_i_2_0 ;
  input Q_2;

  wire [0:0]D;
  wire [0:0]\D[7]_i_2_0 ;
  wire \D[7]_i_3_n_0 ;
  wire \D_reg[0] ;
  wire \D_reg[0]_0 ;
  wire [0:0]E;
  wire [0:0]Q;
  wire Q_2;
  wire Q_5;
  wire Q_reg_0;
  wire clk_out;
  wire d15k;
  wire debComp__5;
  wire enp;
  wire keyQ_0;
  wire keyQ_1;
  wire [0:0]kr_IBUF;

  LUT6 #(
    .INIT(64'h0000000000080000)) 
    \D[7]_i_1 
       (.I0(enp),
        .I1(d15k),
        .I2(kr_IBUF),
        .I3(debComp__5),
        .I4(keyQ_1),
        .I5(keyQ_0),
        .O(E));
  LUT4 #(
    .INIT(16'hAAA8)) 
    \D[7]_i_2 
       (.I0(Q),
        .I1(\D[7]_i_3_n_0 ),
        .I2(\D_reg[0] ),
        .I3(\D_reg[0]_0 ),
        .O(debComp__5));
  LUT4 #(
    .INIT(16'h6FF6)) 
    \D[7]_i_3 
       (.I0(D),
        .I1(Q_5),
        .I2(\D[7]_i_2_0 ),
        .I3(Q_2),
        .O(\D[7]_i_3_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    Q_reg
       (.C(clk_out),
        .CE(Q_reg_0),
        .D(Q_5),
        .Q(D),
        .R(1'b0));
endmodule

module cell6
   (Q_1,
    T_1,
    k_OBUF,
    T1_reg_0,
    enp,
    clk_out,
    enn,
    T1_reg_1,
    T_0,
    Q,
    Q_2);
  output Q_1;
  output T_1;
  output [0:0]k_OBUF;
  output T1_reg_0;
  input enp;
  input clk_out;
  input enn;
  input T1_reg_1;
  input T_0;
  input [0:0]Q;
  input Q_2;

  wire [0:0]Q;
  wire Q_1;
  wire Q_2;
  wire T1_reg_0;
  wire T1_reg_1;
  wire T_0;
  wire T_1;
  wire clk_out;
  wire enn;
  wire enp;
  wire intQ_i_1__5_n_0;
  wire [0:0]k_OBUF;

  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    T1_reg
       (.C(clk_out),
        .CE(enn),
        .D(T1_reg_1),
        .Q(T_1),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    T2_i_1__0
       (.I0(T_1),
        .I1(Q_2),
        .O(T1_reg_0));
  LUT3 #(
    .INIT(8'h60)) 
    intQ_i_1__5
       (.I0(Q_1),
        .I1(T_0),
        .I2(Q),
        .O(intQ_i_1__5_n_0));
  FDRE #(
    .INIT(1'b0)) 
    intQ_reg
       (.C(clk_out),
        .CE(enp),
        .D(intQ_i_1__5_n_0),
        .Q(Q_1),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \k_OBUF[1]_inst_i_1 
       (.I0(Q_1),
        .O(k_OBUF));
endmodule

(* ORIG_REF_NAME = "cell6" *) 
module cell6_34
   (Q_3,
    T_3,
    k_OBUF,
    T1_reg_0,
    enp,
    clk_out,
    enn,
    T1_reg_1,
    T_2,
    Q,
    Q_4);
  output Q_3;
  output T_3;
  output [0:0]k_OBUF;
  output T1_reg_0;
  input enp;
  input clk_out;
  input enn;
  input T1_reg_1;
  input T_2;
  input [0:0]Q;
  input Q_4;

  wire [0:0]Q;
  wire Q_3;
  wire Q_4;
  wire T1_reg_0;
  wire T1_reg_1;
  wire T_2;
  wire T_3;
  wire clk_out;
  wire enn;
  wire enp;
  wire intQ_i_1__7_n_0;
  wire [0:0]k_OBUF;

  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    T1_reg
       (.C(clk_out),
        .CE(enn),
        .D(T1_reg_1),
        .Q(T_3),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h2)) 
    T2_i_1__1
       (.I0(T_3),
        .I1(Q_4),
        .O(T1_reg_0));
  LUT3 #(
    .INIT(8'h60)) 
    intQ_i_1__7
       (.I0(Q_3),
        .I1(T_2),
        .I2(Q),
        .O(intQ_i_1__7_n_0));
  FDRE #(
    .INIT(1'b0)) 
    intQ_reg
       (.C(clk_out),
        .CE(enp),
        .D(intQ_i_1__7_n_0),
        .Q(Q_3),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \k_OBUF[3]_inst_i_1 
       (.I0(Q_3),
        .O(k_OBUF));
endmodule

(* ORIG_REF_NAME = "cell6" *) 
module cell6_36
   (Q_5,
    qLoop_reg,
    preBreak,
    k_OBUF,
    intQ_reg_0,
    intQ_reg_1,
    enp,
    clk_out,
    qLoop,
    d15k,
    control_reg,
    Q_4,
    kr_IBUF,
    enn,
    D,
    T_4,
    Q);
  output Q_5;
  output qLoop_reg;
  output preBreak;
  output [0:0]k_OBUF;
  output intQ_reg_0;
  output intQ_reg_1;
  input enp;
  input clk_out;
  input qLoop;
  input d15k;
  input control_reg;
  input Q_4;
  input [0:0]kr_IBUF;
  input enn;
  input [0:0]D;
  input T_4;
  input [0:0]Q;

  wire [0:0]D;
  wire [0:0]Q;
  wire Q_4;
  wire Q_5;
  wire T_4;
  wire clk_out;
  wire control_reg;
  wire d15k;
  wire enn;
  wire enp;
  wire intQ_i_1__9_n_0;
  wire intQ_reg_0;
  wire intQ_reg_1;
  wire [0:0]k_OBUF;
  wire [0:0]kr_IBUF;
  wire preBreak;
  wire qLoop;
  wire qLoop_reg;

  LUT6 #(
    .INIT(64'hFFFFFFF700000004)) 
    control_i_1
       (.I0(kr_IBUF),
        .I1(enn),
        .I2(intQ_reg_1),
        .I3(Q_4),
        .I4(control_reg),
        .I5(D),
        .O(intQ_reg_0));
  LUT3 #(
    .INIT(8'h60)) 
    intQ_i_1__9
       (.I0(Q_5),
        .I1(T_4),
        .I2(Q),
        .O(intQ_i_1__9_n_0));
  FDRE #(
    .INIT(1'b0)) 
    intQ_reg
       (.C(clk_out),
        .CE(enp),
        .D(intQ_i_1__9_n_0),
        .Q(Q_5),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    \k_OBUF[5]_inst_i_1 
       (.I0(Q_5),
        .O(k_OBUF));
  LUT6 #(
    .INIT(64'hAA2AAAAAAAEAAAAA)) 
    qMuxOut_i_1
       (.I0(qLoop),
        .I1(Q_5),
        .I2(d15k),
        .I3(control_reg),
        .I4(Q_4),
        .I5(kr_IBUF),
        .O(qLoop_reg));
  LUT6 #(
    .INIT(64'h0000000000400000)) 
    setBreak_i_1
       (.I0(qLoop),
        .I1(Q_5),
        .I2(d15k),
        .I3(control_reg),
        .I4(Q_4),
        .I5(kr_IBUF),
        .O(preBreak));
  LUT2 #(
    .INIT(4'hB)) 
    shift_i_2
       (.I0(Q_5),
        .I1(d15k),
        .O(intQ_reg_1));
endmodule

module clk_wiz_0
   (clk_out,
    clk_in1);
  output clk_out;
  input clk_in1;

  wire clk_in1;
  wire clk_out;

  clk_wiz_0_clk_wiz inst
       (.clk_in1(clk_in1),
        .clk_out(clk_out));
endmodule

module clk_wiz_0_clk_wiz
   (clk_out,
    clk_in1);
  output clk_out;
  input clk_in1;

  wire clk_in1;
  wire clk_in1_clk_wiz_0;
  wire clk_out;
  wire clk_out_clk_wiz_0;
  wire clkfbout_buf_clk_wiz_0;
  wire clkfbout_clk_wiz_0;
  wire NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT1_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED;
  wire NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED;
  wire NLW_mmcm_adv_inst_DRDY_UNCONNECTED;
  wire NLW_mmcm_adv_inst_LOCKED_UNCONNECTED;
  wire NLW_mmcm_adv_inst_PSDONE_UNCONNECTED;
  wire [15:0]NLW_mmcm_adv_inst_DO_UNCONNECTED;

  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG clkf_buf
       (.I(clkfbout_clk_wiz_0),
        .O(clkfbout_buf_clk_wiz_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  IBUF #(
    .IOSTANDARD("DEFAULT")) 
    clkin1_ibufg
       (.I(clk_in1),
        .O(clk_in1_clk_wiz_0));
  (* BOX_TYPE = "PRIMITIVE" *) 
  BUFG clkout1_buf
       (.I(clk_out_clk_wiz_0),
        .O(clk_out));
  (* BOX_TYPE = "PRIMITIVE" *) 
  MMCME2_ADV #(
    .BANDWIDTH("OPTIMIZED"),
    .CLKFBOUT_MULT_F(63.750000),
    .CLKFBOUT_PHASE(0.000000),
    .CLKFBOUT_USE_FINE_PS("FALSE"),
    .CLKIN1_PERIOD(83.330002),
    .CLKIN2_PERIOD(0.000000),
    .CLKOUT0_DIVIDE_F(12.750000),
    .CLKOUT0_DUTY_CYCLE(0.500000),
    .CLKOUT0_PHASE(0.000000),
    .CLKOUT0_USE_FINE_PS("FALSE"),
    .CLKOUT1_DIVIDE(1),
    .CLKOUT1_DUTY_CYCLE(0.500000),
    .CLKOUT1_PHASE(0.000000),
    .CLKOUT1_USE_FINE_PS("FALSE"),
    .CLKOUT2_DIVIDE(1),
    .CLKOUT2_DUTY_CYCLE(0.500000),
    .CLKOUT2_PHASE(0.000000),
    .CLKOUT2_USE_FINE_PS("FALSE"),
    .CLKOUT3_DIVIDE(1),
    .CLKOUT3_DUTY_CYCLE(0.500000),
    .CLKOUT3_PHASE(0.000000),
    .CLKOUT3_USE_FINE_PS("FALSE"),
    .CLKOUT4_CASCADE("FALSE"),
    .CLKOUT4_DIVIDE(1),
    .CLKOUT4_DUTY_CYCLE(0.500000),
    .CLKOUT4_PHASE(0.000000),
    .CLKOUT4_USE_FINE_PS("FALSE"),
    .CLKOUT5_DIVIDE(1),
    .CLKOUT5_DUTY_CYCLE(0.500000),
    .CLKOUT5_PHASE(0.000000),
    .CLKOUT5_USE_FINE_PS("FALSE"),
    .CLKOUT6_DIVIDE(1),
    .CLKOUT6_DUTY_CYCLE(0.500000),
    .CLKOUT6_PHASE(0.000000),
    .CLKOUT6_USE_FINE_PS("FALSE"),
    .COMPENSATION("ZHOLD"),
    .DIVCLK_DIVIDE(1),
    .IS_CLKINSEL_INVERTED(1'b0),
    .IS_PSEN_INVERTED(1'b0),
    .IS_PSINCDEC_INVERTED(1'b0),
    .IS_PWRDWN_INVERTED(1'b0),
    .IS_RST_INVERTED(1'b0),
    .REF_JITTER1(0.010000),
    .REF_JITTER2(0.010000),
    .SS_EN("FALSE"),
    .SS_MODE("CENTER_HIGH"),
    .SS_MOD_PERIOD(10000),
    .STARTUP_WAIT("FALSE")) 
    mmcm_adv_inst
       (.CLKFBIN(clkfbout_buf_clk_wiz_0),
        .CLKFBOUT(clkfbout_clk_wiz_0),
        .CLKFBOUTB(NLW_mmcm_adv_inst_CLKFBOUTB_UNCONNECTED),
        .CLKFBSTOPPED(NLW_mmcm_adv_inst_CLKFBSTOPPED_UNCONNECTED),
        .CLKIN1(clk_in1_clk_wiz_0),
        .CLKIN2(1'b0),
        .CLKINSEL(1'b1),
        .CLKINSTOPPED(NLW_mmcm_adv_inst_CLKINSTOPPED_UNCONNECTED),
        .CLKOUT0(clk_out_clk_wiz_0),
        .CLKOUT0B(NLW_mmcm_adv_inst_CLKOUT0B_UNCONNECTED),
        .CLKOUT1(NLW_mmcm_adv_inst_CLKOUT1_UNCONNECTED),
        .CLKOUT1B(NLW_mmcm_adv_inst_CLKOUT1B_UNCONNECTED),
        .CLKOUT2(NLW_mmcm_adv_inst_CLKOUT2_UNCONNECTED),
        .CLKOUT2B(NLW_mmcm_adv_inst_CLKOUT2B_UNCONNECTED),
        .CLKOUT3(NLW_mmcm_adv_inst_CLKOUT3_UNCONNECTED),
        .CLKOUT3B(NLW_mmcm_adv_inst_CLKOUT3B_UNCONNECTED),
        .CLKOUT4(NLW_mmcm_adv_inst_CLKOUT4_UNCONNECTED),
        .CLKOUT5(NLW_mmcm_adv_inst_CLKOUT5_UNCONNECTED),
        .CLKOUT6(NLW_mmcm_adv_inst_CLKOUT6_UNCONNECTED),
        .DADDR({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DCLK(1'b0),
        .DEN(1'b0),
        .DI({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .DO(NLW_mmcm_adv_inst_DO_UNCONNECTED[15:0]),
        .DRDY(NLW_mmcm_adv_inst_DRDY_UNCONNECTED),
        .DWE(1'b0),
        .LOCKED(NLW_mmcm_adv_inst_LOCKED_UNCONNECTED),
        .PSCLK(1'b0),
        .PSDONE(NLW_mmcm_adv_inst_PSDONE_UNCONNECTED),
        .PSEN(1'b0),
        .PSINCDEC(1'b0),
        .PWRDWN(1'b0),
        .RST(1'b0));
endmodule

module clock_gen_core
   (lfsr15k0,
    d15k,
    audClock,
    keybClk,
    d15k_reg_0,
    enn,
    clk_out,
    Q,
    sel15Khz,
    init,
    D);
  output lfsr15k0;
  output d15k;
  output audClock;
  output keybClk;
  output d15k_reg_0;
  input enn;
  input clk_out;
  input [2:0]Q;
  input sel15Khz;
  input init;
  input [0:0]D;

  wire [0:0]D;
  wire [2:0]Q;
  wire audClock;
  wire clkMuxOut;
  wire clk_out;
  wire d15k;
  wire d15k_i_2_n_0;
  wire d15k_reg_0;
  wire d64k;
  wire enn;
  wire init;
  wire keybClk;
  wire lfsr15k0;
  wire lfsr15k0_i_1_n_0;
  wire lfsr15k0_i_2_n_0;
  wire \lfsr15k_reg_n_0_[1] ;
  wire \lfsr64k_reg_n_0_[0] ;
  wire \lfsr64k_reg_n_0_[1] ;
  wire nor15k;
  wire nor64k;
  wire p_0_in;
  wire p_1_in;
  wire p_2_in;
  wire p_3_in;
  wire p_3_in0_in;
  wire p_4_in;
  wire p_4_in1_in;
  wire p_5_in;
  wire [0:0]p_5_out;
  wire sel15Khz;

  LUT5 #(
    .INIT(32'h00010000)) 
    d15k_i_1
       (.I0(d15k_i_2_n_0),
        .I1(p_3_in0_in),
        .I2(\lfsr15k_reg_n_0_[1] ),
        .I3(p_4_in1_in),
        .I4(p_1_in),
        .O(nor15k));
  LUT5 #(
    .INIT(32'hFFFFDDDF)) 
    d15k_i_2
       (.I0(p_0_in),
        .I1(p_5_in),
        .I2(Q[0]),
        .I3(Q[1]),
        .I4(lfsr15k0),
        .O(d15k_i_2_n_0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    d15k_reg
       (.C(clk_out),
        .CE(enn),
        .D(nor15k),
        .Q(d15k),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00000010)) 
    d64k_i_1
       (.I0(\lfsr64k_reg_n_0_[0] ),
        .I1(p_2_in),
        .I2(\lfsr64k_reg_n_0_[1] ),
        .I3(p_4_in),
        .I4(p_3_in),
        .O(nor64k));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    d64k_reg
       (.C(clk_out),
        .CE(enn),
        .D(nor64k),
        .Q(d64k),
        .R(1'b0));
  LUT3 #(
    .INIT(8'hB8)) 
    dClk_i_1
       (.I0(d15k),
        .I1(sel15Khz),
        .I2(d64k),
        .O(clkMuxOut));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    dClk_reg
       (.C(clk_out),
        .CE(enn),
        .D(clkMuxOut),
        .Q(audClock),
        .R(1'b0));
  LUT6 #(
    .INIT(64'h3C3C3C3C3838383C)) 
    lfsr15k0_i_1
       (.I0(lfsr15k0_i_2_n_0),
        .I1(p_0_in),
        .I2(p_5_in),
        .I3(Q[0]),
        .I4(Q[1]),
        .I5(lfsr15k0),
        .O(lfsr15k0_i_1_n_0));
  LUT4 #(
    .INIT(16'hFFFD)) 
    lfsr15k0_i_2
       (.I0(p_1_in),
        .I1(p_4_in1_in),
        .I2(\lfsr15k_reg_n_0_[1] ),
        .I3(p_3_in0_in),
        .O(lfsr15k0_i_2_n_0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    lfsr15k0_reg
       (.C(clk_out),
        .CE(enn),
        .D(lfsr15k0_i_1_n_0),
        .Q(lfsr15k0),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr15k_reg[1] 
       (.C(clk_out),
        .CE(enn),
        .D(D),
        .Q(\lfsr15k_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr15k_reg[2] 
       (.C(clk_out),
        .CE(enn),
        .D(\lfsr15k_reg_n_0_[1] ),
        .Q(p_3_in0_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr15k_reg[3] 
       (.C(clk_out),
        .CE(enn),
        .D(p_3_in0_in),
        .Q(p_1_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr15k_reg[4] 
       (.C(clk_out),
        .CE(enn),
        .D(p_1_in),
        .Q(p_4_in1_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr15k_reg[5] 
       (.C(clk_out),
        .CE(enn),
        .D(p_4_in1_in),
        .Q(p_5_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr15k_reg[6] 
       (.C(clk_out),
        .CE(enn),
        .D(p_5_in),
        .Q(p_0_in),
        .R(1'b0));
  LUT6 #(
    .INIT(64'hBEBEBEBEBEBFBEBE)) 
    \lfsr64k[0]_i_1 
       (.I0(init),
        .I1(p_4_in),
        .I2(p_2_in),
        .I3(\lfsr64k_reg_n_0_[0] ),
        .I4(\lfsr64k_reg_n_0_[1] ),
        .I5(p_3_in),
        .O(p_5_out));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr64k_reg[0] 
       (.C(clk_out),
        .CE(enn),
        .D(p_5_out),
        .Q(\lfsr64k_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr64k_reg[1] 
       (.C(clk_out),
        .CE(enn),
        .D(\lfsr64k_reg_n_0_[0] ),
        .Q(\lfsr64k_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr64k_reg[2] 
       (.C(clk_out),
        .CE(enn),
        .D(\lfsr64k_reg_n_0_[1] ),
        .Q(p_2_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr64k_reg[3] 
       (.C(clk_out),
        .CE(enn),
        .D(p_2_in),
        .Q(p_3_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr64k_reg[4] 
       (.C(clk_out),
        .CE(enn),
        .D(p_3_in),
        .Q(p_4_in),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h1)) 
    nPotClk_i_1
       (.I0(d15k),
        .I1(Q[2]),
        .O(d15k_reg_0));
  LUT1 #(
    .INIT(2'h1)) 
    qkeybClk_i_1
       (.I0(d15k),
        .O(keybClk));
endmodule

module freq_control
   (enn,
    resync,
    rstDelay,
    Q,
    rstDelay_reg_0,
    rstDelay_reg_1,
    rstDelay_reg_2,
    rstDelay_reg_3,
    nor3_reg,
    clk_out,
    presync_reg_0,
    enp,
    nDout,
    nDout_reg,
    nDout_reg_0,
    nDout_reg_1,
    nDout_reg_2,
    nDout_reg_3,
    nDout_reg_4,
    nDout_reg_5,
    nDout_reg_6,
    nDout_0,
    nDout_1,
    nDout_2,
    enFastClk1,
    audClock,
    ch2Bits16,
    enFastClk3,
    ch4Bits16,
    resyncTwoTones,
    resyncSerClk,
    nor4,
    nor30__2,
    nor4_3,
    nor30__1,
    nor4_4,
    nor30__0,
    nor4_5,
    nor30,
    or1Q_reg,
    nor3,
    \Qbor_reg[4]_0 );
  output enn;
  output resync;
  output rstDelay;
  output [3:0]Q;
  output rstDelay_reg_0;
  output rstDelay_reg_1;
  output rstDelay_reg_2;
  output rstDelay_reg_3;
  output nor3_reg;
  input clk_out;
  input presync_reg_0;
  input enp;
  input nDout;
  input nDout_reg;
  input nDout_reg_0;
  input nDout_reg_1;
  input nDout_reg_2;
  input nDout_reg_3;
  input nDout_reg_4;
  input nDout_reg_5;
  input nDout_reg_6;
  input nDout_0;
  input nDout_1;
  input nDout_2;
  input enFastClk1;
  input audClock;
  input ch2Bits16;
  input enFastClk3;
  input ch4Bits16;
  input resyncTwoTones;
  input resyncSerClk;
  input nor4;
  input nor30__2;
  input nor4_3;
  input nor30__1;
  input nor4_4;
  input nor30__0;
  input nor4_5;
  input nor30;
  input [1:0]or1Q_reg;
  input nor3;
  input [1:0]\Qbor_reg[4]_0 ;

  wire CR_BOR_1_3;
  wire CR_BOR_1_6;
  wire CR_BOR_2_3;
  wire CR_BOR_2_6;
  wire CR_BOR_3_3;
  wire CR_BOR_3_6;
  wire CR_BOR_4_3;
  wire CR_BOR_4_6;
  wire [3:0]Q;
  wire [1:0]\Qbor_reg[4]_0 ;
  wire \Qbor_reg_n_0_[1] ;
  wire audClock;
  wire bt;
  wire bt_0;
  wire bt_1;
  wire bt_10;
  wire bt_11;
  wire bt_13;
  wire bt_14;
  wire bt_15;
  wire bt_17;
  wire bt_18;
  wire bt_20;
  wire bt_21;
  wire bt_22;
  wire bt_24;
  wire bt_25;
  wire bt_3;
  wire bt_4;
  wire bt_6;
  wire bt_7;
  wire bt_8;
  wire ch2Bits16;
  wire ch4Bits16;
  wire clk_out;
  wire \cntrLd_reg_n_0_[1] ;
  wire enFastClk1;
  wire enFastClk3;
  wire enn;
  wire enp;
  wire nDout;
  wire nDout_0;
  wire nDout_1;
  wire nDout_2;
  wire nDout_reg;
  wire nDout_reg_0;
  wire nDout_reg_1;
  wire nDout_reg_2;
  wire nDout_reg_3;
  wire nDout_reg_4;
  wire nDout_reg_5;
  wire nDout_reg_6;
  wire nor3;
  wire nor30;
  wire nor30__0;
  wire nor30__1;
  wire nor30__2;
  wire nor3_reg;
  wire nor4;
  wire nor4_3;
  wire nor4_4;
  wire nor4_5;
  wire norb_0;
  wire norb_1;
  wire norb_2;
  wire norb_3;
  wire or1Q;
  wire or1Q_12;
  wire or1Q_16;
  wire or1Q_19;
  wire or1Q_2;
  wire or1Q_23;
  wire or1Q_5;
  wire or1Q_9;
  wire [1:0]or1Q_reg;
  wire p_0_in;
  wire p_0_in0_in;
  wire p_0_in11_in;
  wire p_0_in13_in;
  wire p_0_in15_in;
  wire p_0_in1_in;
  wire [3:0]p_0_out;
  wire presync;
  wire presync_reg_0;
  wire resync;
  wire resyncSerClk;
  wire resyncTwoTones;
  wire rstDelay;
  wire rstDelay_reg_0;
  wire rstDelay_reg_1;
  wire rstDelay_reg_2;
  wire rstDelay_reg_3;
  wire t1_b7_n_0;
  wire t2_b7_n_0;
  wire t3_b7_n_0;
  wire t4_b7_n_0;

  LUT4 #(
    .INIT(16'hFEFF)) 
    I_i_1
       (.I0(rstDelay),
        .I1(resync),
        .I2(nor4),
        .I3(nor30__2),
        .O(rstDelay_reg_0));
  LUT4 #(
    .INIT(16'hFEFF)) 
    I_i_1__0
       (.I0(rstDelay),
        .I1(resync),
        .I2(nor4_3),
        .I3(nor30__1),
        .O(rstDelay_reg_1));
  LUT4 #(
    .INIT(16'hFEFF)) 
    I_i_1__1
       (.I0(rstDelay),
        .I1(resync),
        .I2(nor4_4),
        .I3(nor30__0),
        .O(rstDelay_reg_2));
  LUT4 #(
    .INIT(16'hFEFF)) 
    I_i_1__2
       (.I0(rstDelay),
        .I1(resync),
        .I2(nor4_5),
        .I3(nor30),
        .O(rstDelay_reg_3));
  FDRE #(
    .INIT(1'b0)) 
    \Qbor_reg[1] 
       (.C(clk_out),
        .CE(1'b1),
        .D(t1_b7_n_0),
        .Q(\Qbor_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Qbor_reg[2] 
       (.C(clk_out),
        .CE(1'b1),
        .D(t2_b7_n_0),
        .Q(p_0_in11_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Qbor_reg[3] 
       (.C(clk_out),
        .CE(1'b1),
        .D(t3_b7_n_0),
        .Q(p_0_in13_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    \Qbor_reg[4] 
       (.C(clk_out),
        .CE(1'b1),
        .D(t4_b7_n_0),
        .Q(p_0_in15_in),
        .R(1'b0));
  LUT5 #(
    .INIT(32'hEEEFFFEF)) 
    \cntrLd[1]_i_1 
       (.I0(resyncTwoTones),
        .I1(resync),
        .I2(\Qbor_reg_n_0_[1] ),
        .I3(ch2Bits16),
        .I4(p_0_in11_in),
        .O(p_0_out[0]));
  LUT3 #(
    .INIT(8'hEF)) 
    \cntrLd[2]_i_1 
       (.I0(resyncTwoTones),
        .I1(resync),
        .I2(p_0_in11_in),
        .O(p_0_out[1]));
  LUT5 #(
    .INIT(32'hEEEFFFEF)) 
    \cntrLd[3]_i_1 
       (.I0(resyncSerClk),
        .I1(resync),
        .I2(p_0_in13_in),
        .I3(ch4Bits16),
        .I4(p_0_in15_in),
        .O(p_0_out[2]));
  LUT3 #(
    .INIT(8'hEF)) 
    \cntrLd[4]_i_1 
       (.I0(resyncSerClk),
        .I1(resync),
        .I2(p_0_in15_in),
        .O(p_0_out[3]));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \cntrLd_reg[1] 
       (.C(clk_out),
        .CE(enn),
        .D(p_0_out[0]),
        .Q(\cntrLd_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \cntrLd_reg[2] 
       (.C(clk_out),
        .CE(enn),
        .D(p_0_out[1]),
        .Q(p_0_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \cntrLd_reg[3] 
       (.C(clk_out),
        .CE(enn),
        .D(p_0_out[2]),
        .Q(p_0_in0_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \cntrLd_reg[4] 
       (.C(clk_out),
        .CE(enn),
        .D(p_0_out[3]),
        .Q(p_0_in1_in),
        .R(1'b0));
  LUT3 #(
    .INIT(8'h01)) 
    \intTimer[1]_i_1 
       (.I0(\Qbor_reg_n_0_[1] ),
        .I1(resync),
        .I2(resyncTwoTones),
        .O(norb_0));
  LUT3 #(
    .INIT(8'h01)) 
    \intTimer[2]_i_1 
       (.I0(p_0_in11_in),
        .I1(resync),
        .I2(resyncTwoTones),
        .O(norb_1));
  LUT3 #(
    .INIT(8'h01)) 
    \intTimer[3]_i_1 
       (.I0(p_0_in13_in),
        .I1(resync),
        .I2(resyncSerClk),
        .O(norb_2));
  LUT3 #(
    .INIT(8'h01)) 
    \intTimer[4]_i_1 
       (.I0(p_0_in15_in),
        .I1(resync),
        .I2(resyncSerClk),
        .O(norb_3));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \intTimer_reg[1] 
       (.C(clk_out),
        .CE(enn),
        .D(norb_0),
        .Q(Q[0]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \intTimer_reg[2] 
       (.C(clk_out),
        .CE(enn),
        .D(norb_1),
        .Q(Q[1]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \intTimer_reg[3] 
       (.C(clk_out),
        .CE(enn),
        .D(norb_2),
        .Q(Q[2]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \intTimer_reg[4] 
       (.C(clk_out),
        .CE(enn),
        .D(norb_3),
        .Q(Q[3]),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    presync_reg
       (.C(clk_out),
        .CE(enn),
        .D(presync_reg_0),
        .Q(presync),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    resync_reg
       (.C(clk_out),
        .CE(enp),
        .D(presync),
        .Q(resync),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0)) 
    rstDelay_reg
       (.C(clk_out),
        .CE(enp),
        .D(resync),
        .Q(rstDelay),
        .R(1'b0));
  cell20 t1_b0
       (.Q(\cntrLd_reg_n_0_[1] ),
        .audClock(audClock),
        .clk_out(clk_out),
        .enFastClk1(enFastClk1),
        .nDout(nDout),
        .nDout_reg_0(nDout_reg_6),
        .or1Q(or1Q),
        .or1Q_reg_0(or1Q_reg),
        .\pren_reg[2] (enn));
  cell24 t1_b1
       (.Q(\cntrLd_reg_n_0_[1] ),
        .bt(bt),
        .bt_reg_0(enn),
        .clk_out(clk_out),
        .nDout(nDout),
        .nDout_reg_0(nDout_reg_5),
        .or1Q(or1Q));
  cell24_37 t1_b2
       (.Q(\cntrLd_reg_n_0_[1] ),
        .bt(bt_0),
        .bt_0(bt),
        .bt_reg_0(enn),
        .clk_out(clk_out),
        .nDout(nDout),
        .nDout_reg_0(nDout_reg_4),
        .or1Q(or1Q));
  cell24_38 t1_b3
       (.CR_BOR_1_3(CR_BOR_1_3),
        .Q(\cntrLd_reg_n_0_[1] ),
        .bt(bt_1),
        .bt_0(bt),
        .bt_1(bt_0),
        .bt_reg_0(enn),
        .clk_out(clk_out),
        .nDout(nDout),
        .nDout_reg_0(nDout_reg_3),
        .or1Q(or1Q));
  cell20_39 t1_b4
       (.CR_BOR_1_3(CR_BOR_1_3),
        .Q(\cntrLd_reg_n_0_[1] ),
        .bt(bt_1),
        .bt_0(bt_0),
        .bt_1(bt),
        .clk_out(clk_out),
        .nDout(nDout),
        .nDout_reg_0(nDout_reg_2),
        .or1Q(or1Q_2),
        .or1Q_2(or1Q),
        .or1Q_reg_0(enn));
  cell24_40 t1_b5
       (.Q(\cntrLd_reg_n_0_[1] ),
        .bt(bt_3),
        .bt_reg_0(enn),
        .clk_out(clk_out),
        .nDout(nDout),
        .nDout_reg_0(nDout_reg_1),
        .or1Q(or1Q_2));
  cell24_41 t1_b6
       (.CR_BOR_1_6(CR_BOR_1_6),
        .Q(\cntrLd_reg_n_0_[1] ),
        .bt(bt_4),
        .bt_0(bt_3),
        .bt_reg_0(enn),
        .clk_out(clk_out),
        .nDout(nDout),
        .nDout_reg_0(nDout_reg_0),
        .or1Q(or1Q_2));
  cell24option1 t1_b7
       (.CR_BOR_1_6(CR_BOR_1_6),
        .Q(\cntrLd_reg_n_0_[1] ),
        .\Qbor_reg[1] (\Qbor_reg[4]_0 ),
        .\Qbor_reg[1]_0 (\Qbor_reg_n_0_[1] ),
        .bt(bt_3),
        .bt_0(bt_4),
        .bt_reg_0(enn),
        .clk_out(clk_out),
        .nDout(nDout),
        .nDout_reg_0(nDout_reg),
        .or1Q(or1Q_2),
        .\prep_reg[1] (t1_b7_n_0));
  cell20_42 t2_b0
       (.Q(p_0_in),
        .audClock(audClock),
        .ch2Bits16(ch2Bits16),
        .clk_out(clk_out),
        .nDout_0(nDout_0),
        .nDout_reg_0(nDout_reg_6),
        .or1Q(or1Q_5),
        .or1Q_reg_0(enn),
        .or1Q_reg_1(Q[0]));
  cell24_43 t2_b1
       (.Q(p_0_in),
        .bt(bt_6),
        .bt_reg_0(enn),
        .clk_out(clk_out),
        .nDout_0(nDout_0),
        .nDout_reg_0(nDout_reg_5),
        .or1Q(or1Q_5));
  cell24_44 t2_b2
       (.Q(p_0_in),
        .bt(bt_7),
        .bt_0(bt_6),
        .bt_reg_0(enn),
        .clk_out(clk_out),
        .nDout_0(nDout_0),
        .nDout_reg_0(nDout_reg_4),
        .or1Q(or1Q_5));
  cell24_45 t2_b3
       (.CR_BOR_2_3(CR_BOR_2_3),
        .Q(p_0_in),
        .bt(bt_8),
        .bt_0(bt_6),
        .bt_1(bt_7),
        .bt_reg_0(enn),
        .clk_out(clk_out),
        .nDout_0(nDout_0),
        .nDout_reg_0(nDout_reg_3),
        .or1Q(or1Q_5));
  cell20_46 t2_b4
       (.CR_BOR_2_3(CR_BOR_2_3),
        .Q(p_0_in),
        .bt(bt_8),
        .bt_0(bt_7),
        .bt_1(bt_6),
        .clk_out(clk_out),
        .nDout_0(nDout_0),
        .nDout_reg_0(nDout_reg_2),
        .or1Q(or1Q_9),
        .or1Q_2(or1Q_5),
        .or1Q_reg_0(enn));
  cell24_47 t2_b5
       (.Q(p_0_in),
        .bt(bt_10),
        .bt_reg_0(enn),
        .clk_out(clk_out),
        .nDout_0(nDout_0),
        .nDout_reg_0(nDout_reg_1),
        .or1Q(or1Q_9));
  cell24_48 t2_b6
       (.CR_BOR_2_6(CR_BOR_2_6),
        .Q(p_0_in),
        .bt(bt_11),
        .bt_0(bt_10),
        .bt_reg_0(enn),
        .clk_out(clk_out),
        .nDout_0(nDout_0),
        .nDout_reg_0(nDout_reg_0),
        .or1Q(or1Q_9));
  cell24option1_49 t2_b7
       (.CR_BOR_2_6(CR_BOR_2_6),
        .Q(p_0_in),
        .\Qbor_reg[2] (\Qbor_reg[4]_0 ),
        .bt(bt_10),
        .bt_0(bt_11),
        .bt_reg_0(enn),
        .clk_out(clk_out),
        .nDout_0(nDout_0),
        .nDout_reg_0(nDout_reg),
        .or1Q(or1Q_9),
        .p_0_in11_in(p_0_in11_in),
        .\prep_reg[1] (t2_b7_n_0));
  cell20_50 t3_b0
       (.Q(p_0_in0_in),
        .audClock(audClock),
        .clk_out(clk_out),
        .enFastClk3(enFastClk3),
        .nDout_1(nDout_1),
        .nDout_reg_0(nDout_reg_6),
        .or1Q(or1Q_12),
        .or1Q_reg_0(enn));
  cell24_51 t3_b1
       (.Q(p_0_in0_in),
        .bt(bt_13),
        .bt_reg_0(enn),
        .clk_out(clk_out),
        .nDout_1(nDout_1),
        .nDout_reg_0(nDout_reg_5),
        .or1Q(or1Q_12));
  cell24_52 t3_b2
       (.Q(p_0_in0_in),
        .bt(bt_14),
        .bt_0(bt_13),
        .bt_reg_0(enn),
        .clk_out(clk_out),
        .nDout_1(nDout_1),
        .nDout_reg_0(nDout_reg_4),
        .or1Q(or1Q_12));
  cell24_53 t3_b3
       (.CR_BOR_3_3(CR_BOR_3_3),
        .Q(p_0_in0_in),
        .bt(bt_15),
        .bt_0(bt_13),
        .bt_1(bt_14),
        .bt_reg_0(enn),
        .clk_out(clk_out),
        .nDout_1(nDout_1),
        .nDout_reg_0(nDout_reg_3),
        .or1Q(or1Q_12));
  cell20_54 t3_b4
       (.CR_BOR_3_3(CR_BOR_3_3),
        .Q(p_0_in0_in),
        .bt(bt_15),
        .bt_0(bt_14),
        .bt_1(bt_13),
        .clk_out(clk_out),
        .nDout_1(nDout_1),
        .nDout_reg_0(nDout_reg_2),
        .or1Q(or1Q_16),
        .or1Q_2(or1Q_12),
        .or1Q_reg_0(enn));
  cell24_55 t3_b5
       (.Q(p_0_in0_in),
        .bt(bt_17),
        .bt_reg_0(enn),
        .clk_out(clk_out),
        .nDout_1(nDout_1),
        .nDout_reg_0(nDout_reg_1),
        .or1Q(or1Q_16));
  cell24_56 t3_b6
       (.CR_BOR_3_6(CR_BOR_3_6),
        .Q(p_0_in0_in),
        .bt(bt_18),
        .bt_0(bt_17),
        .bt_reg_0(enn),
        .clk_out(clk_out),
        .nDout_1(nDout_1),
        .nDout_reg_0(nDout_reg_0),
        .or1Q(or1Q_16));
  cell24option1_57 t3_b7
       (.CR_BOR_3_6(CR_BOR_3_6),
        .Q(p_0_in0_in),
        .\Qbor_reg[3] (\Qbor_reg[4]_0 ),
        .bt(bt_17),
        .bt_0(bt_18),
        .bt_reg_0(enn),
        .clk_out(clk_out),
        .nDout_1(nDout_1),
        .nDout_reg_0(nDout_reg),
        .or1Q(or1Q_16),
        .p_0_in13_in(p_0_in13_in),
        .\prep_reg[1] (t3_b7_n_0));
  cell20_58 t4_b0
       (.Q(p_0_in1_in),
        .audClock(audClock),
        .ch4Bits16(ch4Bits16),
        .clk_out(clk_out),
        .nDout_2(nDout_2),
        .nDout_reg_0(nDout_reg_6),
        .or1Q(or1Q_19),
        .or1Q_reg_0(enn),
        .or1Q_reg_1(Q[2]));
  cell24_59 t4_b1
       (.Q(p_0_in1_in),
        .bt(bt_20),
        .bt_reg_0(enn),
        .clk_out(clk_out),
        .nDout_2(nDout_2),
        .nDout_reg_0(nDout_reg_5),
        .or1Q(or1Q_19));
  cell24_60 t4_b2
       (.Q(p_0_in1_in),
        .bt(bt_21),
        .bt_0(bt_20),
        .bt_reg_0(enn),
        .clk_out(clk_out),
        .nDout_2(nDout_2),
        .nDout_reg_0(nDout_reg_4),
        .or1Q(or1Q_19));
  cell24_61 t4_b3
       (.CR_BOR_4_3(CR_BOR_4_3),
        .Q(p_0_in1_in),
        .bt(bt_22),
        .bt_0(bt_20),
        .bt_1(bt_21),
        .bt_reg_0(enn),
        .clk_out(clk_out),
        .nDout_2(nDout_2),
        .nDout_reg_0(nDout_reg_3),
        .or1Q(or1Q_19));
  cell20_62 t4_b4
       (.CR_BOR_4_3(CR_BOR_4_3),
        .Q(p_0_in1_in),
        .bt(bt_22),
        .bt_0(bt_21),
        .bt_1(bt_20),
        .clk_out(clk_out),
        .nDout_2(nDout_2),
        .nDout_reg_0(nDout_reg_2),
        .or1Q(or1Q_23),
        .or1Q_2(or1Q_19),
        .or1Q_reg_0(enn));
  cell24_63 t4_b5
       (.Q(p_0_in1_in),
        .bt(bt_24),
        .bt_reg_0(enn),
        .clk_out(clk_out),
        .nDout_2(nDout_2),
        .nDout_reg_0(nDout_reg_1),
        .or1Q(or1Q_23));
  cell24_64 t4_b6
       (.CR_BOR_4_6(CR_BOR_4_6),
        .Q(p_0_in1_in),
        .bt(bt_25),
        .bt_0(bt_24),
        .bt_reg_0(enn),
        .clk_out(clk_out),
        .nDout_2(nDout_2),
        .nDout_reg_0(nDout_reg_0),
        .or1Q(or1Q_23));
  cell24option1_65 t4_b7
       (.CR_BOR_4_6(CR_BOR_4_6),
        .Q(p_0_in1_in),
        .\Qbor_reg[4] (\Qbor_reg[4]_0 ),
        .bt(bt_24),
        .bt_0(bt_25),
        .bt_reg_0(enn),
        .clk_out(clk_out),
        .nDout_2(nDout_2),
        .nDout_reg_0(nDout_reg),
        .or1Q(or1Q_23),
        .p_0_in15_in(p_0_in15_in),
        .\prep_reg[1] (t4_b7_n_0));
  LUT3 #(
    .INIT(8'h07)) 
    toneCntrl_i_1
       (.I0(nor3),
        .I1(Q[0]),
        .I2(Q[1]),
        .O(nor3_reg));
endmodule

module poly_core
   (swDelay,
    feedback4,
    feedback5,
    Q,
    \lfsr4bit_reg[0]_0 ,
    \lfsr5bit_reg[0]_0 ,
    poly5bit,
    \lfsr9bit_reg[7]_0 ,
    enn,
    sel9bitPoly,
    clk_out,
    D,
    \lfsr9bit_reg[7]_1 ,
    \lfsr4bit_reg[2]_0 ,
    \lfsr5bit_reg[3]_0 );
  output swDelay;
  output feedback4;
  output feedback5;
  output [0:0]Q;
  output [0:0]\lfsr4bit_reg[0]_0 ;
  output [0:0]\lfsr5bit_reg[0]_0 ;
  output poly5bit;
  output [7:0]\lfsr9bit_reg[7]_0 ;
  input enn;
  input sel9bitPoly;
  input clk_out;
  input [0:0]D;
  input [1:0]\lfsr9bit_reg[7]_1 ;
  input [0:0]\lfsr4bit_reg[2]_0 ;
  input [0:0]\lfsr5bit_reg[3]_0 ;

  wire [0:0]D;
  wire [0:0]Q;
  wire clk_out;
  wire enn;
  wire feedback4;
  wire feedback40;
  wire feedback5;
  wire feedback50;
  wire feedback917;
  wire \lfsr17bit_reg_n_0_[0] ;
  wire \lfsr17bit_reg_n_0_[1] ;
  wire \lfsr17bit_reg_n_0_[2] ;
  wire \lfsr17bit_reg_n_0_[3] ;
  wire \lfsr17bit_reg_n_0_[4] ;
  wire \lfsr17bit_reg_n_0_[5] ;
  wire \lfsr17bit_reg_n_0_[6] ;
  wire \lfsr17bit_reg_n_0_[7] ;
  wire [0:0]\lfsr4bit_reg[0]_0 ;
  wire [0:0]\lfsr4bit_reg[2]_0 ;
  wire \lfsr4bit_reg_n_0_[2] ;
  wire [0:0]\lfsr5bit_reg[0]_0 ;
  wire [0:0]\lfsr5bit_reg[3]_0 ;
  wire \lfsr5bit_reg_n_0_[1] ;
  wire \lfsr5bit_reg_n_0_[3] ;
  wire [7:0]\lfsr9bit_reg[7]_0 ;
  wire [1:0]\lfsr9bit_reg[7]_1 ;
  wire \lfsr9bit_reg_n_0_[7] ;
  wire [2:0]nors;
  wire \norsDelayed_reg_n_0_[0] ;
  wire \norsDelayed_reg_n_0_[1] ;
  wire \norsDelayed_reg_n_0_[2] ;
  wire p_0_in;
  wire p_1_in;
  wire p_2_in;
  wire p_3_in;
  wire p_4_in;
  wire p_5_in;
  wire p_6_in;
  wire p_7_in;
  wire [7:7]p_8_out;
  wire poly5bit;
  wire sel9bitPoly;
  wire swDelay;

  LUT1 #(
    .INIT(2'h1)) 
    \DataAQ[0]_i_1 
       (.I0(Q),
        .O(\lfsr9bit_reg[7]_0 [0]));
  LUT1 #(
    .INIT(2'h1)) 
    \DataAQ[1]_i_1 
       (.I0(p_2_in),
        .O(\lfsr9bit_reg[7]_0 [1]));
  LUT1 #(
    .INIT(2'h1)) 
    \DataAQ[2]_i_1 
       (.I0(p_3_in),
        .O(\lfsr9bit_reg[7]_0 [2]));
  LUT1 #(
    .INIT(2'h1)) 
    \DataAQ[3]_i_1 
       (.I0(p_4_in),
        .O(\lfsr9bit_reg[7]_0 [3]));
  LUT1 #(
    .INIT(2'h1)) 
    \DataAQ[4]_i_1 
       (.I0(p_5_in),
        .O(\lfsr9bit_reg[7]_0 [4]));
  LUT1 #(
    .INIT(2'h1)) 
    \DataAQ[5]_i_1 
       (.I0(p_6_in),
        .O(\lfsr9bit_reg[7]_0 [5]));
  LUT1 #(
    .INIT(2'h1)) 
    \DataAQ[6]_i_1 
       (.I0(p_7_in),
        .O(\lfsr9bit_reg[7]_0 [6]));
  LUT1 #(
    .INIT(2'h1)) 
    \DataAQ[7]_i_1 
       (.I0(\lfsr9bit_reg_n_0_[7] ),
        .O(\lfsr9bit_reg[7]_0 [7]));
  LUT2 #(
    .INIT(4'h6)) 
    feedback4_i_1
       (.I0(p_0_in),
        .I1(\lfsr4bit_reg[0]_0 ),
        .O(feedback40));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    feedback4_reg
       (.C(clk_out),
        .CE(enn),
        .D(feedback40),
        .Q(feedback4),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h6)) 
    feedback5_i_1
       (.I0(p_1_in),
        .I1(\lfsr5bit_reg[0]_0 ),
        .O(feedback50));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    feedback5_reg
       (.C(clk_out),
        .CE(enn),
        .D(feedback50),
        .Q(feedback5),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h9)) 
    \lfsr17bit[7]_i_1 
       (.I0(Q),
        .I1(p_6_in),
        .O(feedback917));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr17bit_reg[0] 
       (.C(clk_out),
        .CE(enn),
        .D(\lfsr17bit_reg_n_0_[1] ),
        .Q(\lfsr17bit_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr17bit_reg[1] 
       (.C(clk_out),
        .CE(enn),
        .D(\lfsr17bit_reg_n_0_[2] ),
        .Q(\lfsr17bit_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr17bit_reg[2] 
       (.C(clk_out),
        .CE(enn),
        .D(\lfsr17bit_reg_n_0_[3] ),
        .Q(\lfsr17bit_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr17bit_reg[3] 
       (.C(clk_out),
        .CE(enn),
        .D(\lfsr17bit_reg_n_0_[4] ),
        .Q(\lfsr17bit_reg_n_0_[3] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr17bit_reg[4] 
       (.C(clk_out),
        .CE(enn),
        .D(\lfsr17bit_reg_n_0_[5] ),
        .Q(\lfsr17bit_reg_n_0_[4] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr17bit_reg[5] 
       (.C(clk_out),
        .CE(enn),
        .D(\lfsr17bit_reg_n_0_[6] ),
        .Q(\lfsr17bit_reg_n_0_[5] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr17bit_reg[6] 
       (.C(clk_out),
        .CE(enn),
        .D(\lfsr17bit_reg_n_0_[7] ),
        .Q(\lfsr17bit_reg_n_0_[6] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr17bit_reg[7] 
       (.C(clk_out),
        .CE(enn),
        .D(feedback917),
        .Q(\lfsr17bit_reg_n_0_[7] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr4bit_reg[0] 
       (.C(clk_out),
        .CE(enn),
        .D(p_0_in),
        .Q(\lfsr4bit_reg[0]_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr4bit_reg[1] 
       (.C(clk_out),
        .CE(enn),
        .D(\lfsr4bit_reg_n_0_[2] ),
        .Q(p_0_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr4bit_reg[2] 
       (.C(clk_out),
        .CE(enn),
        .D(\lfsr4bit_reg[2]_0 ),
        .Q(\lfsr4bit_reg_n_0_[2] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr5bit_reg[0] 
       (.C(clk_out),
        .CE(enn),
        .D(\lfsr5bit_reg_n_0_[1] ),
        .Q(\lfsr5bit_reg[0]_0 ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr5bit_reg[1] 
       (.C(clk_out),
        .CE(enn),
        .D(p_1_in),
        .Q(\lfsr5bit_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr5bit_reg[2] 
       (.C(clk_out),
        .CE(enn),
        .D(\lfsr5bit_reg_n_0_[3] ),
        .Q(p_1_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr5bit_reg[3] 
       (.C(clk_out),
        .CE(enn),
        .D(\lfsr5bit_reg[3]_0 ),
        .Q(\lfsr5bit_reg_n_0_[3] ),
        .R(1'b0));
  LUT5 #(
    .INIT(32'h00000054)) 
    \lfsr9bit[7]_i_1 
       (.I0(\norsDelayed_reg_n_0_[2] ),
        .I1(\lfsr9bit_reg[7]_1 [0]),
        .I2(\lfsr9bit_reg[7]_1 [1]),
        .I3(\norsDelayed_reg_n_0_[0] ),
        .I4(\norsDelayed_reg_n_0_[1] ),
        .O(p_8_out));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr9bit_reg[0] 
       (.C(clk_out),
        .CE(enn),
        .D(p_2_in),
        .Q(Q),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr9bit_reg[1] 
       (.C(clk_out),
        .CE(enn),
        .D(p_3_in),
        .Q(p_2_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr9bit_reg[2] 
       (.C(clk_out),
        .CE(enn),
        .D(p_4_in),
        .Q(p_3_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr9bit_reg[3] 
       (.C(clk_out),
        .CE(enn),
        .D(p_5_in),
        .Q(p_4_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr9bit_reg[4] 
       (.C(clk_out),
        .CE(enn),
        .D(p_6_in),
        .Q(p_5_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr9bit_reg[5] 
       (.C(clk_out),
        .CE(enn),
        .D(p_7_in),
        .Q(p_6_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr9bit_reg[6] 
       (.C(clk_out),
        .CE(enn),
        .D(\lfsr9bit_reg_n_0_[7] ),
        .Q(p_7_in),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \lfsr9bit_reg[7] 
       (.C(clk_out),
        .CE(enn),
        .D(p_8_out),
        .Q(\lfsr9bit_reg_n_0_[7] ),
        .R(1'b0));
  LUT2 #(
    .INIT(4'h1)) 
    \norsDelayed[0]_i_1 
       (.I0(\lfsr17bit_reg_n_0_[0] ),
        .I1(sel9bitPoly),
        .O(nors[0]));
  LUT3 #(
    .INIT(8'h28)) 
    \norsDelayed[2]_i_1 
       (.I0(sel9bitPoly),
        .I1(p_6_in),
        .I2(Q),
        .O(nors[2]));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \norsDelayed_reg[0] 
       (.C(clk_out),
        .CE(enn),
        .D(nors[0]),
        .Q(\norsDelayed_reg_n_0_[0] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \norsDelayed_reg[1] 
       (.C(clk_out),
        .CE(enn),
        .D(D),
        .Q(\norsDelayed_reg_n_0_[1] ),
        .R(1'b0));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    \norsDelayed_reg[2] 
       (.C(clk_out),
        .CE(enn),
        .D(nors[2]),
        .Q(\norsDelayed_reg_n_0_[2] ),
        .R(1'b0));
  LUT1 #(
    .INIT(2'h1)) 
    poly5Out_i_1
       (.I0(\lfsr5bit_reg[0]_0 ),
        .O(poly5bit));
  FDRE #(
    .INIT(1'b0),
    .IS_C_INVERTED(1'b1)) 
    swDelay_reg
       (.C(clk_out),
        .CE(enn),
        .D(sel9bitPoly),
        .Q(swDelay),
        .R(1'b0));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
