%% file saved at ~/Library/texlive/2022/tex/latex/VWA.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{VWA}

% Loading the class
\LoadClass[11pt,a4paper,oneside,BCOR18mm,DIV13,titlepage]{article}

% requiring packages

\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[ngerman]{babel}
\usepackage{amsmath}
\usepackage{amsfonts}
\usepackage{amssymb}
\usepackage{amsthm}
\usepackage[hidelinks]{hyperref}
\usepackage{mathtools}
\usepackage[authordate,backend=biber]{biblatex-chicago}
\usepackage{graphicx}
\usepackage[left=2cm, right=2cm]{geometry}
%\usepackage[authordate-trad,backend=biber]{biblatex-chicago}
%\usepackage[backend=bibtex8,style=numeric,sorting=nyt]{biblatex}
\usepackage{tikz}
\usepackage{parskip}

\usepackage[]{url}
\usepackage[]{etoolbox}
\usepackage[]{keyval}
\usepackage[]{ifthen}
\usepackage{xparse}

% Bibliography
% \bibliography{VWA_Literatur.bib}

% some definitions
\newtheorem{mydef}{Definition}
\newtheorem{bsp}{Beispiel}
\newtheorem{theorem}{Satz}

% some code regarding the title page

%% date

\def\shortyear#1{\expandafter\shortyearhelper#1}
\def\shortyearhelper#1#2#3#4{#3#4}

\newcommand{\schoolyear}{%
  \edef\todayyear{\the\year}%
  \ifnum\month<9
    \advance\todayyear by -1
  \fi
  \todayyear/\number\numexpr\shortyear{\todayyear+1}\relax
}

%% Supervisor
\newcommand{\supervisor}[1]{%
  \gdef\@supervisor{#1}% Store the supervisor's name
}

\newcommand{\@supervisor}{}

%% Class
\newcommand{\class}[1]{%
  \gdef\@class{#1}% Store the supervisor's name
}

\newcommand{\@class}{}

% the logo
\graphicspath{{img/}}
% title page

\renewcommand{\maketitle}{%
  \begin{titlepage}
    \begin{figure}[h]
    \flushright

    %the path to the schoollogo belongs here
    \includegraphics[scale=1]{Logo_50x12mm.png}
    ~\linebreak\linebreak
    \end{figure}
    \centering
    {\Large Vorwissenschaftliche Arbeit im Rahmen der Reifeprüfung}

    \vspace{5cm}

    {\huge\textbf{\@title{}}}\linebreak\linebreak
    {\Large\textbf{\@author}}\linebreak\linebreak
    \@class{}, \schoolyear{}

    \vfill

    {\Large Bundesgymnasium und Bundesrealgymnasium Wien 4\\Wiedner Gymnasium / Sir Karl Popper
    Schule\\A-1040 Wien, Wiedner Gürtel 68}\linebreak\linebreak
    {\Large Betreuungslehrperson: \@supervisor{}}\\[0.3cm]
    {\Large Vorgelegt am \today}
  \end{titlepage}

}

% table of contents

\let\tableofcontentsORIG\tableofcontents
\renewcommand\tableofcontents{\thispagestyle{empty}\newpage\tableofcontentsORIG \thispagestyle{empty}\clearpage \pagenumbering{arabic}}
