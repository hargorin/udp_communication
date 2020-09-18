--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
--Date        : Fri Sep 18 18:22:24 2020
--Host        : hargorin running 64-bit Ubuntu 20.04.1 LTS
--Command     : generate_target blinking_wrapper.bd
--Design      : blinking_wrapper
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity blinking_wrapper is
  port (
    clk_sys : in STD_LOGIC;
    led_bb_red : out STD_LOGIC_VECTOR ( 0 to 0 );
    led_fpga_red : out STD_LOGIC_VECTOR ( 0 to 0 );
    rst_n : in STD_LOGIC
  );
end blinking_wrapper;

architecture STRUCTURE of blinking_wrapper is
  component blinking is
  port (
    rst_n : in STD_LOGIC;
    clk_sys : in STD_LOGIC;
    led_fpga_red : out STD_LOGIC_VECTOR ( 0 to 0 );
    led_bb_red : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component blinking;
begin
blinking_i: component blinking
     port map (
      clk_sys => clk_sys,
      led_bb_red(0) => led_bb_red(0),
      led_fpga_red(0) => led_fpga_red(0),
      rst_n => rst_n
    );
end STRUCTURE;
