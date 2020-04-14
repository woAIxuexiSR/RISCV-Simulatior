#include <stdio.h>
#include "syscall.h"

int a[5][5] = { {1, 0, 0, 0, 0},
				{0, 1, 0, 0, 0},
				{0, 0, 1, 0, 0},
				{0, 0, 0, 1, 0},
				{0, 0, 0, 0, 1}};

int b[5][5] = { {1, 2, 3, 4, 5},
				{0, 1, 0, 0, 0},
				{0, 0, 1, 0, 0},
				{0, 0, 0, 1, 0},
				{0, 0, 0, 0, 1}};

int c[5][5];

int main()
{
	int i = 0;
	for(int i = 0; i < 5; ++i)
		for(int j = 0; j < 5; ++j)
		{
			c[i][j] = 0;
			for(int k = 0; k < 5; ++k)
				c[i][j] += a[i][k] * b[k][j];
		}
	
	for(int i = 0; i < 5; ++i)
	{
		for(int j = 0; j < 5; ++j)
		{
			PrintInt(c[i][j]);
			PrintChar(' ');
		}
		PrintChar('\n');
	}
	return 0;
}
