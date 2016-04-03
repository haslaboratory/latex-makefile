PAPER = $(shell ls -d */ | sed -e "s/\//.pdf/g" | sed -e "s/share.pdf//g")
VIEW = xdg-open
MULTICORES = make -j$(shell grep -c ^processor /proc/cpuinfo)

-include .configure

all: dependencies $(PAPER)

view: $(PAPER)
	$(VIEW) $(PAPER)

clean:
	rm -rf */out dependencies

dependencies:
	share/bin/depend > dependencies

watch:
	while sleep 10; do make; done

pull:
	git pull https://github.com/janzhou/latex-example

multicore:
	$(MULTICORES)

-include dependencies
