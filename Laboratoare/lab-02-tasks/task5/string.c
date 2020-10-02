#include <stdio.h>

int main()
{
    char str1[80], str2[80];
    int l, i, j;

    printf("Enter first string: ");
    gets(str1);

    printf("Enter second string: ");
    gets(str2);

    l=0;
    i=0;
    j=0;
x:
    if(str2[l] != '\0')
    {
        l++;
        goto x;
    }
x2:
    if(str1[i] != '\0' && str2[j] != '\0')
        goto x3;
   // if((str1[i] == '\0' && str2[j] != '\0') || (str1[i] != '\0' && str2[j] == '\0') || (str1[i] == '\0' && str2[j] == '\0'))
   // {
        goto xfinal;
    //}

x3:
    if (str1[i] != str2[j])
        goto label;
    j++;
    i++;
    goto x2;
label:
    j=0;
    i++;
    goto x2;



    /*if (str1[i] == str2[j])
    {
        j++;
        i++;
        goto x2;
    }
    if (str1[i] != str2[j])
    {
        j=0;
        i++;
        goto x2;
    }*/
xfinal:
    if (j == l)
    {
        printf("Substring found at position %d\n", i - j + 1);
    }
    if(j!=l)
        printf("Substring not found\n");






   /* for (l = 0; str2[l] != '\0'; l++);

    for (i = 0, j = 0; str1[i] != '\0' && str2[j] != '\0'; i++)
    {
        if (str1[i] == str2[j])
        {
            j++;
        }
        else
        {
            j = 0;
        }
    }

    if (j == l)
    {
        printf("Substring found at position %d", i - j + 1);
    }
    else
    {
        printf("Substring not found");
    }*/

    return 0;
}