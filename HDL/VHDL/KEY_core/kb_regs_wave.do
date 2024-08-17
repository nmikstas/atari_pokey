onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /tb_kb_regs/clk
add wave -noupdate -label Init /tb_kb_regs/init
add wave -noupdate -label keybClk /tb_kb_regs/keybClk
add wave -noupdate -label qkeybClk /tb_kb_regs/qkeybClk
add wave -noupdate -divider kb_regs
add wave -noupdate -label nkbScanDis /tb_kb_regs/nkbScanDis
add wave -noupdate -label kbCmpLd /tb_kb_regs/kbCmpLd
add wave -noupdate -label kbCodeLd /tb_kb_regs/kbCodeLd
add wave -noupdate -label match /tb_kb_regs/match
add wave -noupdate -label oQ -radix unsigned /tb_kb_regs/oQ
add wave -noupdate -label nQ -radix unsigned /tb_kb_regs/nQ
add wave -noupdate -label shiftIn /tb_kb_regs/shiftIn
add wave -noupdate -label controlIn /tb_kb_regs/controlIn
add wave -noupdate -divider {Read Register Path}
add wave -noupdate -label Q -radix unsigned /tb_kb_regs/kb_regs_0/Q
add wave -noupdate -label {Compare Value} -radix unsigned /tb_kb_regs/kb_regs_0/QD
add wave -noupdate -label {Read Register} -radix unsigned -childformat {{/tb_kb_regs/D(7) -radix unsigned} {/tb_kb_regs/D(6) -radix unsigned} {/tb_kb_regs/D(5) -radix unsigned} {/tb_kb_regs/D(4) -radix unsigned} {/tb_kb_regs/D(3) -radix unsigned} {/tb_kb_regs/D(2) -radix unsigned} {/tb_kb_regs/D(1) -radix unsigned} {/tb_kb_regs/D(0) -radix unsigned}} -subitemconfig {/tb_kb_regs/D(7) {-height 15 -radix unsigned} /tb_kb_regs/D(6) {-height 15 -radix unsigned} /tb_kb_regs/D(5) {-height 15 -radix unsigned} /tb_kb_regs/D(4) {-height 15 -radix unsigned} /tb_kb_regs/D(3) {-height 15 -radix unsigned} /tb_kb_regs/D(2) {-height 15 -radix unsigned} /tb_kb_regs/D(1) {-height 15 -radix unsigned} /tb_kb_regs/D(0) {-height 15 -radix unsigned}} /tb_kb_regs/D
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1022052907 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 129
configure wave -valuecolwidth 68
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
WaveRestoreZoom {0 ps} {5978045308 ps}
