#all:
#	pdflatex sig-alternate-sample.tex
#	bibtex sig-alternate-sample
#	pdflatex sig-alternate-sample.tex
#	pdflatex sig-alternate-sample.tex
#	open sig-alternate-sample.pdf

.PHONY: all view aview clean

all: view

sig-alternate-sample.pdf: $(wildcard *.tex) $(wildcard *.bib)
	pdflatex sig-alternate-sample.tex
	bibtex sig-alternate-sample
	pdflatex sig-alternate-sample.tex
	pdflatex sig-alternate-sample.tex
	#dvips -Ppdf -Pdownload35 -j0 -G0 -tletter -osig-alternate-sample.ps sig-alternate-sample.dvi
	#ps2pdf \
	#	-sPAPERSIZE=letter \
	#	-dCompatibilityLevel=1.3 \
 	#	-dEmbedAllFonts=true \
	#	-dSubsetFonts=true \
	#	-dMaxSubsetPct=100 \
	#	-dAutoFilterColorImages=false \
	#	-dAutoFilterGrayImages=false \
	#	-dColorImageFilter=/FlateEncode \
	#	-dGrayImageFilter=/FlateEncode \
	#	-dMonoImageFilter=/FlateEncode  \
	#	sig-alternate-sample.ps

view: sig-alternate-sample.pdf
	if [ `uname -s` == "Darwin" ]; then \
		open -a /Applications/Preview.app \
			sig-alternate-sample.pdf; \
	fi

#	else \
#		xpdf -paper letter sig-alternate-sample.pdf; \

clean:
	rm -f *.sch *.log *.aux *.dvi *.idx *.log *.pdf *.ps *.toc *.bbl *.blg
