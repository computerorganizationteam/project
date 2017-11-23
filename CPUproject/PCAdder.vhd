----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:39:01 11/23/2017 
-- Design Name: 
-- Module Name:    PCAdder - Behavioral 
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

entity PCAdder is
    Port ( curpc : in  STD_LOGIC_VECTOR (15 downto 0);
           nextpc : in  STD_LOGIC_VECTOR (15 downto 0)
			  );
end PCAdder;

architecture Behavioral of PCAdder is
begin
	process (curpc)
	begin
		nextpc <= curpc + 1;
	end process;

end Behavioral;

