program hello

  integer nthreads, tid, omp_get_num_threads, omp_get_thread_num

  !fork a team of threads with each thread having a private tid variable
  !$omp parallel private(tid)

  !obtain and print thread id
  tid = omp_get_thread_num()
  print *, 'Hello world from thread = ', tid

  !only master thread does this
  if (tid .eq. 0) then
     nthreads = omp_get_num_threads()
     print *, 'Number of threads = ', nthreads
  end if

  !all threads join master thread and disband
  !$omp end parallel

end program hello
