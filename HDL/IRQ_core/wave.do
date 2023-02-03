onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /tb_irq_core/clk
add wave -noupdate -label IRQEN /tb_irq_core/IRQEN
add wave -noupdate -label Dw /tb_irq_core/Dw
add wave -noupdate -divider {Input IRQ Signals}
add wave -noupdate -label setBreak /tb_irq_core/setBreak
add wave -noupdate -label setKey /tb_irq_core/setKey
add wave -noupdate -label setSdiCompl /tb_irq_core/setSdiCompl
add wave -noupdate -label setSdoCompl /tb_irq_core/setSdoCompl
add wave -noupdate -label sdoFinish /tb_irq_core/sdoFinish
add wave -noupdate -label Timer4 /tb_irq_core/Timer4
add wave -noupdate -label Timer2 /tb_irq_core/Timer2
add wave -noupdate -label Timer1 /tb_irq_core/Timer1
add wave -noupdate -divider Outputs
add wave -noupdate -label IRQ /tb_irq_core/IRQ
add wave -noupdate -label Dr /tb_irq_core/Dr
add wave -noupdate -label keyOvrun /tb_irq_core/keyOvrun
add wave -noupdate -label sdiOvrun /tb_irq_core/sdiOvrun
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {59899239 ps} 0}
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
WaveRestoreZoom {0 ps} {64455991 ps}
