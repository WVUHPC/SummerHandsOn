#include <stdio.h>
#include <omp.h>
#define N 10000

int main(int argc, char *argv[]) {

  int i, tid;
  float a[N], b[N], c[N], d[N];
  
  /* Some initializations */
  for (i=0; i < N; i++) {
    a[i] = i * i;
    b[i] = i + i;
  }

#pragma omp parallel shared(a,b,c,d) private(i, tid)
  {
    tid=omp_get_thread_num();

#pragma omp sections nowait
    {
      
#pragma omp section
      {
      printf("Thread: %d working on + section\n", tid);
      for (i=0; i < N; i++)
	c[i] = a[i] + b[i];
      }

#pragma omp section
      {
      printf("Thread: %d working on * section\n", tid);
      for (i=0; i < N; i++)
	d[i] = a[i] * b[i];
      }

    }  /* end of sections */

  }  /* end of parallel region */

  for (i=0; i < 10; i++) printf("%17.1f %17.1f %17.1f %17.1f\n", a[i], b[i], c[i], d[i]);
  printf("...\n");
  for (i=N-10; i < N; i++)  printf("%17.1f %17.1f %17.1f %17.1f\n", a[i], b[i], c[i], d[i]);

}
