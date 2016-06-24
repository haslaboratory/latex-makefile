PDF_FILES = $(shell ls -d */ | sed -e "s/\//.pdf/g" | sed -e "s/share.pdf//g")
ALL_FILES = $(shell find -name '*.tex' -or -name '*.sty' -or -name '*.cls' -or -name '*.bib' -or -name '*.bst' -or -name '*.jpg' -or -name '*.png' -or -name '*.eps' | sed -e 's/ /\ /g')
MAKEFILES = $(shell ls -d */ | sed -e "/share\//d" | sed -e "s/\//.makefile/g" | sed -e "s/^/.makefile\//g" | sed -e :a -e N -e "s/\n/ /" -e ta)

-include .configure

all: $(PDF_FILES)

clean:
	rm -rf */out .makefile

watch:
	while inotifywait $(ALL_FILES); do make; done

pull:
	git pull https://github.com/janzhou/latex-makefile

multicore:
	make -j$(shell grep -c ^processor /proc/cpuinfo)

.makefile:
	mkdir -p .makefile

.makefile/%.makefile: .makefile share/makefile.sed
	sed -e "s/SED/$*/g" share/makefile.sed > $@

#-include $(MAKEFILES)

