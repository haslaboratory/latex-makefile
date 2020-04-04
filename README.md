# Latex-Makefile

Ultimate Latex Makefile with Example: https://github.com/janzhou/latex-makefile

# Windows Subsystem for Linux (Bash on Windows)

To use under bash on windows, convert the bash scripts to Unix format:

```bash
dos2unix share/bin/*
```

# Usage

## Suggested Tools

For Debian/Ubuntu-based systems, install:

```bash
sudo apt install make texlive-full inotify-tools biber bibtool poppler-utils python-pygments
```

## Init your project:

Clone the makefile:

```bash
git clone https://github.com/janzhou/latex-makefile
```

*Do not touch the existing files unless you want to develop the makefile. All your latex files should be placed in standalone directories.*

## Put your latex files in a subfolder:

Create a new subfolder to start editing. e.g., If you want to generate ``article.pdf``, create a folder named ``article``.

```bash
cp example.tex article.tex
```

The compiling script will start from ``article.tex/index.tex`` or ``article.tex/article.tex``.

In using ``index.tex`` it is easier for you to rename the subfolder.

In using ``article.tex`` like file, you can more easily compile the ``.tex`` files to ``article.pdf`` in standalone compilers. e.g., You may compile it using MiKTeX GUI program.

## Compile

The compiler will automatically find all the subfolders and solve the dependencies. Each subfolder will compile to a ``pdf`` file. Just use ``GNU Make``:

```bash
make
```

You can also compile a specific ``pdf`` file by using the filename as the parameter. e.g.

```bash
make article.pdf
```

If you are using multicore CPUs, and you want to compile multiple ``pdf``s concurrently. The ``Makefile`` can find the number of CPU Cores, and do multi-threaded compiling:

```bash
make multicore
```

## Watch Changes

The ``Makefile`` can watch the changes in the directories and compile the ``pdf``s automatically when files modified. There are two scripts included. One is using a loop to compile the ``pdf``s:

```bash
make watch
```

The other one is using ``inotify`` to watch the file changes in the directories (require ``inotify-tools`` in Debian based systems):

```bash
make watch-inotify
```

Use the one that works for you. Because in each ``make``, the ``Makefile`` will search the dependencies, and this will result in warnings like this:

```
.makefile/example.makefile:9: warning: overriding recipe for target 'example.pdf'
;�-:9: warning: ignoring old recipe for target 'example.pdf'
```

Alternatively you can use shell scripts located in ``share/bin/watch`` and ``share/bin/watch-inotify`` to avoid the warning.

# Advanced Usage

## Upgrade the Makefile

To upgrade the ``Makefile``, simply use the command:

```bash
make pull
```

In order to not break the upgrade, please do not touch any existing files and directories such as:

- example
- share
- Makefile

## Override Makefile

If you need to customize the ``Makefile``, place your stuff in ``.configure``.

## Config the compiler

The ``Makefile`` will use ``xelatex`` by default, if you want to override this, create a file ``article/config`` and write:

```bash
latex=lualatex
```

The supported compilers are ``pdflatex``, ``lualatex``.

You can also override ``bib`` compiler:

```bash
bib=biber
```

## Latexmk support

``Makefile`` alone can not get the correct dependency setting to make the compiler run ``latex`` and ``bibtex`` properly. That is why the most safer action is chosen. In the default ``pdf`` generating process, we run ``latex``, ``bibtex, ``latex`` and ``latex`` in a row. If we modify any contents, we rerun the above commands to ensure we get the correct ``pdf``. This is unnecessary, and only ``latex`` needed to be rerun once if we make minor changes in ``.tex`` files, which is very common.

``Latexmk`` au­to­mates the pro­cess of gen­er­at­ing a LaTeX doc­u­ment. It runs ``latex`` and ``bibtex`` based on the changes you made. It can also use ``biber`` automatically if you use it.

``Latexmk`` is disabled in the ``Makefile`` by default. To enable it, add the following code in config:

```shell
latexmk=1
```

## TEXMF Search Path

