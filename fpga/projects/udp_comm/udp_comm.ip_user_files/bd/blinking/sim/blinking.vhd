--Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
----------------------------------------------------------------------------------
--Tool Version: Vivado v.2019.2.1 (lin64) Build 2729669 Thu Dec  5 04:48:12 MST 2019
--Date        : Fri Sep 18 17:16:30 2020
--Host        : hargorin running 64-bit Ubuntu 20.04.1 LTS
--Command     : generate_target blinking.bd
--Design      : blinking
--Purpose     : IP block netlist
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity blinking is
  port (
    clk_sys : in STD_LOGIC;
    led_fpga_red : out STD_LOGIC;
    rst_n : in STD_LOGIC
  );
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of blinking : entity is "blinking,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=blinking,x_ipVersion=1.00.a,x_ipLanguage=VHDL,numBlks=4,numReposBlks=4,numNonXlnxBlks=0,numHierBlks=0,maxHierDepth=0,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=1,numPkgbdBlks=0,bdsource=USER,synth_mode=OOC_per_IP}";
  attribute HW_HANDOFF : string;
  attribute HW_HANDOFF of blinking : entity is "blinking.hwdef";
end blinking;

architecture STRUCTURE of blinking is
  component blinking_led_blinking_0_0 is
  port (
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    enable : in STD_LOGIC;
    led : out STD_LOGIC
  );
  end component blinking_led_blinking_0_0;
  component blinking_clk_wiz_0_0 is
  port (
    reset : in STD_LOGIC;
    clk_in1 : in STD_LOGIC;
    clk_out1 : out STD_LOGIC;
    locked : out STD_LOGIC
  );
  end component blinking_clk_wiz_0_0;
  component blinking_xlconstant_0_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component blinking_xlconstant_0_0;
  component blinking_xlconstant_1_0 is
  port (
    dout : out STD_LOGIC_VECTOR ( 0 to 0 )
  );
  end component blinking_xlconstant_1_0;
  signal clk_in1_0_1 : STD_LOGIC;
  signal clk_wiz_0_clk_out1 : STD_LOGIC;
  signal led_blinking_0_led : STD_LOGIC;
  signal reset_0_1 : STD_LOGIC;
  signal xlconstant_0_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal xlconstant_1_dout : STD_LOGIC_VECTOR ( 0 to 0 );
  signal NLW_clk_wiz_0_locked_UNCONNECTED : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk_sys : signal is "xilinx.com:signal:clock:1.0 CLK.CLK_SYS CLK";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk_sys : signal is "XIL_INTERFACENAME CLK.CLK_SYS, CLK_DOMAIN blinking_clk_in1_0, FREQ_HZ 25000000, INSERT_VIP 0, PHASE 0.000";
  attribute X_INTERFACE_INFO of rst_n : signal is "xilinx.com:signal:reset:1.0 RST.RST_N RST";
  attribute X_INTERFACE_PARAMETER of rst_n : signal is "XIL_INTERFACENAME RST.RST_N, INSERT_VIP 0, POLARITY ACTIVE_HIGH";
begin
  clk_in1_0_1 <= clk_sys;
  led_fpga_red <= led_blinking_0_led;
  reset_0_1 <= rst_n;
clk_wiz_0: component blinking_clk_wiz_0_0
     port map (
      clk_in1 => clk_in1_0_1,
      clk_out1 => clk_wiz_0_clk_out1,
      locked => NLW_clk_wiz_0_locked_UNCONNECTED,
      reset => reset_0_1
    );
const_high: component blinking_xlconstant_1_0
     port map (
      dout(0) => xlconstant_1_dout(0)
    );
const_low: component blinking_xlconstant_0_0
     port map (
      dout(0) => xlconstant_0_dout(0)
    );
led_blinking_0: component blinking_led_blinking_0_0
     port map (
      clk => clk_wiz_0_clk_out1,
      enable => xlconstant_1_dout(0),
      led => led_blinking_0_led,
      rst => xlconstant_0_dout(0)
    );
end STRUCTURE;
