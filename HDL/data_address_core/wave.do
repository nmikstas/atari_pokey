onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /tb_data_address_core/clk
add wave -noupdate -label RW /tb_data_address_core/RW
add wave -noupdate -label CS0 /tb_data_address_core/CS0
add wave -noupdate -label CS1 /tb_data_address_core/CS1
add wave -noupdate -divider {Internal enables}
add wave -noupdate -label DoutDis /tb_data_address_core/data_address_core_0/DoutDis
add wave -noupdate -label CsWr /tb_data_address_core/data_address_core_0/CsWr
add wave -noupdate -divider I/O
add wave -noupdate -label D /tb_data_address_core/D
add wave -noupdate -label A /tb_data_address_core/A
add wave -noupdate -label DW /tb_data_address_core/DW
add wave -noupdate -divider {Write Enables}
add wave -noupdate -color {Sky Blue} -label Addr0w /tb_data_address_core/Addr0w
add wave -noupdate -color {Sky Blue} -label Addr1w /tb_data_address_core/Addr1w
add wave -noupdate -color {Sky Blue} -label Addr2w /tb_data_address_core/Addr2w
add wave -noupdate -color {Sky Blue} -label Addr3w /tb_data_address_core/Addr3w
add wave -noupdate -color {Sky Blue} -label Addr4w /tb_data_address_core/Addr4w
add wave -noupdate -color {Sky Blue} -label Addr5w /tb_data_address_core/Addr5w
add wave -noupdate -color {Sky Blue} -label Addr6w /tb_data_address_core/Addr6w
add wave -noupdate -color {Sky Blue} -label Addr7w /tb_data_address_core/Addr7w
add wave -noupdate -color {Sky Blue} -label Addr8w /tb_data_address_core/Addr8w
add wave -noupdate -color {Sky Blue} -label Addr9w /tb_data_address_core/Addr9w
add wave -noupdate -color {Sky Blue} -label AddrAw /tb_data_address_core/AddrAw
add wave -noupdate -color {Sky Blue} -label AddrBw /tb_data_address_core/AddrBw
add wave -noupdate -color {Sky Blue} -label AddrDw /tb_data_address_core/AddrDw
add wave -noupdate -color {Sky Blue} -label AddrEw /tb_data_address_core/AddrEw
add wave -noupdate -color {Sky Blue} -label AddrFw /tb_data_address_core/AddrFw
add wave -noupdate -divider {Constant Read Data}
add wave -noupdate -color {Blue Violet} -label Addr0Data /tb_data_address_core/Addr0Data
add wave -noupdate -color {Blue Violet} -label Addr1Data /tb_data_address_core/Addr1Data
add wave -noupdate -color {Blue Violet} -label Addr2Data /tb_data_address_core/Addr2Data
add wave -noupdate -color {Blue Violet} -label Addr3Data /tb_data_address_core/Addr3Data
add wave -noupdate -color {Blue Violet} -label Addr4Data /tb_data_address_core/Addr4Data
add wave -noupdate -color {Blue Violet} -label Addr5Data /tb_data_address_core/Addr5Data
add wave -noupdate -color {Blue Violet} -label Addr6Data /tb_data_address_core/Addr6Data
add wave -noupdate -color {Blue Violet} -label Addr7Data /tb_data_address_core/Addr7Data
add wave -noupdate -color {Blue Violet} -label Addr8Data /tb_data_address_core/Addr8Data
add wave -noupdate -color {Blue Violet} -label Addr9Data /tb_data_address_core/Addr9Data
add wave -noupdate -color {Blue Violet} -label AddrAData /tb_data_address_core/AddrAData
add wave -noupdate -color {Blue Violet} -label AddrDData /tb_data_address_core/AddrDData
add wave -noupdate -color {Blue Violet} -label AddrEData /tb_data_address_core/AddrEData
add wave -noupdate -color {Blue Violet} -label AddrFData /tb_data_address_core/AddrFData
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5220597 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {4577666 ps} {36929938 ps}
