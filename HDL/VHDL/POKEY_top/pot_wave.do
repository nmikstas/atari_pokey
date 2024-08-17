onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -divider {External Signals}
add wave -noupdate -label phi2 /tb_pokey_top/phi2
add wave -noupdate -label cs /tb_pokey_top/cs
add wave -noupdate -label rw /tb_pokey_top/rw
add wave -noupdate -label d -radix unsigned /tb_pokey_top/d
add wave -noupdate -label a /tb_pokey_top/a
add wave -noupdate -label p /tb_pokey_top/p
add wave -noupdate -divider Init
add wave -noupdate -label Init /tb_pokey_top/pokey_top_0/SKCTLS_reg_0/Init
add wave -noupdate -divider {POT Core}
add wave -noupdate -label POTGO /tb_pokey_top/pokey_top_0/pot_core_0/POTGO
add wave -noupdate -label dump /tb_pokey_top/pokey_top_0/pot_core_0/dump
add wave -noupdate -label pot_scan_en /tb_pokey_top/pokey_top_0/pot_core_0/cell23_0/CR
add wave -noupdate -label POT0 -radix unsigned /tb_pokey_top/pokey_top_0/pot_core_0/POT0
add wave -noupdate -label POT1 -radix unsigned /tb_pokey_top/pokey_top_0/pot_core_0/POT1
add wave -noupdate -label POT2 -radix unsigned /tb_pokey_top/pokey_top_0/pot_core_0/POT2
add wave -noupdate -label POT3 -radix unsigned /tb_pokey_top/pokey_top_0/pot_core_0/POT3
add wave -noupdate -label POT4 -radix unsigned /tb_pokey_top/pokey_top_0/pot_core_0/POT4
add wave -noupdate -label POT5 -radix unsigned /tb_pokey_top/pokey_top_0/pot_core_0/POT5
add wave -noupdate -label POT6 -radix unsigned /tb_pokey_top/pokey_top_0/pot_core_0/POT6
add wave -noupdate -label POT7 -radix unsigned /tb_pokey_top/pokey_top_0/pot_core_0/POT7
add wave -noupdate -label ALLPOT /tb_pokey_top/pokey_top_0/pot_core_0/ALLPOT
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {908276827 ps} 0}
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
WaveRestoreZoom {0 ps} {15750 us}
