####---- CreateClock list ----4
create_clock  -period 1000.00 -waveform {0.00 500.00} -name {POKEY_Top|clk179} [get_ports {clk179}] 
create_clock  -period 8508.17 -waveform {0.00 4254.08} -name {POKEY_Top|sysclk} [get_ports {sysclk}] 
create_clock  -period 10.00 -waveform {0.00 5.00} -name {sysclk} [get_ports {sysclk}] 
create_clock  -period 559.00 -waveform {0.00 279.00} -name {clk179} [get_ports {clk179}] 

####---- SetFalsePath list ----2
set_false_path  -from [get_clocks {POKEY_Top|clk179}]  -to [get_clocks {POKEY_Top|sysclk}]
set_false_path  -from [get_clocks {POKEY_Top|sysclk}]  -to [get_clocks {POKEY_Top|clk179}]

