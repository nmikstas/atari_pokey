onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /tb_aud_control/clk
add wave -noupdate -label clk179 /tb_aud_control/clk179
add wave -noupdate -label enp /tb_aud_control/enp
add wave -noupdate -label enn /tb_aud_control/enn
add wave -noupdate -label audClock /tb_aud_control/audClock
add wave -noupdate -label keybClk /tb_aud_control/keybClk
add wave -noupdate -label init /tb_aud_control/init
add wave -noupdate -radix unsigned /tb_aud_control/rndNum
add wave -noupdate /tb_aud_control/poly4bit
add wave -noupdate /tb_aud_control/poly5bit
add wave -noupdate /tb_aud_control/poly917bit
add wave -noupdate /tb_aud_control/D
add wave -noupdate /tb_aud_control/Addr0w
add wave -noupdate /tb_aud_control/Addr2w
add wave -noupdate /tb_aud_control/Addr4w
add wave -noupdate /tb_aud_control/Addr6w
add wave -noupdate /tb_aud_control/Addr9w
add wave -noupdate /tb_aud_control/Timer
add wave -noupdate /tb_aud_control/rstAudPhase
add wave -noupdate /tb_aud_control/poly4
add wave -noupdate /tb_aud_control/poly5
add wave -noupdate /tb_aud_control/poly17
add wave -noupdate /tb_aud_control/AUDC
add wave -noupdate -format Analog-Step -height 74 -max 10.0 -radix unsigned /tb_aud_control/AUD1
add wave -noupdate -format Analog-Step -height 74 -max 10.0 -radix unsigned -childformat {{{/tb_aud_control/AUD2[3]} -radix unsigned} {{/tb_aud_control/AUD2[2]} -radix unsigned} {{/tb_aud_control/AUD2[1]} -radix unsigned} {{/tb_aud_control/AUD2[0]} -radix unsigned}} -subitemconfig {{/tb_aud_control/AUD2[3]} {-height 15 -radix unsigned} {/tb_aud_control/AUD2[2]} {-height 15 -radix unsigned} {/tb_aud_control/AUD2[1]} {-height 15 -radix unsigned} {/tb_aud_control/AUD2[0]} {-height 15 -radix unsigned}} /tb_aud_control/AUD2
add wave -noupdate -format Analog-Step -height 74 -max 10.0 -radix unsigned /tb_aud_control/AUD3
add wave -noupdate -format Analog-Step -height 74 -max 14.999999999999998 -radix unsigned /tb_aud_control/AUD4
add wave -noupdate /tb_aud_control/dis1
add wave -noupdate /tb_aud_control/dis2
add wave -noupdate /tb_aud_control/AUD12
add wave -noupdate /tb_aud_control/AUD34
add wave -noupdate /tb_aud_control/AUDOut
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {51818443110 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 199
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
WaveRestoreZoom {0 ps} {53550 us}
