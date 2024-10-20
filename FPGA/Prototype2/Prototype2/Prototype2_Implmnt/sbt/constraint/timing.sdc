# ##############################################################################

# iCEcube SDC

# Version:            2020.12.27943

# File Generated:     Oct 12 2024 16:46:24

# ##############################################################################

####---- CreateClock list ----2
create_clock  -period 10.00 -waveform {0.00 5.00} -name {sysclk} [get_ports {sysclk}] 
create_clock  -period 559.00 -waveform {0.00 279.00} -name {clk179} [get_ports {clk179}] 

