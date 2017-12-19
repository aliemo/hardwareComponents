--------------------------------------------------------------------------------
-- Title       : Size confgurable Johnson Counter Behavioral and Structural Code
--------------------------------------------------------------------------------
-- File        : johnson_counter.vhd
-- Author      : alimpk
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity johnson_counter is
	generic (
		size : positive := 4 );
	port (
		clk   : in  std_logic;
		clr   : in  std_logic;
		count : out std_logic_vector(size - 1 downto 0)) ;

end entity ; -- johnson_counter

architecture behavioral of johnson_counter is

	signal cnt : std_logic_vector(count'range);

begin

	ring_proc : process(clk, clr)

	begin
		if clr = '1' then

			cnt <= (0 => '1' ,others => '0');

		elsif (rising_edge(clk)) then

			cnt_loop : for i in 0 ti cnt'length - 2 loop

				cnt(i+1) <= cnt (i) ;

			end loop cnt_loop;

			cnt(0) <= not cnt(cnt'length - 1) ;

		end if;

	end process ; -- ring_proc

	count <= cnt ;

end architecture ; -- behavioral
