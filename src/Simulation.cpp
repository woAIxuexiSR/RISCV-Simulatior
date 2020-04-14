#include "Simulation.h"
using namespace std;

extern void read_elf(const char* filename);
extern unsigned int coff;
extern unsigned int csize;
extern unsigned int cadr;
extern unsigned int doff;
extern unsigned int dsize;
extern unsigned int dadr;
extern unsigned long long gp;
extern unsigned int madr;
extern unsigned int endPC;
extern unsigned long entry;
extern FILE *file;

FILE* log_f;

bool single_mode = 0;
bool debug = 0;


bool jump = 0;
bool nop_flag = 0;
bool control_hazard = 0;

//指令运行数
long long inst_num = 0;
long long cyc_num = 0;
long long branch_num = 0;
long long chazard_num = 0;

//系统调用退出指示
bool exit_flag = 0;

//加载代码段
//初始化PC
void load_memory()
{	
	fseek(file, coff, SEEK_SET);
	fread(&memory[cadr>>2], 1, csize, file);

	fseek(file, doff, SEEK_SET);
	fread(&memory[dadr>>2], 1, dsize, file);
	fclose(file);
}

int main(int argc, char* argv[])
{
	char* filename;
	bool ffile = false;
	for(int i = 1; i < argc; ++i)
	{
		if(!strcmp(argv[i], "-S"))
			single_mode = true;
		else if(!strcmp(argv[i], "-P"))
			single_mode = false;
		else if(!strcmp(argv[i], "-debug"))
			debug = true;
		else
		{
			if(!ffile)
			{
				filename = argv[i];
				ffile = true;
			}
			else
			{
				printf("you should only input one elf-file\n");
				exit(0);
			}
		}
	}
	if(!ffile)
	{
		printf("there is no input file\n");
		exit(0);
	}

	//解析elf文件
	read_elf(filename);

	/*
	printf("coff = %x\n", coff);
	printf("csize = %d\n", csize);
	printf("cadr = %x\n", cadr);
	printf("doff = %x\n", doff);
	printf("dsize = %d\n", dsize);
	printf("dadr = %x\n", dadr);
	printf("gp = %llx\n", gp);
	printf("madr = %x\n", madr);
	printf("endPC = %x\n", endPC);
	printf("entry = %lx\n", entry);
	*/

	//加载内存
	load_memory();

	//设置入口地址
	PC = madr >> 2;
	
	//设置全局数据段地址寄存器
	reg[3] = gp;
	
	reg[2] = MAX / 2;//栈基址 （sp寄存器）

	simulate();

	cout <<"simulate over!"<<endl;

	return 0;
}

void simulate()
{
	//结束PC的设置
	int end=(int)endPC / 4-1;

	log_f = fopen("log_f.txt", "wb");

	bool IF_stop = 0, ID_stop = 0, EX_stop = 0, MEM_stop = 0, WB_stop = 0;
	while(true)
	{
		
		if(single_mode)
		{
			fprintf(log_f, "%lld PC = 0x%llx			", inst_num, PC << 2);
			
			jump = false;

			run_single_inst();

			if(!jump) PC = PC + 1;

			print_reg(log_f);
			if(debug)
			{
				fprintf(stdout, "%lld PC = 0x%llx			", inst_num, PC << 2);
				print_reg(stdout);
				string t;
				cin >> t;
				if(t == "r") debug = false;
				else if(t == "memory")
				{
					int n = 0; cin >> n;
					for(int i = 0; i < n; ++i)
					{
						cin >> t;
						ULL pos = atoi(t.c_str());
						fprintf(stdout, "memory 0x%llx word is %d\n", pos, memory[pos]);
					}
				}
			}

			if(PC == end) break;
		}
		else
		{
			if(!WB_stop) WB();
			else break;
			
			if(!MEM_stop) MEM();
			else WB_stop = true;
			
			if(!EX_stop) EX();
			else MEM_stop = true;

			if(!ID_stop) ID();
			else EX_stop = true;

			if(!IF_stop) IF();
			else ID_stop = true;

			if(PC == end) IF_stop = true;
		
			IF_ID = IF_ID_old;
			ID_EX = ID_EX_old;
			EX_MEM = EX_MEM_old;
			MEM_WB = MEM_WB_old;

			print_reg(log_f);
			
			cyc_num++;
		}

		if(exit_flag)
			break;

        reg[0] = 0;//一直为零
		
	}

	if(single_mode) printf("instuction number : %lld\n", inst_num);
	else printf("instuction number : %lld, cycle number : %lld, condition branch error rate : %.3f\n", inst_num, cyc_num, (double)chazard_num / (double)branch_num);

	fclose(log_f);
}

