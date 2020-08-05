--------------------------------------------------------------------------------
-- Title       : LED Blinking
-- Project     : udp_communication
--------------------------------------------------------------------------------
-- File        : led_blinking.vhd
-- Author      : Jan Stocker
-- Company     : CatPV
-- Created     : Wed Aug  5 19:20:01 2020
-- Last update : Wed Aug  5 20:16:02 2020
-- Platform    : xc7a35tcsg325-2L
-- Standard    : <VHDL-2008 | VHDL-2002 | VHDL-1993 | VHDL-1987>
--------------------------------------------------------------------------------
-- Copyright (c) 2020 CatPV
-------------------------------------------------------------------------------
-- Description: LED flashes with a frequency of clk / C_COUNTER * 0.5
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
		-- clk / C_COUNTER * Duty Cycle = Blinking Frequency 
		-- (125MHz / 15625000 * 0.5 = 4Hz)
		C_BLINK	: INTEGER := 15625000 

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
	signal toggle : std_logic := '0'; 

begin
	
	led <= toggle and enable; -- only drives LED when enable

	pulse: process (clk) is
		variable counter : integer range 0 to C_BLINK := 0;

	begin
		if rising_edge(clk) then
			if(rst = '1') then
				toggle <= 0;
				counter := 0;
			else
				if (counter = C_BLINK) then
					toggle <= not toggle;
					counter := 0;
				else
					counter := counter + 1;
				end if;
			end if;
		end if;

	end process pulse;
	
end architecture logic;