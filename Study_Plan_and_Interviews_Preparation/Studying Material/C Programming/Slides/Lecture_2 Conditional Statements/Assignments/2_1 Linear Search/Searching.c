#include "stdio.h"

void main(void)
{
	int number1, number2, number3, number4,
	number5, number6, number7, number8,
	number9, number10, target, found = 0;
	
	printf("Enter Number 1: ");
	scanf("%d",&number1);
	printf("Enter Number 2: ");
	scanf("%d",&number2);
	printf("Enter Number 3: ");
	scanf("%d",&number3);
	printf("Enter Number 4: ");
	scanf("%d",&number4);
	printf("Enter Number 5: ");
	scanf("%d",&number5);
	printf("Enter Number 6: ");
	scanf("%d",&number6);
	printf("Enter Number 7: ");
	scanf("%d",&number7);
	printf("Enter Number 8: ");
	scanf("%d",&number8);
	printf("Enter Number 9: ");
	scanf("%d",&number9);
	printf("Enter Number 10: ");
	scanf("%d",&number10);

	printf("Enter the target value: ");
	scanf("%d",&target);
	
	if(target == number1)
	{
	printf("Value exists at element number 1\n");
	found = 1;
	}
	
	if(target == number2)
	{
	printf("Value is exist at element number 2\n");
	found = 1;
	}
	
	if(target == number3)
	{
	printf("Value is exist at element number 3\n");
	found = 1;
	}
	
	if(target == number4)
	{
	printf("Value is exist at element number 4\n");
	found = 1;
	}
	
	if(target == number5)
	{
	printf("Value is exist at element number 5\n");
	found = 1;
	}
	
	if(target == number6)
	{
	printf("Value is exist at element number 6\n");
	found = 1;
	}
	
	if(target == number7)
	{
	printf("Value is exist at element number 7\n");
	found = 1;
	}
	
	if(target == number8)
	{
	printf("Value is exist at element number 8\n");
	found = 1;
	}
	
	if(target == number9)
	{
	printf("Value is exist at element number 9\n");
	found = 1;
	}
	
	
	if(target == number10)
	{
	printf("Value is exist at element number 10\n");
	found = 1;
	}
	
	
	if (found == 0)
	{
	printf("value does not exist");
	}
}