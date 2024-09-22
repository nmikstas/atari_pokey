onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Clocks
add wave -noupdate -label clk /tb_SER_core/clk
add wave -noupdate -label clk179 /tb_SER_core/clk179
add wave -noupdate -label enp /tb_SER_core/enp
add wave -noupdate -label enn /tb_SER_core/enn
add wave -noupdate -label BCLK_in /tb_SER_core/BCLK_in
add wave -noupdate -label BCLK_out /tb_SER_core/BCLK_out
add wave -noupdate -label Timer4 {/tb_SER_core/Timer[4]}
add wave -noupdate -label Timer2 /tb_SER_core/sc/Timer2
add wave -noupdate -label Timer1 /tb_SER_core/sc/Timer1
add wave -noupdate -divider {Config Signals}
add wave -noupdate -label SKCTLS /tb_SER_core/SKCTLS
add wave -noupdate -label init /tb_SER_core/init
add wave -noupdate -divider {Control Outputs}
add wave -noupdate -label resync2Tones /tb_SER_core/sc/resync2Tones
add wave -noupdate -label setSdoCompl /tb_SER_core/sc/setSdoCompl
add wave -noupdate -label sdoDloaded /tb_SER_core/sc/sdoDloaded
add wave -noupdate -label ssoEmpty /tb_SER_core/sc/ssoEmpty
add wave -noupdate -label sdoFinish /tb_SER_core/sc/sdoFinish
add wave -noupdate -divider {Output Timing}
add wave -noupdate -label sdoClock /tb_SER_core/sc/sdoClock
add wave -noupdate -label OCLK /tb_SER_core/OCLK
add wave -noupdate -label SOD /tb_SER_core/SOD
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {36674980 ps} 0}
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
WaveRestoreZoom {2438560 ps} {75841440 ps}
