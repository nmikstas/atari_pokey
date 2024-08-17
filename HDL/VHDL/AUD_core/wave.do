onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /tb_aud_freq_control/clk
add wave -noupdate -label init /tb_aud_freq_control/init
add wave -noupdate -label audClock /tb_aud_freq_control/audClock
add wave -noupdate -label Addr9w /tb_aud_freq_control/Addr9w
add wave -noupdate -label reload12 /tb_aud_freq_control/aud_freq_control_0/reload12
add wave -noupdate -label reload34 /tb_aud_freq_control/aud_freq_control_0/reload34
add wave -noupdate -label nBOR /tb_aud_freq_control/aud_freq_control_0/nBOR
add wave -noupdate -label D -radix unsigned /tb_aud_freq_control/D
add wave -noupdate -label {Channel 4 Data Load} /tb_aud_freq_control/Addr6w
add wave -noupdate -label {Channel 3 Data Load} /tb_aud_freq_control/Addr4w
add wave -noupdate -label {Channel 2 Data Load} /tb_aud_freq_control/Addr2w
add wave -noupdate -label {Channel 1 Data Load} /tb_aud_freq_control/Addr0w
add wave -noupdate -label Timer -expand /tb_aud_freq_control/Timer
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {9444670496 ps} 0} {{Cursor 3} {4735744624 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
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
WaveRestoreZoom {1534864352 ps} {17284864992 ps}
