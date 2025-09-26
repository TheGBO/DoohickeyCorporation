#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[])
{
    if(argc < 2){
        printf("usage: ./fibonacio.elf <count>\n");
        return 1;
    }

    unsigned int numberCount = atoi(argv[1]);

    unsigned long long a = 1;
    unsigned long long b = 1;
    for (int i = 0; i < numberCount; i++)
    {
    printf("%llu \n", a);
        unsigned long long c = a + b;
        a = b;
        b = c;
    }

    return 0;
}