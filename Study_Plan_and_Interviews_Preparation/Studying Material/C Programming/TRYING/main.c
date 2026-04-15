#include <stdio.h>
#include <stdlib.h>
#include "std_types.h"

void main() {
    u8 n;
    printf("Enter the number of elements: ");
    scanf("%d", &n);
    u16* ptr = (u16* ) malloc(n * sizeof(u16));
    if (ptr == NULL) {
        printf("Memory allocation failed\n");
    }
    else {
        printf("Address of the allocated memory: %p\n", ptr);
    }
}