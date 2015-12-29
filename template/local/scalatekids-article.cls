% ======================================================
%
% SCALATEKIDS ARTICLE CLASS
%
% ======================================================
\NeedsTeXFormat{LaTeX2e}
% New class name
\ProvidesClass{scalatekids-article}[2015/12/18]
% Parent class extended
\LoadClass{article}

% =======================================================
%
% GENERAL UTILITY PACKAGES
%
% **** all new packages should be added here ****
%
% =======================================================

\usepackage[utf8]{inputenc}
\usepackage{alltt}
\usepackage{caption}
%% \usepackage{hyperref}
\usepackage{xspace}
\usepackage{listings}
\usepackage{xcolor}
\usepackage{changes}
\usepackage{graphicx}
\usepackage{subcaption}
\usepackage{breakurl}
\usepackage{float}
\usepackage{lmodern}
\usepackage[top=2in, bottom=1.5in, left=0.7in, right=0.7in]{geometry}
\usepackage{fancyhdr}           % For footer and header of every page
\usepackage{lastpage}
\pagestyle{fancy}
\usepackage[colorlinks=true,
            linkcolor=red,
            urlcolor=blue,      % url color set to blue
            citecolor=gray]{hyperref}
\usepackage[T1]{fontenc}
\usepackage[scaled]{beraserif}
\usepackage[scaled]{berasans}
\usepackage[scaled]{beramono}

% =======================================================
%
% NEW RULES DEFINITIONS
%
% **** all new rules / command should be added here ****
%
% =======================================================

\DeclareCaptionFormat{listing}{\rule{\dimexpr\textwidth+17pt\relax}{0.4}\vskip1pt#1#2#3}
\captionsetup[lstlisting]{singlelinecheck=false, margin=0pt, font={bf,footnotesize}}
\definecolor{toc-blue}{rgb}{0.0,0.0,0.4}               % ToC links color
\hypersetup{colorlinks,linkcolor=toc-blue,linktoc=all} % Table of contents 'toc-blue' colored
% Make \paragraph behave like a subsubsubsection
\makeatletter
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
            {-2.5ex\@plus -1ex \@minus -.25ex}%
            {1.25ex \@plus .25ex}%
            {\normalfont\normalsize\bfseries}}
\makeatother
\setcounter{secnumdepth}{4} % how many sectioning levels to assign numbers to
\setcounter{tocdepth}{4}    % how many sectioning levels to show in ToC
% footer and header spacing
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
% new command for glossary words
\newcommand{\gloss}[1]{#1\textsubscript{\textit{\tiny{G}}}}
% Change name of Toc to 'Indice'
\renewcommand{\contentsname}{Indice}

\pagestyle{fancy}
\fancyhf{}
\lhead{
    \includegraphics[height=1.5cm, width=1.5cm, keepaspectratio=true]{/home/kids/bin/img/logo.png} \emph{ScalateKids}}
\rhead{
    \slshape \leftmark
}
% pagestyle set to 'n di m'
\rfoot{\thepage\hspace{1pt}di \pageref{LastPage}}
% Summary letter command
\newcommand{\glossaryLetter}[1] {
  \newpage
  \cleardoublepage
  \phantomsection
  \addcontentsline{toc}{section}{#1}
  \vspace{9pt}
  \textbf{\huge{#1} }\\
  \rule[0.3pt]{\linewidth}{0.4pt} \\
}
