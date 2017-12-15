library ieee;
use ieee.std_logic_1164.all;

entity pipo is
	port(
		clk  :in	std_logic;	-- input clock
		en   :in	std_logic;	-- input enable or load
		rst  :in	std_logic;	-- input reset
		din  :in 	std_logic_vector; -- input  flexible size vector
		dout :out std_logic_vector);-- output flexible size vector
end pipo;

architecture behavioral of pipo is
	
	constant ZERO :	std_logic_vector(din'range):= (others=> '0'); -- a vector of zero for reset data to zero

begin

	reg_process:process(clk) 
	begin
		if(clk'EVENT and clk='1' )then -- positive edge of clock
			if(rst ='1') then
				dout <= ZERO; -- clear register value to zero
			elsif(en = '1')	 then
				dout <= din;  -- load data
			end if;
		end if;
	end process;
end behavioral;
			
