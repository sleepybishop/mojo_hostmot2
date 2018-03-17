create_clock -name CLK -period 19.900 [get_ports CLK]
create_clock -name COM_SPICLK -period 9.000 [get_ports COM_SPICLK]

set_false_path -from [get_clocks CLK] -to [get_clocks COM_SPICLK]
set_false_path -from [get_clocks COM_SPICLK] -to [get_clocks CLK]


set_output_delay -clock [get_clocks COM_SPICLK] -add_delay -3.000 [all_outputs]
set_input_delay -clock [get_clocks COM_SPICLK] -max 1.000 -add_delay [all_inputs]
set_input_delay -clock [get_clocks COM_SPICLK] -min 0.000 -add_delay [all_inputs]

set_property PACKAGE_PIN P56 [get_ports CLK]
set_property IOSTANDARD LVTTL [get_ports CLK]

set_property PACKAGE_PIN P24 [get_ports COM_SPICLK]
set_property IOSTANDARD LVTTL [get_ports COM_SPICLK]

set_property PACKAGE_PIN P22 [get_ports COM_SPICS]
set_property IOSTANDARD LVTTL [get_ports COM_SPICS]

set_property PACKAGE_PIN P17 [get_ports COM_SPIIN]
set_property IOSTANDARD LVTTL [get_ports COM_SPIIN]

set_property PACKAGE_PIN P15 [get_ports COM_SPIOUT]
set_property IOSTANDARD LVTTL [get_ports COM_SPIOUT]
set_property DRIVE 4 [get_ports COM_SPIOUT]
set_property SLEW FAST [get_ports COM_SPIOUT]

set_property PACKAGE_PIN P48 [get_ports SPICS]
set_property IOSTANDARD LVTTL [get_ports SPICS]

set_property PACKAGE_PIN P45 [get_ports SPIIN]
set_property IOSTANDARD LVTTL [get_ports SPIIN]

set_property PACKAGE_PIN P44 [get_ports SPIOUT]
set_property IOSTANDARD LVTTL [get_ports SPIOUT]

set_property PACKAGE_PIN P43 [get_ports SPICLK]
set_property IOSTANDARD LVTTL [get_ports SPICLK]

set_property PACKAGE_PIN P46 [get_ports {SPICH[0]}]
set_property IOSTANDARD LVTTL [get_ports {SPICH[0]}]

set_property PACKAGE_PIN P61 [get_ports {SPICH[1]}]
set_property IOSTANDARD LVTTL [get_ports {SPICH[1]}]

set_property PACKAGE_PIN P62 [get_ports {SPICH[2]}]
set_property IOSTANDARD LVTTL [get_ports {SPICH[2]}]

set_property PACKAGE_PIN P65 [get_ports {SPICH[3]}]
set_property IOSTANDARD LVTTL [get_ports {SPICH[3]}]

set_property PACKAGE_PIN P55 [get_ports AVR_TX]
set_property IOSTANDARD LVTTL [get_ports AVR_TX]

set_property PACKAGE_PIN P59 [get_ports AVR_RX]
set_property IOSTANDARD LVTTL [get_ports AVR_RX]

set_property PACKAGE_PIN P39 [get_ports AVR_BUSY]
set_property IOSTANDARD LVTTL [get_ports AVR_BUSY]

set_property PACKAGE_PIN P70 [get_ports CCLK]
set_property IOSTANDARD LVTTL [get_ports CCLK]

set_property PACKAGE_PIN P38 [get_ports RST_N]
set_property IOSTANDARD LVTTL [get_ports RST_N]

set_property PACKAGE_PIN P123 [get_ports {LEDS[7]}]
set_property IOSTANDARD LVTTL [get_ports {LEDS[7]}]
set_property DRIVE 8 [get_ports {LEDS[7]}]
set_property SLEW SLOW [get_ports {LEDS[7]}]

set_property PACKAGE_PIN P124 [get_ports {LEDS[6]}]
set_property IOSTANDARD LVTTL [get_ports {LEDS[6]}]
set_property DRIVE 8 [get_ports {LEDS[6]}]
set_property SLEW SLOW [get_ports {LEDS[6]}]

set_property PACKAGE_PIN P126 [get_ports {LEDS[5]}]
set_property IOSTANDARD LVTTL [get_ports {LEDS[5]}]
set_property DRIVE 8 [get_ports {LEDS[5]}]
set_property SLEW SLOW [get_ports {LEDS[5]}]

