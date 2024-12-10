# ##############################################################################

# iCEcube SDC

# Version:            2020.12.27943

# File Generated:     Dec 5 2024 22:00:38

# ##############################################################################

####---- CreateClock list ----1
create_clock  -period 560.00 -waveform {0.00 280.00} -name {slow_clk} [get_ports {clk}] 
create_clock  -period 10.00 -waveform {0.00 5.00} -name {fast_clk} [get_ports {dev_clk}]
