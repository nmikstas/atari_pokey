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
add wave -noupdate -divider {Serial In}
add wave -noupdate -label bclki /tb_pokey_top/bclki
add wave -noupdate -label bclko /tb_pokey_top/bclko
add wave -noupdate -label sdiClock /tb_pokey_top/sdiClock
add wave -noupdate -label SID /tb_pokey_top/sid
add wave -noupdate -label Dr /tb_pokey_top/pokey_top_0/SER_core_0/Dr
add wave -noupdate -label setFramerr /tb_pokey_top/pokey_top_0/SER_core_0/setFramerr
add wave -noupdate -label setSdiCompl /tb_pokey_top/pokey_top_0/SER_core_0/setSdiCompl
add wave -noupdate -label sdiBusy /tb_pokey_top/pokey_top_0/SER_core_0/sdiBusy
add wave -noupdate -divider {Serial Out}
add wave -noupdate -label SOD /tb_pokey_top/sod
add wave -noupdate -label sdoFinish /tb_pokey_top/pokey_top_0/SER_core_0/sdoFinish
add wave -noupdate -label setSdoCompl /tb_pokey_top/pokey_top_0/SER_core_0/setSdoCompl
add wave -noupdate -divider IRQ
add wave -noupdate -label IRQ /tb_pokey_top/pokey_top_0/irq
add wave -noupdate -label sdiOvrun /tb_pokey_top/pokey_top_0/irq_core_0/sdiOvrun
add wave -noupdate -label setSdiCompl /tb_pokey_top/pokey_top_0/setSdiCompl
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {17759259259 ps} 0}
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
WaveRestoreZoom {0 ps} {168 ms}
