############################################################
# Pin assignments
############################################################
# Clock and reset
set_property PACKAGE_PIN T14 [get_ports {SYS_CLK[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {SYS_CLK[0]}]

set_property PACKAGE_PIN B6 [get_ports mgt_clk_p]
set_property PACKAGE_PIN B5 [get_ports mgt_clk_n]

# User
set_property PACKAGE_PIN K18 [get_ports led]
set_property IOSTANDARD LVCMOS33 [get_ports led]


############################################################
# TIMING
############################################################
create_clock -period 40.000 -name {SYS_CLK[0]} -waveform {0.000 20.000} [get_ports {SYS_CLK[0]}]
create_clock -period 15.152 -name fsys_i/STARTUP_0/U0/I -waveform {0.000 7.576} [get_pins fsys_i/STARTUP_0/U0/STARTUPE2_inst/CFGMCLK]
set_clock_groups -asynchronous -group [get_clocks fsys_i/STARTUP_0/U0/I] -group [get_clocks {SYS_CLK[0]}]
set_clock_groups -asynchronous -group [get_clocks {SYS_CLK[0]}] -group [get_clocks fsys_i/STARTUP_0/U0/I]
set_property C_CLK_INPUT_FREQ_HZ 300000000 [get_debug_cores dbg_hub]
set_property C_ENABLE_CLK_DIVIDER false [get_debug_cores dbg_hub]
set_property C_USER_SCAN_CHAIN 1 [get_debug_cores dbg_hub]
connect_debug_port dbg_hub/clk [get_nets clk]


############################################################
# Board
############################################################
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]