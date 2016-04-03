# Latex-Example

This is a latex example/framework.

## Usage

### Init your project:

    git clone https://github.com/janzhou/latex-example

### Create your latex files as the example:

    paper\
        paper.tex
        bib\
            paper.tex
        fig\
            paper.eps

### Compile

This command will compile all the pdffiles in your project:

    make

To compile multiple pdfs concurrently, use command:

    make multicore

### Watch Changes

To compile automatically when file changed:

    make watch

### Write a ``.configure``

If you want to specify the pdf to compile, you can use a configure file:

    PAPER = paper.pdf

## Development

- [Github](https://github.com/janzhou/latex-example)
- [Bitbucket](https://bitbucket.org/janzhou/latex-example)
- [Issue Tracker](https://janzhou.org/bugzilla/buglist.cgi?component=Latex%20Example&product=Latex&resolution=---)
