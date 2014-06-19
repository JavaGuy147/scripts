#include <stdio.h>

void main()
{
    int i=0;
    double result;
    for(i=0;; i++)
    {
        result += ((i+1)*i)%(i+2);
    }

}