set_property PACKAGE_PIN P127 [get_ports {LEDS[4]}]
set_property IOSTANDARD LVTTL [get_ports {LEDS[4]}]
set_property DRIVE 8 [get_ports {LEDS[4]}]
set_property SLEW SLOW [get_ports {LEDS[4]}]

set_property PACKAGE_PIN P131 [get_ports {LEDS[3]}]
set_property IOSTANDARD LVTTL [get_ports {LEDS[3]}]
set_property DRIVE 8 [get_ports {LEDS[3]}]
set_property SLEW SLOW [get_ports {LEDS[3]}]

set_property PACKAGE_PIN P132 [get_ports {LEDS[2]}]
set_property IOSTANDARD LVTTL [get_ports {LEDS[2]}]
set_property DRIVE 8 [get_ports {LEDS[2]}]
set_property SLEW SLOW [get_ports {LEDS[2]}]

set_property PACKAGE_PIN P133 [get_ports {LEDS[1]}]
set_property IOSTANDARD LVTTL [get_ports {LEDS[1]}]
set_property DRIVE 8 [get_ports {LEDS[1]}]
set_property SLEW SLOW [get_ports {LEDS[1]}]

set_property PACKAGE_PIN P134 [get_ports {LEDS[0]}]
set_property IOSTANDARD LVTTL [get_ports {LEDS[0]}]
set_property DRIVE 8 [get_ports {LEDS[0]}]
set_property SLEW SLOW [get_ports {LEDS[0]}]

set_property PACKAGE_PIN P57 [get_ports {IOBITS[0]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[0]}]
set_property DRIVE 24 [get_ports {IOBITS[0]}]
set_property SLEW SLOW [get_ports {IOBITS[0]}]

set_property PACKAGE_PIN P58 [get_ports {IOBITS[1]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[1]}]
set_property DRIVE 24 [get_ports {IOBITS[1]}]
set_property SLEW SLOW [get_ports {IOBITS[1]}]

set_property PACKAGE_PIN P66 [get_ports {IOBITS[2]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[2]}]
set_property DRIVE 24 [get_ports {IOBITS[2]}]
set_property SLEW SLOW [get_ports {IOBITS[2]}]

set_property PACKAGE_PIN P67 [get_ports {IOBITS[3]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[3]}]
set_property DRIVE 24 [get_ports {IOBITS[3]}]
set_property SLEW SLOW [get_ports {IOBITS[3]}]

set_property PACKAGE_PIN P74 [get_ports {IOBITS[4]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[4]}]
set_property DRIVE 24 [get_ports {IOBITS[4]}]
set_property SLEW SLOW [get_ports {IOBITS[4]}]

set_property PACKAGE_PIN P75 [get_ports {IOBITS[5]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[5]}]
set_property DRIVE 24 [get_ports {IOBITS[5]}]
set_property SLEW SLOW [get_ports {IOBITS[5]}]

set_property PACKAGE_PIN P78 [get_ports {IOBITS[6]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[6]}]
set_property DRIVE 24 [get_ports {IOBITS[6]}]
set_property SLEW SLOW [get_ports {IOBITS[6]}]

set_property PACKAGE_PIN P79 [get_ports {IOBITS[7]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[7]}]
set_property DRIVE 24 [get_ports {IOBITS[7]}]
set_property SLEW SLOW [get_ports {IOBITS[7]}]

set_property PACKAGE_PIN P80 [get_ports {IOBITS[8]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[8]}]
set_property DRIVE 24 [get_ports {IOBITS[8]}]
set_property SLEW SLOW [get_ports {IOBITS[8]}]

set_property PACKAGE_PIN P81 [get_ports {IOBITS[9]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[9]}]
set_property DRIVE 24 [get_ports {IOBITS[9]}]
set_property SLEW SLOW [get_ports {IOBITS[9]}]

set_property PACKAGE_PIN P82 [get_ports {IOBITS[10]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[10]}]
set_property DRIVE 24 [get_ports {IOBITS[10]}]
set_property SLEW SLOW [get_ports {IOBITS[10]}]

set_property PACKAGE_PIN P83 [get_ports {IOBITS[11]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[11]}]
set_property DRIVE 24 [get_ports {IOBITS[11]}]
set_property SLEW SLOW [get_ports {IOBITS[11]}]

set_property PACKAGE_PIN P84 [get_ports {IOBITS[12]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[12]}]
set_property DRIVE 24 [get_ports {IOBITS[12]}]
set_property SLEW SLOW [get_ports {IOBITS[12]}]

set_property PACKAGE_PIN P85 [get_ports {IOBITS[13]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[13]}]
set_property DRIVE 24 [get_ports {IOBITS[13]}]
set_property SLEW SLOW [get_ports {IOBITS[13]}]

