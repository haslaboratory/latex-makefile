PAPER = $(shell ls -d */ | sed -e "s/\//.pdf/g" | sed -e "s/share.pdf//g")
VIEW = xdg-open
BIB = bibtex
MULTICORES = make -j$(shell grep -c ^processor /proc/cpuinfo)

define TEX =
share/bin/latex
endef

PRE_COMPILE = share/bin/pre_compile
POST_COMPILE = share/bin/post_compile

ifeq ($(wildcard .configure),) 
	else 
	include .configure
endif

all: $(PAPER)

view: $(PAPER)
	$(VIEW) $(PAPER)

clean:
	rm -rf */out

%.test: $(filter example/%,$(wildcard */*))
	echo $^

%.pdf: $(wildcard $@/*.tex)
	$(PRE_COMPILE) $*
	$(TEX) $*
	$(BIB) $*
	$(TEX) $*
	$(TEX) $*
	$(POST_COMPILE) $*

watch:
	while sleep 10; do make; done

merge:
	git pull git@bitbucket.org:janzhou/latex-example.git

multicore:
	$(MULTICORES)