void run_single_inst()
{
	inst_num++;
	unsigned inst = memory[PC];

	OP = getbit(inst, 0, 7);
	rd = getbit(inst, 7, 12);
	fuc3 = getbit(inst, 12, 15);
	rs = getbit(inst, 15, 20);
	rt = getbit(inst, 20, 25);
	fuc7 = getbit(inst, 25, 32);
	immI = getbit(inst, 20, 32);
	immS = (getbit(inst, 25, 32) << 5) + getbit(inst, 7, 12);
	immSB = (getbit(inst, 31, 32) << 12) + (getbit(inst, 7, 8) << 11) + (getbit(inst, 25, 31) << 5) + (getbit(inst, 8, 12) << 1);
	immU = getbit(inst, 12, 32) << 12;
	immUJ = (getbit(inst, 31, 32) << 20) + (getbit(inst, 12, 20) << 12) + (getbit(inst, 20, 21) << 11) + (getbit(inst, 21, 31) << 1);


	fprintf(log_f, "OP = 0x%x, fuc3 = 0x%x, fuc7 = 0x%x\n", OP, fuc3, fuc7);
	if(OP == OP_R)
	{
		if(fuc3 == F3_ADD && fuc7 == F7_ADD)
		{
			reg[rd] = reg[rs] + reg[rt];
		}
		else if(fuc3 == F3_MUL && fuc7 == F7_MUL)
		{
			reg[rd] = (LL)reg[rs] * (LL)reg[rt];
		}
		else if(fuc3 == F3_SUB && fuc7 == F7_SUB)
		{
			reg[rd] = reg[rs] - reg[rt];
		}
		else if(fuc3 == F3_SLL && fuc7 == F7_SLL)
		{
			reg[rd] = reg[rs] << reg[rt];
		}
		else if(fuc3 == F3_MULH && fuc7 == F7_MULH)
		{
			LL h1, h2, l1, l2;
			h1 = (LL)reg[rs] >> 32;
			h2 = (LL)reg[rt] >> 32;
			l1 = reg[rs] & 0xffffffff;
			l2 = reg[rt] & 0xffffffff;
			reg[rd] = h1 * h2 + ((h1 * l2) >> 32) + ((h2 * l1) >> 32);
		}
		else if(fuc3 == F3_SLT && fuc7 == F7_SLT)
		{
			reg[rd] = ((LL)reg[rs] < (LL)reg[rt]) ? 1 : 0;
		}
		else if(fuc3 == F3_XOR && fuc7 == F7_XOR)
		{
			reg[rd] = reg[rs] ^ reg[rt];
		}
		else if(fuc3 == F3_DIV && fuc7 == F7_DIV)
		{
			reg[rd] = (LL)reg[rs] / (LL)reg[rt];
		}
		else if(fuc3 == F3_SRL && fuc7 == F7_SRL)
		{
			reg[rd] = reg[rs] >> reg[rt];
		}
		else if(fuc3 == F3_SRA && fuc7 == F7_SRA)
		{
			reg[rd] = (LL)reg[rs] >> reg[rt];
		}
		else if(fuc3 == F3_OR && fuc7 == F7_OR)
		{
			reg[rd] = reg[rs] | reg[rt];
		}
		else if(fuc3 == F3_REM && fuc7 == F7_REM)
		{
			reg[rd] = (LL)reg[rs] % (LL)reg[rt];
		}
		else if(fuc3 == F3_AND && fuc7 == F7_AND)
		{
			reg[rd] = reg[rs] & reg[rt];
		}
	}
	else if(OP == OP_RW)
	{
		if(fuc3 == F3_ADDW && fuc7 == F7_ADDW)
		{
			reg[rd] = ext_signed((unsigned)(reg[rs] + reg[rt]), 32);
		}
		else if(fuc3 == F3_SUBW && fuc7 == F7_SUBW)
		{
			reg[rd] = ext_signed((unsigned)(reg[rs] - reg[rt]), 32);
		}
		else if(fuc3 == F3_MULW && fuc7 == F7_MULW)
		{
			reg[rd] = ext_signed((unsigned)((int)reg[rs] * (int)reg[rt]), 32);
		}
		else if(fuc3 == F3_DIVW && fuc7 == F7_DIVW)
		{
			reg[rd] = ext_signed((unsigned)((int)reg[rs] / (int)reg[rt]), 32);
		}
		else if(fuc3 == F3_REMW && fuc7 == F7_REMW)
		{
			reg[rd] = ext_signed((unsigned)((int)reg[rs] % (int)reg[rt]), 32);
		}
	}
	else if(OP == OP_LW)
	{
		LL offset = reg[rs] + ext_signed(immI, 12);
		if(fuc3 == F3_LB)
		{
			unsigned int t = *((char*)memory + offset);
			reg[rd] = ext_signed(t, 8);
		}
		else if(fuc3 == F3_LH)
		{
			unsigned int t = *(unsigned short*)((char*)memory + offset);
			reg[rd] = ext_signed(t, 16);
		}
		else if(fuc3 == F3_LW)
		{
			unsigned int t = *(unsigned*)((char*)memory + offset);
			reg[rd] = ext_signed(t, 32);
		}
		else if(fuc3 == F3_LD)
		{
			reg[rd] = *(ULL*)((char*)memory + offset);
		}
	}
	else if(OP == OP_I)
	{
		if(fuc3 == F3_ADDI)
		{
			reg[rd] = reg[rs] + ext_signed(immI, 12);
		}
		else if(fuc3 == F3_SLLI)
		{
			reg[rd] = reg[rs] << (immI & 0x3f);
		}
		else if(fuc3 == F3_SLTI)
		{
			reg[rd] = ((LL)reg[rs] < ext_signed(immI, 12)) ? 1 : 0;
		}
		else if(fuc3 == F3_XORI)
		{
			reg[rd] = reg[rs] ^ ext_signed(immI, 12);
		}
		else if(fuc3 == F3_SRLI && fuc7 == F7_SRLI)
		{
			reg[rd] = reg[rs] >> (immI & 0x3f);
		}
		else if(fuc3 == F3_SRAI && fuc7 == F7_SRAI)
		{
			reg[rd] = (LL)reg[rs] >> (immI & 0x3f);
		}
		else if(fuc3 == F3_ORI)
		{
			reg[rd] = reg[rs] | ext_signed(immI, 12);
		}
		else if(fuc3 == F3_ANDI)
		{
			reg[rd] = reg[rs] & ext_signed(immI, 12);
		}
	}
	else if(OP == OP_IW)
	{
		if(fuc3 == F3_ADDIW)
		{
			reg[rd] = ext_signed((unsigned)(reg[rs] + ext_signed(immI, 12)), 32);
		}
		else if(fuc3 == F3_SLLIW)
		{
			reg[rd] = ext_signed((unsigned)(reg[rs] << (immI & 0x3f)), 32);
		}
		else if(fuc3 == F3_SRLIW && fuc7 == F7_SRLIW)
		{
			reg[rd] = ext_signed((unsigned)(reg[rs] >> (immI & 0x3f)), 32);
		}
		else if(fuc3 == F3_SRAIW && fuc7 == F7_SRAIW)
		{
			reg[rd] = ext_signed((unsigned)((LL)reg[rs] >> (immI & 0x3f)), 32);
		}
	}
	else if(OP == OP_JALR)
	{
		reg[rd] = (PC << 2) + 4;
		PC = (reg[rs] + ext_signed(immI, 12)) >> 2;
		jump = true;
	}
	else if(OP == OP_SCALL)
	{
		if(reg[17] == 0)
			printf("%d", (int)reg[10]);
		else if(reg[17] == 1)
			printf("%c", (char)reg[10]);
	}
	else if(OP == OP_SW)
	{
		LL offset = reg[rs] + ext_signed(immS, 12);
		if(fuc3 == F3_SB)
		{
			*((char*)memory + offset) = reg[rt] & 0xff;
		}
		else if(fuc3 == F3_SH)
		{
			*(unsigned short*)((char*)memory + offset) = reg[rt] & 0xffff;
		}
		else if(fuc3 == F3_SW)
		{
			*(unsigned*)((char*)memory + offset) = reg[rt] & 0xffffffff;
		}
		else if(fuc3 == F3_SD)
		{
			*(ULL*)((char*)memory + offset) = reg[rt];
		}
	}
	else if(OP == OP_SB)
	{
		ULL newPC = (LL)PC + (ext_signed(immSB, 13) >> 2);
		if(fuc3 == F3_BEQ)
		{
			if(reg[rs] == reg[rt])
			{
				PC = newPC;
				jump = true;
			}
		}
		else if(fuc3 == F3_BNE)
		{
			if(reg[rs] != reg[rt])
			{
				PC = newPC;
				jump = true;
			}
		}
		else if(fuc3 == F3_BLT)
		{
			if((LL)reg[rs] < (LL)reg[rt])
			{
				PC = newPC;
				jump = true;
			}
		}
		else if(fuc3 == F3_BGE)
		{
			if((LL)reg[rs] >= (LL)reg[rt])
			{
				PC = newPC;
				jump = true;
			}
		}
	}
	else if(OP == OP_AUIPC)
	{
		reg[rd] = (PC << 2) + ext_signed(immU, 32);
	}
	else if(OP == OP_LUI)
	{
		reg[rd] = ext_signed(immU, 32);
	}
	else if(OP == OP_JAL)
	{
		reg[rd] = (PC << 2) + 4;
		PC = PC + (ext_signed(immUJ, 21) >> 2);
		jump = true;
	}
}


