--------------------------------------------------------------------------------
-- Title       : Confgurable Ring Counter Behavioral and Structural Code
--------------------------------------------------------------------------------
-- File        : ring_counter.vhd
-- Author      : alimpk
--------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity ring_counter is
	generic (
		size : positive := 4 );
	port (
		clk   : in  std_logic;
		clr   : in  std_logic;
		count : out std_logic_vector(size - 1 downto 0)) ;

end entity ; -- ring_counter

architecture behavioral of ring_counter is

	signal cnt : std_logic_vector(count'range);

begin

	ring_proc : process(clk, clr)

	begin
		if clr = '1' then

			cnt <= (0 => '1' ,others => '0');

		elsif (rising_edge(clk)) then

			cnt_loop : for i in cnt'range loop

				cnt((i+1) rem size) <= cnt (i) ;

			end loop cnt_loop;

		end if;

	end process ; -- ring_proc

	count <= cnt ;

end architecture ; -- behavioral

architecture structural of ring_counter is

	signal cnt       : std_logic_vector(count'range);
	constant init    : std_logic_vector(count'range) := ((size -1) => '1', others => '0') ;
	signal flops_val : std_logic_vector(count'range);

begin
	flops_val <= cnt when clr = '0' else init;

	flops : for index in 0 to count'length -1 generate
		i_dff : entity work.dff
			port map (
				clk  => clk ,
				rst  => '0' ,
				din  => flops_val(index),
				qout => cnt((index+1) rem size)
			);
	end generate flops;
	count <= cnt;
end architecture ; -- structural
