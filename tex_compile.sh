#!/bin/sh

#--- Varients ----
TEXFILE="main.tex"
AUXFILE="main"
DVIFILE="main.dvi"
PDFFILE="main.pdf"
#-----------------

platex ${TEXFILE}
#jbibtex ${AUXFILE}
pbibtex ${AUXFILE}
platex ${TEXFILE}
platex ${TEXFILE}
dvipdfmx ${DVIFILE}
open ${PDFFILE}
rm ${AUXFILE}.aux
rm ${AUXFILE}.bbl
rm ${AUXFILE}.blg
rm ${AUXFILE}.dvi
rm ${AUXFILE}.lof
rm ${AUXFILE}.log
rm ${AUXFILE}.lot
rm ${AUXFILE}.toc

cp ${PDFFILE} /home/ysk/.public_html/
#rsync -avz --delete . romen@dali.ht.sfc.keio.ac.jp:/home/romen/graduation_thesis/
#rsync -avz --delete . ysk@dali.ht.sfc.keio.ac.jp:/home/ysk/
