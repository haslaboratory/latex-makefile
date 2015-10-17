# Latex-Example

This is a latex example/framework.

## Usage

### Init your project:

```bash
git clone https://github.com/janzhou/latex-example
```

### Create your latex files as the example:

```
    paper\
        paper.tex
        bib\
            paper.tex
        fig\
            paper.eps
```

### Compile

This command will compile all the pdffiles in your project:

```bash
make
```

### Write a ``.configure``

If you want to specify the pdf to compile, you can use a configure file:

```makefile
    PAPER = paper.pdf
```
