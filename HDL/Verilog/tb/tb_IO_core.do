onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Clocks
add wave -noupdate -label clk /tb_SER_core/clk
add wave -noupdate -label clk179 /tb_SER_core/clk179
add wave -noupdate -label enp /tb_SER_core/enp
add wave -noupdate -label enn /tb_SER_core/enn
add wave -noupdate -label BCLK_in /tb_SER_core/BCLK_in
add wave -noupdate -label BCLK_out /tb_SER_core/BCLK_out
add wave -noupdate -label sdiClk /tb_SER_core/sc/sdiClk
add wave -noupdate -label Timer4 {/tb_SER_core/Timer[4]}
add wave -noupdate -label resyncSerClk /tb_SER_core/resyncSerClk
add wave -noupdate -divider {Config Signals}
add wave -noupdate -label SKCTLS /tb_SER_core/SKCTLS
add wave -noupdate -label init /tb_SER_core/init
add wave -noupdate -divider {Serial In Signals}
add wave -noupdate -label SID /tb_SER_core/SID
add wave -noupdate -label serialByte -radix binary /tb_SER_core/Dr
add wave -noupdate -divider {State Machine Signals}
add wave -noupdate -label setFramerr /tb_SER_core/setFramerr
add wave -noupdate -label setSdiCompl /tb_SER_core/setSdiCompl
add wave -noupdate -label sdiBusy /tb_SER_core/sdiBusy
add wave -noupdate -label ssiSet /tb_SER_core/sc/ssiSet
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {183245220 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 168
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
WaveRestoreZoom {0 ps} {1197798 ns}
