#include <stdio.h>
#include <stdlib.h>
#include <omp.h>

# define N 10

int main(int argc, char *argv[])  {

  int   i, chunk;
  float a[N], b[N], result;

  /* Some initializations */
  chunk = 10;
  result = 0.0;
  for (i=0; i < N; i++) {
    a[i] = drand48();
    b[i] = drand48();
  }

  for (i=0; i < N; i++)
    printf("%17.3f %17.3f\n", a[i], b[i]);

#pragma omp parallel for       \
  default(shared) private(i)   \
  schedule(static,chunk)       \
  reduction(+:result)

  for (i=0; i < N; i++)
    result = result + (a[i] * b[i]);

 printf("Dot Product dot(a,b) = %f\n",result);
}
