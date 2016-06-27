# Latex-Makefile

Ultimate Latex Makefile with Example: https://github.com/janzhou/latex-makefile

# Usage

## Init your project:

Clone the makefile:

    git clone https://github.com/janzhou/latex-makefile

*Do not touch the existing files unless you want to develop the makefile. All your latex files should be placed in standalone directories.*

## Put your latex files in sub folder:

Create a new sub folder to start editing. e.g. If you want to generate ``article.pdf``, create a folder named ``article``.

    mkdir article

The compiling script will start from ``article/index.tex`` or ``article/article.tex``.

In using ``index.tex`` it is easier for you to rename the sub folder.

In using ``article.tex`` like file, you can more easily compile the ``.tex`` files to ``article.pdf`` in standalone compilers. e.g. You may compile it using MiKTeX GUI program.

## Compile

The compiler will automatically find all the sub folders, and solve the dependencies. Each sub folder will compiled to a ``pdf`` file. Just use ``GNU Make``:

    make

You can also compile specific ``pdf`` file by use the filename as the parameter. e.g.

    make article.pdf

If you are using multicore CPUs, and you want to compile multiple ``pdf``s concurrently. The ``Makefile`` can find the number of CPU Cores, and do multi threaded compiling:

    make multicore

## Watch Changes

The ``Makefile`` can watch the changes in the directories and compile the ``pdf``s automatically when files modified. There are two scripts included. One is using a loop to compile the ``pdf``s:

    make watch

The other one is using ``inotify`` to watch the file changes in the directories (require ``inotify-tools`` in debian based system):

    make watch-inotify

Use the one that works for you. Because in each ``make``, the ``Makefile`` will search the dependencies, this will result in warnnings like this:

```
.makefile/example.makefile:9: warning: overriding recipe for target 'example.pdf'
;�-:9: warning: ignoring old recipe for target 'example.pdf'
```

Alternatively you can use shell scripts located in ``share/bin/watch`` and ``share/bin/watch-inotify`` to avoid the warning.

# Advanced Usage

## Upgrade the Makefile

To upgrade the ``Makefile``, simply use command:

    make pull

In order to not break the upgrade, please do not touch any existing files and directories such as:

- example
- share
- Makefile

## Override Makefile

If you need to customize the ``Makefile``, place your stuff in ``.configure``.

## Config the compiler

The ``Makefile`` will use ``xelatex`` by default, if you want to override this, create a file ``article/config`` and write:

    latex=lualatex

The supported compilers are ``pdflatex``, ``lualatex``.

You can also override ``bib`` compiler:

    bib=biber

## TEXMF Search Path

Suppose you are compiling ``article.pdf``. These paths will be searched in order: ``article``, ``.``, ``article/texmf`` and ``share/texmf``.

If you have customized ``.sty``, ``.bst``, ``.cls`` files, you can place them in ``article``. Or you can place them in ``article/texmf`` to keep your top level directory clean.

Because ``.`` is included in the search path, you can include files from other sub folders by using ``\input{other-articles/example.tex}`` (replace ``other-articles`` with real path).

The use of ``share/texmf`` should be avoided, as it is supposed to put some shared files.

## Default Variables you can use in ``.tex`` files

You can use some default variables in your ``.tex`` files:

- ``\id``: The current folder/pdf name. e.g. In ``.tex`` files in folder ``article``, the ``\id`` should be equal to ``article``.
- ``\version``: This is the ``git`` version you can use in your ``.tex`` files. You can also use ``\include{version}`` to stay safer (``\version`` will be undefined if you use it in standalone compiler. ``share/texmf/version.tex`` will check if ``\version`` is defined for you.).

# Related Projects

These are latex compiling scripts which have been updated with in 2 years:

- [shiblon/latex-makefile](https://github.com/shiblon/latex-makefile) shiblon's version. Currently has most stars and forks on github.
- [latexmk-Makefile](https://github.com/rueycheng/latexmk-Makefile) a boilerplate Makefile showing how to use latexmk with Gnu Make.
- [repsacc/latex-makefile](https://github.com/repsacc/latex-makefile) a very basic Makefile with example.
- [makefile-latex](https://github.com/ricardoerikson/makefile-latex) ricardoerikson's version.
- [LatexProjectMakefile](https://github.com/Daniel-M/LatexProjectMakefile) Daniel-M's version. Able to compile multiple pdf files, but need some efforts.
- [kulia/makefile-for-latex](https://github.com/kulia/makefile-for-latex) kulia's version.
- [boris-spas/latex-makefile](https://github.com/boris-spas/latex-makefile) Makefile wrapper around latexmk.
