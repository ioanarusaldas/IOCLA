
#include <stdio.h>
 
int main()
{
  int array[100], maximum, size, c=0, location = 1;
 
  printf("Enter the number of elements in array\n");
  scanf("%d", &size);
 
  printf("Enter %d integers\n", size);

label:
  if( c < size)
  {
     scanf("%d", &array[c]);
      c++;
      goto label;
  }
//goto label;
  c=1;
  maximum = array[0];
 label2:
  if( c < size){
      goto label3;
    }
label3:
  /*if (array[c] > maximum)
  {
    maximum  = array[c];
    c++;
    goto label2;
  }*/
  if (!((array[c] > maximum)))
    goto final;
  
    maximum  = array[c];
    c++;
    goto label2;
  
   // goto label2;
final:
  printf("Maximum element is present at location %d and it's value is %d.\n", location, maximum);
  return 0;
}