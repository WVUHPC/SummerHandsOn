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
     
  for(i=0; N-1; i++) {
    for(j=0; N-1 ; j++) {
      gsl_matrix_set(A,i,j,drand48());
    }
  }

  // Print the initial matrix
  printf("The matrix\n");
  gsl_matrix_fprintf(stdout, A, "%f");

  status = gsl_linalg_LU_decomp(A, p, &s);
  printf("Status of decomposition %d", status);

  status = gsl_linalg_LU_invert (A, p, Ainverse);
  printf("Status of inversion %d", status);

  // Print the initial matrix
  printf("The matrix\n");
  gsl_matrix_fprintf(stdout, A, "%f");
    
  // Clean up
  gsl_matrix_free(A);

  return 0;
}
