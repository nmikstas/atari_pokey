onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Inputs
add wave -noupdate -label clk /tb_kb_break/clk
add wave -noupdate -label enBreak /tb_kb_break/enBreak
add wave -noupdate -label KR2 /tb_kb_break/KR2
add wave -noupdate -divider Output
add wave -noupdate -label setBreak /tb_kb_break/setBreak
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {20839094 ps} 0}
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
WaveRestoreZoom {0 ps} {19916505 ps}
