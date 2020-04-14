#include "syscall.h"

void PrintInt(int n)
{
	asm("li a7,0;" "ecall");
}

void PrintChar(char c)
{
	asm("li a7, 1;" "ecall");
}
