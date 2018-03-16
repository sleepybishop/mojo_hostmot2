----------------------------------------------------------------------------------
-- cclk_detector VHDL
-- Translated from Mojo-base Verilog project @ http://embeddedmicro.com/frontend/files/userfiles/files/Mojo-Base.zip
-- by Xark
--
-- This module monitors cclk line from the AVR microcontroller.  When this line
-- has been held high for 10.24 microseconds (@ 50Mhz clk) the ready signal will
-- be asserted.  Before this time the FPGA must not take control of the AVR outputs.
--
-- See http://embeddedmicro.com/tutorials/the-mojo/avr-interface
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity cclk_detector is
	port (
		clk		: in  std_logic;	-- 50Mhz clock 
		rst		: in  std_logic;	-- reset signal
		cclk	: in  std_logic;	-- configuration clock (?) from AVR
		ready	: out std_logic		-- output signal that FPGA I/O is safe to use
	);
end cclk_detector;

architecture RTL of cclk_detector is

-- NOTE: Empirically determined 13 bits of delay needed for ~164 microseconds delay after cclk stops going
--       low (vs 10.25 usec delay in official Verilog version). This determined by running a simple test design that "blasts"
--       data out of UART whenever tx_busy is false (an "echo test", which waits for input before outputting worked
--       fine with smaller delay).
--       My guess is this delay may be needed to establish the USB serial connection on the AVR.  When using a
--       smaller delay with the above UART output test, the Mojo seems to have trouble initializing properly (and
--       may require a power cycle).  This was tested with the latest AVR firmware linked from forum as of
--       5-28-2013 (no obvious version number) http://forum.embeddedmicro.com/viewtopic.php?f=2&t=69
signal ctr_d	: unsigned(12 downto 0);
signal ctr_q	: unsigned(12 downto 0);
signal ready_d	: std_logic;
signal ready_q	: std_logic;

begin
ready <= ready_q;

cclk_comb: process(cclk, ctr_q)
begin
	ready_d <= '0';		-- default to not ready
	if cclk = '0' then
		ctr_d	<= (others => '0');	-- reset counter if cclk is seen to be low
	elsif ctr_q /= "1111111111111" then
		ctr_d	<= ctr_q + 1;		-- if not max (8192 * 20ns = 164.24 usec), increment counter
	else
		ctr_d	<= ctr_q;			-- maintain current max count
		ready_d	<= '1';				-- indicate ready (override default)
	end if;
end process cclk_comb;

cclk_seq: process(clk, rst)
begin
	if rst = '1' then				-- on reset
		ctr_q 	<= (others => '0');		-- reset counter
		ready_q <= '0';					-- indicate not ready
	elsif rising_edge(clk) then		-- on 50Mhz clock tick
		ctr_q	<= ctr_d;				-- latch signals from combinational process
		ready_q	<= ready_d;
	end if;
end process cclk_seq;

end RTL;
