onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Clocks
add wave -noupdate -label clk /tb_ser_core/clk
add wave -noupdate -label BCLK_in /tb_ser_core/BCLK_in
add wave -noupdate -label BCLK_out /tb_ser_core/BCLK_out
add wave -noupdate -label sdiClock /tb_ser_core/ser_clock_gen_0/sdiClock
add wave -noupdate -divider {Control Signals}
add wave -noupdate -label resyncSerClock /tb_ser_core/resyncSerClk
add wave -noupdate -label SKCTLS /tb_ser_core/SKCTLS
add wave -noupdate -label init /tb_ser_core/init
add wave -noupdate -divider {Serial In Signals}
add wave -noupdate -label SID /tb_ser_core/SID
add wave -noupdate -label sdiStopBit /tb_ser_core/serin_0/sdiStopBit
add wave -noupdate -label sdinStartBit /tb_ser_core/serin_0/sdinStartBit
add wave -noupdate -label serialByte /tb_ser_core/serialByte
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {79564439 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 127
configure wave -valuecolwidth 40
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
WaveRestoreZoom {0 ps} {6300 us}
