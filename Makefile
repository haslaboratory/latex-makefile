PAPER = $(shell ls -d */ | sed -e "s/\//.pdf/g" | sed -e "s/share.pdf//g")
VIEW = xdg-open
MULTICORES = make -j$(shell grep -c ^processor /proc/cpuinfo)

ifeq ($(wildcard .configure),) 
	else 
	include .configure
endif

all: $(PAPER)

view: $(PAPER)
	$(VIEW) $(PAPER)

clean:
	rm -rf */out

depend:
	share/bin/depend

watch:
	while sleep 10; do make depend; make; done

pull:
	git pull https://github.com/janzhou/latex-example

multicore:
	$(MULTICORES)

include makefile.d
