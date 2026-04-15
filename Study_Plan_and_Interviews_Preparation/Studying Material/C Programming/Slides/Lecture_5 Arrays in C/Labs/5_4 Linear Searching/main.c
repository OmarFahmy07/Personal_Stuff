#include <stdio.h>

void main (void)
{
	double arr[10], target;
	int counter = 0;
	for (int i = 0; i < 10; i++)
	{
		printf ("Enter element of index %d: ", i);
		scanf ("%lf", &arr[i]);
	}
	
	printf ("\nEnter a number to search for: ");
	scanf ("%lf", &target);
	
	for (int i =0; i < 10; i++)
	{
		if (target == arr[i])
			counter++;
	}
	
	if (counter == 0)
		printf ("\nTarget does not exist");
	else
		printf ("Number %lf exists %d times.", target, counter);
}