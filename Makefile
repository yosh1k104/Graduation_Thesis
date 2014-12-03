FILENAME=main

all: 
	platex ${FILENAME}.tex
	jbibtex ${FILENAME}
	platex ${FILENAME}.tex
	platex ${FILENAME}.tex

	dvipdfmx ${FILENAME}.dvi
	open ${FILENAME}.pdf
	#rsync -avz . ysk@dali.ht.sfc.keio.ac.jp:~/graduation_thesis/
