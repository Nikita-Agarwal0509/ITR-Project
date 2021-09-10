#!env bash

#read -r date tm MJD ifile ofile
read -p "Enter date (DD/MM/YYYY) :" date  
read -p "Enter IST - 5:30 HRS time:" tm
read -p "Enter MJD:" MJD
read -p "Input header file template (~/) :" ifile
read -p "Enter output file name (.gmrt_hdr) :" ofile

sed -e "s+X+$date+g" -e "s+Y+$tm+g" -e "s/Z/$MJD/g" "$ifile" > "$ofile"
