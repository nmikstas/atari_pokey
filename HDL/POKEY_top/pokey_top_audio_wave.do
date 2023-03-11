onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {External Signals}
add wave -noupdate -label phi2 /tb_pokey_top/phi2
add wave -noupdate -label cs /tb_pokey_top/cs
add wave -noupdate -label rw /tb_pokey_top/rw
add wave -noupdate -label d -radix binary /tb_pokey_top/d
add wave -noupdate -label a -radix unsigned /tb_pokey_top/a
add wave -noupdate -divider Init
add wave -noupdate -label Init /tb_pokey_top/pokey_top_0/SKCTLS_reg_0/Init
add wave -noupdate -divider Counters
add wave -noupdate -label Timers -expand /tb_pokey_top/pokey_top_0/AUD_core_0/Timer
add wave -noupdate -divider Audio
add wave -noupdate -format Analog-Step -height 30 -label AUD1 -max 23.0 -radix unsigned /tb_pokey_top/pokey_top_0/AUD_core_0/AUD1
add wave -noupdate -format Analog-Step -height 30 -label AUD2 -max 15.0 -radix unsigned /tb_pokey_top/pokey_top_0/AUD_core_0/AUD2
add wave -noupdate -format Analog-Step -height 30 -label AUD3 -max 15.0 -radix unsigned /tb_pokey_top/pokey_top_0/AUD_core_0/AUD3
add wave -noupdate -format Analog-Step -height 30 -label AUD4 -max 15.0 -radix unsigned /tb_pokey_top/pokey_top_0/AUD_core_0/AUD4
add wave -noupdate -format Analog-Step -height 60 -label audio -max 35.0 -radix unsigned /tb_pokey_top/audio
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1854125594 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 73
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
WaveRestoreZoom {0 ps} {21458270136 ps}
