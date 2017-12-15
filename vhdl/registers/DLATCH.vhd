
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity DLATCH is
    Port ( 	clk: in  STD_LOGIC;
				rst 	: in  STD_LOGIC;
				d 	: in  STD_LOGIC;
				q 	: out  STD_LOGIC;
				qb : out  STD_LOGIC);
end DLATCH;

architecture Behavioral of DLATCH is

begin
	PROCESS(clk,rst)
	BEGIN
		
		IF(rst = '1' )THEN 
			q <= '0';
			qB <= '1';
		ELSIF(clk = '1' )THEN 
			q <= d;
			qb <= NOT d;
		END IF;
	
	
	END PROCESS;

end Behavioral;

