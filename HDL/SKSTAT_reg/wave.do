onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /tb_skstat/clk
add wave -noupdate -divider {Non-latching Status Bits}
add wave -noupdate -label kShift /tb_skstat/kShift
add wave -noupdate -label keyDown /tb_skstat/keyDown
add wave -noupdate -label sdiBusy /tb_skstat/sdiBusy
add wave -noupdate -label siDelay /tb_skstat/siDelay
add wave -noupdate -divider {Latching Status Bits}
add wave -noupdate -label sdiOvrun /tb_skstat/sdiOvrun
add wave -noupdate -label keyOvrun /tb_skstat/keyOvrun
add wave -noupdate -label setFramer /tb_skstat/setFramer
add wave -noupdate -divider {Latch Reset}
add wave -noupdate -label {SKSTAT Reset} /tb_skstat/addrAw
add wave -noupdate -divider Output
add wave -noupdate -label {Data Out} /tb_skstat/Dout
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3559822 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 175
configure wave -valuecolwidth 38
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
WaveRestoreZoom {0 ps} {14722522 ps}
