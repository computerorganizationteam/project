----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:48:16 11/24/2017 
-- Design Name: 
-- Module Name:    RAM - Behavioral 
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

entity RAM1 is
    Port ( clk : in  STD_LOGIC;
           tsre : in  STD_LOGIC;
           tbre : in  STD_LOGIC;
			  data_ready : in STD_LOGIC;
			  Input_Ram1_Addr : in  STD_LOGIC_VECTOR (15 downto 0);
			  Input_Ram1_Data	: in  STD_LOGIC_VECTOR (15 downto 0);
			  Ram1Read : in  STD_LOGIC;
			  Ram1Write : in  STD_LOGIC;
			  
			  Ram1Addr : out  STD_LOGIC_VECTOR (17 downto 0);
			  Ram1Data : inout  STD_LOGIC_VECTOR (15 downto 0);
			  Ram1OE : out  STD_LOGIC;
			  Ram1WE : out  STD_LOGIC;
			  Ram1EN : out  STD_LOGIC;
			  wrn, rdn : out  STD_LOGIC 
			  );
end RAM1;

architecture Behavioral of RAM1 is
signal data_src : std_logic_vector(2 downto 0);
signal temp_data : std_logic_vector(15 downto 0);
begin
	process(Input_Ram1_Addr, Input_Ram1_Data, Ram1Read, Ram1Write, data_ready)
		if Input_Ram1_Addr = PORT_STATUS then
            temp_data <= (others => '0');
            temp_data(0) <= (tbre and tsre); 
            temp_data(1) <= data_ready; 
            data_src <= "011";
       elsif Input_Ram1_Addr = PORT_DATA then
            data_src <= "000";
		 end if;
	end process;

	process(Input_Ram1_Addr, Input_Ram1_Data, Ram1Read, Ram1Write, Ram1Data, temp_data)
	 begin
		if Ram1Write = '1' then
			Ram1Data <= Input_Ram1_Data;
			Ram1Addr <= Input_Ram1_Addr;
		elsif Ram1Read = '1' then
			if data_src = "011" then
				Ram1Data <= temp_data;
				Ram1Addr <= Input_Ram1_Addr;
			else 
				Ram1Data <= "ZZZZZZZZZZZZZZZZ";
				Ram1Addr <= Input_Ram1_Addr;
			end if;
		else 
			Ram1Data <= "ZZZZZZZZZZZZZZZZ";
			Ram1Addr <= Input_Ram1_Addr;
		end if;
	 end process;
  
    process(clk, Input_Ram1_Addr, Ram1Read, Ram1Write, data_src)
    begin
		if clk = '0' then 
            if data_src = "000" then 
                Ram1EN <= '1';
                Ram1OE <= '1';
                Ram1WE <= '1';
                if Ram1Write = '1' then then 
                    rdn <= '1';
                    wrn <= '0';
                elsif Ram1Read = '1' then 
                    rdn <= '0';
                    wrn <= '1';
                else
                    rdn <= '1';
                    wrn <= '1';
                end if;
            else 
                Ram1EN <= '1';
					 Ram1OE <= '1';
					 Ram1WE <= '1';
					 rdn <= '1';
					 wrn <= '1';
            end if;
        elsif clk = '1' then 
            Ram1EN <= '1';
            Ram1OE <= '1';
            Ram1WE <= '1';
			   rdn <= '1';
            wrn <= '1';
        end if;
    end process;
end Behavioral;

