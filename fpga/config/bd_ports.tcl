#------------------------------------------------------------------------------
# File        : bd_ports.tcl
# Author      : Jan Stocker
# Company     : CatPV
# Created     : Wed Sep 29 13:53:19 2020
# Last update : Tue Sep 29 13:53:19 2020
#------------------------------------------------------------------------------
# bd_ports.tcl
# 
# Adds the default ports to the block design including
# - rgmii interface
# - mdio io interface
# - clock and reset in
# - switch in
# 
#------------------------------------------------------------------------------

# 25 MHz clock input
create_bd_port -dir I clk_sys

# reset
set reset [ create_bd_port -dir I -type rst reset ]
set_property -dict [ list CONFIG.POLARITY {ACTIVE_HIGH} ] $reset

# LED
create_bd_port -dir O led_fpga_red
create_bd_port -dir O led_bb_red
create_bd_port -dir O led_bb_green
