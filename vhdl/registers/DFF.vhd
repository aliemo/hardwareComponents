
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity DFF is
	PORT(		clk: in  STD_LOGIC;
				rst: in  STD_LOGIC;
				d 	: in  STD_LOGIC;
				q 	: out  STD_LOGIC
				);
end DFF;

architecture Behavioral of DFF is

begin
	PROCESS(CLK)
	BEGIN
		IF(RISING_EDGE(clk))THEN
				IF(RST='1') THEN
					q<= '0';
				ELSE
					q<= D;
				END IF;
		END IF;		
	END PROCESS;


end Behavioral;

