#!/bin/awk -f
BEGIN {
# Print the squares from 1 to 10 the first way
    i=1;
    printf("Squares:\n")
    while (i <= 10) {
	printf("The square of %3d is %3d\n", i, i*i);
	i = i+1;
    }
# do it again, using more concise code
    printf("Cubes:\n")
    for (i=1; i <= 10; i++) {
	printf("The cube of %3d is %4d\n", i, i**3);
    }
# now end
    exit;
}
