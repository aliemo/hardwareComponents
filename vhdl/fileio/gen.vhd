
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity gen is
	port (
		clk : in std_ulogic;
		rst : in std_ulogic;
		a_i : in std_ulogic_vector(3 downto 0);
		b_i : in std_ulogic_vector(3 downto 0);
		c_o : out std_ulogic_vector(4 downto 0)
	);
end entity gen;

architecture RTL of gen is

begin
	name : process (clk, rst) is
	begin
		if rst = '1' then
			c_o <= (others => '0');
		elsif rising_edge(clk) then
			c_o <= std_ulogic_vector(unsigned('0' & a_i) + unsigned('0' & b_i));
		end if;
	end process name;

end architecture RTL;