//取指令
void IF()
{
	//write IF_ID_old

	fprintf(log_f, "\nnop_flag %d, control_hazard %d\n", nop_flag, control_hazard);
	if(nop_flag)
	{
		PC = PC - 1;
		inst_num--;
	}
	else if(control_hazard)
	{
		PC = EX_MEM_old.PC + 1;
		control_hazard = false;
		inst_num--;
		chazard_num++;
	}
	else if(ID_EX_old.Ctrl_M_Branch == Branch_JAL)
	{
		PC = (LL)ID_EX_old.PC + (ID_EX_old.Imm >> 2);
	}
	else if(ID_EX_old.Ctrl_M_Branch == Branch_JALR)
	{
		PC = ((LL)ID_EX_old.Reg_Rs + ID_EX_old.Imm) >> 2;
	}
	else if(ID_EX_old.Ctrl_M_Branch == Branch_COND)
	{
		PC = (LL)ID_EX_old.PC + (ID_EX_old.Imm >> 2);
		branch_num++;
	}

	fprintf(log_f, "IF PC = 0x%llx			", PC << 2);
	
	IF_ID_old.inst = memory[PC];
	IF_ID_old.PC = PC;
	PC = PC + 1;
	inst_num++;
}

//译码
void ID()
{
	//Read IF_ID
	fprintf(log_f, "ID PC = 0x%llx			", IF_ID.PC << 2);
	
	unsigned int inst = IF_ID.inst;
	LL Imm = 0;

	int ALUOp = 0, ALUSrc = 0;
	int Branch = 0, MemRead = 0, MemWrite = 0;
	int RegWrite = 0, MemtoReg = 0;
	
	OP = getbit(inst, 0, 7);
	rd = getbit(inst, 7, 12);
	fuc3 = getbit(inst, 12, 15);
	rs = getbit(inst, 15, 20);
	rt = getbit(inst, 20, 25);
	fuc7 = getbit(inst, 25, 32);
	immI = getbit(inst, 20, 32);
	immS = (getbit(inst, 25, 32) << 5) + getbit(inst, 7, 12);
	immSB = (getbit(inst, 31, 32) << 12) + (getbit(inst, 7, 8) << 11) + (getbit(inst, 25, 31) << 5) + (getbit(inst, 8, 12) << 1);
	immU = getbit(inst, 12, 32) << 12;
	immUJ = (getbit(inst, 31, 32) << 20) + (getbit(inst, 12, 20) << 12) + (getbit(inst, 20, 21) << 11) + (getbit(inst, 21, 31) << 1);


	//fprintf(log_f, "OP = 0x%x, fuc3 = 0x%x, fuc7 = 0x%x\n", OP, fuc3, fuc7);
	if(OP == OP_R)
	{
		ALUSrc = ALUSrc_Rt;
		RegWrite = RegWrite_Reg;

		if(fuc3 == F3_ADD && fuc7 == F7_ADD)
		{
			ALUOp = ALUOp_ADD;
		}
		else if(fuc3 == F3_MUL && fuc7 == F7_MUL)
		{
			ALUOp = ALUOp_MUL;
		}
		else if(fuc3 == F3_SUB && fuc7 == F7_SUB)
		{
			ALUOp = ALUOp_SUB;
		}
		else if(fuc3 == F3_SLL && fuc7 == F7_SLL)
		{
			ALUOp = ALUOp_SLL;
		}
		else if(fuc3 == F3_MULH && fuc7 == F7_MULH)
		{
			ALUOp = ALUOp_MULH;
		}
		else if(fuc3 == F3_SLT && fuc7 == F7_SLT)
		{
			ALUOp = ALUOp_SLT;
		}
		else if(fuc3 == F3_XOR && fuc7 == F7_XOR)
		{
			ALUOp = ALUOp_XOR;
		}
		else if(fuc3 == F3_DIV && fuc7 == F7_DIV)
		{
			ALUOp = ALUOp_DIV;
		}
		else if(fuc3 == F3_SRL && fuc7 == F7_SRL)
		{
			ALUOp = ALUOp_SRL;
		}
		else if(fuc3 == F3_SRA && fuc7 == F7_SRA)
		{
			ALUOp = ALUOp_SRA;
		}
		else if(fuc3 == F3_OR && fuc7 == F7_OR)
		{
			ALUOp = ALUOp_OR;
		}
		else if(fuc3 == F3_REM && fuc7 == F7_REM)
		{
			ALUOp = ALUOp_REM;
		}
		else if(fuc3 == F3_AND && fuc7 == F7_AND)
		{
			ALUOp = ALUOp_AND;
		}
	}
	else if(OP == OP_RW)
	{
		ALUSrc = ALUSrc_Rt;
		RegWrite = RegWrite_Reg;

		if(fuc3 == F3_ADDW && fuc7 == F7_ADDW)
		{
			ALUOp = ALUOp_ADDW;
		}
		else if(fuc3 == F3_SUBW && fuc7 == F7_SUBW)
		{
			ALUOp = ALUOp_SUBW;
		}
		else if(fuc3 == F3_MULW && fuc7 == F7_MULW)
		{
			ALUOp = ALUOp_MULW;
		}
		else if(fuc3 == F3_DIVW && fuc7 == F7_DIVW)
		{
			ALUOp = ALUOp_DIVW;
		}
		else if(fuc3 == F3_REMW && fuc7 == F7_REMW)
		{
			ALUOp = ALUOp_REMW;
		}
	}
	else if(OP == OP_LW)
	{
		ALUSrc = ALUSrc_Imm;
		ALUOp = ALUOp_ADD;
		Imm = ext_signed(immI, 12);
		MemtoReg = MemtoReg_Reg;

		if(fuc3 == F3_LB)
		{
			MemRead = MemRead_B;
		}
		else if(fuc3 == F3_LH)
		{
			MemRead = MemRead_H;
		}
		else if(fuc3 == F3_LW)
		{
			MemRead = MemRead_W;
		}
		else if(fuc3 == F3_LD)
		{
			MemRead = MemRead_D;
		}
	}
	else if(OP == OP_I)
	{
		ALUSrc = ALUSrc_Imm;
		RegWrite = RegWrite_Reg;

		if(fuc3 == F3_ADDI)
		{
			Imm = ext_signed(immI, 12);
			ALUOp = ALUOp_ADD;
		}
		else if(fuc3 == F3_SLLI)
		{
			Imm = immI & 0x3f;
			ALUOp = ALUOp_SLL;
		}
		else if(fuc3 == F3_SLTI)
		{
			Imm = ext_signed(immI, 12);
			ALUOp = ALUOp_SLT;
		}
		else if(fuc3 == F3_XORI)
		{
			Imm = ext_signed(immI, 12);
			ALUOp = ALUOp_XOR;
		}
		else if(fuc3 == F3_SRLI && fuc7 == F7_SRLI)
		{
			Imm = immI & 0x3f;
			ALUOp = ALUOp_SRL;
		}
		else if(fuc3 == F3_SRAI && fuc7 == F7_SRAI)
		{
			Imm = immI & 0x3f;
			ALUOp = ALUOp_SRA;
		}
		else if(fuc3 == F3_ORI)
		{
			Imm = ext_signed(immI, 12);
			ALUOp = ALUOp_OR;
		}
		else if(fuc3 == F3_ANDI)
		{
			Imm = ext_signed(immI, 12);
			ALUOp = ALUOp_AND;
		}
	}
	else if(OP == OP_IW)
	{
		ALUSrc = ALUSrc_Imm;
		RegWrite = RegWrite_Reg;

		if(fuc3 == F3_ADDIW)
		{
			ALUOp = ALUOp_ADDW;
			Imm = ext_signed(immI, 12);
		}
		else if(fuc3 == F3_SLLIW)
		{
			ALUOp = ALUOp_SLLW;
			Imm = immI & 0x3f;
		}
		else if(fuc3 == F3_SRLIW && fuc7 == F7_SRLIW)
		{
			ALUOp = ALUOp_SRLW;
			Imm = immI & 0x3f;
		}
		else if(fuc3 == F3_SRAIW && fuc7 == F7_SRAIW)
		{
			ALUOp = ALUOp_SRAW;
			Imm = immI & 0x3f;
		}
	}
	else if(OP == OP_JALR)
	{
		ALUOp = ALUOp_PC;
		Imm = ext_signed(immI, 12);
		RegWrite = RegWrite_Reg;
		Branch = Branch_JALR;
	}
	else if(OP == OP_SCALL)
	{
		rs = 17; rt = 10;
		
		ALUOp = ALUOp_SCALL;
		ALUSrc = ALUSrc_Rt;	
	}
	else if(OP == OP_SW)
	{
		ALUSrc = ALUSrc_Imm;
		ALUOp = ALUOp_ADD;
		Imm = ext_signed(immS, 12);
		
		if(fuc3 == F3_SB)
		{
			MemWrite = MemWrite_B;
		}
		else if(fuc3 == F3_SH)
		{
			MemWrite = MemWrite_H;
		}
		else if(fuc3 == F3_SW)
		{
			MemWrite = MemWrite_W;
		}
		else if(fuc3 == F3_SD)
		{
			MemWrite = MemWrite_D;
		}
	}
	else if(OP == OP_SB)
	{
		ALUSrc = ALUSrc_Rt;
		Branch = Branch_COND;
		Imm = ext_signed(immSB, 13);

		if(fuc3 == F3_BEQ)
		{
			ALUOp = ALUOp_EQ;
		}
		else if(fuc3 == F3_BNE)
		{
			ALUOp = ALUOp_NE;
		}
		else if(fuc3 == F3_BLT)
		{
			ALUOp = ALUOp_LT;
		}
		else if(fuc3 == F3_BGE)
		{
			ALUOp = ALUOp_GE;
		}
	}
	else if(OP == OP_AUIPC)
	{
		ALUSrc = ALUSrc_PC;
		ALUOp = ALUOp_ADD;
		Imm = ext_signed(immU, 32);
		RegWrite = RegWrite_Reg;
	}
	else if(OP == OP_LUI)
	{
		ALUSrc = ALUSrc_ZERO;
		Imm = ext_signed(immU, 32);
		ALUOp = ALUOp_ADD;
		RegWrite = RegWrite_Reg;
	}
	else if(OP == OP_JAL)
	{
		ALUOp = ALUOp_PC;
		Imm = ext_signed(immUJ, 21);
		RegWrite = RegWrite_Reg;
		Branch = Branch_JAL;
	}


	//write ID_EX_old
	ID_EX_old.Rd = rd;
	ID_EX_old.PC = IF_ID.PC;
	ID_EX_old.Imm = Imm;

	nop_flag = false;
	if(rs == 0)
		ID_EX_old.Reg_Rs = 0;
	else if(EX_MEM_old.Ctrl_WB_MemtoReg == MemtoReg_Reg && EX_MEM_old.Rd == rs)
		nop_flag = true;
	else if(EX_MEM_old.Rd == rs && EX_MEM_old.Ctrl_WB_RegWrite == RegWrite_Reg)
		ID_EX_old.Reg_Rs = EX_MEM_old.ALU_out;
	else if(MEM_WB_old.Rd == rs && MEM_WB_old.Ctrl_WB_MemtoReg == MemtoReg_Reg)
		ID_EX_old.Reg_Rs = MEM_WB_old.Mem_read;
	else if(MEM_WB_old.Rd == rs && MEM_WB_old.Ctrl_WB_RegWrite == RegWrite_Reg)
		ID_EX_old.Reg_Rs = MEM_WB_old.ALU_out;
	else 
		ID_EX_old.Reg_Rs = reg[rs];

	if(rt == 0)
		ID_EX_old.Reg_Rt = 0;
	else if(OP == OP_R || OP == OP_RW || OP == OP_SW || OP == OP_SB)
	{
		if(EX_MEM_old.Ctrl_WB_MemtoReg == MemtoReg_Reg && EX_MEM_old.Rd == rt)
			nop_flag = true;
		if(EX_MEM_old.Rd == rt && EX_MEM_old.Ctrl_WB_RegWrite == RegWrite_Reg)
			ID_EX_old.Reg_Rt = EX_MEM_old.ALU_out;
		else if(MEM_WB_old.Rd == rt && MEM_WB_old.Ctrl_WB_MemtoReg == MemtoReg_Reg)
			ID_EX_old.Reg_Rt = MEM_WB_old.Mem_read;
		else if(MEM_WB_old.Rd == rt && MEM_WB_old.Ctrl_WB_RegWrite == RegWrite_Reg)
			ID_EX_old.Reg_Rt = MEM_WB_old.ALU_out;
		else 
			ID_EX_old.Reg_Rt = reg[rt];
	}
	else ID_EX_old.Reg_Rt = reg[rt];

	ID_EX_old.Ctrl_EX_ALUSrc = ALUSrc;
	ID_EX_old.Ctrl_EX_ALUOp = ALUOp;

	ID_EX_old.Ctrl_M_Branch = Branch;
	ID_EX_old.Ctrl_M_MemWrite = MemWrite;
	ID_EX_old.Ctrl_M_MemRead = MemRead;
	
	ID_EX_old.Ctrl_WB_RegWrite = RegWrite;
	ID_EX_old.Ctrl_WB_MemtoReg = MemtoReg;

	ID_EX_old.is_nop = nop_flag || control_hazard;
	
}

