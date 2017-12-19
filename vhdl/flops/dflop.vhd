library ieee;
use ieee.std_logic_1164.all;

entity dff is
	port(
		clk  : in  std_logic;
		rst  : in  std_logic;
		din  : in  std_logic;
		qout : out std_logic);
end dff;

architecture behavioral of dff is

begin
	process(clk)
	begin
		if(rising_edge(clk))then
			if(rst='1') then
				qout <= '0';
			else
				qout <= din;
			end if;
		end if;
	end process;

end behavioral;

