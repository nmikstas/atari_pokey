onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -label clk /tb_freq_cntrl_reg/clk
add wave -noupdate -label D /tb_freq_cntrl_reg/D
add wave -noupdate -label WR /tb_freq_cntrl_reg/WR
add wave -noupdate -label decEn /tb_freq_cntrl_reg/decEn
add wave -noupdate -label Ld /tb_freq_cntrl_reg/Ld
add wave -noupdate -label nBOR /tb_freq_cntrl_reg/nBOR
add wave -noupdate -divider {Internal Bits}
add wave -noupdate -label b7 /tb_freq_cntrl_reg/freq/bit_7/nbt
add wave -noupdate -label b6 /tb_freq_cntrl_reg/freq/bit_6/nbt
add wave -noupdate -label b5 /tb_freq_cntrl_reg/freq/bit_5/nbt
add wave -noupdate -label b4 /tb_freq_cntrl_reg/freq/bit_4/nbt
add wave -noupdate -label b3 /tb_freq_cntrl_reg/freq/bit_3/nbt
add wave -noupdate -label b2 /tb_freq_cntrl_reg/freq/bit_2/nbt
add wave -noupdate -label b1 /tb_freq_cntrl_reg/freq/bit_1/nbt
add wave -noupdate -label b0 /tb_freq_cntrl_reg/freq/bit_0/nbt
add wave -noupdate -divider Borrows
add wave -noupdate -label {Borrow Chain} -expand /tb_freq_cntrl_reg/freq/CR_BOR
add wave -noupdate -divider {Internal Logic}
add wave -noupdate -label LdQ /tb_freq_cntrl_reg/freq/bit_0/LdQ
add wave -noupdate -label nbtQ /tb_freq_cntrl_reg/freq/bit_0/nbtQ
add wave -noupdate -label nCRQ /tb_freq_cntrl_reg/freq/bit_0/nCRQ
add wave -noupdate -label {Bit 0 nor1} /tb_freq_cntrl_reg/freq/bit_0/nor1
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 3} {16761720 ps} 0}
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
WaveRestoreZoom {14785651 ps} {21348211 ps}
