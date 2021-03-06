#!/bin/bash
mkdir $1
swfstrings "page.php?publication=$1&file=$2" > $1/$2.txt
IDS=`swfextract "page.php?publication=$1&file=$2" | grep JPEG | sed -e 's|.*ID(s) ||' -e 's|,||g'`
echo $IDS
for id in $IDS
do
	swfextract "page.php?publication=$1&file=$2" -j $id -o $1/$2-$id.jpg
done
IDS=`swfextract "page.php?publication=$1&file=$2" | grep PNG | sed -e 's|.*ID(s) ||' -e 's|,||g'`
echo $IDS
for id in $IDS
do
	swfextract "page.php?publication=$1&file=$2" -p $id -o $1/$2-$id.png
done