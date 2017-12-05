----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:42:03 12/05/2017 
-- Design Name: 
-- Module Name:    Boot - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Boot is
    Port ( start : in  STD_LOGIC;
           clk : in  STD_LOGIC;
			  rst : in  STD_LOGIC;
			  Flash_ready : in  STD_LOGIC;
			  FlashData : in  STD_LOGIC_VECTOR (15 downto 0);
           FlashAddr : out  STD_LOGIC_VECTOR (15 downto 0);
           RamAddr : out  STD_LOGIC_VECTOR (15 downto 0);
			  RamData : out  STD_LOGIC_VECTOR (15 downto 0);
           FlashRead : out  STD_LOGIC;
           Ram2Write : out  STD_LOGIC;
           done : out  STD_LOGIC);
end Boot;

architecture Behavioral of Boot is
	type BootState is (idle, waiting, writing);
begin
	process(clk)
		variable state : BootState := idle;
		variable addr : STD_LOGIC_VECTOR (15 downto 0) := x"0000";
	begin
		if clk'event and clk = '1' then
			if rst = '0' then
				state := idle;
				FlashRead <= '0';
				Ram2Write <= '0';
				done <= '0';
			else
				case state is
					when idle =>
						if start = '1' then
							state := waiting;
							addr := x"0000";
							FlashAddr <= addr;
							FlashRead <= '1';
						end if;
					when waiting =>
						FlashRead <= '0';
						if Flash_ready = '1' then
							RamData <= FlashData;
							RamAddr <= addr;
							Ram2Write <= '1';
							state := writing;
						end if;
					when writing =>
						Ram2Write <= '0';
						addr := addr + 1;
						if addr < x"4000" then
							state := waiting;
							FlashAddr <= addr;
							FlashRead <= '1';
						else
							state := idle;
						end if;
				end case;
			end if;
		end if;
	end process;
end Behavioral;

