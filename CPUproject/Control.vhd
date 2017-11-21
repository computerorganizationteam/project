----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:16:28 11/20/2017 
-- Design Name: 
-- Module Name:    Control - Behavioral 
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

entity Control is
    Port ( 
		Instruction : in  STD_LOGIC_VECTOR (15 downto 0);     -- 指令
		
		DestRegA : out STD_LOGIC_VECTOR (3 downto 0);			-- 寄存器A
		DestRegB : out STD_LOGIC_VECTOR (3 downto 0);			-- 寄存器B, 在写内存时作为写入内存的数
		Imm : out STD_LOGIC_VECTOR (15 downto 0);				   -- 立即数
		
		ALUsrc : out STD_LOGIC;										   -- 第二个操作数是立即数还是寄存器, 是寄存器时为'1'
		ALUop : out STD_LOGIC_VECTOR (3 downto 0);			   -- 操作码
		
		RegWrite : out STD_LOGIC;									-- 是否写回寄存器
		RegWriteDst : out STD_LOGIC_VECTOR (3 downto 0);	-- 写回寄存器编号
		MemtoReg	:	out STD_LOGIC;									-- 写回寄存器的是哪个结果, 是Mem时为'1'
		
		MemRead : out STD_LOGIC;									-- 是否读内存
		MemWrite	: out STD_LOGIC									-- 是否写内存	
	 );
	 
end Control;

