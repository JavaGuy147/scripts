#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>

int f = 0, x = 0;

void* handler1(void *data)
{
    while (f == 0);
    // Memory fence required here
    printf("%d\n", x);
}

void* handler2(void *data)
{
    x = 42;
    // Memory fence required here
    f = 1;
}

int main(int argc, char argv[])
{
    pthread_t tid1, tid2;

    pthread_create(&tid1, NULL, handler1, NULL);
    pthread_create(&tid2, NULL, handler2, NULL);

    sleep(1);
    return 0;
}
