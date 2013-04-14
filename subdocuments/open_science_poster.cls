%%------------------------------------------------------------------------------------%%
%%------------------------------------------------------------------------------------%%
%% Content : Open-Science-Poster LateX-Class 
%% Use : Open-Sciene-Poster formatting 
%% Author : Claas-Thido Pfaff
%%------------------------------------------------------------------------------------%%
%%------------------------------------------------------------------------------------%%

%%%-------------------------------------------------%%%
%%% Class requires format %%%
%%%-------------------------------------------------%%%

\NeedsTeXFormat{LaTeX2e}

%%%-------------------------------------------------%%%
%%% Provides class %%%
%%%-------------------------------------------------%%%

\ProvidesClass{open-science-poster}[2012/09/10 version 0.2 LaTeX class of the Open-Science-Poster]

%%%-------------------------------------------------%%%
%%% Define and process class options %%%
%%%-------------------------------------------------%%%

%% Define class options %%

\newif\if@wide
\DeclareOption{wide}{\@widetrue}
\newif\if@long
\DeclareOption{long}{\@longtrue}

\newif\if@headsep
\DeclareOption{headsep}{\@headseptrue}
\newif\if@noheadsep
\DeclareOption{noheadsep}{\@noheadseptrue}

\newif\if@gray
\DeclareOption{gray}{\@graytrue}
\newif\if@blue
\DeclareOption{blue}{\@bluetrue}
\newif\if@green
\DeclareOption{green}{\@greentrue}
\newif\if@orange
\DeclareOption{orange}{\@orangetrue}
\newif\if@red
\DeclareOption{red}{\@redtrue}

%% Set default class options %%

\ExecuteOptions{%
	%% gray as standard %%
	long,
	headsep,
	gray		
}

%% Process class options %%

\ProcessOptions*\relax

%% Provide decision makers %%

