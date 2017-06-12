#!/bin/bash
## you must do a 'chmod +x chain.sh' to make it executable then './chain.sh'
## define variable FIRST as jobid that is results after submitting the job with
## qsub
FIRST=$(qsub run1.sh)
## just echoing job because good coding practices
echo $FIRST
## and then repeat but with dependency! afterany means that the job will be 
## put on hold until the first job has completed with NO ERRORS
## however this can be changed to do some really cool stuff... (explained@end)
SECOND=$(qsub -W depend=afterany:$FIRST run2.sh)
echo $SECOND
THIRD=$(qsub -W depend=afterany:$SECOND run3.sh)
echo $THIRD
## usually it is good practice to end all shell scripts (or any scripts)
## with this last line

## this ensure that the script doesn't hang around after completing the
## the commands


## good link to check out http://beige.ucs.indiana.edu/I590/node45.html
## nics must read https://www.nics.tennessee.edu/computing-resources/running-jobs/job-chaining

## dependency list
## Dependency     Definition
##after 	Execute current job after listed jobs have begun
##afterok 	Execute current job after listed jobs have terminated without error
##afternotok 	Execute current job after listed jobs have terminated with an error
##afterany 	Execute current job after listed jobs have terminated for any reason
##before 	Listed jobs can be run after current job begins execution
##beforeok 	Listed jobs can be run after current job terminates without error
##beforenotok 	Listed jobs can be run after current job terminates with an error
##beforeany 	Listed jobs can be run after current job terminates for any reason
