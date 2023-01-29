onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /tb_kb_state/clk
add wave -noupdate -label keybClk /tb_kb_state/keybClk
add wave -noupdate -label Init /tb_kb_state/init
add wave -noupdate -divider kb_state
add wave -noupdate -label KR1 /tb_kb_state/KR1
add wave -noupdate -label match /tb_kb_state/match
add wave -noupdate -label setKey /tb_kb_state/setKey
add wave -noupdate -label keyDown /tb_kb_state/keyDown
add wave -noupdate -label debComp /tb_kb_state/kb_state_0/debComp
add wave -noupdate -divider States
add wave -noupdate -color Cyan -label {This State} /tb_kb_state/kb_state_0/keyQ
add wave -noupdate -color Cyan -label {Next State} /tb_kb_state/kb_state_0/keyD
add wave -noupdate -divider {Reg Load Signals}
add wave -noupdate -label {Load Compare Reg} /tb_kb_state/kbCmpLd
add wave -noupdate -label {Load Data Reg} /tb_kb_state/kbCodeLd
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {829310766 ps} 0}
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
WaveRestoreZoom {0 ps} {347769731 ps}
