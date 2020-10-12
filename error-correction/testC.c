/*
 * Author: Evan Colwell
 * Date: 10/12/2020
 * Description: This is a simple C program that I used as a refresher for my CS410 class to test what I remembered from a previous C class.
 *              This program will be used for the error correction for the CSA Hacktoberfest 2020 challenge.
*/

//This program has 8 errors, 3 of which are logical errors.

// To compile C code, do gcc filename (use -o and a name to name the output file)

#include <stdio.h>

int main()
{
    //Question 3
    int myInt = 0;
    printf("Please enter an integer: ");
    scnf("%d", &myInt);
    myInt = myInt+1;
    printf("%d\n", myint);

    //Question 4
    int x = 18;
     y = 4;
    double div = x/y;
    printf("%f\n", div);

    //Question 5
    int i = 0;
    i += 1;
    i += 1;
    printf("%d\n", i);

    //Question 7
    int a = 3;
    int b = 4;
    printf("%d d\n", a,b);

    //Question 8
    int count = 1
    while(count  21){
        if(count%3 == 0 || count%5 == 0){
            if(count%5 == 0) printf("Fizz ");
            if(count%3 == 0) printf("Buzz ");
        } else {
            printf("%d", count);
        }
        printf("\n");
        count += 1;
    }

    
}
