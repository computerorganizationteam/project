----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:15:57 11/23/2017 
-- Design Name: 
-- Module Name:    IF_ID - Behavioral 
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

entity IF_ID is
    Port ( clk : in  STD_LOGIC;
			  iswriteins : in STD_LOGIC;
			  writenop : in STD_LOGIC;
           nextpc : in  STD_LOGIC_VECTOR (15 downto 0);
			  Instruction_in : in  STD_LOGIC_VECTOR (15 downto 0);
           outpc : out  STD_LOGIC_VECTOR (15 downto 0);
           Instruction : out  STD_LOGIC_VECTOR (15 downto 0)
			  );
end IF_ID;

architecture Behavioral of IF_ID is
begin
	process(clk)
		if clk'event and clk='1' then
			if (iswriteins = '1') then
				outpc <= nextpc;
				if (writenop = '1') then
					Instruction <= NOP;
				else
					Instruction <= Instruction_in;
				end if;
			end if;
		end if;
	end process;

end Behavioral;

