\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{proposalnsf}[2008/06/01 NSF proposal style v1.3 SGLS]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass[11pt]{article}
\RequirePackage{calc}
%\RequirePackage{pdffig}
\RequirePackage[square,sort,comma,numbers]{natbib}
\RequirePackage[american]{babel}
%\RequirePackage{hyperref}
\RequirePackage{mathpazo}
%\RequirePackage{newcent}

\setlength{\paperheight}{11in}
\setlength{\paperwidth}{8.5in}
\addtolength{\voffset}{-1in}
\addtolength{\hoffset}{-1in}
\setlength{\topmargin}{1in}
\setlength{\oddsidemargin}{1in}
\setlength{\evensidemargin}{1in}
\setlength{\textwidth}{\paperwidth - 2in}
\setlength{\textheight}{\paperheight - 2in}
\setlength{\footskip}{36pt}
\setlength{\marginparsep}{0.5cm}
\setlength{\marginparwidth}{1.5cm}
\setlength{\headheight}{0pt}
\setlength{\headsep}{0pt}

\RequirePackage{fancyhdr}
\pagestyle{fancyplain}
\renewcommand{\headrulewidth}{0pt}
\lhead{}
\chead{}
\rhead{}
\lfoot{}
\cfoot{\thepage}
\rfoot{}

%\def\@makefnmark{\hbox{$^{\fnsymbol{\@mpfn}}\m@th$}}
\renewcommand\floatpagefraction{.9}
