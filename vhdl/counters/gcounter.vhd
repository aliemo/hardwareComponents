LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY counter IS
	PORT(	clk : IN	STD_LOGIC;
			rst : IN	STD_LOGIC;
			res : OUT	STD_LOGIC_VECTOR);
END counter;

ARCHITECTURE behavioral OF counter IS
	SIGNAL temp : STD_LOGIC_VECTOR(res'RANGE):= (OTHERS => '0');
BEGIN

	cnt_proc:PROCESS(clk)
		BEGIN
			IF (clk'EVENT AND clk = '1') THEN
				IF (rst = '1') THEN
					temp <= (OTHERS => '0');
				ELSE
					temp <= temp + '1';
			END IF;
	END process;
	res <= temp;
END;