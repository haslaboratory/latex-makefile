PAPER = $(shell ls -d */ | sed -e "s/\//.pdf/g" | sed -e "s/share.pdf//g")
VIEW = xdg-open
MULTICORES = make -j$(shell grep -c ^processor /proc/cpuinfo)
MAKEFILES = $(shell ls -d */ | sed -e "/share\//d" | sed -e "s/\//.makefile/g" | sed -e "s/^/.makefile\//g" | sed -e :a -e N -e "s/\n/ /" -e ta)

-include .configure

all: $(MAKEFILES) $(PAPER)

view: $(PAPER)
	$(VIEW) $(PAPER)

clean:
	rm -rf */out .makefile

watch:
	while sleep 10; do make; done

pull:
	git pull https://github.com/janzhou/latex-makefile

multicore:
	$(MULTICORES)

.makefile:
	mkdir -p .makefile

.makefile/%.makefile: .makefile share/makefile.sed
	sed -e "s/SED/$*/g" share/makefile.sed > $@

-include $(MAKEFILES)