//执行
void EX()
{
	if(ID_EX.is_nop)
	{
		memset(&EX_MEM_old, 0, sizeof(EX_MEM_old));
		EX_MEM_old.is_nop = true;
		fprintf(log_f, "EX nop			");
		return;
	}

	//read ID_EX
	fprintf(log_f, "EX PC = 0x%llx			", ID_EX.PC << 2);
	
	ULL temp_PC = ID_EX.PC;
	int ALUSrc = ID_EX.Ctrl_EX_ALUSrc;
	int ALUOp = ID_EX.Ctrl_EX_ALUOp;
	int Branch = ID_EX.Ctrl_M_Branch;

	//Branch PC calulate
	ULL newPC;
	if(Branch == Branch_COND)
	{
		newPC = (LL)temp_PC + (ID_EX.Imm >> 2);
	}
	else if(Branch == Branch_JALR)
	{
		newPC = ((LL)ID_EX.Reg_Rs + ID_EX.Imm) >> 2;
	}
	else if(Branch == Branch_JAL)
	{
		newPC = (LL)temp_PC + (ID_EX.Imm >> 2);
	}

	//choose ALU input number
	ULL val1 = 0, val2 = 0;
	if(ALUSrc == ALUSrc_Rt)
	{
		val1 = ID_EX.Reg_Rs;
		val2 = ID_EX.Reg_Rt;
	}
	else if(ALUSrc == ALUSrc_Imm)
	{
		val1 = ID_EX.Reg_Rs;
		val2 = ID_EX.Imm;
	}
	else if(ALUSrc == ALUSrc_PC)
	{
		val1 = temp_PC << 2;
		val2 = ID_EX.Imm;
	}
	else if(ALUSrc == ALUSrc_ZERO)
	{
		val1 = ID_EX.Imm;
		val2 = 0;
	}

	//alu calculate
	REG ALUout = 0;
	bool jflag = false;

	switch(ALUOp){
	case ALUOp_None: ALUout = 0; break;
	case ALUOp_ADD: ALUout = val1 + val2; break;
	case ALUOp_MUL: ALUout = (LL)val1 * (LL)val2; break;
	case ALUOp_SUB: ALUout = val1 - val2; break;
	case ALUOp_SLL: ALUout = val1 << val2; break;
	case ALUOp_MULH: {
						LL h1, h2, l1, l2;
						h1 = (LL)val1 >> 32;
						h2 = (LL)val2 >> 32;
						l1 = val1 & 0xffffffff;
						l2 = val2 & 0xffffffff;
						ALUout = h1 * h2 + ((h1 * l2) >> 32) + ((h2 * l1) >> 32);
						break;
					}
	case ALUOp_SLT: ALUout = (LL)val1 < (LL)val2 ? 1 : 0; break;
	case ALUOp_XOR: ALUout = val1 ^ val2; break;
	case ALUOp_DIV: ALUout = (LL)val1 / (LL)val2; break;
	case ALUOp_SRL: ALUout = val1 >> val2; break;
	case ALUOp_SRA: ALUout = (LL)val1 >> val2; break;
	case ALUOp_OR: ALUout = val1 | val2; break;
	case ALUOp_REM: ALUout = (LL)val1 % (LL)val2; break;
	case ALUOp_AND: ALUout = val1 & val2; break;
	case ALUOp_ADDW: ALUout = ext_signed((unsigned)(val1 + val2), 32); break;
	case ALUOp_SUBW: ALUout = ext_signed((unsigned)(val1 - val2), 32); break; 
	case ALUOp_MULW: ALUout = ext_signed((unsigned)((int)val1 * (int)val2), 32); break; 
	case ALUOp_DIVW: ALUout = ext_signed((unsigned)((int)val1 / (int)val2), 32); break; 
	case ALUOp_REMW: ALUout = ext_signed((unsigned)((int)val1 % (int)val2), 32); break; 
	case ALUOp_SLLW: ALUout = ext_signed((unsigned)(val1 << val2), 32); break; 
	case ALUOp_SRLW: ALUout = ext_signed((unsigned)(val1 >> val2), 32); break; 
	case ALUOp_SRAW: ALUout = ext_signed((unsigned)((LL)val1 >> val2), 32); break; 
	case ALUOp_EQ: if(val1 == val2) jflag = true; break;
	case ALUOp_NE: if(val1 != val2) jflag = true; break;
	case ALUOp_LT: if((LL)val1 < (LL)val2) jflag = true; break;
	case ALUOp_GE: if((LL)val1 >= (LL)val2) jflag = true; break;
	case ALUOp_PC: ALUout = (temp_PC << 2) + 4; break;
	case ALUOp_SCALL: {
						if(val1 == 0)
							printf("%d", (int)val2);
						else if(val1 == 1)
							printf("%c", (char)val2);
						break;
					  }
	}
	

	if(Branch == Branch_COND && !jflag)
		control_hazard = true;

	//write EX_MEM_old
	if(jflag || Branch == Branch_JALR || Branch == Branch_JAL)
	{
		EX_MEM_old.PC = newPC;
		EX_MEM_old.Ctrl_M_Branch = Branch_DIRC;
	}
	else 
	{
		EX_MEM_old.PC = temp_PC;
		EX_MEM_old.Ctrl_M_Branch = Branch_NONE;
	}

	EX_MEM_old.Rd = ID_EX.Rd;
	EX_MEM_old.ALU_out = ALUout;
	EX_MEM_old.Reg_Rt = ID_EX.Reg_Rt;

	EX_MEM_old.Ctrl_M_MemWrite = ID_EX.Ctrl_M_MemWrite;
	EX_MEM_old.Ctrl_M_MemRead = ID_EX.Ctrl_M_MemRead;
	EX_MEM_old.Ctrl_WB_RegWrite = ID_EX.Ctrl_WB_RegWrite;
	EX_MEM_old.Ctrl_WB_MemtoReg = ID_EX.Ctrl_WB_MemtoReg;
	EX_MEM_old.is_nop = false;
}

