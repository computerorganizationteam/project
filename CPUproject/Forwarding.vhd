----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:51:18 11/25/2017 
-- Design Name: 
-- Module Name:    Forwarding - Behavioral 
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

entity Forwarding is
    Port ( RegWrite : in  STD_LOGIC;  --EXE/MEM
           RegWriteDst : in  STD_LOGIC_VECTOR (3 downto 0);  --EXE/MEM
			  
			  RegWrite_Mem : in  STD_LOGIC;  --MEM/WB
           MemtoReg : in  STD_LOGIC;  --MEM/WB
           RegWriteDst_Mem : in  STD_LOGIC_VECTOR (3 downto 0);  --MEM/WB
			  
           DestRegA : in  STD_LOGIC_VECTOR (3 downto 0);  --ID/EXE
           DestRegB : in  STD_LOGIC_VECTOR (3 downto 0);  --ID/EXE
			  
           opAForward : out  STD_LOGIC_VECTOR (1 downto 0);
           opBForward : out  STD_LOGIC_VECTOR (1 downto 0));
end Forwarding;

architecture Behavioral of Forwarding is
begin
	process (RegWrite, RegWriteDst, RegWrite_Mem, MemtoReg, RegWriteDst_Mem, DestRegA, DestRegB)
	begin
		if RegWrite = '1' and RegWriteDst = DestRegA then
			opAForward <= "01";
		elsif RegWrite_Mem = '1' and MemtoReg = '1' and RegWriteDst_Mem = DestRegA then
			opAForward <= "10";
		else
			opAForward <= "00";
		end if;
		if RegWrite = '1' and RegWriteDst = DestRegB then
			opBForward <= "01";
		elsif RegWrite_Mem = '1' and MemtoReg = '1' and RegWriteDst_Mem = DestRegB then
			opBForward <= "10";
		else
			opAForward <= "00";
		end if;
	end process;
end Behavioral;

