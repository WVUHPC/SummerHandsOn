program vec_add_sections

  integer n, i, tid, omp_get_thread_num
  parameter (n=10000)
  real a(n), b(n), c(n), d(n)

  !some initializations
  do i = 1, n
     a(i) = i * i
     b(i) = i + i
  enddo

  !$omp parallel shared(a,b,c,d), private(i, tid)
  tid=omp_get_thread_num()

  !$omp sections

  !$omp section
  write(*,*) 'Thread: ', tid, ' working on + section'
  do i = 1, n
     c(i) = a(i) + b(i)
  enddo

  !$omp section
  write(*,*) 'Thread: ', tid, ' working on * section'
  do i = 1, n
     d(i) = a(i) * b(i)
  enddo

  !$omp end sections nowait

  !$omp end parallel

  do i = 1, 10
     write(*,'(4f17.1)') a(i), b(i), c(i), d(i)
  end do
  write(*,*) '...'
  do i = 1, 10
     write(*,'(4f17.1)') a(n-10+i), b(n-10+i), c(n-10+i), d(n-10+i)
  end do

end program vec_add_sections
