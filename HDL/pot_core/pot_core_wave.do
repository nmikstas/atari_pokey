onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /tb_pot_core/clk
add wave -noupdate -label init /tb_pot_core/init
add wave -noupdate -label POTGO /tb_pot_core/POTGO
add wave -noupdate -label fastScan /tb_pot_core/fastScan
add wave -noupdate -label p /tb_pot_core/p
add wave -noupdate -label nPotClk /tb_pot_core/pot_core_0/nPotClk
add wave -noupdate -label {Decrement Count} -radix unsigned -childformat {{/tb_pot_core/pot_core_0/nQ(7) -radix unsigned} {/tb_pot_core/pot_core_0/nQ(6) -radix unsigned} {/tb_pot_core/pot_core_0/nQ(5) -radix unsigned} {/tb_pot_core/pot_core_0/nQ(4) -radix unsigned} {/tb_pot_core/pot_core_0/nQ(3) -radix unsigned} {/tb_pot_core/pot_core_0/nQ(2) -radix unsigned} {/tb_pot_core/pot_core_0/nQ(1) -radix unsigned} {/tb_pot_core/pot_core_0/nQ(0) -radix unsigned}} -subitemconfig {/tb_pot_core/pot_core_0/nQ(7) {-height 15 -radix unsigned} /tb_pot_core/pot_core_0/nQ(6) {-height 15 -radix unsigned} /tb_pot_core/pot_core_0/nQ(5) {-height 15 -radix unsigned} /tb_pot_core/pot_core_0/nQ(4) {-height 15 -radix unsigned} /tb_pot_core/pot_core_0/nQ(3) {-height 15 -radix unsigned} /tb_pot_core/pot_core_0/nQ(2) {-height 15 -radix unsigned} /tb_pot_core/pot_core_0/nQ(1) {-height 15 -radix unsigned} /tb_pot_core/pot_core_0/nQ(0) {-height 15 -radix unsigned}} /tb_pot_core/pot_core_0/nQ
add wave -noupdate -divider {POTGO Delays}
add wave -noupdate -label nor1 /tb_pot_core/pot_core_0/nor1
add wave -noupdate -label nor2 /tb_pot_core/pot_core_0/nor2
add wave -noupdate -label potPreset /tb_pot_core/pot_core_0/potPreset
add wave -noupdate -label delay1 /tb_pot_core/pot_core_0/delay1
add wave -noupdate -label delay2 /tb_pot_core/pot_core_0/delay2
add wave -noupdate -divider {POT Load Control}
add wave -noupdate -label count /tb_pot_core/pot_core_0/count
add wave -noupdate -label Qcount /tb_pot_core/pot_core_0/Qcount
add wave -noupdate -label nor3 /tb_pot_core/pot_core_0/nor3
add wave -noupdate -label nor4 /tb_pot_core/pot_core_0/nor4
add wave -noupdate -label dump /tb_pot_core/pot_core_0/dump
add wave -noupdate -divider POTs
add wave -noupdate -label POT0 -radix unsigned /tb_pot_core/POT0
add wave -noupdate -label POT1 -radix unsigned /tb_pot_core/POT1
add wave -noupdate -label POT2 -radix unsigned /tb_pot_core/POT2
add wave -noupdate -label POT3 -radix unsigned /tb_pot_core/POT3
add wave -noupdate -label POT4 -radix unsigned /tb_pot_core/POT4
add wave -noupdate -label POT5 -radix unsigned /tb_pot_core/POT5
add wave -noupdate -label POT6 -radix unsigned /tb_pot_core/POT6
add wave -noupdate -label POT7 -radix unsigned /tb_pot_core/POT7
add wave -noupdate -label ALLPOT -radix unsigned /tb_pot_core/ALLPOT
TreeUpdate [SetDefaultTree]
WaveRestoreCursors
quietly wave cursor active 0
configure wave -namecolwidth 133
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
WaveRestoreZoom {1510189778 ps} {1541059652 ps}
