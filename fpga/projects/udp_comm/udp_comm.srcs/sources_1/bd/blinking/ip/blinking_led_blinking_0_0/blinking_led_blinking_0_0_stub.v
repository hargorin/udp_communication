// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
// Date        : Fri Sep 18 17:18:17 2020
// Host        : hargorin running 64-bit Ubuntu 20.04.1 LTS
// Command     : write_verilog -force -mode synth_stub
//               /home/jan/git/udp_communication/fpga/projects/udp_comm/udp_comm.srcs/sources_1/bd/blinking/ip/blinking_led_blinking_0_0/blinking_led_blinking_0_0_stub.v
// Design      : blinking_led_blinking_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcsg325-2L
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "led_blinking,Vivado 2019.2.1" *)
module blinking_led_blinking_0_0(clk, rst, enable, led)
/* synthesis syn_black_box black_box_pad_pin="clk,rst,enable,led" */;
  input clk;
  input rst;
  input enable;
  output led;
endmodule
