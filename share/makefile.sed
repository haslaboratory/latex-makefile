SED_TEX_FILES = $(shell find SED -name '*.tex' -or -name '*.sty' -or -name '*.cls' | sed -e 's/ /\ /g')
SED_BIB_FILES = $(shell find SED -name '*.bib' | sed -e 's/ /\ /g')
SED_BST_FILES = $(shell find SED -name '*.bst' | sed -e 's/ /\ /g')
SED_IMG_FILES = $(shell find SED -name '*.jpg' -or -name '*.png' -or -name '*.eps' | sed -e 's/ /\ /g')
SED_PDF_FILES = $(shell share/bin/depend SED)

SED_ALL_FILES = $(SED_TEX_FILES) $(SED_IMG_FILES) $(SED_BIB_FILES) $(SED_BST_FILES) $(SED_PDF_FILES)

SED.pdf: $(SED_ALL_FILES)
	share/bin/latex.route SED
