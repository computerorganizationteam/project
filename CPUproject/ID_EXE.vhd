----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:07:58 11/24/2017 
-- Design Name: 
-- Module Name:    ID_EXE - Behavioral 
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

entity ID_EXE is
    Port ( clk : in  STD_LOGIC;
			  isClear : in STD_LOGIC;
           regA : in  STD_LOGIC_VECTOR (15 downto 0);
           regB : in  STD_LOGIC_VECTOR (15 downto 0);
           Imm : in  STD_LOGIC_VECTOR (15 downto 0);
			  inpc : in  STD_LOGIC_VECTOR (15 downto 0);
			  inrs, inrt : in STD_LOGIC_VECTOR(3 downto 0);
			  ALUsrc : in STD_LOGIC;										  
			  ALUop : in STD_LOGIC_VECTOR (3 downto 0);
			  RegWrite : out STD_LOGIC;							
			  RegWriteDst : out STD_LOGIC_VECTOR (3 downto 0);	
			  MemtoReg	:	out STD_LOGIC;									
			  MemRead : out STD_LOGIC;									
			  MemWrite	: out STD_LOGIC	
			  
           outA : out  STD_LOGIC_VECTOR (15 downto 0);
           outB : out  STD_LOGIC_VECTOR (15 downto 0);
           outImm : out  STD_LOGIC_VECTOR (15 downto 0);
			  outpc : out  STD_LOGIC_VECTOR (15 downto 0);
			  outrs, outrt : in STD_LOGIC_VECTOR(3 downto 0);
			  outALUsrc : out STD_LOGIC;
			  outALUop : out STD_LOGIC_VECTOR (3 downto 0);
			  outRegWrite : out STD_LOGIC;							
			  outRegWriteDst : out STD_LOGIC_VECTOR (3 downto 0);	
			  outMemtoReg	:	out STD_LOGIC;									
			  outMemRead : out STD_LOGIC;									
			  outMemWrite	: out STD_LOGIC
			  );
end ID_EXE;

architecture Behavioral of ID_EXE is
	process(clk)
	begin
		if clk'event and clk='1' then
			if (isClear = '1') then
				outrs <= REG_EMPTY;
				outrt <= REG_EMPTY; 
				outMemRead <= '0';
				outMemWrite <= '0';
				outRegWriteDst <= REG_EMPTY; 
				outRegWrite <= '0';
			else
				outA <= regA;
				outB <= regB;
				outImm <= Imm;
				inpc < outpc;
				outrs < outrs;
				outrt <= outrt;
				outALUsrc <= ALUsrc;
				outALUop <= ALUop;
				outRegWrite <= RegWrite;
				outRegWriteDst <= RegWriteDst;
				outMemtoReg <= MegtoReg;
				outMemRead <= MemRead;
				outMemWrite <= MemWrite;
			end if;
		end if;
	end process;
begin


end Behavioral;

