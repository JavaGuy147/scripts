#include <stdio.h>

void main()
{
    int i=0;
    double result = 0;
    for(i=0;; i++)
    {
        result += ((i+1)*i)%(i+2);
	if (result >= 100000000)
		result = 1;
    }

}
