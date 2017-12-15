----------------------------------------------------------------------------------
-- Engineer: 	Ali Mohammad Pour 
-- Module Name: BIN2C7SEG - DATAFLOW 
-- Description: 4-Bit Binary Number To
-- Common Cathode 7-Segment Decoder
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY BIN2C7SEG IS
    PORT( 
        BIN :IN	 STD_LOGIC_VECTOR(3 DOWNTO 0); -- BIN INPUT
        SEG :OUT STD_LOGIC_VECTOR(6 DOWNTO 0));-- 7 SEG OUTPUT
END BIN2C7SEG;

ARCHITECTURE DATAFLOW OF BIN2C7SEG IS

BEGIN

    WITH BIN SELECT 
        SEG <=  "0111111" when "0000", -- 0x1
                "0000110" when "0001", -- 0x0
                "1011011" when "0010", -- 0x2
                "1001111" when "0011", -- 0x3
                "1100110" when "0100", -- 0x4
                "1101101" when "0101", -- 0x5
                "1111101" when "0110", -- 0x6
                "0000111" when "0111", -- 0x7
                "1111111" when "1000", -- 0x8
                "1101111" when "1001", -- 0x9
                "1110111" when "1010", -- 0xA
                "1111100" when "1011", -- 0xB
                "0111001" when "1100", -- 0xC
                "1011110" when "1101", -- 0xD
                "1111001" when "1110", -- 0xE
                "1110001" when "1111", -- 0xF
                "0000000" when others; -- OFF when others
END DATAFLOW;
