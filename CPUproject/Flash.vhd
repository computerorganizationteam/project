----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:10:10 11/23/2017 
-- Design Name: 
-- Module Name:    Flash - Behavioral 
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

entity Flash is
    Port ( clk : in  STD_LOGIC;
           Input_Flash_Addr : in  STD_LOGIC_VECTOR (15 downto 0);
           Output_Flash_Data : out  STD_LOGIC_VECTOR (15 downto 0);
           FlashRead : in  STD_LOGIC;
			  ready : out  STD_LOGIC;
           
           FlashByte : out  STD_LOGIC;
           FlashVpen : out  STD_LOGIC;
           FlashCE : out  STD_LOGIC;
           FlashOE : out  STD_LOGIC;
           FlashWE : out  STD_LOGIC;
           FlashRP : out  STD_LOGIC;
           FlashAddr : out  STD_LOGIC_VECTOR (22 downto 0);
           FlashData : inout  STD_LOGIC_VECTOR (15 downto 0));
end Flash;

architecture Behavioral of Flash is
	type FlashState is (Idle, Read1, Read2, Read3, Read4);
begin
	FlashByte <= '1';
	FlashVpen <= '1';
	FlashRP <= '1';
	
	process (clk)
		variable state : FlashState := Idle;
	begin
		if clk'event and clk = '1' then
			case state is
				when Idle =>
					FlashOE <= '1';
					FlashWE <= '1';
					if FlashRead = '1' then
						FlashCE <= '0';
						ready <= '0';
						state := Read1;
					else
						FlashCE <= '1';
					end if;
				when Read1 =>
					FlashWE <= '0';
					FlashData <= x"00FF";
					state := Read2;
				when Read2 =>
					FlashWE <= '1';
					state := Read3;
				when Read3 =>
					FlashOE <= '0';
					FlashAddr <= "000000" & Input_Flash_Addr & "0";
					FlashData <= (others => 'Z');
					state := Read4;
				when Read4 =>
					Output_Flash_Data <= FlashData;
					ready <= '1';
					FlashOE <= '1';
					state := Idle;
			end case;
		end if;
	end process;
end Behavioral;

