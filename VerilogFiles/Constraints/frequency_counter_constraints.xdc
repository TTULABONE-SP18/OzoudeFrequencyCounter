# Clock signal
set_property PACKAGE_PIN W5 [get_ports CLK]
	set_property IOSTANDARD LVCMOS33 [get_ports CLK]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports CLK]

#Pmod Header JA
#Sch name = JA1
set_property PACKAGE_PIN J1 [get_ports {IN}]
	set_property IOSTANDARD LVCMOS33 [get_ports {IN}]

#Switch
set_property PACKAGE_PIN V17 [get_ports {reset}]
	set_property IOSTANDARD LVCMOS33 [get_ports {reset}]


#7 segment display
set_property PACKAGE_PIN W7 [get_ports {segments[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {segments[0]}]
set_property PACKAGE_PIN W6 [get_ports {segments[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {segments[1]}]
set_property PACKAGE_PIN U8 [get_ports {segments[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {segments[2]}]
set_property PACKAGE_PIN V8 [get_ports {segments[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {segments[3]}]
set_property PACKAGE_PIN U5 [get_ports {segments[4]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {segments[4]}]
set_property PACKAGE_PIN V5 [get_ports {segments[5]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {segments[5]}]
set_property PACKAGE_PIN U7 [get_ports {segments[6]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {segments[6]}]

set_property PACKAGE_PIN V7 [get_ports DP]
	set_property IOSTANDARD LVCMOS33 [get_ports DP]

set_property PACKAGE_PIN U2 [get_ports {digits[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {digits[0]}]
set_property PACKAGE_PIN U4 [get_ports {digits[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {digits[1]}]
set_property PACKAGE_PIN V4 [get_ports {digits[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {digits[2]}]
set_property PACKAGE_PIN W4 [get_ports {digits[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {digits[3]}]
