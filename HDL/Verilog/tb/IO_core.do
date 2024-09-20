onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /tb_IO_core/clk
add wave -noupdate /tb_IO_core/clk179
add wave -noupdate /tb_IO_core/enp
add wave -noupdate /tb_IO_core/enn
add wave -noupdate /tb_IO_core/init
add wave -noupdate /tb_IO_core/sel9bitPoly
add wave -noupdate -radix unsigned /tb_IO_core/rndNum
add wave -noupdate /tb_IO_core/RW
add wave -noupdate /tb_IO_core/CS
add wave -noupdate -divider {Address Signals}
add wave -noupdate -radix unsigned /tb_IO_core/A
add wave -noupdate -radix unsigned /tb_IO_core/Aint
add wave -noupdate -radix unsigned /tb_IO_core/ioc/Ar
add wave -noupdate -radix unsigned /tb_IO_core/ioc/AQ
add wave -noupdate /tb_IO_core/ioc/nwriteEn
add wave -noupdate -divider {New Divider}
add wave -noupdate /tb_IO_core/Addr0w
add wave -noupdate /tb_IO_core/Addr1w
add wave -noupdate /tb_IO_core/Addr2w
add wave -noupdate /tb_IO_core/Addr3w
add wave -noupdate /tb_IO_core/Addr4w
add wave -noupdate /tb_IO_core/Addr5w
add wave -noupdate /tb_IO_core/Addr6w
add wave -noupdate /tb_IO_core/Addr7w
add wave -noupdate /tb_IO_core/Addr8w
add wave -noupdate /tb_IO_core/Addr9w
add wave -noupdate /tb_IO_core/AddrAw
add wave -noupdate /tb_IO_core/AddrBw
add wave -noupdate /tb_IO_core/AddrDw
add wave -noupdate /tb_IO_core/AddrEw
add wave -noupdate /tb_IO_core/AddrFw
add wave -noupdate /tb_IO_core/readEn
add wave -noupdate -radix unsigned /tb_IO_core/Datar
add wave -noupdate -radix unsigned /tb_IO_core/Data0r
add wave -noupdate -radix unsigned /tb_IO_core/Data1r
add wave -noupdate -radix unsigned /tb_IO_core/Data2r
add wave -noupdate -radix unsigned /tb_IO_core/Data3r
add wave -noupdate -radix unsigned /tb_IO_core/Data4r
add wave -noupdate -radix unsigned /tb_IO_core/Data5r
add wave -noupdate -radix unsigned /tb_IO_core/Data6r
add wave -noupdate -radix unsigned /tb_IO_core/Data7r
add wave -noupdate -radix unsigned /tb_IO_core/Data8r
add wave -noupdate -radix unsigned /tb_IO_core/Data9r
add wave -noupdate -radix unsigned /tb_IO_core/DataDr
add wave -noupdate -radix unsigned /tb_IO_core/DataEr
add wave -noupdate -radix unsigned /tb_IO_core/DataFr
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {16159860 ps} 0} {{Cursor 2} {64792720 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 147
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
WaveRestoreZoom {26338610 ps} {36377700 ps}
