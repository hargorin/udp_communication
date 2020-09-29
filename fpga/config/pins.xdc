#------------------------------------------------------------------------------------------
# Pin assignments
#------------------------------------------------------------------------------------------
# Clock and reset
set_property PACKAGE_PIN T14 [get_ports clk_sys]
set_property IOSTANDARD LVCMOS33 [get_ports clk_sys]

set_property PACKAGE_PIN B6 [get_ports clk_mgt_p]

# User
set_property PACKAGE_PIN K18 [get_ports {led_fpga_red[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_fpga_red[0]}]
set_property PACKAGE_PIN D11 [get_ports {led_bb_red[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led_bb_red[0]}]
set_property PACKAGE_PIN C12 [get_ports led_bb_green]
set_property IOSTANDARD LVCMOS33 [get_ports led_bb_green]


#------------------------------------------------------------------------------------------
# Reset input
#------------------------------------------------------------------------------------------
set_property PACKAGE_PIN L5 [get_ports rst_n]
set_property IOSTANDARD LVCMOS18 [get_ports rst_n]
set_property PULLUP true [get_ports rst_n]
set_property PACKAGE_PIN M5 [get_ports rst_low]
set_property IOSTANDARD LVCMOS18 [get_ports rst_low]


#------------------------------------------------------------------------------------------
# TIMING
#------------------------------------------------------------------------------------------
create_clock -period 8.000 -name clk_mgt_p -waveform {0.000 4.000} [get_ports clk_mgt_p]
create_clock -period 40.000 -name clk_sys -waveform {0.000 20.000} [get_ports clk_sys]


#------------------------------------------------------------------------------------------
# set false path for debug vio and ila
#------------------------------------------------------------------------------------------
#set_false_path -through [get_pins {
#{vio_sysclk_i/probe_*}
#{tx_ila_i/trig*}}]


#------------------------------------------------------------------------------------------
# Design config
#------------------------------------------------------------------------------------------
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]

