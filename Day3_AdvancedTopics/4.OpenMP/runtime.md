routine	purpose
omp_set_num_threads	sets the number of threads that will be used in the next parallel region
omp_get_num_threads	returns the number of threads that are currently in the team executing the parallel region from which it is called
omp_get_max_threads	returns the maximum value that can be returned by a call to the omp_get_num_threads function
omp_get_thread_num	returns the thread number of the thread, within the team, making this call.
omp_get_thread_limit	returns the maximum number of openmp threads available to a program
omp_get_num_procs	returns the number of processors that are available to the program
omp_in_parallel		used to determine if the section of code which is executing is parallel or not
omp_set_dynamic		enables or disables dynamic adjustment (by the run time system) of the number of threads available for execution of parallel regions
omp_get_dynamic		used to determine if dynamic thread adjustment is enabled or not
omp_set_nested		used to enable or disable nested parallelism
omp_get_nested		used to determine if nested parallelism is enabled or not
omp_set_schedule	sets the loop scheduling policy when "runtime" is used as the schedule kind in the openmp directive
omp_get_schedule	returns the loop scheduling policy when "runtime" is used as the schedule kind in the openmp directive
omp_set_max_active_levels	sets the maximum number of nested parallel regions
omp_get_max_active_levels	returns the maximum number of nested parallel regions
omp_get_level			returns the current level of nested parallel regions
omp_get_ancestor_thread_num	returns, for a given nested level of the current thread, the thread number of ancestor thread
omp_get_team_size		returns, for a given nested level of the current thread, the size of the thread team
omp_get_active_level		returns the number of nested, active parallel regions enclosing the task that contains the call
omp_in_final			returns true if the routine is executed in the final task region; otherwise it returns false
omp_init_lock			initializes a lock associated with the lock variable
omp_destroy_lock		disassociates the given lock variable from any locks
omp_set_lock			acquires ownership of a lock
omp_unset_lock			releases a lock
omp_test_lock			attempts to set a lock, but does not block if the lock is unavailable
omp_init_nest_lock		initializes a nested lock associated with the lock variable
omp_destroy_nest_lock		disassociates the given nested lock variable from any locks
omp_set_nest_lock		acquires ownership of a nested lock
omp_unset_nest_lock		releases a nested lock
omp_test_nest_lock		attempts to set a nested lock, but does not block if the lock is unavailable
omp_get_wtime			provides a portable wall clock timing routine
omp_get_wtick			returns a double-precision floating point value equal to the number of seconds between successive clock ticks
