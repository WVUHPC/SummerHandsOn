binwidth = 2.0
sum = 0
bin(x,width)=width*floor(x/width)

pl "vac-dihedral.dat" using (bin($2,binwidth)):(1.0) smooth freq wi li title "Vacuum", "wb-dihedral.dat" using (bin($2,binwidth)):(1.0) smooth freq wi li title "Water box"

pause -1
