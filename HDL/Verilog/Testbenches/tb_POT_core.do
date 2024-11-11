onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {Clocks and enables}
add wave -noupdate -label clk /tb_POT_core/clk
add wave -noupdate -label clk179 /tb_POT_core/clk179
add wave -noupdate -label enp /tb_POT_core/enp
add wave -noupdate -label enn /tb_POT_core/enn
add wave -noupdate -label keybClk /tb_POT_core/keybClk
add wave -noupdate -divider {Config Signals}
add wave -noupdate -label sel15Khz /tb_POT_core/sel15Khz
add wave -noupdate -label fastScan /tb_POT_core/fastScan
add wave -noupdate -label init /tb_POT_core/init
add wave -noupdate -divider <NULL>
add wave -noupdate /tb_POT_core/POTGO
add wave -noupdate /tb_POT_core/P
add wave -noupdate /tb_POT_core/dump
add wave -noupdate -radix unsigned /tb_POT_core/POT0
add wave -noupdate -radix unsigned /tb_POT_core/POT1
add wave -noupdate -radix unsigned /tb_POT_core/POT2
add wave -noupdate -radix unsigned /tb_POT_core/POT3
add wave -noupdate -radix unsigned /tb_POT_core/POT4
add wave -noupdate -radix unsigned /tb_POT_core/POT5
add wave -noupdate -radix unsigned /tb_POT_core/POT6
add wave -noupdate -radix unsigned /tb_POT_core/POT7
add wave -noupdate /tb_POT_core/ALLPOT
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {502320000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 178
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
WaveRestoreZoom {0 ps} {16250346 ns}
