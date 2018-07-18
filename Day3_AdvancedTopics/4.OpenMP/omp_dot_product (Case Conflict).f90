program dot_product

  integer n, chunksize, chunk, i, nn
  parameter (n=10)
  parameter (chunksize=10)
  real a(n), b(n), result

  integer, allocatable :: seed(:)

  call random_seed(size = nn)
  allocate(seed(nn))
  seed(:)=0.0
  call random_seed(put=seed)

  !some initializations
  !$omp  parallel do &
  !$omp  default(shared) private(i)
  do i = 1, n
     call random_number(a(i))
     call random_number(b(i))
  enddo
  !$omp  end parallel do

  do i = 1, n
     write(*,'(2F17.3)') a(i),b(i)
  end do

  result= 0.0
  chunk = chunksize

  !$omp  parallel do &
  !$omp  default(shared) private(i) &
  !$omp  schedule(static,chunk) &
  !$omp  reduction(+:result)
  do i = 1, n
     result = result + (a(i) * b(i))
  enddo
  !$omp  end parallel do

  print *, 'Dot product of dot(a,b) = ', result
end program dot_product
