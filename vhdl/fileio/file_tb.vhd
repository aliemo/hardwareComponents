library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use std.textio.all;

entity fileio is
end entity fileio;

architecture RTL of fileio is
	signal i_a, i_b : std_ulogic_vector(3 downto 0);
	signal i_c      : std_ulogic_vector(4 downto 0);

	signal clk : std_ulogic := '0';

	signal endoffile : std_ulogic := '0';

	component gen
		port(clk : in  std_ulogic;
			 rst : in  std_ulogic;
			 a_i : in  std_ulogic_vector(3 downto 0);
			 b_i : in  std_ulogic_vector(3 downto 0);
			 c_o : out std_ulogic_vector(4 downto 0));
	end component gen;
begin
	gen_inst : gen port map(
			clk => clk,
			rst => '0',
			a_i => i_a,
			b_i => i_b,
			c_o => i_c
		);

	clk <= not clk after 100 ps;

	input_gen : process is
		file inp_file : text open read_mode is "in.txt";
		variable inline : line;
		variable in_int : integer range 0 to 15;
	begin
		wait until clk = '1' and clk'event;
		if (not endfile(inp_file)) then
			readline(inp_file, inline);
			read(inline, in_int);
			i_a <= std_ulogic_vector(to_unsigned(in_int, 4));
			read(inline, in_int);
			i_b <= std_ulogic_vector(to_unsigned(in_int, 4));
		else
			endoffile <= '1';
		end if;
	end process input_gen;

	output_gen : process is
		file out_file : text open write_mode is "out.txt";
		variable outline : line;
		variable out_int : integer range 0 to 15;
	begin
		wait until clk = '1' and clk'event;
		if endoffile = '0' then
			out_int := to_integer(unsigned(i_c));
			write(outline, out_int);
			writeline(out_file, outline);
		else
			null;
		end if;
	end process output_gen;

end architecture RTL;
