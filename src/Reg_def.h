typedef unsigned long long REG;
typedef unsigned long long ULL;
typedef long long LL;

struct IFID{
	unsigned int inst;
	ULL PC;
}IF_ID,IF_ID_old;

#define ALUSrc_Rt 0
#define ALUSrc_Imm 1
#define ALUSrc_PC 2
#define ALUSrc_ZERO 3

#define ALUOp_None 0
#define ALUOp_ADD 1
#define ALUOp_MUL 2
#define ALUOp_SUB 3
#define ALUOp_SLL 4
#define ALUOp_MULH 5
#define ALUOp_SLT 6
#define ALUOp_XOR 7
#define ALUOp_DIV 8
#define ALUOp_SRL 9
#define ALUOp_SRA 10
#define ALUOp_OR 11
#define ALUOp_REM 12
#define ALUOp_AND 13
#define ALUOp_ADDW 14
#define ALUOp_SUBW 15
#define ALUOp_MULW 16
#define ALUOp_DIVW 17
#define ALUOp_REMW 18
#define ALUOp_SLLW 19
#define ALUOp_SRLW 20
#define ALUOp_SRAW 21
#define ALUOp_EQ 22
#define ALUOp_NE 23
#define ALUOp_LT 24
#define ALUOp_GE 25
#define ALUOp_PC 26
#define ALUOp_SCALL 27

#define MemWrite_NONE 0
#define MemWrite_B 1
#define MemWrite_H 2
#define MemWrite_W 3
#define MemWrite_D 4

#define MemRead_NONE 0
#define MemRead_B 1
#define MemRead_H 2
#define MemRead_W 3
#define MemRead_D 4

#define RegWrite_NONE 0
#define RegWrite_Reg 1

#define MemtoReg_NONE 0
#define MemtoReg_Reg 1

#define Branch_NONE 0
#define Branch_COND 1
#define Branch_DIRC 2
#define Branch_JAL 3
#define Branch_JALR 4

struct IDEX{
	int Rd;
	ULL PC;
	LL Imm;
	REG Reg_Rs,Reg_Rt;
	bool is_nop;

	int Ctrl_EX_ALUSrc;
	int Ctrl_EX_ALUOp;

	int Ctrl_M_Branch;
	int Ctrl_M_MemWrite;
	int Ctrl_M_MemRead;

	int Ctrl_WB_RegWrite;
	int Ctrl_WB_MemtoReg;

}ID_EX,ID_EX_old;

struct EXMEM{
	ULL PC;
	int Rd;
	REG ALU_out;
	REG Reg_Rt;
	bool is_nop;

	int Ctrl_M_Branch;
	int Ctrl_M_MemWrite;
	int Ctrl_M_MemRead;

	int Ctrl_WB_RegWrite;
	int Ctrl_WB_MemtoReg;

}EX_MEM,EX_MEM_old;

struct MEMWB{
	ULL PC;
	int Rd;
	unsigned long long Mem_read;
	REG ALU_out;
	bool is_nop;
	
	int Ctrl_M_Branch;
		
	int Ctrl_WB_RegWrite;
	int Ctrl_WB_MemtoReg;

}MEM_WB,MEM_WB_old;
