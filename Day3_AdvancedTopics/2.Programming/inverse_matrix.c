#include <stdio.h>
#include <gsl/gsl_matrix.h>
#include <gsl/gsl_linalg.h>

int main(int argc, const char * argv[])
{
  // Declare pointer variables for a gsl matrix
  gsl_matrix *A, *Ainverse;
  gsl_permutation *p;
  int i, j, s, status, N=4;

  // Create the matrix
  A = gsl_matrix_alloc(N, N);
  Ainverse = gsl_matrix_alloc(N, N);
  p = gsl_permutation_alloc (N);

  for(i=0; i<N; i++) {
      for(j=0; j<N; j++) {
        gsl_matrix_set(A,i,j,drand48());
    }
  }

  // Print the initial matrix
  printf("Initial Matrix\n");
  for (i=0;i<N;i++)
    {
      for (j=0;j<N;j++)
	     {
	        printf("%16.4f ",gsl_matrix_get(A,i,j));
        }
      printf("\n");
    }
  printf("\n");

  status = gsl_linalg_LU_decomp(A, p, &s);
  printf("Status of decomposition %d\n", status);

  status = gsl_linalg_LU_invert (A, p, Ainverse);
  printf("Status of inversion %d\n", status);

  // Print the initial matrix
  printf("Inverse Matrix\n");
  for (i=0;i<N;i++)
    {
      for (j=0;j<N;j++)
	     {
	        printf("%16.4f ",gsl_matrix_get(Ainverse,i,j));
        }
      printf("\n");
    }
  printf("\n");

  // Clean up
  gsl_permutation_free (p);
  gsl_matrix_free(A);
  gsl_matrix_free(Ainverse);

  return 0;
}
