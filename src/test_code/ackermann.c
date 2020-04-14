#include <stdio.h>
#include "syscall.h"

int ackermann(int m, int n)
{
	if(m == 0) return n + 1;
	if(m > 0 && n == 0) return ackermann(m - 1, 1);
	if(m > 0 && n > 0) return ackermann(m - 1, ackermann(m, n - 1));
}

int main()
{
	int result;
	result = ackermann(3, 6);
	PrintInt(result);
	PrintChar('\n');
	return 0;
}
