onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Inputs
add wave -noupdate -color Yellow -label debComp /tb_keyboard_pla/inBus(3)
add wave -noupdate -color Yellow -label keyQ1 /tb_keyboard_pla/inBus(2)
add wave -noupdate -color Yellow -label keyQ0 /tb_keyboard_pla/inBus(1)
add wave -noupdate -color Yellow -label iKR1 /tb_keyboard_pla/inBus(0)
add wave -noupdate -divider Outputs
add wave -noupdate -label nLdKbus /tb_keyboard_pla/o4
add wave -noupdate -label nLdComp /tb_keyboard_pla/o3
add wave -noupdate -label keyD1 /tb_keyboard_pla/o2
add wave -noupdate -label keyD0 /tb_keyboard_pla/o1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 2} {5551862 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 189
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
WaveRestoreZoom {0 ps} {16174212 ps}
