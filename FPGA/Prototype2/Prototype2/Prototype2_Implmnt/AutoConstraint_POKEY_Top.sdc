
#Begin clock constraint
define_clock -name {POKEY_Top|clk179} {p:POKEY_Top|clk179} -period 10000000.000 -clockgroup Autoconstr_clkgroup_0 -rise 0.000 -fall 5000000.000 -route 0.000 
#End clock constraint

#Begin clock constraint
define_clock -name {POKEY_Top|sysclk} {p:POKEY_Top|sysclk} -period 8508.169 -clockgroup Autoconstr_clkgroup_1 -rise 0.000 -fall 4254.084 -route 0.000 
#End clock constraint

#Begin clock constraint
define_clock -name {Prototype2_pll|PLLOUTGLOBAL_derived_clock} {n:Prototype2_pll|PLLOUTGLOBAL_derived_clock} -period 8508.169 -clockgroup Autoconstr_clkgroup_1 -rise 0.000 -fall 4254.084 -route 0.000 
#End clock constraint
