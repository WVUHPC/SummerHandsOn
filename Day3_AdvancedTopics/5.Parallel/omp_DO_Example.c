#include <stdio.h>
#include <omp.h>
#define N 1000
#define CHUNKSIZE 100

int main(int argc, char *argv[]) {

  int i, chunk, tid;
  float a[N], b[N], c[N];

  /* Some initializations */
  for (i=0; i < N; i++)
    a[i] = b[i] = i * 1.0;
  chunk = CHUNKSIZE;

#pragma omp parallel shared(a,b,c,chunk) private(i, tid)
  {
    tid=omp_get_thread_num();
#pragma omp for schedule(dynamic,chunk) nowait
    for (i=0; i < N; i++)
      printf("Thread: %d working on i=%d\n", tid, i);
      c[i] = a[i] + b[i];

  }   /* end of parallel region */

}

