onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -color Cyan -label clk /tb_clock_gen_core/clk
add wave -noupdate -color Cyan -label init /tb_clock_gen_core/init
add wave -noupdate -color Cyan -label sel15Khz /tb_clock_gen_core/sel15Khz
add wave -noupdate -color Cyan -label audClock /tb_clock_gen_core/audClock
add wave -noupdate -color Cyan -label keybClk /tb_clock_gen_core/keybClk
add wave -noupdate -divider 15k
add wave -noupdate -label lfsr15k /tb_clock_gen_core/clock_gen_core_0/lfsr15k
add wave -noupdate -label nor15k /tb_clock_gen_core/clock_gen_core_0/nor15k
add wave -noupdate -label feedback15k /tb_clock_gen_core/clock_gen_core_0/feedback15k
add wave -noupdate -label d15k /tb_clock_gen_core/clock_gen_core_0/d15k
add wave -noupdate -divider 64k
add wave -noupdate -label lfsr64k /tb_clock_gen_core/clock_gen_core_0/lfsr64k
add wave -noupdate -label lfsr64kIn /tb_clock_gen_core/clock_gen_core_0/lfsr64kIn
add wave -noupdate -label nor64k /tb_clock_gen_core/clock_gen_core_0/nor64k
add wave -noupdate -label feedback64k /tb_clock_gen_core/clock_gen_core_0/feedback64k
add wave -noupdate -label d64k /tb_clock_gen_core/clock_gen_core_0/d64k
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {108396719 ps} 0} {{Cursor 2} {22615143 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 127
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
WaveRestoreZoom {0 ps} {499482724 ps}
