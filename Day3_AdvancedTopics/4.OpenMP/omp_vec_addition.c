#include <omp.h>
#include <stdio.h>
#define N 10000
#define CHUNKSIZE 100

int main(int argc, char *argv[]) {

  int i, chunk;
  float a[N], b[N], c[N];

  /* Initializing vectors */
  for (i=0; i < N; i++)
    {
      a[i] = i; 
      b[i] = i * N;
    }
  chunk = CHUNKSIZE;

#pragma omp parallel shared(a,b,c,chunk) private(i)
  {
#pragma omp for schedule(dynamic,chunk)
    for (i=0; i < N; i++)
      c[i] = a[i] + b[i];
  }   /* end of parallel region */

  for (i=0; i < 10; i++) printf("%17.1f %17.1f %17.1f\n", a[i], b[i], c[i]);
  printf("...\n");
  for (i=N-10; i < N; i++)  printf("%17.1f %17.1f %17.1f\n", a[i], b[i], c[i]);
}
