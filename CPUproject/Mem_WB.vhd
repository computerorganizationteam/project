----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:38:31 11/24/2017 
-- Design Name: 
-- Module Name:    Mem_WB - Behavioral 
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

entity Mem_WB is
    Port ( clk : in  STD_LOGIC;
			  MemtoReg : in STD_LOGIC;
           ALUResult: in STD_LOGIC_VECTOR(15 downto 0);
			  MemData: in STD_LOGIC_VECTOR(15 downto 0);
           RegWrite: in STD_LOGIC;
           RegWriteDst: in STD_LOGIC_VECTOR(3 downto 0);

			  OutMemtoReg : out STD_LOGIC;
			  OutALUResult: out STD_LOGIC_VECTOR(15 downto 0);
			  OutRegWrite: out STD_LOGIC;
			  OutMemData: out STD_LOGIC_VECTOR(15 downto 0);
			  OutRegWriteDst: out STD_LOGIC_VECTOR(3 downto 0) 
	 );
end Mem_WB;

architecture Behavioral of Mem_WB is
begin
	process (clk)
		if clk'event and clk='1' then
			OutMemtoReg <= MemtoReg;
			OutALUResult <= ALUResult;
		   OutRegWrite <= RegWrite;
		   OutMemData <= MemData;
			OutRegWriteDst <= RegWriteDst;
		end if;
	end process;
end Behavioral;

