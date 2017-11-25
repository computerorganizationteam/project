----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:40:00 11/24/2017 
-- Design Name: 
-- Module Name:    EXE_MEM - Behavioral 
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

entity EXE_MEM is
    Port ( clk : in  STD_LOGIC;
           MemtoReg : in  STD_LOGIC;
			  RegWrite : in STD_LOGIC;							
			  RegWriteDst : in STD_LOGIC_VECTOR (3 downto 0);							
           ALUResult : in  STD_LOGIC_VECTOR (15 downto 0);
			  MemRead : in STD_LOGIC;									
			  MemWrite	: in STD_LOGIC;
			  MemAddress : in STD_LOGIC(15 downto 0);
			  MemData : in STD_LOGIC(15 downto 0);
			  
			  OutMemtoReg : out  STD_LOGIC;
			  OutRegWrite : out STD_LOGIC;							
			  OutRegWriteDst : out STD_LOGIC_VECTOR (3 downto 0);
           OutALUResult : out  STD_LOGIC_VECTOR (15 downto 0);
			  OutMemRead : out STD_LOGIC;									
			  OutMemWrite	: out STD_LOGIC;
			  OutMemAddress : out STD_LOGIC(15 downto 0);
			  OutMemData : out STD_LOGIC(15 downto 0)
			  );
end EXE_MEM;

architecture Behavioral of EXE_MEM is
begin
	process (clk)
		if clk'event and clk='1' then
			OutMemtoReg <= MemtoReg;
			OutRegWrite <= RegWrite;							
			OutRegWriteDst <= RegWriteDst;
         OutALUResult <= ALUResult;
			OutMemRead <= MemRead;									
			OutMemWrite	<= MemWrite;
			OutMemAddress <= MemAddress;
			OutMemData <= MemData;
		end if;
	end process;
end Behavioral;