set_property PACKAGE_PIN P87 [get_ports {IOBITS[14]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[14]}]
set_property DRIVE 24 [get_ports {IOBITS[14]}]
set_property SLEW SLOW [get_ports {IOBITS[14]}]

set_property PACKAGE_PIN P88 [get_ports {IOBITS[15]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[15]}]
set_property DRIVE 24 [get_ports {IOBITS[15]}]
set_property SLEW SLOW [get_ports {IOBITS[15]}]

set_property PACKAGE_PIN P92 [get_ports {IOBITS[16]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[16]}]
set_property DRIVE 24 [get_ports {IOBITS[16]}]
set_property SLEW SLOW [get_ports {IOBITS[16]}]

set_property PACKAGE_PIN P93 [get_ports {IOBITS[17]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[17]}]
set_property DRIVE 24 [get_ports {IOBITS[17]}]
set_property SLEW SLOW [get_ports {IOBITS[17]}]

set_property PACKAGE_PIN P94 [get_ports {IOBITS[18]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[18]}]
set_property DRIVE 24 [get_ports {IOBITS[18]}]
set_property SLEW SLOW [get_ports {IOBITS[18]}]

set_property PACKAGE_PIN P95 [get_ports {IOBITS[19]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[19]}]
set_property DRIVE 24 [get_ports {IOBITS[19]}]
set_property SLEW SLOW [get_ports {IOBITS[19]}]

set_property PACKAGE_PIN P97 [get_ports {IOBITS[20]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[20]}]
set_property DRIVE 24 [get_ports {IOBITS[20]}]
set_property SLEW SLOW [get_ports {IOBITS[20]}]

set_property PACKAGE_PIN P98 [get_ports {IOBITS[21]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[21]}]
set_property DRIVE 24 [get_ports {IOBITS[21]}]
set_property SLEW SLOW [get_ports {IOBITS[21]}]

set_property PACKAGE_PIN P99 [get_ports {IOBITS[22]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[22]}]
set_property DRIVE 24 [get_ports {IOBITS[22]}]
set_property SLEW SLOW [get_ports {IOBITS[22]}]

set_property PACKAGE_PIN P100 [get_ports {IOBITS[23]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[23]}]
set_property DRIVE 24 [get_ports {IOBITS[23]}]
set_property SLEW SLOW [get_ports {IOBITS[23]}]

set_property PACKAGE_PIN P101 [get_ports {IOBITS[24]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[24]}]
set_property DRIVE 24 [get_ports {IOBITS[24]}]
set_property SLEW SLOW [get_ports {IOBITS[24]}]

set_property PACKAGE_PIN P102 [get_ports {IOBITS[25]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[25]}]
set_property DRIVE 24 [get_ports {IOBITS[25]}]
set_property SLEW SLOW [get_ports {IOBITS[25]}]

set_property PACKAGE_PIN P104 [get_ports {IOBITS[26]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[26]}]
set_property DRIVE 24 [get_ports {IOBITS[26]}]
set_property SLEW SLOW [get_ports {IOBITS[26]}]

set_property PACKAGE_PIN P105 [get_ports {IOBITS[27]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[27]}]
set_property DRIVE 24 [get_ports {IOBITS[27]}]
set_property SLEW SLOW [get_ports {IOBITS[27]}]

set_property PACKAGE_PIN P111 [get_ports {IOBITS[28]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[28]}]
set_property DRIVE 24 [get_ports {IOBITS[28]}]
set_property SLEW SLOW [get_ports {IOBITS[28]}]

set_property PACKAGE_PIN P112 [get_ports {IOBITS[29]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[29]}]
set_property DRIVE 24 [get_ports {IOBITS[29]}]
set_property SLEW SLOW [get_ports {IOBITS[29]}]

set_property PACKAGE_PIN P114 [get_ports {IOBITS[30]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[30]}]
set_property DRIVE 24 [get_ports {IOBITS[30]}]
set_property SLEW SLOW [get_ports {IOBITS[30]}]

set_property PACKAGE_PIN P115 [get_ports {IOBITS[31]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[31]}]
set_property DRIVE 24 [get_ports {IOBITS[31]}]
set_property SLEW SLOW [get_ports {IOBITS[31]}]

set_property PACKAGE_PIN P116 [get_ports {IOBITS[32]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[32]}]
set_property DRIVE 24 [get_ports {IOBITS[32]}]
set_property SLEW SLOW [get_ports {IOBITS[32]}]

