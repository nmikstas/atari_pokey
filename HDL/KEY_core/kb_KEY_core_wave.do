onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /tb_key_core/clk
add wave -noupdate -label keybClk /tb_key_core/keybClk
add wave -noupdate -label init /tb_key_core/init
add wave -noupdate -divider {State Machine}
add wave -noupdate -label {This State} /tb_key_core/KEY_core_0/kb_state_0/keyQ
add wave -noupdate -divider {KEY Core}
add wave -noupdate -label K -radix unsigned -childformat {{/tb_key_core/K(5) -radix unsigned} {/tb_key_core/K(4) -radix unsigned} {/tb_key_core/K(3) -radix unsigned} {/tb_key_core/K(2) -radix unsigned} {/tb_key_core/K(1) -radix unsigned} {/tb_key_core/K(0) -radix unsigned}} -subitemconfig {/tb_key_core/K(5) {-height 15 -radix unsigned} /tb_key_core/K(4) {-height 15 -radix unsigned} /tb_key_core/K(3) {-height 15 -radix unsigned} /tb_key_core/K(2) {-height 15 -radix unsigned} /tb_key_core/K(1) {-height 15 -radix unsigned} /tb_key_core/K(0) {-height 15 -radix unsigned}} /tb_key_core/K
add wave -noupdate -label KR1 /tb_key_core/KR1
add wave -noupdate -label KR2 /tb_key_core/KR2
add wave -noupdate -label setKey /tb_key_core/setKey
add wave -noupdate -label keyDown /tb_key_core/keyDown
add wave -noupdate -divider {Brk, Ctrl, Shft}
add wave -noupdate -label controlOut /tb_key_core/KEY_core_0/kb_code_0/controlOut
add wave -noupdate -label kShift /tb_key_core/kShift
add wave -noupdate -label setBreak /tb_key_core/setBreak
add wave -noupdate -divider {Data Reg Path}
add wave -noupdate -label match /tb_key_core/KEY_core_0/kb_regs_0/match
add wave -noupdate -label QD -radix unsigned -childformat {{/tb_key_core/KEY_core_0/kb_regs_0/QD(5) -radix unsigned} {/tb_key_core/KEY_core_0/kb_regs_0/QD(4) -radix unsigned} {/tb_key_core/KEY_core_0/kb_regs_0/QD(3) -radix unsigned} {/tb_key_core/KEY_core_0/kb_regs_0/QD(2) -radix unsigned} {/tb_key_core/KEY_core_0/kb_regs_0/QD(1) -radix unsigned} {/tb_key_core/KEY_core_0/kb_regs_0/QD(0) -radix unsigned}} -subitemconfig {/tb_key_core/KEY_core_0/kb_regs_0/QD(5) {-height 15 -radix unsigned} /tb_key_core/KEY_core_0/kb_regs_0/QD(4) {-height 15 -radix unsigned} /tb_key_core/KEY_core_0/kb_regs_0/QD(3) {-height 15 -radix unsigned} /tb_key_core/KEY_core_0/kb_regs_0/QD(2) {-height 15 -radix unsigned} /tb_key_core/KEY_core_0/kb_regs_0/QD(1) {-height 15 -radix unsigned} /tb_key_core/KEY_core_0/kb_regs_0/QD(0) {-height 15 -radix unsigned}} /tb_key_core/KEY_core_0/kb_regs_0/QD
add wave -noupdate -label D -radix unsigned -childformat {{/tb_key_core/D(7) -radix unsigned} {/tb_key_core/D(6) -radix unsigned} {/tb_key_core/D(5) -radix unsigned} {/tb_key_core/D(4) -radix unsigned} {/tb_key_core/D(3) -radix unsigned} {/tb_key_core/D(2) -radix unsigned} {/tb_key_core/D(1) -radix unsigned} {/tb_key_core/D(0) -radix unsigned}} -subitemconfig {/tb_key_core/D(7) {-height 15 -radix unsigned} /tb_key_core/D(6) {-height 15 -radix unsigned} /tb_key_core/D(5) {-height 15 -radix unsigned} /tb_key_core/D(4) {-height 15 -radix unsigned} /tb_key_core/D(3) {-height 15 -radix unsigned} /tb_key_core/D(2) {-height 15 -radix unsigned} /tb_key_core/D(1) {-height 15 -radix unsigned} /tb_key_core/D(0) {-height 15 -radix unsigned}} /tb_key_core/D
TreeUpdate [SetDefaultTree]
WaveRestoreCursors
quietly wave cursor active 0
configure wave -namecolwidth 116
configure wave -valuecolwidth 46
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
WaveRestoreZoom {0 ps} {49616742155 ps}
