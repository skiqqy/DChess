#include<stdio.h>

void signalHandler(int signalNumber)
{
    /* Handle SIGINT */
    if (signalNumber == 2)
    {
        printf("Exiting nicely, and by that I mean just `exit(0)`\n");
        exit(0);
    }
}