set_property PACKAGE_PIN P117 [get_ports {IOBITS[33]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[33]}]
set_property DRIVE 24 [get_ports {IOBITS[33]}]
set_property SLEW SLOW [get_ports {IOBITS[33]}]

set_property PACKAGE_PIN P118 [get_ports {IOBITS[34]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[34]}]
set_property DRIVE 24 [get_ports {IOBITS[34]}]
set_property SLEW SLOW [get_ports {IOBITS[34]}]

set_property PACKAGE_PIN P119 [get_ports {IOBITS[35]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[35]}]
set_property DRIVE 24 [get_ports {IOBITS[35]}]
set_property SLEW SLOW [get_ports {IOBITS[35]}]

set_property PACKAGE_PIN P120 [get_ports {IOBITS[36]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[36]}]
set_property DRIVE 24 [get_ports {IOBITS[36]}]
set_property SLEW SLOW [get_ports {IOBITS[36]}]

set_property PACKAGE_PIN P121 [get_ports {IOBITS[37]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[37]}]
set_property DRIVE 24 [get_ports {IOBITS[37]}]
set_property SLEW SLOW [get_ports {IOBITS[37]}]

set_property PACKAGE_PIN P50 [get_ports {IOBITS[38]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[38]}]
set_property DRIVE 24 [get_ports {IOBITS[38]}]
set_property SLEW SLOW [get_ports {IOBITS[38]}]

set_property PACKAGE_PIN P51 [get_ports {IOBITS[39]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[39]}]
set_property DRIVE 24 [get_ports {IOBITS[39]}]
set_property SLEW SLOW [get_ports {IOBITS[39]}]

set_property PACKAGE_PIN P40 [get_ports {IOBITS[40]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[40]}]
set_property DRIVE 24 [get_ports {IOBITS[40]}]
set_property SLEW SLOW [get_ports {IOBITS[40]}]

set_property PACKAGE_PIN P41 [get_ports {IOBITS[41]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[41]}]
set_property DRIVE 24 [get_ports {IOBITS[41]}]
set_property SLEW SLOW [get_ports {IOBITS[41]}]

set_property PACKAGE_PIN P34 [get_ports {IOBITS[42]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[42]}]
set_property DRIVE 24 [get_ports {IOBITS[42]}]
set_property SLEW SLOW [get_ports {IOBITS[42]}]

set_property PACKAGE_PIN P35 [get_ports {IOBITS[43]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[43]}]
set_property DRIVE 24 [get_ports {IOBITS[43]}]
set_property SLEW SLOW [get_ports {IOBITS[43]}]

set_property PACKAGE_PIN P32 [get_ports {IOBITS[44]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[44]}]
set_property DRIVE 24 [get_ports {IOBITS[44]}]
set_property SLEW SLOW [get_ports {IOBITS[44]}]

set_property PACKAGE_PIN P33 [get_ports {IOBITS[45]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[45]}]
set_property DRIVE 24 [get_ports {IOBITS[45]}]
set_property SLEW SLOW [get_ports {IOBITS[45]}]

set_property PACKAGE_PIN P29 [get_ports {IOBITS[46]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[46]}]
set_property DRIVE 24 [get_ports {IOBITS[46]}]
set_property SLEW SLOW [get_ports {IOBITS[46]}]

set_property PACKAGE_PIN P30 [get_ports {IOBITS[47]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[47]}]
set_property DRIVE 24 [get_ports {IOBITS[47]}]
set_property SLEW SLOW [get_ports {IOBITS[47]}]

set_property PACKAGE_PIN P26 [get_ports {IOBITS[48]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[48]}]
set_property DRIVE 24 [get_ports {IOBITS[48]}]
set_property SLEW SLOW [get_ports {IOBITS[48]}]

set_property PACKAGE_PIN P27 [get_ports {IOBITS[49]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[49]}]
set_property DRIVE 24 [get_ports {IOBITS[49]}]
set_property SLEW SLOW [get_ports {IOBITS[49]}]

set_property PACKAGE_PIN P23 [get_ports {IOBITS[50]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[50]}]
set_property DRIVE 24 [get_ports {IOBITS[50]}]
set_property SLEW SLOW [get_ports {IOBITS[50]}]

set_property PACKAGE_PIN P21 [get_ports {IOBITS[51]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[51]}]
set_property DRIVE 24 [get_ports {IOBITS[51]}]
set_property SLEW SLOW [get_ports {IOBITS[51]}]

set_property PACKAGE_PIN P16 [get_ports {IOBITS[52]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[52]}]
set_property DRIVE 24 [get_ports {IOBITS[52]}]
set_property SLEW SLOW [get_ports {IOBITS[52]}]

