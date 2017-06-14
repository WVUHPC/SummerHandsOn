#include <stdio.h>
#include <stdlib.h>

int main()
{
  int a, b;
  int *p, *q, *tmp;

  a=3;
  b=7;

  p=&a;
  q=&b;
  
  printf("p = %d and it is located at %x or %x\n", *p, &a, p);
  printf("q = %d and it is located at %x or %x\n", *q, &b, q);

  printf("Swaping positions\n");

  tmp = p;
  p = q;
  q = tmp;

  printf("p = %d and it is located at %x or %x\n", *p, &a, p);
  printf("q = %d and it is located at %x or %x\n", *q, &b, q);

}
