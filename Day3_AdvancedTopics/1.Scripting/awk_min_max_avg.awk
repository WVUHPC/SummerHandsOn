#/usr/bin/awk -f
BEGIN {
    emin=10000;
    emax=-10000;
    eavg=0.0
    nele=0
}
(/etot\/atom/){
    etot_atom = $11
    if ( etot_atom < emin ) {
	emin = etot_atom;
    }
    if ( etot_atom > emax ) {
	emax = etot_atom;
    }
    eavg+=etot_atom;
    nele+=1
}
END {
    printf("Minimum: %f Maximum: %f Average: %f\n", emin, emax, eavg/nele);
}
