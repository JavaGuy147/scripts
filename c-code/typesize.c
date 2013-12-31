#include<stdio.h>

void main()
{
    //%z is size_t type; so %zu is long unsigned int which is the type of sizeof()
    printf("int size %zuB\n", sizeof(int));
    printf("unsigned int size %zuB\n", sizeof(unsigned int));
    printf("long size %zuB\n", sizeof(long));
    printf("unsigned long size %zuB\n", sizeof(unsigned long));

}