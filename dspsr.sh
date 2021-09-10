#!env bash

#bash ~/dspsr.sh gmrt_dat file
echo "For J0034 use 1024 bins"
echo "For J0134,J0036 use 256 bins"

read -p "Enter ephimeris file :" epfile
read -p "Enter nbin :" nbin
read -p "Enter filename to be saved as :" rfile  

for i in $@
do
        #outfile=$(basename $i).txt
	echo $i
        dspsr -E $epfile -L 10 -U 600 -b $nbin -A -O $rfile $i
done
