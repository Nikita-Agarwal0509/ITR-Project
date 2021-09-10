#!/bin/bash
#
#ardir="/data/nagarwal/40_104_29june2021/BM3/ar_files"

read -p "Enter working directory :" ardir

# Basic validation
if [[ ! -d "$ardir" ]]
then
    echo "ERROR: the directory ($ardir) does not exist."
    exit 1
fi

# Process each file
find "$ardir" -type f -name "*.ar" -print0 | while IFS= read -r -d '' arfile
do
    echo "DEBUG file=$arfile"

    paz -r -L -e ar.clean $arfile
    psrplot -pF -j CDTp  -j 'C max'  -N2,1 -D $arfile.ps/cps -c set=pub -c psd=0 $arfile $arfile.clean
    ps2pdf $arfile.ps
done
