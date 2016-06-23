SED_TEX_FILES = $(shell find SED -name '*.tex' -or -name '*.sty' -or -name '*.cls' | sed -e 's/ /\ /g')
SED_BIB_FILES = $(shell find SED -name '*.bib' | sed -e 's/ /\ /g')
SED_BST_FILES = $(shell find SED -name '*.bst' | sed -e 's/ /\ /g')
SED_IMG_FILES = $(shell find example -name '*.jpg' -or -name '*.png' -or -name '*.eps' | sed -e 's/ /\ /g')

SED.pdf: $(SED_TEX_FILES) $(SED_IMG_FILES) $(SED_BIB_FILES) $(SED_BST_FILES)
	share/bin/latex SED
