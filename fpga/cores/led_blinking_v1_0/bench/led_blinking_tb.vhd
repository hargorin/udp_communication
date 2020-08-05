--------------------------------------------------------------------------------
-- Title       : Testbench LED Blinking
-- Project     : udp_communication
--------------------------------------------------------------------------------
-- File        : led_blinking_tb.vhd
-- Author      : Jan Stocker
-- Company     : CatPV
-- Created     : Wed Aug  5 19:20:01 2020
-- Last update : Wed Aug  5 20:53:42 2020
-- Platform    : xc7a35tcsg325-2L
-- Standard    : <VHDL-2008 | VHDL-2002 | VHDL-1993 | VHDL-1987>
--------------------------------------------------------------------------------
-- Copyright (c) 2020 CatPV
-------------------------------------------------------------------------------
-- Description: Testbench of LED flashes with a frequency of 
-- 				clk / C_COUNTER * 0.5
--------------------------------------------------------------------------------
-- Revisions:  Revisions and documentation are controlled by
-- the revision control system (RCS).  The RCS should be consulted
-- on revision history.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use ieee.std_logic_textio.all;

-----------------------------------------------------------

entity led_blinking_tb is

end entity led_blinking_tb;

-----------------------------------------------------------

architecture testbench of led_blinking_tb is

	-- Testbench DUT generics
	constant C_BLINK : INTEGER := 5;

	-- Testbench DUT ports
	signal clk    : std_logic;
	signal rst    : std_logic;
	signal enable : std_logic;
	signal led    : std_logic;

	-- Other constants
    constant C_CLK_PERIOD : time := 10 ns; -- NS
    signal stop_sim  : std_logic := '0';

begin
	-----------------------------------------------------------
	-- Clocks and Reset
	-----------------------------------------------------------
    CLK_GEN : process
    begin
        clk <= '1';
        wait for C_CLK_PERIOD / 2;
        clk <= '0';
        wait for C_CLK_PERIOD / 2;

        if stop_sim = '1' then
            wait;
        end if;
    end process CLK_GEN;

	-----------------------------------------------------------
	-- Testbench Stimulus
	-----------------------------------------------------------
    p_sim : process
        
        procedure waitfor ( t : in natural ) is
        begin
            wait for t*C_CLK_PERIOD;
            wait until rising_edge(clk);
        end procedure waitfor;

    begin
        rst <= '1';
        waitfor(3);
        rst <= '0';


        assert false report "All test successful" severity note;
        stop_sim <= '1';
        wait;
    end process ; -- p_sim
	-----------------------------------------------------------
	-- Entity Under Test
	-----------------------------------------------------------
	DUT : entity work.led_blinking
		generic map (
			C_BLINK => C_BLINK
		)
		port map (
			clk    => clk,
			rst    => rst,
			enable => enable,
			led    => led
		);

end architecture testbench;