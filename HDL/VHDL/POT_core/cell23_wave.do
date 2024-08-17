onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /tb_cell23/clk
add wave -noupdate -label Preset /tb_cell23/P
add wave -noupdate -label Enable /tb_cell23/en
add wave -noupdate -label {Counter Value} -radix unsigned /tb_cell23/nQ
add wave -noupdate -label {Count Done} /tb_cell23/count
add wave -noupdate -label Carry/Borrow /tb_cell23/bor
TreeUpdate [SetDefaultTree]
WaveRestoreCursors
quietly wave cursor active 0
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
WaveRestoreZoom {139671677 ps} {149863757 ps}
