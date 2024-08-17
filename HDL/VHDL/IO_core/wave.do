onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /tb_io_core/clk
add wave -noupdate -label RW /tb_io_core/RW
add wave -noupdate -label CS /tb_io_core/CS
add wave -noupdate -label A -radix unsigned /tb_io_core/A
add wave -noupdate -label D -radix unsigned /tb_io_core/D
add wave -noupdate -label Addr0w /tb_io_core/Addr0w
add wave -noupdate -label Addr1w /tb_io_core/Addr1w
add wave -noupdate -label Addr2w /tb_io_core/Addr2w
add wave -noupdate -label Addr3w /tb_io_core/Addr3w
add wave -noupdate -label Addr4w /tb_io_core/Addr4w
add wave -noupdate /tb_io_core/Addr5w
add wave -noupdate /tb_io_core/Addr6w
add wave -noupdate /tb_io_core/Addr7w
add wave -noupdate /tb_io_core/Addr8w
add wave -noupdate /tb_io_core/Addr9w
add wave -noupdate /tb_io_core/AddrAw
add wave -noupdate /tb_io_core/AddrBw
add wave -noupdate /tb_io_core/AddrDw
add wave -noupdate /tb_io_core/AddrEw
add wave -noupdate -label AddrFw /tb_io_core/AddrFw
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {32189414 ps} 0}
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
WaveRestoreZoom {0 ps} {8725548 ps}
