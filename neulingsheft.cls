%% Dokumentklasse der KoMa für das Neulingsheft
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{neulingsheft}[2018/11/02 v1.0]

%\DeclareOption*{\PassOptionsToClass\CurrentOption{scrartcl}}
%\ProcessOptions

%===Load Class and Must-Have Packages===%
\LoadClass[a5paper,fontsize=9pt]{scrreprt}
\RequirePackage[ngerman]{babel}
% Names and hyphenation rules for German.
% UTF-8 encoding (not necessary for LuaTeX)
%\RequirePackage[utf8]{inputenc} % Allow input of arbitrary characters.
%\RequirePackage[T1]{fontenc} % Allow hyphenation in words with non-ASCII characters
\RequirePackage{microtype} % Improved typography, removes some overfull \hboxes.
\RequirePackage{hyperref} % Adds links and bookmarks to PDF.

%===Start happy hacking===%
\makeatletter

%===Document Metadata===%
\hypersetup{pdftitle=\@title,pdfauthor=\@author}

%===Special Contents===%
%==Mathematics==%
%\RequirePackage{amsmath} % more maths
%\RequirePackage{mathtools} % more maths
%\RequirePackage{xfrac} % nice fractions
%==Miscellaneous==%
\RequirePackage{eurosym} % € symbol
%\RequirePackage{xspace} % space after macro
%==References==%
\newcommand\mail[1]{\href{mailto:#1}{\nolinkurl{#1}}}

%===Special Layout==%
%\RequirePackage{tabularx} % tables with same width column
%\RequirePackage{ragged2e} % Improved ragged layout

%===Media===%
%==Graphics==%
%\RequirePackage{tikz} % Create cool graphics in TeX directly.
\RequirePackage{graphicx} % Include and work with graphics.
%==Code Listings==%
%\RequirePackage{listings}
%==Color==%
%\usepackage[svgnames]{xcolor} % Use colors, including some color names.

%===Neulingsheft Specials===%
%==Handzeichen==%
\newenvironment{handzeichen}[2]{% Name, Bild
	\def\handzeichen@img{#2}%
	\section*{#1}%
	\begin{minipage}[t]{.7\linewidth}%
}{%
	\end{minipage}%
	\mbox{\vbox to 0pt{%
	\includegraphics[width=.3\linewidth]{img/\handzeichen@img}%
	\vfill
	}}
}

%===Stop happy hacking===%
\makeatother
