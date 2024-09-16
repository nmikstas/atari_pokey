onerror {resume}
quietly virtual function -install /tb_freq_control/fc -env /tb_freq_control/fc/t1_b0 { &{/tb_freq_control/fc/t1_b7/nDout, /tb_freq_control/fc/t1_b6/nDout, /tb_freq_control/fc/t1_b5/nDout, /tb_freq_control/fc/t1_b4/nDout, /tb_freq_control/fc/t1_b3/nDout, /tb_freq_control/fc/t1_b2/nDout, /tb_freq_control/fc/t1_b1/nDout, /tb_freq_control/fc/t1_b0/nDout }} T1Load
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Clocks
add wave -noupdate -label clk /tb_freq_control/clk
add wave -noupdate -label clk179 /tb_freq_control/clk179
add wave -noupdate -label enp /tb_freq_control/enp
add wave -noupdate -label enn /tb_freq_control/enn
add wave -noupdate -label audClock /tb_freq_control/audClock
add wave -noupdate -divider Config
add wave -noupdate -label enFastClk1 /tb_freq_control/enFastClk1
add wave -noupdate -label enFastClk3 /tb_freq_control/enFastClk3
add wave -noupdate -label ch2Bits16 /tb_freq_control/ch2Bits16
add wave -noupdate -label ch4Bits16 /tb_freq_control/ch4Bits16
add wave -noupdate -label sel15Khz /tb_freq_control/sel15Khz
add wave -noupdate -divider {Reset And Resync}
add wave -noupdate -label Addr9w /tb_freq_control/Addr9w
add wave -noupdate -label reload12 /tb_freq_control/fc/reload12
add wave -noupdate -label reload34 /tb_freq_control/fc/reload34
add wave -noupdate -label presync /tb_freq_control/fc/presync
add wave -noupdate -label resync /tb_freq_control/fc/resync
add wave -noupdate -label rstAudPhase /tb_freq_control/rstAudPhase
add wave -noupdate -label init /tb_freq_control/init
add wave -noupdate -divider Writes
add wave -noupdate -label D -radix unsigned /tb_freq_control/D
add wave -noupdate -label Addr0w /tb_freq_control/Addr0w
add wave -noupdate -label Addr2w /tb_freq_control/Addr2w
add wave -noupdate -label Addr4w /tb_freq_control/Addr4w
add wave -noupdate -label Addr6w /tb_freq_control/Addr6w
add wave -noupdate -label resyncTwoTones /tb_freq_control/resyncTwoTones
add wave -noupdate -label resyncSerClk /tb_freq_control/resyncSerClk
add wave -noupdate -divider Outputs
add wave -noupdate -label Timer -expand /tb_freq_control/Timer
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {8072333400 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 216
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
WaveRestoreZoom {0 ps} {21263707500 ps}
