onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /tb_IRQ_core/clk
add wave -noupdate -label clk179 /tb_IRQ_core/clk179
add wave -noupdate -label enp /tb_IRQ_core/enp
add wave -noupdate -label enn /tb_IRQ_core/enn
add wave -noupdate -label IRQEN /tb_IRQ_core/IRQEN
add wave -noupdate -label Dw /tb_IRQ_core/Dw
add wave -noupdate -divider {IRQ Input Signals}
add wave -noupdate -label setBreak /tb_IRQ_core/setBreak
add wave -noupdate -label setKey /tb_IRQ_core/setKey
add wave -noupdate -label setSdiCompl /tb_IRQ_core/setSdiCompl
add wave -noupdate -label setSdoCompl /tb_IRQ_core/setSdoCompl
add wave -noupdate -label sdoFinish /tb_IRQ_core/sdoFinish
add wave -noupdate -label Timer4 /tb_IRQ_core/Timer4
add wave -noupdate -label Timer2 /tb_IRQ_core/Timer2
add wave -noupdate -label Timer1 /tb_IRQ_core/Timer1
add wave -noupdate -divider Outputs
add wave -noupdate -label IRQ /tb_IRQ_core/IRQ
add wave -noupdate -label Dr /tb_IRQ_core/Dr
add wave -noupdate -label keyOvrun /tb_IRQ_core/keyOvrun
add wave -noupdate -label sdiOvrun /tb_IRQ_core/sdiOvrun
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
WaveRestoreZoom {0 ps} {1 ns}
