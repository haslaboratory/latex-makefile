SED_TEX_FILES = $(shell find SED -name '*.tex' -or -name '*.sty' -or -name '*.cls')
SED_BIB_FILES = $(shell find SED -name '*.bib')
SED_BST_FILES = $(shell find SED -name '*.bst')
SED_IMG_FILES = $(shell find SED -path '*.jpg' -or -path '*.png' -or \( \! -path './obj/*.pdf' -path '*.pdf' \) )

SED.pdf: $(SED_TEX_FILES) $(SED_IMG_FILES) $(SED_BIB_FILES) $(SED_BST_FILES)
	share/bin/latex SED
