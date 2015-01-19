PAPER = paper.pdf
VIEW = chromium
BIB = bibtex
VERSION = $(shell git describe --always)
DATE = $(shell git log -n 1 --format=%ai)

define TEX =
pdflatex -interaction nonstopmode -halt-on-error -file-line-error "\def\version{$(DATE) $(VERSION)} \input{$*}"
endef

ifeq ($(wildcard .configure),) 
	else 
	include .configure
endif

all: $(PAPER)

view: $(PAPER)
	$(VIEW) $(PAPER)

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.dvi *.nav *.snm *.toc

%.pdf: %.bib %.tex
	$(TEX) $*.tex
	$(BIB) $*
	$(TEX) $*.tex
	$(TEX) $*.tex

watch:
	while sleep 10; do make; done
