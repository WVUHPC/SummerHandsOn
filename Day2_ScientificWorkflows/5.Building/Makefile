all: single double long_double

single:
	gcc example_fftf.c -l fftw3f -lm -o example_fftf

double:
	gcc example_fft.c -l fftw3 -lm -o example_fft

long_double:
	gcc example_fftl.c -l fftw3l -lm -o example_fftl

pdfpage:
	a2ps -BR -1 example_fftl.c -o page.ps
	ps2pdf page.ps example_fftl.pdf
	rm page.ps
