#include <stdio.h>      /* printf, NULL */
#include <stdlib.h>     /* srand, rand */
#include <time.h>       /* time */
#include <float.h>

#define N 700000

void average(double *a, double *b, int n)
{
  int i;
#pragma omp parallel for
  for (i=1; i<n; i++) /* i is private by default */
    b[i] = (a[i] + a[i-1]) / 2.0;
}

double max_array(double *a, int n)
{
  int i;
  double max=-DBL_MAX;
  for (i=0; i<n; i++)
    {
      if (a[i]>max)
	{
	  max=a[i];
	}
    }
  return(max);
}

double min_array(double *a, int n)
{
  int i;
  double min=DBL_MAX;
  for (i=0; i<n; i++)
    {
      if (a[i]<min)
	{
	  min=a[i];
	}
    }
  return(min);
}

int minmax(double a[], int n)
{
  double min, max;
  min=min_array(a, n);
  max=max_array(a, n);
  printf("Min= %f Max=%f\n", min, max);
}

int main()
{
  int i, niter=1000;
  double a[N], b[N];

  srand(time(NULL));
  for (i = 0; i < N; i++) {
    a[i] = 2.0*drand48()-1;
  }
  a[0]=a[N-1]=0.0;

  minmax(a,N);
  for (i = 0; i < niter; i++) {
    average(a, b, N);
    average(b, a, N);
    minmax(a, N);
  }
}
