#include <iostream>
#include <stdio.h>
#include <math.h>
#include <sys/io.h>
#include <pthread.h>
#include <time.h>
#include <stdlib.h>
#include <cstring>
#include <vector>
#include "Reg_def.h"

#define OP_R 0x33

#define F3_ADD 0
#define F7_ADD 0
#define F3_MUL 0
#define F7_MUL 0x01
#define F3_SUB 0
#define F7_SUB 0x20

#define F3_SLL 0x1
#define F7_SLL 0
#define F3_MULH 0x1
#define F7_MULH 0X1

#define F3_SLT 0x2
#define F7_SLT 0

#define F3_XOR 0x4
#define F7_XOR 0
#define F3_DIV 0x4
#define F7_DIV 0x1

#define F3_SRL 0x5
#define F7_SRL 0
#define F3_SRA 0x5
#define F7_SRA 0x20

#define F3_OR 0x6
#define F7_OR 0
#define F3_REM 0x6
#define F7_REM 0x1

#define F3_AND 0x7
#define F7_AND 0


#define OP_RW 0x3b

#define F3_ADDW 0
#define F7_ADDW 0
#define F3_SUBW 0
#define F7_SUBW 0x20
#define F3_MULW 0
#define F7_MULW 0x1

#define F3_DIVW 0x4
#define F7_DIVW 0x1
#define F3_REMW 0x6
#define F7_REMW 0x1


#define OP_LW 0x3

#define F3_LB 0
#define F3_LH 0x1
#define F3_LW 0x2
#define F3_LD 0x3


#define OP_I 0x13

#define F3_ADDI 0
#define F3_SLLI 0x1
#define F3_SLTI 0x2
#define F3_XORI 0x4
#define F3_SRLI 0x5
#define F3_SRAI 0x5
#define F3_ORI 0x6
#define F3_ANDI 0x7
#define F7_SRLI 0
#define F7_SRAI 0x10


#define OP_IW 0x1b
#define F3_ADDIW 0
#define F3_SLLIW 0x1
#define F3_SRLIW 0x5
#define F7_SRLIW 0
#define F3_SRAIW 0x5
#define F7_SRAIW 0x20


#define OP_JALR 0x67


#define OP_SCALL 0x73


#define OP_SW 0x23
#define F3_SB 0
#define F3_SH 0x1
#define F3_SW 0x2
#define F3_SD 0x3


#define OP_SB 0x63
#define F3_BEQ 0
#define F3_BNE 0x1
#define F3_BLT 0x4
#define F3_BGE 0x5


#define OP_AUIPC 0x17
#define OP_LUI 0x37
#define OP_JAL 0x6f


#define MAX 100000000

//主存
unsigned int memory[MAX]={0};
//寄存器堆
REG reg[32]={0};
//PC
unsigned long long PC=0;


//各个指令解析段
unsigned int OP=0;
unsigned int fuc3=0,fuc7=0;
int shamt=0;
int rs=0,rt=0,rd=0;
unsigned int immI=0;
unsigned int immS=0;
unsigned int immSB=0;
unsigned int immU=0;
unsigned int immUJ=0;



//加载内存
void load_memory();

void simulate();

void run_single_inst();

void IF();

void ID();

void EX();

void MEM();

void WB();

void print_reg(FILE* pf);


//符号扩展
long long ext_signed(unsigned int src,int bit);

//获取指定位
unsigned int getbit(unsigned inst, int s,int e);

unsigned int getbit(unsigned inst,int s,int e)
{
	unsigned p = (1 << (e - s)) - 1;
	return (inst >> s) & p;
}

long long ext_signed(unsigned int src,int bit)
{
	long long sign = (src >> (bit - 1)) & 1;
	sign = (sign << 63) >> (63 - bit);
    return (long long)src | sign;
}

char reg_name[32][3] = {
		"0", "ra", "sp", "gp", "tp", "t0", "t1", "t2",
		"s0", "s1", "a0", "a1", "a2", "a3", "a4", "a5",
		"a6", "a7", "s2", "s3", "s4", "s5", "s6", "s7",
		"s8", "s9", "sa", "sb", "t3", "t4", "t5", "t6"

};
