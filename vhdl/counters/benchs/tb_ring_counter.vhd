library ieee;
use ieee.std_logic_1164.all;

-----------------------------------------------------------

entity tb_ring_counter is
end entity tb_ring_counter;

-----------------------------------------------------------

architecture testbench of tb_ring_counter is

	-- Testbench DUT generics
	component ring_counter is
		generic (
			size : positive := 4 );
		port (
			clk   : in  std_logic;
			clr   : in  std_logic;
			count : out std_logic_vector(size - 1 downto 0)) ;
	end component ring_counter;
	-- Testbench DUT ports


	signal clk :  std_logic := '0';
	signal clr :  std_logic;
	signal count :  std_logic_vector(3 downto 0);

begin

	dut : ring_counter
		generic map(
			size => 4	
		)
		port map (
			clk   => clk  ,
			clr   => clr  ,
			count => count
		);

	clk <= not clk after 10 ns ;
	clr <= '1', '0' after 20 ns;

end architecture testbench;
