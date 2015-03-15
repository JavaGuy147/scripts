#include<stdio.h>

void main()
{
    char str[1024];
    struct{
        unsigned field1 :8;
        unsigned field2 :8;
        unsigned pad:16;
    }field, field_neg;
    field.field1 = 1;
    printf("this unsigned value's mem is %08x is when filed.filed1=1 only\n", field);
    field.field2 = 0;
    field.pad = 0;
    printf("this unsigned value's mem is %08x is when filed.filed1=1 and clear other bits\n", field);
    field_neg.field1 = 0xf0;
    printf("this unsigned value's mem is %08x is when filed_neg.filed1=0xf0 \n", field_neg);
    
    //%z is size_t type; so %zu is long unsigned int which is the type of sizeof()
    printf("int size %zuB\n", sizeof(int));
    printf("unsigned int size %zuB\n", sizeof(unsigned int));
    printf("long size %zuB\n", sizeof(long));
    printf("unsigned long size %zuB\n", sizeof(unsigned long));

    printf("sizeof(char str[1024]) is %d\n", sizeof(str));
    return;
}
