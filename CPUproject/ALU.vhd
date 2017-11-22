----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:30:39 11/22/2017 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
library work;
use work.common.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
    Port ( op : in  STD_LOGIC_VECTOR (3 downto 0);
           A : in  STD_LOGIC_VECTOR (15 downto 0);
           B : in  STD_LOGIC_VECTOR (15 downto 0);
           output : out  STD_LOGIC_VECTOR (15 downto 0));
end ALU;

architecture Behavioral of ALU is
begin
	process (op)
	begin
		case op is
			when ALU_ADD =>
				output <= A + B;
			when ALU_SUB =>
				output <= A - B;
			when ALU_AND =>
				output <= A and B;
			when ALU_CMP =>
				if A = B then
					output <= (0 => '0', others => '0');
				else
					output <= (0 => '1', others => '0');
				end if;
			when ALU_NOT =>
				output <= not B;
			when ALU_OR =>
				output <= A or B;
			when ALU_SLL =>
				if A = 0 then
					output <= to_stdlogicvector(to_bitvector(B) sll 8);
				else
					output <= to_stdlogicvector(to_bitvector(B) sll conv_integer(A));
				end if;
			when ALU_SRA =>
				if A = 0 then
					output <= to_stdlogicvector(to_bitvector(B) sra 8);
				else
					output <= to_stdlogicvector(to_bitvector(B) sra conv_integer(A));
				end if;
			when ALU_SLT =>
				if conv_signed(conv_integer(A), 16) < conv_signed(conv_integer(B), 16) then
					output <= (0 => '1', others => '0');
				else
					output <= (0 => '0', others => '0');
				end if;
			when ALU_NEG =>
				output <= 0 - B;
			when ALU_SRLV =>
				output <= to_stdlogicvector(to_bitvector(B) srl conv_integer(A));
			when others =>
				output <= (others => '0');
		end case;
	end process;
end Behavioral;

