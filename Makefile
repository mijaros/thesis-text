.PHONY: all bp clean clean-all recreate

all: bp

bp: bp.pdf

bp.pdf: index.tex chapters/intro.tex chapters/chapter1.tex chapters/chapter2.tex chapters/chapter3.tex chapters/chapter4.tex index.bib
	pdflatex -interaction=nonstopmode -synctex=1 index.tex
	bibtex index.aux
	pdflatex -interaction=nonstopmode -synctex=1 index.tex
	pdflatex -interaction=nonstopmode -synctex=1 index.tex
	mv index.pdf bp.pdf

clean:
	rm -rf *.{log,out,pdf,aux,tfm,600pk,514pk,fls,toc,bbl,blg,fdb_latexmk,synctex.gz}

clean-all: clean
	rm -rf *.pdf

recreate: clean-all all
	evince bp.pdf
