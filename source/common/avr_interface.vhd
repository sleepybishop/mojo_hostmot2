----------------------------------------------------------------------------------
-- avr_interface VHDL
-- Translated from Mojo-base Verilog project @ http://embeddedmicro.com/frontend/files/userfiles/files/Mojo-Base.zip
-- by Xark
--
-- This module manages the communcation with AVR microcontroller on the Mojo board
-- and provides a convenient interface for reading analog samples and using the USB
-- UART interface.
--
-- See http://embeddedmicro.com/tutorials/the-mojo/avr-interface
--
-- NOTE: This also incorporates a suggestion from russm to add a "miso_en" line
-- to control miso tristate and avoid systhesis warning (and save a few gates).
-- See http://forum.embeddedmicro.com/viewtopic.php?f=6&t=45#p127
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity avr_interface is
	port (
		clk				: in  std_logic;
		rst				: in  std_logic;
		cclk			: in  std_logic;

		spi_miso		: out std_logic;
		spi_mosi		: in  std_logic;
		spi_sck			: in  std_logic;
		spi_ss			: in  std_logic;
		spi_channel		: out std_logic_vector(3 downto 0);

		tx				: out std_logic;
		rx				: in  std_logic;

		channel			: in  std_logic_vector(3 downto 0);
		new_sample		: out std_logic;
		sample			: out std_logic_vector(9 downto 0);
		sample_channel	: out std_logic_vector(3 downto 0);

		tx_data			: in  std_logic_vector(7 downto 0);
		new_tx_data		: in  std_logic;
		tx_busy			: out std_logic;
		tx_block		: in  std_logic;

		rx_data			: out std_logic_vector(7 downto 0);
		new_rx_data		: out std_logic
	);
end avr_interface;

architecture RTL of avr_interface is

	signal ready			: std_logic;
	signal n_rdy			: std_logic;
	signal spi_done			: std_logic;
	signal spi_dout			: std_logic_vector(7 downto 0);
	signal tx_m				: std_logic;
	signal spi_miso_m		: std_logic;
	signal spi_miso_en_m	: std_logic;

	signal byte_ct_d, byte_ct_q					: std_logic;
	signal sample_d, sample_q					: std_logic_vector(9 downto 0);
	signal new_sample_d, new_sample_q			: std_logic;
	signal sample_channel_d, sample_channel_q	: std_logic_vector(3 downto 0);
	
begin

n_rdy <= NOT ready;

cclk_detector : entity work.cclk_detector
	port map (
		clk		=> clk,
		rst		=> rst,
		cclk	=> cclk,
		ready	=> ready
	);

spi_slave	: entity work.spi_slave
	port map (
		clk		=> clk,
		rst		=> n_rdy,
		ss		=> spi_ss,
		mosi	=> spi_mosi,
		miso	=> spi_miso_m,
		miso_en	=> spi_miso_en_m,
		sck		=> spi_sck,
		done	=> spi_done,
		din		=> "11111111",
		dout	=> spi_dout
	);
	
serial_rx	: entity work.serial_rx
	generic map (
		CLK_PER_BIT	=> 100,
		CTR_SIZE	=> 7
	)
	port map (
		clk			=> clk,
		rst			=> rst,
		rx			=> rx,
		data		=> rx_data,
		new_data	=> new_rx_data
	);

serial_tx	: entity work.serial_tx
	generic map (
		CLK_PER_BIT	=>	100,
		CTR_SIZE	=>	7
	)
	port map (
		clk			=> clk,
		rst			=> rst,
		tx			=> tx_m,
		tx_block	=> tx_block,
		busy		=> tx_busy,
		data		=> tx_data,
		new_data	=> new_tx_data
	);


new_sample		<= new_sample_q;
sample			<= sample_q;
sample_channel	<= sample_channel_q;

avr_comb	: process(ready, channel, byte_ct_q, sample_q, sample_channel_q, spi_miso_m, spi_miso_en_m, spi_ss, spi_done, spi_dout, tx_m)
begin
	if ready = '1' then
		if spi_miso_en_m = '1' then
			spi_miso	<= spi_miso_m;
		else
			spi_miso	<= 'Z';
		end if;
		spi_channel <= channel;
		tx			<= tx_m;
	else
		spi_channel <= "ZZZZ";
		spi_miso	<= 'Z';
		tx			<= 'Z';
	end if;

	byte_ct_d		<= byte_ct_q;
	sample_d		<= sample_q;
	new_sample_d	<= '0';
	sample_channel_d <= sample_channel_q;

	if spi_ss = '1' then
		byte_ct_d <= '0';
	end if;

	if spi_done = '1' then
		if byte_ct_q = '0' then
			sample_d(7 downto 0)	<= spi_dout;
			byte_ct_d				<= '1';
		else
			sample_d(9 downto 8)	<= spi_dout(1 downto 0);
			sample_channel_d		<= spi_dout(7 downto 4);
			byte_ct_d				<= '1';
			new_sample_d			<= '1';
		end if;
	end if;
end process avr_comb;

avr_seq: process (clk, n_rdy)
begin
	if n_rdy = '1' then
		byte_ct_q		<= '0';
		sample_q		<= (others => '0');
		new_sample_q	<= '0';
	elsif rising_edge(clk) then
		byte_ct_q		<= byte_ct_d;
		sample_q		<= sample_d;
		new_sample_q	<= new_sample_d;

		sample_channel_q	<= sample_channel_d;
	end if;
end process avr_seq;

end RTL;
