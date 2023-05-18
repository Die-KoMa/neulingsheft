%% Dokumentklasse der KoMa für das Neulingsheft
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{neulingsheft}[2018/11/02 v1.0]

%\DeclareOption*{\PassOptionsToClass\CurrentOption{scrartcl}}
%\ProcessOptions

%===Load Class and Must-Have Packages===%
\LoadClass[a5paper,fontsize=9pt, DIV=calc]{scrreprt}
\RequirePackage[ngerman]{babel}
% Names and hyphenation rules for German.
% UTF-8 encoding (not necessary for LuaTeX)
\RequirePackage[utf8x]{inputenc} % Allow input of arbitrary characters.
%\RequirePackage[T1]{fontenc} % Allow hyphenation in words with non-ASCII characters
\RequirePackage{microtype} % Improved typography, removes some overfull \hboxes.
\RequirePackage{hyperref} % Adds links and bookmarks to PDF.
\RequirePackage{csquotes} % allow enquote instead of unicode
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
% Suppress warnings from pdftex that can safely be ignored in our case, confer
% section "Graphics inclusion" of the pdftex manual.  Only set this option if
% it is actually available (ie. in pdftex >=1.40.15).  Especially luatex does
% not have this problem at all (and thus no option to suppress the warnings).
\ifdefined\pdfsuppresswarningpagegroup
	\pdfsuppresswarningpagegroup=1
\fi
%==Code Listings==%
%\RequirePackage{listings}
%==Color==%
%\usepackage[svgnames]{xcolor} % Use colors, including some color names.

%===Neulingsheft Specials===%
%==Handzeichen==%
\graphicspath{{img/}}
%% Umgebung für ein Handzeichen
% Setzt den Inhalt der Umgebung als Beschreibung mit #2 als Überschrift auf
% einer Breite von .7\linewidth.  Rechts daneben in einem Abstand von
% .05\linewidth setzt es das Bild (oben bündig mit der Überschrift) in einem
% .25\linewidth breiten Bereich zentriert mit einer Breite von #1.
\newenvironment{handzeichen}[3][.25\linewidth]{% [Bildbreite], Name, Bild
	\def\handzeichen@width{#1}%
	\def\handzeichen@img{#3}%
	\noindent
	\begin{minipage}[t]{.7\linewidth}%
	\section*{#2}%
}{%
	\end{minipage}%
	\hspace{.05\linewidth}%
	\makebox[.25\linewidth]{\raisebox{-\height}{%
		\includegraphics[width=\handzeichen@width]{\handzeichen@img}%
	}}%
	\medskip
}

%===Stop happy hacking===%
\makeatother
