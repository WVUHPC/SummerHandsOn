PROGRAM DOT_PRODUCT

  INTEGER N, CHUNKSIZE, CHUNK, I, NN
  PARAMETER (N=100)
  PARAMETER (CHUNKSIZE=10)
  REAL A(N), B(N), RESULT

  integer, allocatable :: seed(:)

  call random_seed(size = NN)
  allocate(seed(NN))
  SEED(:)=0.0
  call random_seed(put=seed)

  !Some initializations
  !$OMP  PARALLEL DO &
  !$OMP  DEFAULT(SHARED) PRIVATE(I)
  DO I = 1, N
     CALL RANDOM_NUMBER(A(I))
     CALL RANDOM_NUMBER(B(I))
  ENDDO
  !$OMP  END PARALLEL DO

  RESULT= 0.0
  CHUNK = CHUNKSIZE

  !$OMP  PARALLEL DO &
  !$OMP  DEFAULT(SHARED) PRIVATE(I) &
  !$OMP  SCHEDULE(STATIC,CHUNK) &
  !$OMP  REDUCTION(+:RESULT)
  DO I = 1, N
     RESULT = RESULT + (A(I) * B(I))
  ENDDO
  !$OMP  END PARALLEL DO

  PRINT *, 'Final Result= ', RESULT
  PRINT *, A
  PRINT *, B
END PROGRAM DOT_PRODUCT
