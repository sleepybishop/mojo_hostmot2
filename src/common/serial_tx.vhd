----------------------------------------------------------------------------------
-- serial_tx VHDL
-- Translated from Mojo-base Verilog project @ http://embeddedmicro.com/frontend/files/userfiles/files/Mojo-Base.zip
-- by Xark
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity serial_tx is
	generic (
		CLK_PER_BIT	: natural := 50;
		CTR_SIZE	: natural := 6
	);
	port (
		clk			: in  std_logic;
		rst			: in  std_logic;
		tx			: out std_logic;
		tx_block	: in  std_logic;
		busy		: out std_logic;
		new_data	: in  std_logic;
		data 		: in  std_logic_vector(7 downto 0)
	);
end entity serial_tx;

architecture RTL of serial_tx is

type tx_state_type is (IDLE, START_BIT, DATA_BITS, STOP_BIT);

signal state_d, state_q		: tx_state_type	:= IDLE;
signal ctr_d, ctr_q			: unsigned(CTR_SIZE-1 downto 0);
signal bit_ctr_d, bit_ctr_q	: unsigned(2 downto 0);
signal data_d, data_q		: std_logic_vector(7 downto 0);
signal tx_d, tx_q			: std_logic;
signal busy_r				: std_logic;
signal block_d, block_q		: std_logic;

begin

tx		<= tx_q;
busy	<= busy_r;

tx_comb: process(tx_block, block_q, ctr_q, bit_ctr_q, data_q, state_q, data, new_data)
begin
	block_d 	<= tx_block;
	ctr_d 		<= ctr_q;
	bit_ctr_d 	<= bit_ctr_q;
	data_d 		<= data_q;
	state_d 	<= state_q;

	case state_q is
		when IDLE =>
			if block_q = '1' then
				busy_r		<= '1';
				tx_d 		<= '1';
			else
				busy_r		<=	'0';
				tx_d		<= 	'1';
				bit_ctr_d	<= "000";
				ctr_d 		<=	(others => '0');
				if new_data = '1' then
					data_d		<= data;
					state_d 	<= START_BIT;
					busy_r		<= '1';
				end if;
			end if;
		when START_BIT =>
			busy_r	<= '1';
			ctr_d	<= ctr_q + 1;
			tx_d	<= '0';
			if ctr_q = (CLK_PER_BIT-1) then
				ctr_d	<= (others => '0');
				state_d	<= DATA_BITS;
			end if;
		when DATA_BITS =>
			busy_r	<= '1';
			tx_d	<= data_q(0);
			ctr_d 	<= ctr_q + 1;
			if ctr_q = (CLK_PER_BIT-1) then
				data_d		<= "0" & data_q(7 downto 1);
				ctr_d		<= (others => '0');
				bit_ctr_d	<= bit_ctr_q + 1;
				if bit_ctr_q = 7 then
					state_d	<= STOP_BIT;
				end if;
			end if;
		when STOP_BIT =>
			busy_r	<= '1';
			tx_d	<= '1';
			ctr_d	<= ctr_q + 1;
			if ctr_q = (CLK_PER_BIT-1) then
				state_d	<= IDLE;
			end if;
		when others =>
			state_d	<= IDLE;
	end case;
end process tx_comb;

tx_seq: process(clk, rst)
begin
	if rst = '1' then
		state_q	<= IDLE;
		tx_q	<= '1';
	elsif rising_edge(clk) then
		state_q	<= state_d;
		tx_q	<= tx_d;

		block_q		<= block_d;
		data_q		<= data_d;
		bit_ctr_q	<= bit_ctr_d;
		ctr_q		<= ctr_d;
	end if;
end process tx_seq;

end RTL;