PAPER = $(shell ls -d */ | sed -e "s/\//.pdf/g" | sed -e "s/share.pdf//g")
VIEW = xdg-open
BIB = bibtex
VERSION = $(shell git describe --always)
DATE = $(shell git log -n 1 --format=%ai)
MULTICORES = make -j$(shell grep -c ^processor /proc/cpuinfo)

define TEX =
share/bin/latex
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

%.pdf: %/* %/*/*
	$(TEX) $*
	$(BIB) $*
	$(TEX) $*
	$(TEX) $*

watch:
	while sleep 10; do make; done

merge:
	git pull git@bitbucket.org:janzhou/latex-example.git

multicore:
	$(MULTICORES)
