onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_KEY_core/clk
add wave -noupdate /tb_KEY_core/clk179
add wave -noupdate /tb_KEY_core/enp
add wave -noupdate /tb_KEY_core/enn
add wave -noupdate -label keybClk /tb_KEY_core/keybClk
add wave -noupdate -label init /tb_KEY_core/init
add wave -noupdate -divider {State Machine}
add wave -noupdate -label ThisState /tb_KEY_core/kc/keyQ
add wave -noupdate -divider {KEY Core}
add wave -noupdate -label K -radix unsigned -childformat {{{/tb_KEY_core/K[5]} -radix unsigned} {{/tb_KEY_core/K[4]} -radix unsigned} {{/tb_KEY_core/K[3]} -radix unsigned} {{/tb_KEY_core/K[2]} -radix unsigned} {{/tb_KEY_core/K[1]} -radix unsigned} {{/tb_KEY_core/K[0]} -radix unsigned}} -subitemconfig {{/tb_KEY_core/K[5]} {-height 15 -radix unsigned} {/tb_KEY_core/K[4]} {-height 15 -radix unsigned} {/tb_KEY_core/K[3]} {-height 15 -radix unsigned} {/tb_KEY_core/K[2]} {-height 15 -radix unsigned} {/tb_KEY_core/K[1]} {-height 15 -radix unsigned} {/tb_KEY_core/K[0]} {-height 15 -radix unsigned}} /tb_KEY_core/K
add wave -noupdate -label KR1 /tb_KEY_core/KR1
add wave -noupdate -label KR2 /tb_KEY_core/KR2
add wave -noupdate -label setKey /tb_KEY_core/kc/setKey
add wave -noupdate -label keyDown /tb_KEY_core/kc/keyDown
add wave -noupdate -divider Brk,Ctrl,Shift
add wave -noupdate -label Control /tb_KEY_core/kc/control
add wave -noupdate -label Shift /tb_KEY_core/kShift
add wave -noupdate -label Break /tb_KEY_core/setBreak
add wave -noupdate -divider {Data Reg Path}
add wave -noupdate -label match /tb_KEY_core/kc/match
add wave -noupdate -label QD -radix unsigned -childformat {{{/tb_KEY_core/kc/QD[5]} -radix unsigned} {{/tb_KEY_core/kc/QD[4]} -radix unsigned} {{/tb_KEY_core/kc/QD[3]} -radix unsigned} {{/tb_KEY_core/kc/QD[2]} -radix unsigned} {{/tb_KEY_core/kc/QD[1]} -radix unsigned} {{/tb_KEY_core/kc/QD[0]} -radix unsigned}} -subitemconfig {{/tb_KEY_core/kc/QD[5]} {-height 15 -radix unsigned} {/tb_KEY_core/kc/QD[4]} {-height 15 -radix unsigned} {/tb_KEY_core/kc/QD[3]} {-height 15 -radix unsigned} {/tb_KEY_core/kc/QD[2]} {-height 15 -radix unsigned} {/tb_KEY_core/kc/QD[1]} {-height 15 -radix unsigned} {/tb_KEY_core/kc/QD[0]} {-height 15 -radix unsigned}} /tb_KEY_core/kc/QD
add wave -noupdate -label D -radix unsigned -childformat {{{/tb_KEY_core/D[7]} -radix unsigned} {{/tb_KEY_core/D[6]} -radix unsigned} {{/tb_KEY_core/D[5]} -radix unsigned} {{/tb_KEY_core/D[4]} -radix unsigned} {{/tb_KEY_core/D[3]} -radix unsigned} {{/tb_KEY_core/D[2]} -radix unsigned} {{/tb_KEY_core/D[1]} -radix unsigned} {{/tb_KEY_core/D[0]} -radix unsigned}} -subitemconfig {{/tb_KEY_core/D[7]} {-height 15 -radix unsigned} {/tb_KEY_core/D[6]} {-height 15 -radix unsigned} {/tb_KEY_core/D[5]} {-height 15 -radix unsigned} {/tb_KEY_core/D[4]} {-height 15 -radix unsigned} {/tb_KEY_core/D[3]} {-height 15 -radix unsigned} {/tb_KEY_core/D[2]} {-height 15 -radix unsigned} {/tb_KEY_core/D[1]} {-height 15 -radix unsigned} {/tb_KEY_core/D[0]} {-height 15 -radix unsigned}} /tb_KEY_core/D
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {27253840000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 176
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
WaveRestoreZoom {0 ps} {33865944 ns}
