----------------------------------------------------------------------------------
-- Engineer: 	Ali Mohammad Pour
-- Module Name: BIN2A7SEG - DATAFLOW 
-- Description: 4-Bit Binary Number To
-- Common Anode 7-Segment Decoder
----------------------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY BIN2A7SEG IS
    PORT( 
        BIN :IN	 STD_LOGIC_VECTOR(3 DOWNTO 0); -- BIN INPUT
        SEG :OUT STD_LOGIC_VECTOR(6 DOWNTO 0));-- 7 SEG OUTPUT
END BIN2A7SEG;

ARCHITECTURE DATAFLOW OF BIN2A7SEG IS

BEGIN

    WITH BIN SELECT 
        SEG <=  "1000000" when "0000", -- 0x0
                "1111001" when "0001", -- 0x1
                "0100100" when "0010", -- 0x2
                "0110000" when "0011", -- 0x3
                "0011001" when "0100", -- 0x4
                "0010010" when "0101", -- 0x5
                "0000010" when "0110", -- 0x6
                "1111000" when "0111", -- 0x7
                "0000000" when "1000", -- 0x8
                "0010000" when "1001", -- 0x9
                "0001000" when "1010", -- 0xA
                "0000011" when "1011", -- 0xB
                "1000110" when "1100", -- 0xC
                "0100001" when "1101", -- 0xD
                "0000110" when "1110", -- 0xE
                "0001110" when "1111", -- 0xF
                "1111111" when others; -- OFF when others
END DATAFLOW;
