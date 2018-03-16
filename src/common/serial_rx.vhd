----------------------------------------------------------------------------------
-- serial_rx VHDL
-- Translated from Mojo-base Verilog project @ http://embeddedmicro.com/frontend/files/userfiles/files/Mojo-Base.zip
-- by Xark
--
-- This module receives serial data from USB/AVR
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity serial_rx is
	generic (
		CLK_PER_BIT	: natural := 50;
		CTR_SIZE	: natural := 6
	);
	port (
		clk			: in  std_logic;
		rst			: in  std_logic;
		rx			: in  std_logic;
		new_data	: out std_logic;
		data		: out std_logic_vector(7 downto 0)
	);
end entity serial_rx;

architecture RTL of serial_rx is

type rx_state_type is (IDLE, WAIT_HALF, WAIT_FULL, WAIT_HIGH);

signal state_d, state_q			: rx_state_type := IDLE;
signal ctr_d, ctr_q				: unsigned(CTR_SIZE-1 downto 0);
signal bit_ctr_d, bit_ctr_q		: unsigned(2 downto 0);
signal data_d, data_q			: std_logic_vector(7 downto 0);
signal new_data_d, new_data_q	: std_logic;
signal rx_d, rx_q				: std_logic;

begin

new_data	<= new_data_q;
data		<= data_q;

rx_comb: process(rx, rx_q, state_q, ctr_q, bit_ctr_q, data_q)
begin
	rx_d 		<= rx;
	state_d		<= state_q;
	ctr_d		<= ctr_q;
	bit_ctr_d	<= bit_ctr_q;
	data_d		<= data_q;
	new_data_d	<= '0';

	case state_q is
		when IDLE =>
			bit_ctr_d 	<= "000";
			ctr_d 		<= (others => '0');
			if rx_q = '0' then
				state_d		<= WAIT_HALF;
			end if;
		when WAIT_HALF =>
			ctr_d 		<= ctr_q + 1;
			if ctr_q = (CLK_PER_BIT/2) then
				ctr_d		<= (others => '0');
				state_d		<= WAIT_FULL;
			end if;
		when WAIT_FULL =>
			ctr_d 		<= ctr_q + 1;
			if ctr_q = (CLK_PER_BIT-1) then
				data_d		<= rx_q & data_q(7 downto 1);
				bit_ctr_d	<= bit_ctr_q + 1;
				ctr_d		<= (others => '0');
				if bit_ctr_q = 7 then
					state_d		<= WAIT_HIGH;
					new_data_d	<= '1';
				end if;
			end if;
		when WAIT_HIGH =>
			if rx_q = '1' then
				state_d		<= IDLE;
			end if;
		when others =>
			state_d		<= IDLE;
	end case;
end process rx_comb;

rx_seq: process(clk, rst)
begin
	if rst = '1' then
		ctr_q		<= (others => '0');
		bit_ctr_q	<= "000";
		new_data_q	<= '0';
		state_q		<= IDLE;
	elsif rising_edge(clk) then
		ctr_q		<= ctr_d;
		bit_ctr_q	<= bit_ctr_d;
		new_data_q	<= new_data_d;
		state_q		<= state_d;

		rx_q		<= rx_d;
		data_q		<= data_d;
	end if;
end process rx_seq;

end RTL;
