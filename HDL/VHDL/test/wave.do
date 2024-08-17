onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Clocks
add wave -noupdate -label {System Clock} /tb_test/clk
add wave -noupdate -label {Serial Clock} /tb_test/slowClk
add wave -noupdate -divider {Shift Enable}
add wave -noupdate -label nShiftEnable /tb_test/sdonShiftEn
add wave -noupdate -divider {Control Signals}
add wave -noupdate -label Load /tb_test/ssoLoad
add wave -noupdate -label Shift /tb_test/ssoShift
add wave -noupdate -label Transfer /tb_test/ssoTransfer
add wave -noupdate -label Rec /tb_test/ssoRec
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1101497 ps} 0}
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
WaveRestoreZoom {0 ps} {29273126 ps}