//访问存储器
void MEM()
{
	if(EX_MEM.is_nop)
	{
		memset(&MEM_WB_old, 0, sizeof(MEM_WB_old));
		MEM_WB_old.is_nop = true;
		fprintf(log_f, "MEM nop			");
		return;
	}

	//read EX_MEM
	fprintf(log_f, "MEM PC = 0x%llx			", EX_MEM.PC << 2);
	
	int MemWrite = EX_MEM.Ctrl_M_MemWrite;
	int MemRead = EX_MEM.Ctrl_M_MemRead;
	LL ALU_out = EX_MEM.ALU_out;


	//read / write memory
	ULL Mem_read = 0;

	if(MemWrite == MemWrite_B)
	{
		*((char*)memory + ALU_out) = EX_MEM.Reg_Rt & 0xff;
	}
	else if(MemWrite == MemWrite_H)
	{
		*(unsigned short*)((char*)memory + ALU_out) = EX_MEM.Reg_Rt & 0xffff;
	}
	else if(MemWrite == MemWrite_W)
	{
		*(unsigned*)((char*)memory + ALU_out) = EX_MEM.Reg_Rt & 0xffffffff;
	}
	else if(MemWrite == MemWrite_D)
	{
		*(ULL*)((char*)memory + ALU_out) = EX_MEM.Reg_Rt;
	}
	
	if(MemRead == MemRead_B)
	{
		Mem_read = *((char*)memory + ALU_out);
	}
	else if(MemRead == MemRead_H)
	{
		Mem_read = *(unsigned short*)((char*)memory + ALU_out);
	}
	else if(MemRead == MemRead_W)
	{
		Mem_read = *(unsigned*)((char*)memory + ALU_out);
	}
	else if(MemRead == MemRead_D)
	{
		Mem_read = *(ULL*)((char*)memory +ALU_out);
	}
	

	//write MEM_WB_old
	MEM_WB_old.PC = EX_MEM.PC;
	MEM_WB_old.Rd = EX_MEM.Rd;
	MEM_WB_old.Mem_read = Mem_read;
	MEM_WB_old.ALU_out = ALU_out;

	MEM_WB_old.Ctrl_M_Branch = EX_MEM.Ctrl_M_Branch;
	MEM_WB_old.Ctrl_WB_RegWrite = EX_MEM.Ctrl_WB_RegWrite;
	MEM_WB_old.Ctrl_WB_MemtoReg = EX_MEM.Ctrl_WB_MemtoReg;
	MEM_WB_old.is_nop = false;
}


