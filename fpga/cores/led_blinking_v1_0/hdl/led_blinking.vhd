--------------------------------------------------------------------------------
-- Title       : LED Blinking
-- Project     : udp_communication
--------------------------------------------------------------------------------
-- File        : led_blinking.vhd
-- Author      : Jan Stocker
-- Company     : CatPV
-- Created     : Wed Aug  5 19:20:01 2020
-- Last update : Fri Oct  2 15:56:11 2020
-- Platform    : xc7a35tcsg325-2L
-- Standard    : <VHDL-2008 | VHDL-2002 | VHDL-1993 | VHDL-1987>
--------------------------------------------------------------------------------
-- Copyright (c) 2020 CatPV
-------------------------------------------------------------------------------
-- Description: LED flashes with a frequency of C_BLINK_FRQ
--------------------------------------------------------------------------------
-- Revisions:  Revisions and documentation are controlled by
-- the revision control system (RCS).  The RCS should be consulted
-- on revision history.
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;


entity led_blinking is
	generic (
		-- clk / C_BLINK * Duty Cycle = Blinking Frequency 
		C_BLINK_FRQ : INTEGER := 4 -- Hz
	);
	port (
		clk 		: IN  std_logic;
		rst			: IN  std_logic;
		enable		: IN  std_logic;
		led			: OUT std_logic

	);
	
end entity led_blinking;

architecture logic of led_blinking is
	-- toggles the LED
	signal toggle 		: std_logic := '0';
	constant C_BLINK 	: INTEGER := (125000000 / C_BLINK_FRQ / 2); 

begin
	
	 led <= toggle and enable; -- only drives LED when enable

	pulse: process (clk) is
		variable counter : integer range 0 to C_BLINK := 0;

	begin
		if rising_edge(clk) then
			if(rst = '1') then
				toggle <= '0';
				counter := 0;
			else
				if (counter = C_BLINK-1) then
					toggle <= not toggle;
					counter := 0;
				else
					counter := counter + 1;
				end if;
			end if;
		end if;

	end process pulse;
	
end architecture logic;