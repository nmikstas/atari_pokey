onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider Init
add wave -noupdate -label Init /tb_pokey_top/pokey_top_0/SKCTLS_reg_0/Init
add wave -noupdate -divider {External Signals}
add wave -noupdate -label phi2 /tb_pokey_top/phi2
add wave -noupdate -label p /tb_pokey_top/p
add wave -noupdate -label cs /tb_pokey_top/cs
add wave -noupdate -label rw /tb_pokey_top/rw
add wave -noupdate -label d -radix unsigned /tb_pokey_top/d
add wave -noupdate -label a /tb_pokey_top/a
add wave -noupdate -label kr /tb_pokey_top/kr
add wave -noupdate -label k -radix unsigned /tb_pokey_top/k
add wave -noupdate -label irq /tb_pokey_top/irq
add wave -noupdate -divider {IRQ Internal Signals}
add wave -noupdate -divider {SKSTAT Internal Signals}
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1452610044 ps} 0}
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
WaveRestoreZoom {0 ps} {15766531486 ps}
