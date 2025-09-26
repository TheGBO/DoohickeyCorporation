//$ gcc fibonacio.c -o fibonacio.elf
//$ ./fibonacio.elf (count) (print everything)
//$ ./fibonacio.elf 10 true
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>

int main(int argc, char *argv[])
{
	if(argc < 3){
		printf("usage: ./fibonacio.elf <count> <print everything>\n");
		return 1;
	}

	unsigned int numberCount = atoi(argv[1]);

	long long a = 1;
	long long b = 1;
	bool printEverything = strcmp(argv[2], "true") == 0;
	for (int i = 0; i < numberCount; i++)
	{
		long long c = a + b;
		a = b;
		b = c;
		if(printEverything)
		{
			printf("%lld \n", a);
		}
	}
	if(!printEverything)
	{
		printf("%lld \n", a);
	}

    return 0;
}
