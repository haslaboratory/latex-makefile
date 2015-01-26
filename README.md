# Latex-Example

This is a latex example/framework.

## Usage

### Init your project:

```bash
git init your paper
git pull https://github.com/janzhou/latex-example master
```

### Create your latex files as the example:

```
    mypdf\
        mypdf.tex
        bib\
            mypdf.tex
        fig\
            myfig.eps
```

### Compile

This command will compile all the pdffiles in your project:

```bash
make
```

### Write a ``.configure``

If you want to specify the pdf to compile, you can use a configure file:

```makefile
    PAPER = mypdf.pdf
```