\providecommand{\ifwide}[2]{\if@wide#1\else#2\fi}

\providecommand{\ifnoheadsep}[2]{\if@noheadsep#1\else#2\fi}

\providecommand{\ifgray}[2]{\if@gray#1\else#2\fi}
\providecommand{\ifblue}[2]{\if@blue#1\else#2\fi}
\providecommand{\ifgreen}[2]{\if@green#1\else#2\fi}
\providecommand{\iforange}[2]{\if@orange#1\else#2\fi}
\providecommand{\ifred}[2]{\if@red#1\else#2\fi}


\LoadClassWithOptions{beamer}

\ifwide{%
	\RequirePackage[orientation=landscape, size=a0, scale=1.3]{beamerposter}    
	}{%
	\RequirePackage[orientation=portrait, size=a0, scale=1.3]{beamerposter}    
	}

%%%-------------------------------------------------%%%
%%% Input encodings fonts and symbols %%%
%%%-------------------------------------------------%%%

%% input and font encoding %%
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

%% Fonts and math symbols %%
\RequirePackage{lmodern}
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{textcomp}

%% Set beamer font theme %%

\usefonttheme{professionalfonts}

\setbeamerfont{section in head/foot}{series=\bfseries}
\setbeamerfont{block title}{series=\bfseries}
\setbeamerfont{block alerted title}{series=\bfseries}
\setbeamerfont{frametitle}{series=\bfseries}
\setbeamerfont{frametitle}{size=\Large}

%%%-------------------------------------------------%%%
%%% Patch some LaTeX problems %%%
%%%-------------------------------------------------%%%

\RequirePackage{fixltx2e}
\RequirePackage{scrhack}
\RequirePackage{etex}
\reserveinserts{30}

%%%-------------------------------------------------%%%
%%% Language adaption of the document %%%
%%%-------------------------------------------------%%%

\RequirePackage[ngerman,english]{babel} 
\RequirePackage[autostyle]{csquotes}
% usage:
%  \enquote{} to put a text in the right quotes

%%%-------------------------------------------------%%%
%%% Text %%%
%%%-------------------------------------------------%%%

%% Example text %%
\RequirePackage{lipsum}

%% Justify text %%
\usepackage{ragged2e}

%%%-------------------------------------------------%%%
%%% Color options %%%
%%%-------------------------------------------------%%%

\RequirePackage{xcolor} 
% Some standards:
% 	green 
%  blue
%  cyan
%  magenta
%  red
%  yellow
%  black
%  white
%  darkgray
%  gray
%  lightgray

\xdefinecolor{vistingBackgroundColor}{gray}{.95}
\xdefinecolor{ListingCommentstyleColor}{gray}{.60}
\xdefinecolor{LinkColor}{rgb}{0,0,0.4}

\colorlet{ListingStringstyleColor}{green!25} 
\colorlet{ListingEmphstyleColor}{blue}
\colorlet{ListingKeywordstyleColor}{orange!70}

%% Beamer colors

\ifgray{%
%% Gray color palette %%
\xdefinecolor{color1}{RGB}{247,247,247}
\xdefinecolor{color2}{RGB}{204,204,204}
\xdefinecolor{color3}{RGB}{150,150,150}
\xdefinecolor{color4}{RGB}{99,99,99}
\xdefinecolor{color5}{RGB}{37,37,37}
}{} 

\ifblue{%
%% Blue color palette %%
\xdefinecolor{color1}{RGB}{241,238,246}
\xdefinecolor{color2}{RGB}{189,201,225}
\xdefinecolor{color3}{RGB}{116,169,207}
\xdefinecolor{color4}{RGB}{43,140,190}
\xdefinecolor{color5}{RGB}{4,90,141}
}{} 

\ifgreen{%
%% Green color palette %%
\xdefinecolor{color1}{RGB}{237,248,233}
\xdefinecolor{color2}{RGB}{186,228,179}
\xdefinecolor{color3}{RGB}{116,196,118}
\xdefinecolor{color4}{RGB}{49,163,84}
\xdefinecolor{color5}{RGB}{0,109,44}
}{} 

\iforange{%
%% Orange color palette %%
\xdefinecolor{color1}{RGB}{254,237,222}
\xdefinecolor{color2}{RGB}{253,190,133}
\xdefinecolor{color3}{RGB}{235,141,60}
\xdefinecolor{color4}{RGB}{230,85,13}
\xdefinecolor{color5}{RGB}{166,54,3}
}{} 

\ifred{%
%% Red color palette %%
\xdefinecolor{color1}{RGB}{256,229,217}
\xdefinecolor{color2}{RGB}{252,174,145}
\xdefinecolor{color3}{RGB}{251,106,74}
\xdefinecolor{color4}{RGB}{222,45,38}
\xdefinecolor{color5}{RGB}{165,15,21}
}{} 

%% title frame colors %%

\ifnoheadsep{}{\setbeamercolor{cboxb}{fg=black,bg=color4}}

%% colors itemize/enumerate %%
  \setbeamercolor{item}{fg=color3}
  \setbeamercolor{item projected}{fg=white,bg=color3}

%% colors for blocks %%
  \setbeamercolor{block title}{fg=color3,bg=white}
  \setbeamercolor{block body}{fg=black,bg=white}

%% set colors for alerted blocks (with frame) %%
  \setbeamercolor{block alerted title}{fg=white,bg=color3}
  \setbeamercolor{block alerted body}{fg=black,bg=color3!60}

%%%-------------------------------------------------%%%
%%% List options %%%
%%%-------------------------------------------------%%%

% \RequirePackage[neverdecrease]{paralist}

% %% Overwrite the listing environments with the ones from paralist
% \let\itemize\compactitem
% \let\enditemize\endcompactitem
% \let\enumerate\compactenum
% \let\endenumerate\endcompactenum
% \let\description\compactdesc
% \let\enddescription\endcompactdesc

% \pltopsep=\medskipamount
% \setdefaultenum{1.}{a)~}{i.~}{A)~}%
% \setdefaultleftmargin{1.5em}{1.2em}{1.2em}{1.2em}{1.2em}{1.2em}%
% \setdefaultitem{$\circ$}{\textbullet}{\textperiodcentered}{--}%

%%%-------------------------------------------------%%%
%%% Graphics options %%%
%%%-------------------------------------------------%%%

%% Use and create graphics %%
\RequirePackage{graphicx}
\RequirePackage{overpic}
\RequirePackage{tikz}

%% Load some tikz libraries %%
\usetikzlibrary{spy,external,automata,patterns,shadows.blur,trees,mindmap,arrows,decorations.pathmorphing,backgrounds,positioning,fit,petri}
\pgfdeclarelayer{background}
\pgfdeclarelayer{foreground}
\pgfsetlayers{background,main,foreground}

%% Define tikz styles %%
\tikzstyle{pictureframe} = [rectangle, rounded corners, draw=gray!10, fill=white, blur shadow={shadow blur steps=5,shadow blur extra rounding=1.3pt}]
\tikzstyle{signbackground} = [rectangle, fill=gray!3, rounded corners, draw=gray, very thin]

\RequirePackage{subcaption} 
% usage:
%  \begin{figure}
%    \begin{subfigure}{Breite}
%      Bild
%      \caption{Text}
%    \end{subfigure}
%  \end{figure}

%%%-------------------------------------------------%%%
%%% Control floatings and captions %%%
%%%-------------------------------------------------%%%

%% Control float placement %%
\RequirePackage{float} 

%% Control caption layout %%
\RequirePackage[format=plain, margin=7pt, font={small,it}, labelformat=default, labelfont=bf]{caption}

%%%-------------------------------------------------%%%
%%% Table related options %%%
%%%-------------------------------------------------%%%

%% Professional tables %%
\RequirePackage{booktabs}
% useage:
%	\toprule
%	\midrule
%	\bottomrule
% 	\cmidrule{from column #. - to column #}

%% Extended table functions %%
\RequirePackage{tabularx}

\newcolumntype{R}[1]{>{\raggedright\arraybackslash}p{#1}}
\newcolumntype{C}[1]{>{\centering\arraybackslash}p{#1}}
% usage:
%  R{column width} for raggedright column in certain width
%  C{column width} for centered column in certain width

%% Aggregate cells column and row wise %%
\RequirePackage{multirow}
% usage:
%  Horizontal aggregation of table cells
%	 \multicolumn{count of columns}{alignment}{text}
%  Vertical aggregation of table cells  
%	 \multirow{count of rows}{width}{text}

%% Tables spanning multiple pages 
\RequirePackage{longtable}

%%%-------------------------------------------------%%%
%%% Multi column documents %%%
%%%-------------------------------------------------%%%

\RequirePackage{multicol}

%%%-------------------------------------------------%%%
%%% Bibliography options %%%
%%%-------------------------------------------------%%%

%% citation management %%
\RequirePackage[backend=biber, natbib=true, style=authoryear, bibstyle=authoryear, hyperref=true]{biblatex}

% usage:
%  \citet{jon90} ⇒ Jones et al. (1990)
%  \citet[chap.~2]{jon90} ⇒ Jones et al. (1990, chap. 2)
%  \citep{jon90} ⇒ (Jones et al., 1990)
%  \citep[chap.~2]{jon90} ⇒ (Jones et al., 1990, chap. 2)
%  \citep[see][]{jon90} ⇒ (see Jones et al., 1990)
%  \citep[see][chap.~2]{jon90} ⇒ (see Jones et al., 1990, chap. 2)
%  \citet*{jon90} ⇒ Jones, Baker, and Williams (1990)
%  \citep*{jon90} ⇒ (Jones, Baker, and Williams, 1990)

%%%-------------------------------------------------%%%
%%% Typesetting of units %%%
%%%-------------------------------------------------%%%

\RequirePackage{siunitx}
% usage:
%  \si{kg.m/s^2}
%  \num{12345}
%  \num{0,1234}
%  \num{.12345}
%  \ang{12.3}
%  \ang{1;2;3}
%  \ang{;;-1}
%  \SI{-29}{\degreeCelsius}   
%  \SI{30000}{\kilogram}

%%%-------------------------------------------------%%%
%%% Display LaTeX code compiled %%%
%%%-------------------------------------------------%%%

%% Source code and compiled LaTeX document next to each other %%
\RequirePackage{showexpl}

%%%-------------------------------------------------%%%
%%% Options for references in the document %%%
%%%-------------------------------------------------%%%

\RequirePackage{prettyref}

\newrefformat{fig}{figure~\ref{#1}}
\newrefformat{Fig}{Figure~\lowercase{\ref{#1}}}
\newrefformat{cha}{chapter~\ref{#1}}
\newrefformat{Cha}{Chapter~\lowercase{\ref{#1}}}
\newrefformat{sec}{chapter~\ref{#1}}
\newrefformat{Sec}{Chapter~\lowercase{\ref{#1}}}
\newrefformat{sub}{chapter~\ref{#1}}
\newrefformat{Sub}{Chapter~\lowercase{\ref{#1}}}
\newrefformat{subs}{chapter~\ref{#1}}
\newrefformat{Subs}{Chapter~\lowercase{\ref{#1}}}
\newrefformat{tab}{table~\ref{#1}}
\newrefformat{Tab}{Table~\lowercase{\ref{#1}}}
\newrefformat{lst}{listing~\ref{#1}}
\newrefformat{Lst}{Listing~\lowercase{\ref{#1}}}
\newrefformat{equ}{equation~\ref{#1}}
\newrefformat{Equ}{Equation~\lowercase{\ref{#1}}}

% Usage:
%  \prettyref{fig:my_figure_label}
%  \prettyref{Fig:my_figure_label}

%%%-------------------------------------------------%%%
%%% Options for code listings in your document %%%
%%%-------------------------------------------------%%%

\RequirePackage{listings}

\lstset{
   backgroundcolor=\color{ListingBackgroundColor},
   basicstyle=\scriptsize\ttfamily,
   keywordstyle=\bfseries\ttfamily\color{ListingKeywordstyleColor},
   stringstyle=\color{ListingStringstyleColor}\ttfamily,
   commentstyle=\color{ListingCommentstyleColor}\ttfamily,
   emph={word1}, 
   emphstyle=\color{ListingEmphstyleColor}\texttt, %for word 1
   emph={[2]word2,word3},
   emphstyle={[2]\color{ListingEmphstyleColor}\texttt}, %for word 2
   showstringspaces=false,
   flexiblecolumns=false,
   tabsize=3,
   numbers=left,
   breaklines=true,
   numberstyle=\tiny,
   numberblanklines=true,
   stepnumber=1,
   numbersep=10pt,
   xleftmargin=15pt
}

\lstset{literate=%
{Ö}{{\"O}}1
{Ä}{{\"A}}1
{Ü}{{\"U}}1
{ß}{{\ss}}2 
{ü}{{\"u}}1
{ä}{{\"a}}1
{ö}{{\"o}}1
{~}{{\textasciitilde}}1
}

%%%-------------------------------------------------%%%
%%% Definition of environments %%%
%%%-------------------------------------------------%%%


%%%-------------------------------------------------%%%
%%% Typographical options of the headings %%%
%%%-------------------------------------------------%%%

% \RequirePackage[noindentafter,calcwidth]{titlesec}  

% \titleformat{\chapter}
% {\normalfont\sffamily\huge\bfseries}{%\chaptertitlename\ 
% \thechapter}{20pt}{\Huge}

% \titleformat{\section}
% {\normalfont\sffamily\Large\bfseries}{\thesection}{1em}{}

%  \titleformat{\subsection}
%  {\normalfont\sffamily\large\bfseries}{\thesubsection}{1em}{}

% \titleformat{\subsubsection}
% {\normalfont\sffamily\normalsize\bfseries}{\thesubsubsection}{1em}{}

%  \titleformat{\paragraph}[runin]
%  {\normalfont\sffamily\normalsize\bfseries}{\theparagraph}{1em}{}

% \titleformat{\subparagraph}[runin]
% {\normalfont\sffamily\normalsize\bfseries}{\thesubparagraph}{1em}{}

% \titlespacing*{\chapter}
%  {0pt}{50pt}{40pt}
% \titlespacing*{\section}
%  {0pt}{3.5ex plus 1ex minus .2ex}{2.3ex plus .2ex}
%  \titlespacing*{\subsection}
%   {0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
% \titlespacing*{\subsubsection}{0pt}{3.25ex plus 1ex minus .2ex}{1.5ex plus .2ex}
%  \titlespacing*{\paragraph}
%   {0pt}{3.25ex plus 1ex minus .2ex}{1em}
% \titlespacing*{\subparagraph} {\parindent}{3.25ex plus 1ex minus .2ex}{1em}

%%%-------------------------------------------------%%%
%%% Typographical fine-tuning %%%
%%%-------------------------------------------------%%%

%% No indent for new paragraph %%
\setlength{\parindent}{0em} 

%% correction of white spaces %%
\RequirePackage{ellipsis}

%% set right space after macros %%
\RequirePackage{xspace}

%% TeX typesetting parameters %%
\clubpenalty = 9999 % No "Schusterjungen"
\widowpenalty = 9999 % No "Hurenkinder"
\displaywidowpenalty = 9999
\tolerance = 200
\hbadness = 1414
\emergencystretch = 1.5em
\hfuzz = 0.3pt

%% Microtype for fine-tuning of typesetting %%
\RequirePackage[protrusion=true,%
expansion=true,%
babel=true,%
tracking=true,% 
spacing=false]{microtype}     

\DeclareMicrotypeSet*[tracking]{my}% 
       { font = */*/*/sc/* }% 
\SetTracking{ encoding = *, shape = sc }{40}

%%%-------------------------------------------------%%%
%%% PDF Options %%%
%%%-------------------------------------------------%%%

\hypersetup{ 
  plainpages=false,%
  bookmarks=true,%
  bookmarksopen=true,%
  pdfborder={0 0 0},%
  pdfpagemode=UseNone,%
  colorlinks=false,%
  linkcolor=LinkColor,
  citecolor=LinkColor,%
  filecolor=LinkColor,%
  menucolor=LinkColor,%	
  urlcolor=LinkColor,%
  breaklinks=true,%
  raiselinks=true,%
  pdfauthor={Open-Science-poster},
  pdfcreator={Open-Science-poster},
  pdfsubject={Open-Science-poster},
  pdfkeywords={LaTeX, Tikz, Knitr, Scientific poster, Open science}
}

% Usage:
%  \href{URL}{text} 
%  \url{URL}
%  \nolinkurl{URL}


%%%-------------------------------------------------%%%
%%% Style the beamer poster %%%
%%%-------------------------------------------------%%%

%% set some beamer theme options %%
  \setbeamertemplate{items}[circle]
  \setbeamertemplate{blocks}[width=0.0]
  \beamertemplatenavigationsymbolsempty

% %% set bibliography style %%
%  \setbeamertemplate{bibliography item}[text]
%  \setbeamercolor{bibliography item}{fg=black,bg=white}
%  \setbeamercolor{bibliography entry author}{fg=black,bg=white}
%  \setbeamercolor{bibliography item}{fg=black,bg=white}

% %% define some lengths %%
\newlength{\widthinbox}
\newlength{\withininbox}
\newlength{\boxinrule}
\newlength{\logocolumnwidth}

\newcommand{\makeruleinbox}
{{\usebeamercolor[bg]{block alerted title}\centering\hspace*{-0.7cm}
\rule{\boxinrule}{0.5cm}}
}

\setlength{\logocolumnwidth}{.15\paperwidth}
\makeatletter
 \ifportrait
  \setlength{\logocolumnwidth}{.2\paperwidth}
 \fi
\makeatother

%% Style the headline %%
	\setbeamertemplate{headline}{
		\leavevmode
		\begin{columns}
			% logo column
			\begin{column}{\logocolumnwidth}
				\begin{center}
					\vspace{1em}
					\includegraphics[scale=0.75]{graphics/open_science_posters_logo_long.png}
				\end{center}
			\end{column}
			% title column
			\begin{column}{.7\linewidth}
				\vskip2cm
				\centering
				\usebeamercolor{title in headline}{\color{fg}
				\textbf{\huge{\inserttitle}}\\[1ex]}
				\usebeamercolor{author in headline}{\color{fg}
				\large{\insertauthor}\\[1ex]}
				\usebeamercolor{institute in headline}{\color{fg}
				\large{\insertinstitute}\\[1ex]}
				\vskip2cm
			\end{column}
			\vspace{1cm}
		\end{columns}
		\begin{beamercolorbox}[colsep=0.5cm]{cboxb}
		\end{beamercolorbox}
	}


%% Style the background %%
	\setbeamertemplate{background}
	{
		\begin{tikzpicture}[remember picture,overlay]
			\draw [line width=2cm,rounded corners=1.5cm, color4]
			(current page.south west) rectangle (current page.north east);
		\end{tikzpicture}
	}

%% Set beamer block design %%
	\setbeamertemplate{block begin}
	{
		\par\vskip\medskipamount%
		\begin{beamercolorbox}[colsep*=0ex,dp={2ex},center]{block title}
			\vskip-0.4cm
			\usebeamerfont{block title}\large\insertblocktitle
			\begin{flushleft}
				\vskip-1cm
				\begin{tikzpicture}[remember picture,overlay]
					\shade [inner color=lightgray,outer color=white]
					(0,0) rectangle (\textwidth,0.3cm);
				\end{tikzpicture}
			\end{flushleft}
		\end{beamercolorbox}%
		{\parskip0pt\par}%
		\ifbeamercolorempty[bg]{block title}
		{}
		{\ifbeamercolorempty[bg]{block body}{}{\nointerlineskip\vskip-0.5pt}}%
		\usebeamerfont{block body}%
		\vskip-0.5cm
		\begin{beamercolorbox}[colsep*=0ex,vmode]{block body}%
			\justifying 
		}

\setbeamertemplate{block end}  
{
  \end{beamercolorbox}
  \vskip\smallskipamount
}

%% Set beamer example block design %%
\setbeamertemplate{block example begin}
{
	\par\vskip\medskipamount%
	\begin{beamercolorbox}[colsep*=0ex,dp={2ex},center]{block title}
		\vskip-0.4cm
		\usebeamerfont{block title}\large\insertblocktitle
		\begin{flushleft}
			\vskip-1cm
		\end{flushleft}
	\end{beamercolorbox}%
	{\parskip0pt\par}%
	\ifbeamercolorempty[bg]{block title}
	{}
	{\ifbeamercolorempty[bg]{block body}{}{\nointerlineskip\vskip-0.5pt}}%
	\usebeamerfont{block body}%
	\vskip-0.5cm
	\begin{beamercolorbox}[colsep*=0ex,vmode]{block body}%
		\justifying 
	}

\setbeamertemplate{block example end}  
{
  \end{beamercolorbox}
  \vskip\smallskipamount
}

%% Set beamer alert block design %%
\setbeamertemplate{block alerted begin}
{
  \par\vskip\medskipamount%
  \begin{beamercolorbox}[sep=0ex,rounded=true,center,dp={2ex}]{block alerted title}
     \vskip-0.4cm
     \usebeamerfont{block title}\large\insertblocktitle
  \end{beamercolorbox}%
  {\parskip0pt\par}%
  \usebeamerfont{block body}%
  \vskip-0.8cm
  \begin{beamercolorbox}[sep=0.5cm, rounded=true,center]{block alerted title}%
  \setlength{\widthinbox}{\linewidth}
  \addtolength{\widthinbox}{-1cm}
  \begin{beamercolorbox}[rounded=true,wd={\widthinbox},center]{block alerted body}
  \setlength{\withininbox}{\widthinbox}
  \setlength{\boxinrule}{\widthinbox}
  \addtolength{\withininbox}{-0.5cm}
  \addtolength{\boxinrule}{0.5cm}
  \begin{center}
  \begin{minipage}{\withininbox}
  \justifying 
}

\setbeamertemplate{block alerted end} 
{
  \end{minipage}
  \end{center}
  \end{beamercolorbox}
  \end{beamercolorbox}
  \vskip\smallskipamount
}


%%%-------------------------------------------------%%%
%%% Do before the document starts %%%
%%%-------------------------------------------------%%%