set_property PACKAGE_PIN P14 [get_ports {IOBITS[53]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[53]}]
set_property DRIVE 24 [get_ports {IOBITS[53]}]
set_property SLEW SLOW [get_ports {IOBITS[53]}]

set_property PACKAGE_PIN P11 [get_ports {IOBITS[54]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[54]}]
set_property DRIVE 24 [get_ports {IOBITS[54]}]
set_property SLEW SLOW [get_ports {IOBITS[54]}]

set_property PACKAGE_PIN P12 [get_ports {IOBITS[55]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[55]}]
set_property DRIVE 24 [get_ports {IOBITS[55]}]
set_property SLEW SLOW [get_ports {IOBITS[55]}]

set_property PACKAGE_PIN P9 [get_ports {IOBITS[56]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[56]}]
set_property DRIVE 24 [get_ports {IOBITS[56]}]
set_property SLEW SLOW [get_ports {IOBITS[56]}]

set_property PACKAGE_PIN P10 [get_ports {IOBITS[57]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[57]}]
set_property DRIVE 24 [get_ports {IOBITS[57]}]
set_property SLEW SLOW [get_ports {IOBITS[57]}]

set_property PACKAGE_PIN P7 [get_ports {IOBITS[58]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[58]}]
set_property DRIVE 24 [get_ports {IOBITS[58]}]
set_property SLEW SLOW [get_ports {IOBITS[58]}]

set_property PACKAGE_PIN P8 [get_ports {IOBITS[59]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[59]}]
set_property DRIVE 24 [get_ports {IOBITS[59]}]
set_property SLEW SLOW [get_ports {IOBITS[59]}]

set_property PACKAGE_PIN P5 [get_ports {IOBITS[60]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[60]}]
set_property DRIVE 24 [get_ports {IOBITS[60]}]
set_property SLEW SLOW [get_ports {IOBITS[60]}]

set_property PACKAGE_PIN P6 [get_ports {IOBITS[61]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[61]}]
set_property DRIVE 24 [get_ports {IOBITS[61]}]
set_property SLEW SLOW [get_ports {IOBITS[61]}]

set_property PACKAGE_PIN P1 [get_ports {IOBITS[62]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[62]}]
set_property DRIVE 24 [get_ports {IOBITS[62]}]
set_property SLEW SLOW [get_ports {IOBITS[62]}]

set_property PACKAGE_PIN P2 [get_ports {IOBITS[63]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[63]}]
set_property DRIVE 24 [get_ports {IOBITS[63]}]
set_property SLEW SLOW [get_ports {IOBITS[63]}]

set_property PACKAGE_PIN P143 [get_ports {IOBITS[64]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[64]}]
set_property DRIVE 24 [get_ports {IOBITS[64]}]
set_property SLEW SLOW [get_ports {IOBITS[64]}]

set_property PACKAGE_PIN P144 [get_ports {IOBITS[65]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[65]}]
set_property DRIVE 24 [get_ports {IOBITS[65]}]
set_property SLEW SLOW [get_ports {IOBITS[65]}]

set_property PACKAGE_PIN P141 [get_ports {IOBITS[66]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[66]}]
set_property DRIVE 24 [get_ports {IOBITS[66]}]
set_property SLEW SLOW [get_ports {IOBITS[66]}]

set_property PACKAGE_PIN P142 [get_ports {IOBITS[67]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[67]}]
set_property DRIVE 24 [get_ports {IOBITS[67]}]
set_property SLEW SLOW [get_ports {IOBITS[67]}]

set_property PACKAGE_PIN P139 [get_ports {IOBITS[68]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[68]}]
set_property DRIVE 24 [get_ports {IOBITS[68]}]
set_property SLEW SLOW [get_ports {IOBITS[68]}]

set_property PACKAGE_PIN P140 [get_ports {IOBITS[69]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[69]}]
set_property DRIVE 24 [get_ports {IOBITS[69]}]
set_property SLEW SLOW [get_ports {IOBITS[69]}]

set_property PACKAGE_PIN P137 [get_ports {IOBITS[70]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[70]}]
set_property DRIVE 24 [get_ports {IOBITS[70]}]
set_property SLEW SLOW [get_ports {IOBITS[70]}]

set_property PACKAGE_PIN P138 [get_ports {IOBITS[71]}]
set_property IOSTANDARD LVTTL [get_ports {IOBITS[71]}]
set_property DRIVE 24 [get_ports {IOBITS[71]}]
set_property SLEW SLOW [get_ports {IOBITS[71]}]

