
# Create instance: clk_wiz, and set properties
set clk_wiz [create_bd_cell -type ip -vlnv xilinx.com:ip:clk_wiz:6.0 clk_wiz]
set_property -dict [list \
	CONFIG.PRIM_IN_FREQ {25.000} \
	CONFIG.CLKOUT2_USED {true} \
	CONFIG.CLKOUT1_REQUESTED_OUT_FREQ {125.000} \
	CONFIG.CLKOUT2_REQUESTED_OUT_FREQ {25.000} \
	CONFIG.CLKIN1_JITTER_PS {400.0} \
	CONFIG.MMCM_CLKFBOUT_MULT_F {40.000} \
	CONFIG.MMCM_CLKIN1_PERIOD {40.000} \
	CONFIG.MMCM_CLKIN2_PERIOD {10.0} \
	CONFIG.MMCM_CLKOUT0_DIVIDE_F {8.000} \
	CONFIG.MMCM_CLKOUT1_DIVIDE {40} \
	CONFIG.NUM_OUT_CLKS {2} \
	CONFIG.CLKOUT1_JITTER {220.126} \
	CONFIG.CLKOUT1_PHASE_ERROR {237.727} \
	CONFIG.CLKOUT2_JITTER {356.129} \
	CONFIG.CLKOUT2_PHASE_ERROR {237.727}\
] $clk_wiz

# Create instance: proc_sys_reset, and set properties
set proc_sys_reset [create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 proc_sys_reset]
set_property -dict [list \
	CONFIG.C_AUX_RESET_HIGH {0} \
] $proc_sys_reset

# Create instance: led_blinking, and set properties
set led_blinking [create_bd_cell -type ip -vlnv CatPV:UDP_Communication:led_blinking:1.0 led_blinking]

# Create instance: const_high, and set properties
set const_high [create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 const_high]

# Create instance: ila_deb, and set properties
set ila_deb [create_bd_cell -type ip -vlnv xilinx.com:ip:ila:6.2 ila_deb]
set_property -dict [list \
	CONFIG.C_DATA_DEPTH {65536} \
	CONFIG.C_NUM_OF_PROBES {3} \
	CONFIG.C_ADV_TRIGGER {true} \
	CONFIG.C_ENABLE_ILA_AXI_MON {false} \
	CONFIG.C_MONITOR_TYPE {Native} \
] $ila_deb


# Create port connections
connect_bd_net [get_bd_ports clk_sys] [get_bd_pins clk_wiz/clk_in1]
connect_bd_net [get_bd_ports reset] [get_bd_pins clk_wiz/reset] [get_bd_pins proc_sys_reset/ext_reset_in] [get_bd_pins ila_deb/probe0]
connect_bd_net [get_bd_pins clk_wiz/clk_out1] [get_bd_pins proc_sys_reset/slowest_sync_clk] [get_bd_pins led_blinking/clk] [get_bd_pins ila_deb/clk]
connect_bd_net [get_bd_pins clk_wiz/clk_out2] [get_bd_pins ila_deb/probe1]
connect_bd_net [get_bd_pins proc_sys_reset/mb_reset] [get_bd_pins led_blinking/rst]
connect_bd_net [get_bd_pins const_high/dout] [get_bd_pins led_blinking/enable]
connect_bd_net [get_bd_pins led_blinking/led] [get_bd_ports led_fpga_red] [get_bd_ports led_bb_red] [get_bd_ports led_bb_green] [get_bd_pins ila_deb/probe2]
