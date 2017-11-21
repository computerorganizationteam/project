----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:19:12 11/21/2017 
-- Design Name: 
-- Module Name:    RAM2 - Behavioral 
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

entity RAM2 is
    Port ( clk : in  STD_LOGIC;
           Input_Ram2_Addr : in  STD_LOGIC_VECTOR (15 downto 0);
			  Input_Ram2_Data	: in  STD_LOGIC_VECTOR (15 downto 0);
			  Ram2Read : in  STD_LOGIC;
			  Ram2Write : in  STD_LOGIC;
			  
			  Ram2Addr : out  STD_LOGIC_VECTOR (17 downto 0);
			  Ram2Data : inout  STD_LOGIC_VECTOR (15 downto 0);
			  Ram2OE : out  STD_LOGIC;
			  Ram2WE : out  STD_LOGIC;
			  Ram2EN : out  STD_LOGIC
			  );
end RAM2;

architecture Behavioral of RAM2 is

begin
	process(Ram2Read, Ram2Write, Input_Ram2_Addr, Input_Ram2_Data)
	begin
		if (Ram2Read = '1') then
			Ram2Data <= "ZZZZZZZZZZZZZZZZ";
			Ram2Addr <= "00" & Input_Ram2_Addr;
		elsif (Ram2Write = '1') then
			Ram2Data <= Input_Ram2_Data;
			Ram2Addr <= "00" & Input_Ram2_Addr;
		else
			Ram2Data <= "ZZZZZZZZZZZZZZZZ";
		end if;
	end process;
	
	process(clk, Ram2Read, Ram2Write)
	begin
		if (clk = '0') then
			Ram2OE <= not Ram2Read;
			Ram2WE <= not Ram2Write;
			Ram2EN <= '0';
		elsif (clk = '1') then
			Ram2OE <= '1';
			Ram2WE <= '1';
			Ram2EN <= '1';
		 end if;
	end process;
end Behavioral;