//写回
void WB()
{
	if(MEM_WB.is_nop)
	{
		fprintf(log_f, "WB nop			");
		return ;
	}

	//read MEM_WB
	fprintf(log_f, "WB PC = 0x%llx			", MEM_WB.PC << 2);
	
	unsigned long long ALU_out = MEM_WB.ALU_out;
	unsigned long long Mem_read = MEM_WB.Mem_read;
	int RegWrite = MEM_WB.Ctrl_WB_RegWrite;
	int MemtoReg = MEM_WB.Ctrl_WB_MemtoReg;

	//write reg
	if(RegWrite == RegWrite_Reg)
	{
		reg[MEM_WB.Rd] = ALU_out;
	}
	else if(MemtoReg == MemtoReg_Reg)
	{
		reg[MEM_WB.Rd] = Mem_read;
	}
}

void print_reg(FILE* pf)
{
	fprintf(pf, "Registers : \n");
	for(int i = 0; i < 32; ++i)
	{
		fprintf(pf, "%4s = 0x%16llx	", reg_name[i], reg[i]);
		i++;
		fprintf(pf, "%4s = 0x%16llx	", reg_name[i], reg[i]);
		i++;
		fprintf(pf, "%4s = 0x%16llx	", reg_name[i], reg[i]);
		i++;
		fprintf(pf, "%4s = 0x%16llx\n", reg_name[i], reg[i]);
	}
	fprintf(pf, "\n");
}
