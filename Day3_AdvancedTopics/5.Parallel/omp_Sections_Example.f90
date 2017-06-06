PROGRAM VEC_ADD_SECTIONS

  INTEGER N, I, TID, OMP_GET_THREAD_NUM
  PARAMETER (N=1000)
  REAL A(N), B(N), C(N), D(N)

  !Some initializations
  DO I = 1, N
     A(I) = I * 1.5
     B(I) = I + 22.35
  ENDDO

  !$OMP PARALLEL SHARED(A,B,C,D), PRIVATE(I, TID)
  TID=OMP_GET_THREAD_NUM()

  !$OMP SECTIONS

  !$OMP SECTION
  WRITE(*,*) 'Thread: ', TID, ' Working on + section'
  DO I = 1, N
     C(I) = A(I) + B(I)
  ENDDO

  !$OMP SECTION
  WRITE(*,*) 'Thread: ', TID, ' Working on * section'
  DO I = 1, N
     D(I) = A(I) * B(I)
  ENDDO

  !$OMP END SECTIONS NOWAIT

  !$OMP END PARALLEL

END PROGRAM VEC_ADD_SECTIONS
