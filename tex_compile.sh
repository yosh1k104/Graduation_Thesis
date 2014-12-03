#!/bin/sh

#--- Varients ----
TEXFILE="main.tex"
AUXFILE="main"
DVIFILE="main.dvi"
PDFFILE="main.pdf"
#-----------------

platex ${TEXFILE}
jbibtex ${AUXFILE}
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


NUMBER=1

for i in `ls ../old`
do
    if [ $NUMBER -eq 1 ]; then
        DELETE_FILE=${i}
    fi
done

if [ $NUMBER -gt 15 ]; then
    rm -r ../old/$DELETE_FILE
fi

cp -r ../thesis ../old/thesis_`date +%m`:`date +%d`_`date +%H`:`date +%M`:`date +%S`

#rsync -avz --delete . romen@dali.ht.sfc.keio.ac.jp:/home/romen/graduation_thesis/
#rsync -avz --delete . ysk@dali.ht.sfc.keio.ac.jp:/home/ysk/
