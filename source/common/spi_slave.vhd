----------------------------------------------------------------------------------
-- spi_slave VHDL
-- Translated from Mojo-base Verilog project @ http://embeddedmicro.com/frontend/files/userfiles/files/Mojo-Base.zip
-- by Xark
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;

entity spi_slave is
	port (
		clk		: in  std_logic;	-- 50Mhz clock 
		rst		: in  std_logic;	-- reset signal
		ss		: in  std_logic;	-- SPI slave select
		mosi	: in  std_logic;	-- SPI master out, slave in
		miso	: out std_logic;	-- SPI master in, slave out
		miso_en	: out std_logic;	-- true when slave selected (else miso should be 'Z')
		sck		: in  std_logic;	-- SPI clock
		done	: out std_logic;	-- done output signal
		din		: in  std_logic_vector(7 downto 0);	-- input data byte to send
		dout	: out std_logic_vector(7 downto 0)	-- output data byte received
	);
end spi_slave;

architecture RTL of spi_slave is

signal	mosi_d, mosi_q		: std_logic;
signal	miso_d, miso_q		: std_logic;
signal	ss_d, ss_q			: std_logic;
signal	sck_d, sck_q		: std_logic;
signal	sck_old_d, sck_old_q: std_logic;
signal	done_d, done_q		: std_logic;
signal	data_d, data_q		: std_logic_vector(7 downto 0);
signal	dout_d, dout_q		: std_logic_vector(7 downto 0);
signal	bit_ct_d, bit_ct_q	: unsigned(2 downto 0);

begin

done <= done_q;
dout <= dout_q;
miso_en <= NOT ss;
miso <= miso_q;

spi_slave_comb: process(ss, mosi, mosi_q, miso_q, sck, sck_q, sck_old_q, ss_q, din, data_q, dout_q, bit_ct_q)
begin
	ss_d 		<= ss;			-- register slave select input pin
	mosi_d		<= mosi;		-- register master out, slave in input pin
	sck_d		<= sck;			-- register SPI clock input pin
	sck_old_d	<= sck_q;		-- register SPI clock from sequential process as previous clock state
	miso_d		<= miso_q;		-- register miso from sequential process
	data_d		<= data_q;		-- register data to send from sequential process
	dout_d		<= dout_q;		-- register data recieved from sequential process 
	bit_ct_d	<= bit_ct_q;	-- register bit counter from sequential process 

	done_d		<= '0';		-- default to not complete

	if ss_q = '1' then				-- if this slave is not selected
		bit_ct_d	<= "000";		-- reset bit counter
		data_d		<= din;			-- reset byte to send
		miso_d		<= data_q(7);	-- reset first bit to send
	else
		if (sck_old_q = '0' and sck_q = '1') then 		-- on rising edge of SPI clock
			data_d		<= data_q(6 downto 0) & mosi_q;		-- shift in newly recieved LSB from master
			bit_ct_d	<= bit_ct_q + 1;					-- increment bit counter
			if bit_ct_q = "111" then						-- if counter at max
				dout_d		<= data_q(6 downto 0) & mosi_q;		-- set received output byte
				data_d		<= din;								-- reset byte to send
				done_d		<= '1';								-- indicate completion (override default)
			end if;
		elsif (sck_old_q = '1' and sck_q = '0') then 	-- on falling edge of SPI clock
			miso_d 		<= data_q(7);						-- output next data bit to master
		end if;
	end if;
end process spi_slave_comb;

spi_slave_seq: process(clk, rst)
begin
	if rst = '1' then					-- on reset signal
		done_q		<= '0';					-- clear done
		bit_ct_q	<= "000";				-- clear bit counter
		dout_q		<= "00000000";			-- clear data recieved
		miso_q		<= '1';					-- output 1 (if selected)
	elsif rising_edge(clk) then			-- on clock rising edge
		done_q		<= done_d;				-- latch signals from combinational process
		bit_ct_q	<= bit_ct_d;
		dout_q		<= dout_d;
		miso_q		<= miso_d;

		sck_q		<= sck_d;
		mosi_q		<= mosi_d;
		ss_q		<= ss_d;
		data_q		<= data_d;
		sck_old_q	<= sck_old_d;
	end if;

end process spi_slave_seq;
end RTL;
