program main
  use mpi
  double precision  pi25dt
  parameter        (pi25dt = 3.141592653589793238462643d0)
  double precision  mypi, pi, h, sum, x, f, a
  integer n, myid, numprocs, i, ierr
  character(len=32) :: arg
  ! Function to integrate
  f(a) = 4.d0 / (1.d0 + a*a)

  ! Basic initialization calls
  call mpi_init(ierr)
  call mpi_comm_rank(mpi_comm_world, myid, ierr)
  call mpi_comm_size(mpi_comm_world, numprocs, ierr)

  if (myid .eq. 0) then
     i = 0
     ierr = 1
     do
        call get_command_argument(i, arg)
        if (len_trim(arg) == 0) exit
        i = i+1
        if (i .eq. 2) then
           read(arg,*,iostat=ierr)  n

           if (ierr .ne. 0 ) then
              write(*,*) 'Conversion failed asuming n = 10 ierr=',ierr,n
              n = 10
           end if
        end if
     end do
  write(*,*) 'Splitting with N = ', n
  endif

  ! Broadcast n
  call mpi_bcast(n, 1, mpi_integer, 0, mpi_comm_world, ierr)
  ! Calculate the interval size
  h = 1.0d0/n
  sum  = 0.0d0
  write(*,*) 'Rank ', myid, 'Computing from ', myid+1, 'jumping ', numprocs
  do i = myid+1, n, numprocs
     x = h * (dble(i) - 0.5d0)
     sum = sum + f(x)
  enddo
  mypi = h * sum
  ! Collect all the partial sums
  call mpi_reduce(mypi, pi, 1, mpi_double_precision, &
       mpi_sum, 0, mpi_comm_world, ierr)
  ! Node 0 prints the answer.
  if (myid .eq. 0) then
     print *, 'pi is ', pi, ' error is', abs(pi - pi25dt)
  endif

  call mpi_finalize(ierr)
end program main
