----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:50:06 11/20/2017 
-- Design Name: 
-- Module Name:    common - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

package common is
	  constant ZERO : std_logic_vector(15 downto 0) := "0000000000000000";

	  -- instruction op 
	  constant I_ADDIU       : std_logic_vector(4 downto 0) := "01001";
	  constant I_ADDIU3      : std_logic_vector(4 downto 0) := "01000";  
	  constant I_B       	 : std_logic_vector(4 downto 0) := "00010";
	  constant I_BEQZ        : std_logic_vector(4 downto 0) := "00100";
	  constant I_BNEZ        : std_logic_vector(4 downto 0) := "00101";
	  constant I_LI          : std_logic_vector(4 downto 0) := "01101";
	  constant I_LW          : std_logic_vector(4 downto 0) := "10011";
	  constant I_LW_SP       : std_logic_vector(4 downto 0) := "10010";
	  constant I_SLTI        : std_logic_vector(4 downto 0) := "01010";
	  constant I_SW		    : std_logic_vector(4 downto 0) := "11011";
	  constant I_NOP         : std_logic_vector(4 downto 0) := "00001";
	    
	  constant I_SP          : std_logic_vector(4 downto 0) := "01100";  -- ADDSP, MTSP, SW_RS
	  constant I_ADDSUBU     : std_logic_vector(4 downto 0) := "11100";  -- ADDU, SUBU
	  constant I_REG_JUMP    : std_logic_vector(4 downto 0) := "11101";	-- AND, CMP, JR, MFPC, NEG, NOT, ,OR, SRLV
	  constant I_MIH         : std_logic_vector(4 downto 0) := "11110";  -- MFIH, MTIH
	  constant I_SHIFT       : std_logic_vector(4 downto 0) := "00110";  -- SLL, SRA
	  
	  -- instruction func
	  constant F_ADDSP		 : std_logic_vector(2 downto 0) := "011";
	  constant F_MTSP		    : std_logic_vector(2 downto 0) := "100";
	  constant F_SW_RS	    : std_logic_vector(2 downto 0) := "010";	  
	  constant F_ADDU		    : std_logic_vector(1 downto 0) := "01";
	  constant F_SUBU		    : std_logic_vector(1 downto 0) := "11";
	  constant F_AND		    : std_logic_vector(4 downto 0) := "01100";
	  constant F_CMP		    : std_logic_vector(4 downto 0) := "01010";
	  constant F_JR_MFPC		 : std_logic_vector(4 downto 0) := "00000";  -- JR, MFPC
	  constant F_JR		    : std_logic_vector(2 downto 0) := "000";
	  constant F_MFPC		    : std_logic_vector(2 downto 0) := "010";
	  constant F_NEG		    : std_logic_vector(4 downto 0) := "01011";
	  constant F_NOT		    : std_logic_vector(4 downto 0) := "01111";
	  constant F_OR		    : std_logic_vector(4 downto 0) := "01101";
	  constant F_SRLV		    : std_logic_vector(4 downto 0) := "00110";
	  constant F_MFIH		    : std_logic := '0';
	  constant F_MTIH		    : std_logic := '1';
	  constant F_SLL		    : std_logic_vector(1 downto 0) := "00";
	  constant F_SRA		    : std_logic_vector(1 downto 0) := "11";
	  
	  -- alu operation
	  constant ALU_ADD		 : std_logic_vector(3 downto 0) := "0000";
	  constant ALU_SUB		 : std_logic_vector(3 downto 0) := "0001";
	  constant ALU_AND		 : std_logic_vector(3 downto 0) := "0010";
	  constant ALU_CMP		 : std_logic_vector(3 downto 0) := "0011";
	  constant ALU_NOT		 : std_logic_vector(3 downto 0) := "0100";
	  constant ALU_OR		    : std_logic_vector(3 downto 0) := "0101";
	  constant ALU_SLL		 : std_logic_vector(3 downto 0) := "0110";
	  constant ALU_SRA		 : std_logic_vector(3 downto 0) := "0111";
	  constant ALU_SLT		 : std_logic_vector(3 downto 0) := "1000";
	  constant ALU_NEG		 : std_logic_vector(3 downto 0) := "1001";
	  constant ALU_SRLV		 : std_logic_vector(3 downto 0) := "1010";
	  constant ALU_NULL		 : std_logic_vector(3 downto 0) := "1111";
	  
	  -- registers
	  constant REG_SP		 : std_logic_vector(3 downto 0) := "1000";
	  constant REG_IH 		 : std_logic_vector(3 downto 0) := "1001";
	  constant REG_RA  		 : std_logic_vector(3 downto 0) := "1010";
	  constant REG_T  		 : std_logic_vector(3 downto 0) := "1011";
	  constant REG_PC  		 : std_logic_vector(3 downto 0) := "1100";
	  constant REG_EMPTY		 : std_logic_vector(3 downto 0) := "1111";
<<<<<<< HEAD
	  constant REG_REGNUM 		 : integer := 15;
	  
=======
	  
	  constant I_NOP         : std_logic_vector(15 downto 0) := "0000100000000000";
>>>>>>> 2a98f33e55b0d8bc9d4eedf1e348828af5aebd7c
end common;

package body common is

end common;

