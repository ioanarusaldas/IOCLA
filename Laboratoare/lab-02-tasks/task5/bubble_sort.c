/* Bubble sort code */
 
#include <stdio.h>
 
int main()
{
  int array[100], n, c=0, d, swap,i=0;
 
  printf("Enter number of elements\n");
  scanf("%d", &n);
 
  printf("Enter %d integers\n", n);
 
  //for (c = 0; c < n; c++)
    //scanf("%d", &array[c]);
  label:
  if( c < n)
  {
     scanf("%d", &array[c]);
      c++;
      goto label;
  }
  c=0;
  d=0;
x:
  if(c < n - 1)
    goto x2;
  if(c >= n - 1)
    goto xfinal;
x2:
  if(d < n - c -1)
  {
      goto x3;
  }
  if(d < n - c -1)
    goto x3;

  c++;
  d=0;
  goto x;
  
x3:
  if (!((array[d] > array[d+1])))
    goto a;
    
  swap = array[d];
  array[d] = array[d+1];
  array[d+1] = swap;
      
a:
  d++;
  goto x2;

xfinal:
  printf("Sorted list in ascending order:\n");
  goto label2;
label2:
  if( i < n)
  {
      printf("%d\n", array[i]);
      i++;
      goto label2;
  }
  
  








 
  /*for (c = 0 ; c < n - 1; c++)
  {
    for (d = 0 ; d < n - c - 1; d++)
    {
      if (array[d] > array[d+1]) 
      {
        swap       = array[d];
        array[d]   = array[d+1];
        array[d+1] = swap;
      }
    }
  }
 
  printf("Sorted list in ascending order:\n");
 
  for (c = 0; c < n; c++)
     printf("%d\n", array[c]);*/
 
  return 0;
}