Suppose you are compiling ``article.pdf``. These paths will be searched in order: ``article``, ``.``, ``article.tex/texmf`` and ``share/texmf``.

If you have customized ``.sty``, ``.bst``, ``.cls`` files, you can place them in ``article``. Or you can place them in ``article.tex/texmf`` to keep your top-level directory clean.

Because ``.`` is included in the search path, you can include files from other subfolders by using ``\input{other-articles/example.tex}`` (replace ``other-articles`` with real path).

The use of ``share/texmf`` should be avoided, as it is supposed to put some shared files.

## Dependency between ``pdf``s

If you need to include files from other latex sources, it would be wise to explicitly add dependencies in the make file. So that the changes in the source ``pdf`` would cause rebuild in the destiny ``pdf``. This is done by add ``depend`` configuration in ``config`` file:

```bash
depend="source1 source2"
```

## Default Variables you can use in ``.tex`` files

You can use some default variables in your ``.tex`` files:

- ``\id``: The current folder/pdf name. e.g. In ``.tex`` files in folder ``article``, the ``\id`` should be equal to ``article``.
- ``\version``: This is the ``git`` version you can use in your ``.tex`` files. You can also use ``\include{version}`` to stay safer (``\version`` will be undefined if you use it in a standalone compiler. ``share/texmf/version.tex`` will check if ``\version`` is defined for you.).
- ``\wordcount``: The words in the text. It uses ``texcount`` to count the words in ``index.tex`` and all the ``\input`` files. But because of the limitation of ``texcount``, ``\id`` in the file path is not supported (see #6 for details).

# Tip: Collaborate using Dropbox

**This ``Makefile`` works better while collaborating with Dropbox.**

One of the issues of collaborating on a latex project is every collaborator needs to set up the same compiling tools. This is often not easy. And you can not just pick up a computer and start to work before install the correct tools on that computer.

[ShareLaTeX](https://www.sharelatex.com) is a good collaborating tool. But it is either a little bit expensive or hard to set up your server.

Dropbox is a great sync \& collaborate tool. It is the only cloud storage that has official Linux support. But no support for latex.

We can set up a Dropbox shared folder to collaborate on the latex projects. We then can sync the files to a Linux machine to compile them in a background terminal like ``GNU Screen``. The machine can be any Linux desktop or server with latex tools installed and access to the Internet, and need not be publicly accessible. It is cheap.

Each latex project can be placed in an independent folder and be compiled automatically by the ``Makefile``. The compiler-generated files locate in ``out`` directory under each project folder. We can find the ``pdf`` file in ``out`` directory and see the ``.log`` file to debug the compiling error.

**Known bugs:**

- To watch the latex changes, the ``watch`` script uses a loop method, but it may flush the ``.log`` file too quickly if there are errors. As a result, you may not have time to see the ``error`` information.
- The ``watch-inotify`` use inotify to trigger ``make`` command while file changes detected. But, it may fail to catch some of the file changes because of the file sync problem. So, you have to ``pretend`` to change the files to trigger the compiling occasionally.

# Related Projects

These are latex compiling scripts which have been updated with in 2 years:

- [shiblon/latex-makefile](https://github.com/shiblon/latex-makefile) shiblon's version. Currently has most stars and forks on github.
- [latexmk-Makefile](https://github.com/rueycheng/latexmk-Makefile) a boilerplate Makefile showing how to use latexmk with Gnu Make.
- [repsacc/latex-makefile](https://github.com/repsacc/latex-makefile) a very basic Makefile with example.
- [makefile-latex](https://github.com/ricardoerikson/makefile-latex) ricardoerikson's version.
- [LatexProjectMakefile](https://github.com/Daniel-M/LatexProjectMakefile) Daniel-M's version. Able to compile multiple pdf files, but need some efforts.
- [kulia/makefile-for-latex](https://github.com/kulia/makefile-for-latex) kulia's version.
- [boris-spas/latex-makefile](https://github.com/boris-spas/latex-makefile) Makefile wrapper around latexmk.
