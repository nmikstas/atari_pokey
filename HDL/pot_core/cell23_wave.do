onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_cell23/clk
add wave -noupdate /tb_cell23/P
add wave -noupdate /tb_cell23/en
add wave -noupdate -radix unsigned /tb_cell23/Q
add wave -noupdate -radix unsigned /tb_cell23/nQ
add wave -noupdate /tb_cell23/bor
add wave -noupdate /tb_cell23/count
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {135729893 ps} 0}
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
WaveRestoreZoom {130711607 ps} {146623247 ps}
