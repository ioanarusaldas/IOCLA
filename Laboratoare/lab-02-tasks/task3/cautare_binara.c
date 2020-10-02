#include <stdio.h>
 
int main()
{
   int c=0, first, last, middle, n, search, array[100];
 
   printf("Enter number of elements\n");
   scanf("%d",&n);
 
   printf("Enter %d integers\n", n);
 
label:
  if( c < n)
  {
     scanf("%d", &array[c]);
      c++;
      goto label;
  }
 
   printf("Enter value to find\n");
   scanf("%d", &search);
 
   first = 0;
   last = n - 1;
   middle = (first+last)/2;

x: 
   if(first<=last)
      goto  x1;
   if(first>last)
   {
      printf("Not found! %d isn't present in the list.\n", search);
      goto xfinal;
   }


x1:
   if(array[middle]<search)
   {
      first=middle+1;
      middle = (first + last)/2;
      goto x;
   }
   if(array[middle]==search)
   {
       printf("%d found at location %d.\n", search, middle+1);
       middle = (first + last)/2;
       goto xfinal;
   }
   if(array[middle]>search)
   {
      last = middle - 1;
      middle = (first + last)/2;
      goto x;
   }
xfinal:
   return 0;

}





   /*while (first <= last) {
      if (array[middle] < search)
         first = middle + 1;    
      else if (array[middle] == search) {
         printf("%d found at location %d.\n", search, middle+1);
         break;
      }
      else
         last = middle - 1;
 
      middle = (first + last)/2;
   }
   if (first > last)
      printf("Not found! %d isn't present in the list.\n", search);
 
   return 0;  
}*/