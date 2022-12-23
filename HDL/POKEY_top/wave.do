onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {External Signals}
add wave -noupdate -label phi2 /tb_pokey_top/phi2
add wave -noupdate -label cs /tb_pokey_top/cs
add wave -noupdate -label rw /tb_pokey_top/rw
add wave -noupdate -label d -radix unsigned /tb_pokey_top/d
add wave -noupdate -label a /tb_pokey_top/a
add wave -noupdate -divider {Clock Generator}
add wave -noupdate -label khz64 /tb_pokey_top/pokey_top_0/clock_gen_core_0/khz64
add wave -noupdate -label hsync /tb_pokey_top/pokey_top_0/clock_gen_core_0/hsync
add wave -noupdate -label audClock /tb_pokey_top/pokey_top_0/clock_gen_core_0/audClock
add wave -noupdate -label sel15khz /tb_pokey_top/pokey_top_0/clock_gen_core_0/sel15Khz
add wave -noupdate -divider SKCTLS
add wave -noupdate -label clk /tb_pokey_top/pokey_top_0/SKCTLS_reg_0/clk
add wave -noupdate -label wren /tb_pokey_top/pokey_top_0/SKCTLS_reg_0/wren
add wave -noupdate -label SKCTLS /tb_pokey_top/pokey_top_0/SKCTLS_reg_0/Skctls
add wave -noupdate -label init /tb_pokey_top/pokey_top_0/SKCTLS_reg_0/Init
add wave -noupdate -divider {Poly Core}
add wave -noupdate -label poly4bit /tb_pokey_top/pokey_top_0/poly_core_0/poly4bit
add wave -noupdate -label poly5bit /tb_pokey_top/pokey_top_0/poly_core_0/poly5bit
add wave -noupdate -label poly917bit /tb_pokey_top/pokey_top_0/poly_core_0/poly917bit
add wave -noupdate -label rndNum -radix unsigned /tb_pokey_top/pokey_top_0/poly_core_0/rndNum
add wave -noupdate -divider Misc
add wave -noupdate -label AddrAData /tb_pokey_top/pokey_top_0/data_address_core_0/AddrAData
add wave -noupdate -label DataMUXOut /tb_pokey_top/pokey_top_0/data_address_core_0/DataMUXOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {281287457 ps} 0}
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
WaveRestoreZoom {278060476 ps} {286809488 ps}
