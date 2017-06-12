program omp_vec_addition
  
  integer n, chunksize, chunk, i
  parameter (n=10000) 
  parameter (chunksize=100) 
  real a(n), b(n), c(n)

  !initialization of vectors
  do i = 1, n
     a(i) = i
     b(i) = a(i) * n
  enddo
  chunk = chunksize
        
  !$omp parallel shared(a,b,c,chunk) private(i)
  
  !$omp do schedule(dynamic,chunk)
  do i = 1, n
     c(i) = a(i) + b(i)
  enddo
  !$omp end do
  
  !$omp end parallel

  do i = 1, 10
     write(*,'(3F17.1)') a(i), b(i), c(i)
  end do
  write(*,*) '...'
  do i = 1, 10
     write(*,'(3F17.1)') a(n-10+i), b(n-10+i), c(n-10+i)
  end do

end program omp_vec_addition
