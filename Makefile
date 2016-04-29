#all:
#	pdflatex paper.tex
#	bibtex paper
#	pdflatex paper.tex
#	pdflatex paper.tex
#	open paper.pdf

.PHONY: all view aview clean

all: view

paper.pdf: $(wildcard *.tex) $(wildcard *.bib)
	pdflatex paper.tex
	bibtex paper
	pdflatex paper.tex
	pdflatex paper.tex
	#dvips -Ppdf -Pdownload35 -j0 -G0 -tletter -opaper.ps paper.dvi
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
	#	paper.ps

view: paper.pdf
	if [ `uname -s` == "Darwin" ]; then \
		open -a /Applications/Preview.app \
			paper.pdf; \
	fi

#	else \
#		xpdf -paper letter paper.pdf; \

clean:
	rm -f *.sch *.log *.aux *.dvi *.idx *.log *.pdf *.ps *.toc *.bbl *.blg
