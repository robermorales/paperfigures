#!/bin/sh

mkdir -p svg
mkdir -p png
mkdir -p eps
mkdir -p pdf

for i in svg/*.svg
do
	name=`basename "${i}" .svg`
	inkscape -e "png/${name}.png"  -d 90       -y 0                                   "svg/${name}.svg"
	inkscape -A "pdf/${name}.pdf"  -d 90 -b 0        --export-area-page --without-gui "svg/${name}.svg"
	inkscape -E "eps/${name}.eps"  -d 90             --export-area-page --without-gui "svg/${name}.svg"
done

