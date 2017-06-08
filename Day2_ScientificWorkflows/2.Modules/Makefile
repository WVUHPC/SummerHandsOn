all:
	echo "Enter pdfpage to generate the page of the code"

pdfpage:
	a2ps -BR -1 my_local_module -o - | ps2pdf - my_local_module.pdf
