onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /tb_ser_clock_gen/clk
add wave -noupdate -label BCLK_in /tb_ser_clock_gen/BCLK_in
add wave -noupdate -divider {Timer 2}
add wave -noupdate -color Khaki -label Timer2 /tb_ser_clock_gen/ser_clock_gen_0/Timer2
add wave -noupdate -color Khaki -label ToggledTimer2 /tb_ser_clock_gen/ser_clock_gen_0/TogldTmr2
add wave -noupdate -divider {Timer 4}
add wave -noupdate -color Khaki -label Timer4 /tb_ser_clock_gen/ser_clock_gen_0/Timer4
add wave -noupdate -color Khaki -label ToggledTimer4 /tb_ser_clock_gen/ser_clock_gen_0/TogldTmr4
add wave -noupdate -divider {Clock Outputs}
add wave -noupdate -color Cyan -label sdiClock /tb_ser_clock_gen/sdiClock
add wave -noupdate -color Cyan -label sdoClock /tb_ser_clock_gen/sdoClock
add wave -noupdate -color Cyan -label OCLK /tb_ser_clock_gen/OCLK
add wave -noupdate -color Cyan -label BCLK_out /tb_ser_clock_gen/ser_clock_gen_0/BCLK_out
add wave -noupdate -divider {Control Signals}
add wave -noupdate -color Red -label {SKCTLS[6..4]} /tb_ser_clock_gen/ser_clock_gen_0/SKCTLS
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9996978781 ps} 0}
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
WaveRestoreZoom {9688281243 ps} {9852343747 ps}
