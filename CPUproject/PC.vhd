----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:25:22 11/23/2017 
-- Design Name: 
-- Module Name:    PC - Behavioral 
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

entity PC is
    Port ( clk : in  STD_LOGIC;
			  isjump : in STD_LOGIC;
           inpc : in  STD_LOGIC_VECTOR (15 downto 0);
           jumppc : in  STD_LOGIC_VECTOR (15 downto 0);
           outpc : out  STD_LOGIC_VECTOR (15 downto 0);
			  );
end PC;

architecture Behavioral of PC is
begin
	process(clk)
	begin
		if clk'event and clk='1' then
			if jump='1' then
			  outpc <= jumppc;
			else
			  outpc <= inpc;
			end if;
		end if; 
	end process;
end Behavioral;

