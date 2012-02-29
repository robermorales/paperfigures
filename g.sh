#!/bin/sh

mkdir -p svg png canon ps
mkdir -p svgg pngg pdf

cd dot
for i in *.dot
do
	b=`basename $i .dot`
	for t in png svg canon ps
	do
		dot $i -o../$t/$b.$t -T$t
	done
	xsltproc ../notugly.xsl ../svg/$b.svg > ../svgg/$b.svg
	convert ../svgg/$b.svg ../pngg/$b.png
	epstopdf ../ps/$b.ps --outfile=../pdf/$b.pdf
done
cd ..
