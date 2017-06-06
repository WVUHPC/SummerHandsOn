#include <stdio.h>
#include <omp.h>
#define N 1000

int main(int argc, char *argv[]) {

  int i, tid;
  float a[N], b[N], c[N], d[N];
  
  /* Some initializations */
  for (i=0; i < N; i++) {
    a[i] = i * 1.5;
    b[i] = i + 22.35;
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

}
