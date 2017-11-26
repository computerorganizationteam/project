----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:25:32 11/25/2017 
-- Design Name: 
-- Module Name:    register - Behavioral 
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
library work;
use work.common.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity register is
  port(
      --debug
		debug_r0,debug_r1,debug_r2,debug_r3,debug_r4,debug_r5,debug_r6,debug_r7,
		debug_rT,debug_rpc : out std_logic_vector(15 downto 0);
		--debug
      clk : in STD_LOGIC;
      rst : in STD_LOGIC;
      
      REGF_SrcA: in STD_LOGIC_VECTOR(3 downto 0);
      REGF_SrcB: in STD_LOGIC_VECTOR(3 downto 0);
      REGF_InAddr : in STD_LOGIC_VECTOR(3 downto 0);
      REGF_WE : in STD_LOGIC;
      REGF_InData : in STD_LOGIC_VECTOR(15 downto 0);
      REGF_InPC : in STD_LOGIC_VECTOR(15 downto 0);
      
      REGF_OutA: out STD_LOGIC_VECTOR(15 downto 0);
      REGF_OutB: out STD_LOGIC_VECTOR(15 downto 0)
      
  );
end register;

architecture Behavioral of register is
	type reg_array is array (integer range 0 to REGF_REGNUM) of std_logic_vector(15 downto 0);
	signal regs : reg_array;
begin
	debug_r0<=regs(0);
	debug_r7<=regs(7);
	debug_rT<=regs(CONV_INTEGER(REGF_T));
	debug_r1<=regs(1);
	debug_r2<=regs(2);
	debug_r3<=regs(3);
	debug_r4<=regs(4);
	debug_r5<=regs(5);
	debug_r6<=regs(6);
	debug_rpc<=regs(CONV_INTEGER(REGF_PC));

	REGF_OutA <= regs(CONV_INTEGER(REGF_SrcA));
	REGF_OutB <= regs(CONV_INTEGER(REGF_SrcB));
	
	process(clk, rst)
	begin
    if rst = '0' then
      for i in 0 to REGF_REGNUM loop
        regs(i) <= ZERO;
      end loop;
      regs(CONV_INTEGER(REGF_SP))<="1011111011111111";
    else  
	  if clk'event and clk='0'then
	    if REGF_WE = '1' then
        regs(CONV_INTEGER(REGF_InAddr)) <= REGF_InData;
		 end if;
		 regs(CONV_INTEGER(REGF_PC)) <= REGF_InPC;
	  end if;		
    end if;
  end process;

end Behavioral;

