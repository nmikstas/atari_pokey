set_property SRC_FILE_INFO {cfile:d:/work/Arcade+Projects/atari_pokey/FPGA/Prototype/Prototype/Prototype.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc rfile:../../../Prototype.gen/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc id:1 order:EARLY scoped_inst:c0/inst} [current_design]
set_property SRC_FILE_INFO {cfile:D:/work/Arcade+Projects/atari_pokey/FPGA/Prototype/Prototype/Prototype.srcs/constrs_1/new/contraint.xdc rfile:../../../Prototype.srcs/constrs_1/new/contraint.xdc id:2} [current_design]
current_instance c0/inst
set_property src_info {type:SCOPED_XDC file:1 line:57 export:INPUT save:INPUT read:READ} [current_design]
set_input_jitter [get_clocks -of_objects [get_ports clk_in1]] 0.83333
current_instance
set_property src_info {type:XDC file:2 line:7 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN L17   IOSTANDARD LVCMOS33 } [get_ports { clk }]; #IO_L12P_T1_MRCC_14 Sch=gclk
set_property src_info {type:XDC file:2 line:52 export:INPUT save:INPUT read:READ} [current_design]
set_property -dict { PACKAGE_PIN U8   IOSTANDARD LVCMOS33 } [get_ports { clk179 }]; #IO_L12P_T1_MRCC_14 Sch=gclk
