PDF_FILES = $(shell share/bin/allpdfs)
ALL_FILES = $(shell find -name '*.tex' -or -name '*.sty' -or -name '*.cls' -or -name '*.bib' -or -name '*.bst' -or -name '*.jpg' -or -name '*.png' -or -name '*.eps' | sed -e 's/ /\ /g')
MAKEFILES = $(shell share/bin/allmakefiles)
PWD=$(shell pwd)

-include .configure

all: $(PDF_FILES)

clean:
	rm -rf */out .makefile

watch:
	share/bin/watch

watch-inotify:
	share/bin/watch-inotify

pull:
	git pull https://github.com/janzhou/latex-makefile
	${PWD}/pkgdep.sh

pull-develop:
	git pull https://github.com/janzhou/latex-makefile develop
	${PWD}/pkgdep.sh

multicore:
	make -j$(shell grep -c ^processor /proc/cpuinfo)

.makefile:
	mkdir -p .makefile

.makefile/%.makefile: .makefile share/makefile.sed
	sed -e "s/SED/$*/g" share/makefile.sed > $@

-include $(MAKEFILES)

echo:
	echo $(PDF_FILES)

inst_dependencies:
	${PWD}/pkgdep.sh