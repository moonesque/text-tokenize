/*this program calculates the average of inputed numbers ( up to 100 numbers)*/
#include <stdio.h>
int main(){
	int n = 0;
	float num[100], sum = 0.0, average = 0.0;
	printf("Enter the number of inputs please. 100 at max.\n");
	scanf ("%i", &n);
	int i = 0;
	for ( i = 0; i <100 ; ++i)
		num[i] = 0;
	for ( i = 0; i < n; ++i){
		printf("Input number please.\n");
		scanf("%g", &num[i]);
		if (i == 99){
			printf( "Maximum number of inputs recieved.\n");
			break;
		}
		sum += num[i];
	}
	average = sum / i;
	printf(" The average of these numbers is : %.3f \n", average);
	return 0;
}

