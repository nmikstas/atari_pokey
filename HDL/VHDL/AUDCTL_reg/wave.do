onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /tb_audctl_reg/clk
add wave -noupdate -label wren /tb_audctl_reg/wren
add wave -noupdate -label d /tb_audctl_reg/d
add wave -noupdate -divider {Combined Outputs}
add wave -noupdate -label q /tb_audctl_reg/q
add wave -noupdate -divider Outputs
add wave -noupdate -label sel15Khz /tb_audctl_reg/sel15Khz
add wave -noupdate -label disHiFltr2 /tb_audctl_reg/disHiFltr2
add wave -noupdate -label disHiFltr1 /tb_audctl_reg/disHiFltr1
add wave -noupdate -label ch4Bits16 /tb_audctl_reg/ch4Bits16
add wave -noupdate -label ch2Bits16 /tb_audctl_reg/ch2Bits16
add wave -noupdate -label enFastClk3 /tb_audctl_reg/enFastClk3
add wave -noupdate -label enFastClk1 /tb_audctl_reg/enFastClk1
add wave -noupdate -label sel9bitPoly /tb_audctl_reg/sel9bitPoly
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
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
WaveRestoreZoom {0 ps} {14207403 ps}
