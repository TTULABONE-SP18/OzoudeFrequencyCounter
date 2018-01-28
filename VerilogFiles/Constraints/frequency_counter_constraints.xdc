# Clock signal
set_property PACKAGE_PIN W5 [get_ports CLK]
	set_property IOSTANDARD LVCMOS33 [get_ports CLK]
	create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports CLK]

#Pmod Header JA
#Sch name = JA1
set_property PACKAGE_PIN J1 [get_ports {IN[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {IN[0]}]

#7 segment display
set_property PACKAGE_PIN W7 [get_ports {cathode[0]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {cathode[0]}]
set_property PACKAGE_PIN W6 [get_ports {cathode[1]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {cathode[1]}]
set_property PACKAGE_PIN U8 [get_ports {cathode[2]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {cathode[2]}]
set_property PACKAGE_PIN V8 [get_ports {cathode[3]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {cathode[3]}]
set_property PACKAGE_PIN U5 [get_ports {cathode[4]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {cathode[4]}]
set_property PACKAGE_PIN V5 [get_ports {cathode[5]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {cathode[5]}]
set_property PACKAGE_PIN U7 [get_ports {cathode[6]}]
	set_property IOSTANDARD LVCMOS33 [get_ports {cathode[6]}]

set_property PACKAGE_PIN V7 [get_ports DP]
	set_property IOSTANDARD LVCMOS33 [get_ports DP]

set_property PACKAGE_PIN U2 [get_ports {anode[0]}]
	set_property IOSTanodeDARD LVCMOS33 [get_ports {anode[0]}]
set_property PACKAGE_PIN U4 [get_ports {anode[1]}]
	set_property IOSTanodeDARD LVCMOS33 [get_ports {anode[1]}]
set_property PACKAGE_PIN V4 [get_ports {anode[2]}]
	set_property IOSTanodeDARD LVCMOS33 [get_ports {anode[2]}]
set_property PACKAGE_PIN W4 [get_ports {anode[3]}]
	set_property IOSTanodeDARD LVCMOS33 [get_ports {anode[3]}]
