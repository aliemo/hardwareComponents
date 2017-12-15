library ieee;
use ieee.std_logic_1164.all;
entity siso is
	generic(size : integer := 8);
	port(clk ,en,rst :in std_logic;	
		din  :in 	std_logic;
		dout  :out 	std_logic);
end siso;

architecture behavioral of siso is
	signal reg :std_logic_vector(size -1 downto 0):= (others=>'0');
	constant ZERO :	std_logic_vector(size -1 downto 0):= (others=> '0');
	
begin
	reg_process:process(clk,en)
	begin
		if(clk'EVENT and clk='1' )then 
			if(rst ='1') then
				reg <= ZERO;
				dout <= reg(7);
			elsif(en = '1')	 then
				reg(reg'LENGTH -1 downto 1) <= reg(reg'LENGTH -2 downto 0);
				reg(0) <= din;
				dout <= reg(7);
			end if;
		end if;
	end process;
end behavioral;