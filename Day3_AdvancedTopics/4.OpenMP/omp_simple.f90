program hello

  !$omp parallel
  print *, 'This is a thread'
  !$omp end parallel

end program hello
