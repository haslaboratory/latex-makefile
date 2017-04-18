SED_TEX_FILES = $(shell find SED.tex -name '*.tex' -or -name '*.sty' -or -name '*.cls' | grep -v '.\#' | sed -e 's/ /\\ /g')
SED_BIB_FILES = $(shell find SED.tex -name '*.bib' | grep -v '.\#' | sed -e 's/ /\\ /g')
SED_BST_FILES = $(shell find SED.tex -name '*.bst' | grep -v '.\#' | sed -e 's/ /\\ /g')
SED_IMG_FILES = $(shell find SED.tex -name '*.jpg' -or -name '*.png' -or -name '*.eps' -or -name '*.csv' | grep -v '.\#' | sed -e 's/ /\\ /g')
SED_PDF_FILES = $(shell share/bin/depend SED.tex)

SED_ALL_FILES = $(SED_TEX_FILES) $(SED_IMG_FILES) $(SED_BIB_FILES) $(SED_BST_FILES) $(SED_PDF_FILES)

SED.pdf: $(SED_ALL_FILES)
	 share/bin/latex.route SED.tex