architecture Behavioral of Control is
begin 
	process (Instruction)
	begin
		case (Instruction(15 downto 11)) is
			when I_ADDIU =>
				DestRegA <= '0' & Instruction(10 downto 8);
				Imm(7 downto 0) <= Instruction(7 downto 0);
				Imm(15 downto 8) <= (others => Instruction(7));
				ALUsrc <= '0';
				ALUop <= ALU_ADD;
				DestRegB <= REG_EMPTY;
				RegWrite <= '1';
				RegWriteDst <= '0' & Instruction(10 downto 8);
				MemRead <= '0';
				MemWrite <= '0';
				MemtoReg <= '0';
			when I_ADDIU3 =>
				DestRegA <= '0' & Instruction(10 downto 8);
				Imm(3 downto 0) <= Instruction(3 downto 0);
				Imm(15 downto 4) <= (others => Instruction(3));
				ALUsrc <= '0';
				ALUop <= ALU_ADD;
				DestRegB <= REG_EMPTY;
				RegWrite <= '1';
				RegWriteDst <= '0' & Instruction(7 downto 5);
				MemRead <= '0';
				MemWrite <= '0';
				MemtoReg <= '0';
			when I_LI =>
				Imm(7 downto 0) <= Instruction(7 downto 0);
				Imm(15 downto 8) <= (others => '0');
				ALUsrc <= '0';
				ALUop <= ALU_ADD;
				DestRegA <= REG_EMPTY;
				DestRegB <= REG_EMPTY;
				RegWrite <= '1';
				RegWriteDst <= '0' & Instruction(10 downto 8);
				MemRead <= '0';
				MemWrite <= '0';
				MemtoReg <= '0';
			when I_LW =>
				Imm(4 downto 0) <= Instruction(4 downto 0);
				Imm(15 downto 5) <= (others => Instruction(4));
				ALUsrc <= '0';
				ALUop <= ALU_ADD;
				DestRegA <= '0' & Instruction(10 downto 8);
				DestRegB <= REG_EMPTY;
				RegWrite <= '1';
				RegWriteDst <= '0' & Instruction(7 downto 5);
				MemRead <= '1';
				MemWrite <= '0';
				MemtoReg <= '1';
			when I_LW_SP =>
				Imm(7 downto 0) <= Instruction(7 downto 0);
				Imm(15 downto 8) <= (others => Instruction(7));
				ALUsrc <= '0';
				ALUop <= ALU_ADD;
				DestRegA <= REG_SP;
				DestRegB <= REG_EMPTY;
				RegWrite <= '1';
				RegWriteDst <= '0' & Instruction(10 downto 8);
				MemRead <= '1';
				MemWrite <= '0';
				MemtoReg <= '1';
			when I_SLTI =>
				Imm(7 downto 0) <= Instruction(7 downto 0);
				Imm(15 downto 8) <= (others => Instruction(7));
				ALUsrc <= '0';
				ALUop <= ALU_SLT;
				DestRegA <= '0' & Instruction(10 downto 8);
				DestRegB <= REG_EMPTY;
				RegWrite <= '1';
				RegWriteDst <= REG_T;
				MemRead <= '0';
				MemWrite <= '0';
				MemtoReg <= '0';
			when I_SW =>
				Imm(4 downto 0) <= Instruction(4 downto 0);
				Imm(15 downto 5) <= (others => Instruction(4));
				ALUsrc <= '0';
				ALUop <= ALU_ADD;
				DestRegA <= '0' & Instruction(10 downto 8);
				DestRegB <= '0' & Instruction(7 downto 5);
				RegWrite <= '0';
				RegWriteDst <= REG_EMPTY;
				MemRead <= '0';
				MemWrite <= '1';
				MemtoReg <= '0';
			when I_NOP =>
				Imm <= (others => '0');
				ALUsrc <= '0';
				ALUop <= ALU_NULL;
				DestRegA <= REG_EMPTY;
				DestRegB <= REG_EMPTY;
				RegWrite <= '0';
				RegWriteDst <= REG_EMPTY;
				MemRead <= '0';
				MemWrite <= '0';
				MemtoReg <= '0';
			when I_SP =>
				case (Instruction(10 downto 8)) is
					when F_ADDSP =>
						Imm(7 downto 0) <= Instruction(7 downto 0);
						Imm(15 downto 8) <= (others => Instruction(7));
						ALUsrc <= '0';
						ALUop <= ALU_ADD;
						DestRegA <= REG_SP;
						DestRegB <= REG_EMPTY;
						RegWrite <= '1';
						RegWriteDst <= REG_SP;
						MemRead <= '0';
						MemWrite <= '0';
						MemtoReg <= '0';
					when F_MTSP =>
						Imm(15 downto 0) <= (others => '0');
						ALUsrc <= '0';
						ALUop <= ALU_ADD;
						DestRegA <= REG_SP;
						DestRegB <= REG_EMPTY;
						RegWrite <= '1';
						RegWriteDst <= REG_SP;
						MemRead <= '0';
						MemWrite <= '0';
						MemtoReg <= '0';
					when F_SW_RS =>
						Imm(7 downto 0) <= Instruction(7 downto 0);
						Imm(15 downto 8) <= (others => Instruction(7));
						ALUsrc <= '0';
						ALUop <= ALU_ADD;
						DestRegA <= REG_SP;
						DestRegB <= REG_RA;
						RegWrite <= '0';
						RegWriteDst <= REG_EMPTY;
						MemRead <= '0';
						MemWrite <= '1';
						MemtoReg <= '0';
					when others =>
						null;
				end case;
			when I_ADDSUBU =>
				case (Instruction(1 downto 0)) is
					when F_ADDU =>
						Imm(15 downto 0) <= (others => '0');
						ALUsrc <= '1';
						ALUop <= ALU_ADD;
						DestRegA <= '0' & Instruction(10 downto 8);
						DestRegB <= '0' & Instruction(7 downto 5);
						RegWrite <= '1';
						RegWriteDst <= '0' & Instruction(4 downto 2);
						MemRead <= '0';
						MemWrite <= '0';
						MemtoReg <= '0';
					when F_SUBU =>
						Imm(15 downto 0) <= (others => '0');
						ALUsrc <= '1';
						ALUop <= ALU_SUB;
						DestRegA <= '0' & Instruction(10 downto 8);
						DestRegB <= '0' & Instruction(7 downto 5);
						RegWrite <= '1';
						RegWriteDst <= '0' & Instruction(4 downto 2);
						MemRead <= '0';
						MemWrite <= '0';
						MemtoReg <= '0';
					when others =>
						null;
				end case;
			when I_REG_JUMP =>
				case (Instruction(4 downto 0)) is
					when F_AND =>
						Imm(15 downto 0) <= (others => '0');
						ALUsrc <= '1';
						ALUop <= ALU_AND;
						DestRegA <= '0' & Instruction(10 downto 8);
						DestRegB <= '0' & Instruction(7 downto 5);
						RegWrite <= '1';
						RegWriteDst <= '0' & Instruction(10 downto 8);
						MemRead <= '0';
						MemWrite <= '0';
						MemtoReg <= '0';
					when F_CMP =>
						Imm(15 downto 0) <= (others => '0');
						ALUsrc <= '1';
						ALUop <= ALU_CMP;
						DestRegA <= '0' & Instruction(10 downto 8);
						DestRegB <= '0' & Instruction(7 downto 5);
						RegWrite <= '1';
						RegWriteDst <= REG_T;
						MemRead <= '0';
						MemWrite <= '0';
						MemtoReg <= '0';
					when F_JR_MFPC =>    -- TODO in Hazard
						case (Instruction(7 downto 5)) is
							when F_MFPC =>
								Imm(15 downto 0) <= (others => '0');
								ALUsrc <= '0';
								ALUop <= ALU_ADD;
								DestRegA <= REG_PC;
								DestRegB <= REG_EMPTY;
								RegWrite <= '1';
								RegWriteDst <= '0' & Instruction(10 downto 8);
								MemRead <= '0';
								MemWrite <= '0';
								MemtoReg <= '0';
							when others =>
								null;
						end case;
					when F_NEG =>
						Imm(15 downto 0) <= (others => '0');
						ALUsrc <= '0';
						ALUop <= ALU_NEG;
						DestRegA <= '0' & Instruction(7 downto 5);
						DestRegB <= REG_EMPTY;
						RegWrite <= '1';
						RegWriteDst <= '0' & Instruction(10 downto 8);
						MemRead <= '0';
						MemWrite <= '0';
						MemtoReg <= '0';
					when F_NOT =>
						Imm(15 downto 0) <= (others => '0');
						ALUsrc <= '0';
						ALUop <= ALU_NOT;
						DestRegA <= '0' & Instruction(7 downto 5);
						DestRegB <= REG_EMPTY;
						RegWrite <= '1';
						RegWriteDst <= '0' & Instruction(10 downto 8);
						MemRead <= '0';
						MemWrite <= '0';
						MemtoReg <= '0';
					when F_OR =>
						Imm(15 downto 0) <= (others => '0');
						ALUsrc <= '1';
						ALUop <= ALU_OR;
						DestRegA <= '0' & Instruction(10 downto 8);
						DestRegB <= '0' & Instruction(7 downto 5);
						RegWrite <= '1';
						RegWriteDst <= '0' & Instruction(10 downto 8);
						MemRead <= '0';
						MemWrite <= '0';
						MemtoReg <= '0';
					when F_SRLV =>
						Imm(15 downto 0) <= (others => '0');
						ALUsrc <= '1';
						ALUop <= ALU_SRLV;
						DestRegA <= '0' & Instruction(10 downto 8);
						DestRegB <= '0' & Instruction(7 downto 5);
						RegWrite <= '1';
						RegWriteDst <= '0' & Instruction(7 downto 5);
						MemRead <= '0';
						MemWrite <= '0';
						MemtoReg <= '0';
					when others =>
						null;
				end case;
			when I_MIH =>
				case (Instruction(6)) is
					when F_MFIH =>
						Imm(15 downto 0) <= (others => '0');
						ALUsrc <= '0';
						ALUop <= ALU_ADD;
						DestRegA <= REG_IH;
						DestRegB <= REG_EMPTY;
						RegWrite <= '1';
						RegWriteDst <= '0' & Instruction(10 downto 8);
						MemRead <= '0';
						MemWrite <= '0';
						MemtoReg <= '0';
					when F_MTIH =>
						Imm(15 downto 0) <= (others => '0');
						ALUsrc <= '0';
						ALUop <= ALU_ADD;
						DestRegA <= '0' & Instruction(10 downto 8);
						DestRegB <= REG_EMPTY;
						RegWrite <= '1';
						RegWriteDst <= REG_IH;
						MemRead <= '0';
						MemWrite <= '0';
						MemtoReg <= '0';
					when others =>
						null;
				end case;
			when I_SHIFT =>
				case (Instruction(1 downto 0)) is
					when F_SLL =>
						Imm(2 downto 0) <= Instruction(4 downto 2);
						Imm(15 downto 3) <= (others => '0');
						ALUsrc <= '0';
						ALUop <= ALU_SLL;
						DestRegA <= '0' & Instruction(7 downto 5);
						DestRegB <= REG_EMPTY;
						RegWrite <= '1';
						RegWriteDst <= '0' & Instruction(10 downto 8);
						MemRead <= '0';
						MemWrite <= '0';
						MemtoReg <= '0';
					when F_SRA =>
						Imm(2 downto 0) <= Instruction(4 downto 2);
						Imm(15 downto 3) <= (others => '0');
						ALUsrc <= '0';
						ALUop <= ALU_SRA;
						DestRegA <= '0' & Instruction(7 downto 5);
						DestRegB <= REG_EMPTY;
						RegWrite <= '1';
						RegWriteDst <= '0' & Instruction(10 downto 8);
						MemRead <= '0';
						MemWrite <= '0';
						MemtoReg <= '0';
					when others =>
						null;
				end case;	
			when I_B =>   -- TODO in Hazard
				null;
			when I_BEQZ =>
				null;
			when I_BNEZ =>
				null;
			when others =>
            null;
		end case;
	end process;
end Behavioral;

