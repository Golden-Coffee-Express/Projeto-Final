%% -*- coding: utf-8; -*-

%% This is file `ThesisPUC.cls'.
%%
%% Any modified versions of this file must be renamed
%% with new filenames distinct from ThesisPUC.cls.
%% 
%% ----------------------------------------------------------------------------
%% LaTeX document class for typesetting theses of the PUC
%%
%% Copyright (C) 2020, Iserj
%%
%% ----------------------------------------------------------------------------
%%
%%
%% \CharacterTable
%%  {Upper-case    \A\B\C\D\E\F\G\H\I\J\K\L\M\N\O\P\Q\R\S\T\U\V\W\X\Y\Z
%%   Lower-case    \a\b\c\d\e\f\g\h\i\j\k\l\m\n\o\p\q\r\s\t\u\v\w\x\y\z
%%   Digits        \0\1\2\3\4\5\6\7\8\9
%%   Exclamation   \!     Double quote  \"     Hash (number) \#
%%   Dollar        \$     Percent       \%     Ampersand     \&
%%   Acute accent  \'     Left paren    \(     Right paren   \)
%%   Asterisk      \*     Plus          \+     Comma         \,
%%   Minus         \-     Point         \.     Solidus       \/
%%   Colon         \:     Semicolon     \;     Less than     \<
%%   Equals        \=     Greater than  \>     Question mark \?
%%   Commercial at \@     Left bracket  \[     Backslash     \\
%%   Right bracket \]     Circumflex    \^     Underscore    \_
%%   Grave accent  \`     Left brace    \{     Vertical bar  \|
%%   Right brace   \}     Tilde         \~}
%%


\newcommand{\docdate}{}  % See the renewcommands below,
\newcommand{\filedate}{} % these contain the content;-))
\newcommand{\fileversion}{}
\renewcommand{\docdate}{2017/11/12}
\renewcommand{\filedate}{2017/11/12}
\renewcommand{\fileversion}{1.0.6}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Iserj}%
[\filedate\space v\fileversion\space Thesis PUC-Rio document class]


%%%
%%% style options
%%%

%%  booleans
%% \makeatletter
\RequirePackage{ifthen}
\RequirePackage{nth}

% hyphenation
\RequirePackage[brazilian, american]{babel}

% PhD thesis or MsC dissertation
\newboolean{iserj@phd}
\setboolean{iserj@phd}{false}
\DeclareOption{msc}{\setboolean{iserj@phd}{false}}
\DeclareOption{master}{\setboolean{iserj@phd}{false}}
\DeclareOption{phd}{\setboolean{iserj@phd}{true}}

% tight or wide page layout
\newboolean{iserj@tight}
\setboolean{iserj@tight}{false}
\DeclareOption{wide}{\setboolean{iserj@tight}{false}}
\DeclareOption{tight}{\setboolean{iserj@tight}{true}}

% hyphenation

\newcommand{\llocale}{brazilian}
\newboolean{iserj@localebr}
\setboolean{iserj@localebr}{true}
\newboolean{iserj@localeus}
\setboolean{iserj@localeus}{false}

\DeclareOption{american}%
  {\PassOptionsToPackage{american, brazilian}{babel}%
   \setboolean{iserj@localeus}{true}%
   \setboolean{iserj@localebr}{false}%
   \renewcommand{\llocale}{american}%
}

\DeclareOption{brazilian}%
  {\PassOptionsToPackage{brazilian, american}{babel}%
   \setboolean{iserj@localebr}{true}%
   \setboolean{iserj@localeus}{false}%
   \renewcommand{\llocale}{brazilian}%
}

%%\DeclareOption{german}%
%%  {\PassOptionsToPackage{geran, brazilian, american}{babel}}

%%\DeclareOption{french}%
%%  {\PassOptionsToPackage{french, brazilian, american}{babel}}

% twoside
\newboolean{iserj@twoside}
\setboolean{iserj@twoside}{false}
\DeclareOption{twoside}{\setboolean{iserj@twoside}{true}}
\DeclareOption{oneside}{\setboolean{iserj@twoside}{false}}

% draft for debugging overful boxes
\newboolean{iserj@draft}
\setboolean{iserj@draft}{false}
\DeclareOption{draft}{\setboolean{iserj@draft}{true}}

% translations
\DeclareOption{dissertacao}{\setboolean{iserj@phd}{false}}
\DeclareOption{mestrado}{\setboolean{iserj@phd}{false}}
\DeclareOption{tese}{\setboolean{iserj@phd}{true}}
\DeclareOption{doutorado}{\setboolean{iserj@phd}{true}}
\DeclareOption{modelo1}{\setboolean{iserj@tight}{false}}
\DeclareOption{modelo2}{\setboolean{iserj@tight}{true}}
\DeclareOption{frenteverso}{\setboolean{iserj@twoside}{true}}
\DeclareOption{rascunho}{\setboolean{iserj@draft}{true}}

\ProcessOptions\relax


%%%
%%% base style
%%%

\ifthenelse{\boolean{iserj@twoside}}{%
  \LoadClass[a4paper,12pt\ifiserj@draft,draft\else\fi]{book}%
  \raggedbottom%
}{%
  \LoadClass[a4paper,12pt\ifiserj@draft,draft\else\fi]{report}%
}
%%\makeatother


%%%
%%% required packages
%%%

% fonts and symbols
\RequirePackage{amsfonts}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}             %% OT1 has 127 characters only
\RequirePackage{lmodern}                 %% tex modern font version

% graphics inclusion (in particular the PUC logo)
\RequirePackage[pdftex]{graphicx}

% subfigure loaded here for spacing definition
\RequirePackage[FIGBOTCAP, TABBOTCAP]{subfigure}

% Section titles
\RequirePackage[clearempty, compact]{titlesec}

% table of contents
\RequirePackage[subfigure]{tocloft}

% dynamically change margins
% \RequirePackage{changepage}

% line spacing
\RequirePackage{setspace}

% header and footer
\RequirePackage{fancyhdr}

% front matter inclusion and space in environment
\RequirePackage{atbeginend}

% indent first line of sections and chapters
\RequirePackage{indentfirst}

% number of pages
\RequirePackage{lastpage}

% hyperlink and pdf bookmarks

\RequirePackage[%
  %backref,%
  pdftex,%
  colorlinks=true,%
  bookmarksopen=true,%
  breaklinks=true,%
  linkcolor=black,% blue
  anchorcolor=black,%
  citecolor=black,% cyan
  urlcolor=black,% red
  bookmarksnumbered=false%
]{hyperref}

%% \makeatletter


%%%
%%% page layout
%%%

\setlength{\parindent}{1cm}
\setlength{\voffset}{-1in}
\setlength{\topmargin}{20pt}
\setlength{\topskip}{0.001cm}
\addtolength{\headheight}{2.5pt}

% Copy of some of the code from the ifmtarg package to save requiring
% ifmtarg
\begingroup
\catcode`\Q=3
\long\gdef\@ifmtarg#1{\@xifmtarg#1QQ\@secondoftwo\@firstoftwo\@nil}
\long\gdef\@xifmtarg#1#2Q#3#4#5\@nil{#4}
\endgroup


% Set the page output parameters
\DeclareRobustCommand{\ch@ngetext}{%
  \setlength{\@colht}{\textheight}\setlength{\@colroom}{\textheight}%
  \setlength{\vsize}{\textheight}\setlength{\columnwidth}{\textwidth}%
  \if@twocolumn%
    \advance\columnwidth-\columnsep \divide\columnwidth\tw@%
    \@firstcolumntrue%
  \fi%
  \setlength{\hsize}{\columnwidth}%
  \setlength{\linewidth}{\hsize}}

%\newcommand{\setpage}[9]{%
\DeclareRobustCommand{\setpage}[9]{%
  \@ifmtarg{#1}{}{\setlength{\textheight}{#1}}%
  \@ifmtarg{#2}{}{\setlength{\textwidth}{#2}}%
  \@ifmtarg{#3}{}{\setlength{\evensidemargin}{#3}}%
  \@ifmtarg{#4}{}{\setlength{\oddsidemargin}{#4}}%
  \@ifmtarg{#5}{}{\setlength{\columnsep}{#5}}%
  \ch@ngetext%
  \@ifmtarg{#6}{}{\setlength{\topmargin}{#6}}%
  \@ifmtarg{#7}{}{\setlength{\headheight}{#7}}%
  \@ifmtarg{#8}{}{\setlength{\headsep}{#8}}%
  \@ifmtarg{#9}{}{\setlength{\footskip}{#9}}%
}

\newcommand{\iserj@setallmargins}[5]{%
 % declare length
 \expandafter\newlength\csname iserj@topmargin@#1\endcsname%
 \expandafter\newlength\csname iserj@bottommargin@#1\endcsname%
 \expandafter\newlength\csname iserj@leftmargin@#1\endcsname%
 \expandafter\newlength\csname iserj@rightmargin@#1\endcsname%
 \expandafter\newlength\csname iserj@textwidth@#1\endcsname%
 \expandafter\newlength\csname iserj@oddsidemargin@#1\endcsname%
 \expandafter\newlength\csname iserj@evensidemargin@#1\endcsname%
 \expandafter\newlength\csname iserj@textheight@#1\endcsname%
 \expandafter\newlength\csname iserj@headsep@#1\endcsname%
%
 % adjust margins
 \expandafter\setlength{\csname iserj@topmargin@#1\endcsname}{#2}%
 \expandafter\setlength{\csname iserj@bottommargin@#1\endcsname}{#3}%
 \expandafter\setlength{\csname iserj@leftmargin@#1\endcsname}{#4}%
 \expandafter\setlength{\csname iserj@rightmargin@#1\endcsname}{#5}%
%
 % converts margins to text size
 \expandafter\setlength{\csname iserj@textwidth@#1\endcsname}{\paperwidth}%
 \expandafter\addtolength{\csname iserj@textwidth@#1\endcsname}{-\csname iserj@leftmargin@#1\endcsname}%
 \expandafter\addtolength{\csname iserj@textwidth@#1\endcsname}{-\csname iserj@rightmargin@#1\endcsname}%
%
 \expandafter\setlength{\csname iserj@oddsidemargin@#1\endcsname}{\csname iserj@leftmargin@#1\endcsname}%
 \expandafter\addtolength{\csname iserj@oddsidemargin@#1\endcsname}{-1in}%
 \expandafter\addtolength{\csname iserj@oddsidemargin@#1\endcsname}{-\hoffset}%
%
 \ifthenelse{\boolean{iserj@twoside}}{%
   \expandafter\setlength{\csname iserj@evensidemargin@#1\endcsname}{\csname iserj@rightmargin@#1\endcsname}%
 }{%
   \expandafter\setlength{\csname iserj@evensidemargin@#1\endcsname}{\csname iserj@leftmargin@#1\endcsname}%
 }%
 \expandafter\addtolength{\csname iserj@evensidemargin@#1\endcsname}{-1in}%
 \expandafter\addtolength{\csname iserj@evensidemargin@#1\endcsname}{-\hoffset}%
%
 \expandafter\setlength{\csname iserj@headsep@#1\endcsname}{\csname iserj@topmargin@#1\endcsname}%
 \expandafter\addtolength{\csname iserj@headsep@#1\endcsname}{-1in}%
 \expandafter\addtolength{\csname iserj@headsep@#1\endcsname}{-\voffset}%
 \expandafter\addtolength{\csname iserj@headsep@#1\endcsname}{-\topmargin}%
 \expandafter\addtolength{\csname iserj@headsep@#1\endcsname}{-\headheight}%
%
 \expandafter\setlength{\csname iserj@textheight@#1\endcsname}{\paperheight}%
 \expandafter\addtolength{\csname iserj@textheight@#1\endcsname}{-\csname iserj@topmargin@#1\endcsname}%
 \expandafter\addtolength{\csname iserj@textheight@#1\endcsname}{-\csname iserj@bottommargin@#1\endcsname}%
%
 % dynamic margin adjustment
 \expandafter\newcommand\csname iserj@setmargins@#1\endcsname{%
   \setpage%
     {\csname iserj@textheight@#1\endcsname}%
     {\csname iserj@textwidth@#1\endcsname}%
     {\csname iserj@evensidemargin@#1\endcsname}%
     {\csname iserj@oddsidemargin@#1\endcsname}%
     {}{}{}%
     {\csname iserj@headsep@#1\endcsname}%
     {}%
  }%
}


% text
\ifthenelse{\boolean{iserj@tight}}{%
 \iserj@setallmargins{text}{2.5cm}{2.5cm}{3.5cm}{7.0cm}%
}{%
 \iserj@setallmargins{text}{2.5cm}{2.5cm}{3.0cm}{4.0cm}%
}

% cover
\iserj@setallmargins{cover}{7.0cm}{3.0cm}{7.0cm}{2.0cm}

% front
\iserj@setallmargins{front}{2.5cm}{2.5cm}{6.0cm}{4.0cm}

% dedication
\iserj@setallmargins{dedication}{2.5cm}{2.5cm}{3.0cm}{4.0cm}



%%%
%%% To debug the layout
%%%

%\newcommand{\iserj@leftmargin}[1]{\noindent\fbox{\begin{minipage}[top]{\textwidth}#1\end{minipage}}}
%\newcommand{\iserj@rightmargin}[1]{\noindent\fbox{\begin{minipage}[top]{\textwidth}\begin{flushright}#1\end{flushright}\end{minipage}}}

\newcommand{\iserj@leftmargin}[1]{\noindent\begin{minipage}[top]{\textwidth}#1\end{minipage}}
\newcommand{\iserj@rightmargin}[1]{\iserj@leftmargin{\begin{flushright}#1\end{flushright}}}


%%%
%%% line spacing
%%%

\ifthenelse{\boolean{iserj@tight}}{}{\onehalfspacing}
\frenchspacing
\clubpenalty=2000
\emergencystretch=20pt
\pretolerance=500
\tolerance=2500
\widowpenalty=2000


%%%
%%% number of floats per page
%%%

\renewcommand{\floatpagefraction}{.7}
\renewcommand{\topfraction}{.7}
\renewcommand{\bottomfraction}{.7}
\renewcommand{\textfraction}{.3}
\setcounter{totalnumber}{10}
\setcounter{topnumber}{10}
\setcounter{bottomnumber}{10}


%%%
%%% subfigures
%%%

\renewcommand{\thesubfigure}{\thefigure (\alph{subfigure})}
\renewcommand{\@thesubfigure}{\thesubfigure:\space}
\renewcommand{\p@subfigure}{}


%%%
%%% Fonts
%%%

%% \newcommand{\arial}{\fontfamily{arial}}
\newcommand{\arial}{\sf}

%%%
%%% Section titles
%%%

%% \newcommand{\autolabel}[1]{\label{sec:#1}#1}

\titleformat{name=\chapter}			%% the command
   [display]					%% the shape
%%   {\singlespacing\large\fontfamily{arial}\bfseries\selectfont}
%%   %% the format (whole title)
   {\singlespacing\large\arial\bfseries}	%% the format (whole title)
   {\thechapter}				%% the label
   {0pt}					%% label title sep (space)
   {} %% {\autolabel}					%% before (code)
   {}						%% after (code)
\titlespacing{\chapter}		%% command
   {0pt}			%% left
   {-1.6em}			%% before [pagestyle is not empty]
   {84pt}			%% after
   %% []			%% right

\titleformat{name=\section}
   [display]
   {\penalty -5000\singlespacing\normalsize\arial\bfseries}
   {\thesection}
   {0pt}
   {} %% {\autolabel}
   {}

\titleformat{name=\section,numberless}
   [display]
   {\penalty -5000\singlespacing\normalsize\arial\bfseries}
   {}
   {0pt}
   {}
   {}

\titleformat{name=\subsection}
   [display]
   {\penalty -4000\singlespacing\normalsize\arial\bfseries}
   {\thesubsection}
   {0pt}
   {} %% {\autolabel}
   {}

\titleformat{name=\subsection,numberless}
   [display]
   {\penalty -4000\singlespacing\normalsize\arial\bfseries}
   {}
   {0pt}
   {}
   {}

\titleformat{name=\subsubsection}
   [display]
   {\penalty -3000\singlespacing\normalsize\arial\bfseries}
   {\thesubsubsection}
   {0pt}
   {} %% {\autolabel}
   {}

\titleformat{name=\subsubsection,numberless}
   [display]
   {\penalty -3000\singlespacing\normalsize\arial\bfseries}
   {\thesubsubsection}
   {0pt}
   {} %% {\autolabel}
   {}

\titleformat{name=\paragraph}
   [runin]
   {\singlespacing\normalsize\arial\bfseries}
   {}
   {2\wordsep}
   {}
   {}

\titleformat{name=\subparagraph}
   [runin]
   {\singlespacing\normalsize\arial\bfseries}
   {}
   {2\wordsep}
   {}
   {}


%%%
%%% page styles
%%%

%%\makeatletter%
\newcommand{\iserj@setpagestyle}{%
 \pagestyle{fancy}%
 \fancyhf{}% delete current setting for header and footer
 \fancyfoot{}%
  \ifthenelse{\boolean{iserj@twoside}}{%
   \fancyhead[LE]{\arial\footnotesize \nouppercase{\iserj@title}}%
   \fancyhead[RE]{\arial\footnotesize \thepage}%
   \fancyhead[RO]{\arial\footnotesize \thepage}%
   \fancyhead[LO]{\arial\footnotesize \nouppercase{\leftmark}}%
  }{
   \fancyhead[L]{\arial\slshape \nouppercase{\leftmark}}%
   \fancyhead[R]{\thepage}%
  }
 \renewcommand{\headrulewidth}{0pt}%
}
\fancypagestyle{empty}{\fancyhead{} \fancyfoot{} \renewcommand{\headrulewidth}{0pt}}%
\fancypagestyle{plain}{\fancyhead{} \fancyfoot{} \renewcommand{\headrulewidth}{0pt}}%


%%%
%%% table of contents
%%%

\setcounter{tocdepth}{3}
\setcounter{lofdepth}{3}
\setcounter{lotdepth}{3}
\setcounter{secnumdepth}{3}

\renewcommand{\cfttoctitlefont}{\large \arial \bfseries}
\setlength{\cftbeforetoctitleskip}{0pt}
\renewcommand{\cftloftitlefont}{\large \arial \bfseries}
\setlength{\cftbeforeloftitleskip}{0pt}
\renewcommand{\cftlottitlefont}{\large \arial \bfseries}
\setlength{\cftbeforelottitleskip}{0pt}
\renewcommand{\cftdot}{}
\renewcommand{\cftsecfont}{}
\setlength{\cftbeforesecskip}{\parskip}
\setlength{\cftbeforesubsecskip}{0pt}
\setlength{\cftchapnumwidth}{1.9em}
\setlength{\cftsecnumwidth}{2.5em}
\setlength{\cftsubsecnumwidth}{3.1em}
\setlength{\cftsubsubsecnumwidth}{3.7em}
\renewcommand{\cftchapindent}{0pt}
\renewcommand{\cftsecindent}{0pt}
\renewcommand{\cftsubsecindent}{0pt}
\renewcommand{\cftsubsubsecindent}{0pt}
\renewcommand{\cftchapfont}{\arial}
\renewcommand{\cftsecfont}{\arial}
\renewcommand{\cftsubsecfont}{\arial}
\renewcommand{\cftsubsubsecfont}{\arial}
\renewcommand{\cftfigfont}{\arial}
\renewcommand{\cfttabfont}{\arial}


%%%
%%% citations
%%%

\def\@cite#1#2{({#1\if@tempswa , #2\fi})}
\def\@citeb#1#2{[{#1\if@tempswa , #2\fi}]}


%%%
%%% theorems environments
%%%

\renewcommand{\theequation}{\thechapter-\arabic{equation}}
\newtheorem{definition}{Definição}[chapter]
\newtheorem{theorem}[definition]{Teorema}
\newtheorem{proposition}[definition]{Proposição}
\newtheorem{corollary}[definition]{Corolário}
\newenvironment{proof}{\par \noindent \textit{Prova}.}{\hfill $\blacksquare$}


%%%
%%% space in environment
%%%

\AfterBegin{itemize}{\addtolength{\itemsep}{-0.5em}}
\renewcommand{\labelitemi}{--}
\BeforeBegin{equation}{\vspace{-0.5em}}
\BeforeEnd{equation}{\vspace{-0.5em}}
\BeforeBegin{theorem}{\vspace{-0.4em}}
\BeforeEnd{theorem}{\vspace{-0.2em}}
\BeforeBegin{definition}{\vspace{-0.4em}}
\BeforeEnd{definition}{\vspace{-0.2em}}
\BeforeBegin{corollary}{\vspace{-0.4em}}
\BeforeEnd{corollary}{\vspace{-0.2em}}
\BeforeBegin{proposition}{\vspace{-0.4em}}
\BeforeEnd{proposition}{\vspace{-0.2em}}


%%%
%%% Front matter elements
%%%

%%\makeatletter

\newcommand{\iserj@usecolour}{false}
\newcommand{\usecolour}[1]{\renewcommand{\iserj@usecolour}{#1}}

\newcommand{\iserj@bibliographicdatalabel}{}

\newcommand{\authorA}{}
\newcommand{\iserj@authorA}{}
\renewcommand{\authorA}{\renewcommand{\iserj@authorA}}
\newcommand{\authorB}{}
\newcommand{\iserj@authorB}{}
\renewcommand{\authorB}{\renewcommand{\iserj@authorB}}
\newcommand{\authorC}{}
\newcommand{\iserj@authorC}{}
\renewcommand{\authorC}{\renewcommand{\iserj@authorC}}
\newcommand{\authorD}{}
\newcommand{\iserj@authorD}{}
\renewcommand{\authorD}{\renewcommand{\iserj@authorD}}
\newcommand{\authorE}{}
\newcommand{\iserj@authorE}{}
\renewcommand{\authorE}{\renewcommand{\iserj@authorE}}
\newcommand{\authorF}{}
\newcommand{\iserj@authorF}{}
\renewcommand{\authorF}{\renewcommand{\iserj@authorF}}
\newcommand{\authorG}{}
\newcommand{\iserj@authorG}{}
\renewcommand{\authorG}{\renewcommand{\iserj@authorG}}

\newcommand{\iserj@authorRA}{}
\newcommand{\authorRA}[1]{\renewcommand{\iserj@authorRA}{#1}}
\newcommand{\iserj@authorRB}{}
\newcommand{\authorRB}[1]{\renewcommand{\iserj@authorRB}{#1}}
\newcommand{\iserj@authorRC}{}
\newcommand{\authorRC}[1]{\renewcommand{\iserj@authorRC}{#1}}
\newcommand{\iserj@authorRD}{}
\newcommand{\authorRD}[1]{\renewcommand{\iserj@authorRD}{#1}}
\newcommand{\iserj@authorRE}{}
\newcommand{\authorRE}[1]{\renewcommand{\iserj@authorRE}{#1}}
\newcommand{\iserj@authorRF}{}
\newcommand{\authorRF}[1]{\renewcommand{\iserj@authorRF}{#1}}
\newcommand{\iserj@authorRG}{}
\newcommand{\authorRG}[1]{\renewcommand{\iserj@authorRG}{#1}}

\newcommand{\iserj@advisor}{}
\newcommand{\iserj@advisorT}{}
\newcommand{\advisor}[2]{%
  \renewcommand{\iserj@advisor}{#1}%
  \renewcommand{\iserj@advisorT}{#2}}
\newcommand{\iserj@advisorPF}{}
\newcommand{\advisorPF}[1]{
	\renewcommand{\iserj@advisorPF}{#1}
}
\newcommand{\iserj@advisorMD}{}
\newcommand{\advisorMD}[1]{
	\renewcommand{\iserj@advisorMD}{#1}
}
\newcommand{\iserj@advisorLTP}{}
\newcommand{\advisorLTP}[1]{
	\renewcommand{\iserj@advisorLTP}{#1}
}
\newcommand{\iserj@advisorWEB}{}
\newcommand{\advisorWEB}[1]{
	\renewcommand{\iserj@advisorWEB}{#1}
}

\newcommand{\iserj@advisorlabel}{}
\newcommand{\iserj@advisorlabellc}{}

\newcommand{\iserj@advisorR}{}
\newcommand{\advisorR}[1]{\renewcommand{\iserj@advisorR}{#1}}

%% the advisor's institution and symbol if not the university itself
\newcommand{\iserj@advisorInst}{}
\newcommand{\iserj@advisorInstS}{}
\newcommand{\advisorInst}[2]{%
  \renewcommand{\iserj@advisorInst}{#1}%
  \renewcommand{\iserj@advisorInstS}{#2}}

\newcommand{\iserj@coadvisor}{}
\newcommand{\iserj@coadvisorT}{}
\newcommand{\coadvisor}[2]{%
  \renewcommand{\iserj@coadvisor}{#1}%
  \renewcommand{\iserj@coadvisorT}{#2}}
\newcommand{\iserj@coadvisorlabel}{}
\newcommand{\iserj@coadvisorlabellc}{}

\newcommand{\iserj@coadvisorR}{}
\newcommand{\coadvisorR}[1]{\renewcommand{\iserj@coadvisorR}{#1}}

\newcommand{\iserj@coadvisorInst}{}
\newcommand{\iserj@coadvisorInstS}{}
\newcommand{\coadvisorInst}[2]{%
  \renewcommand{\iserj@coadvisorInst}{#1}%
  \renewcommand{\iserj@coadvisorInstS}{#2}}

\newcommand{\iserj@coadvisorII}{}
\newcommand{\iserj@coadvisorIIT}{}
\newcommand{\coadvisorII}[2]{%
  \renewcommand{\iserj@coadvisorII}{#1}
  \renewcommand{\iserj@coadvisorIIT}{#2}}

\newcommand{\iserj@coadvisorIIR}{}
\newcommand{\coadvisorIIR}[1]{\renewcommand{\iserj@coadvisorIIR}{#1}}

\newcommand{\iserj@coadvisorIIInst}{}
\newcommand{\iserj@coadvisorIIInstS}{}
\newcommand{\coadvisorIIInst}[2]{%
  \renewcommand{\iserj@coadvisorIIInst}{#1}
  \renewcommand{\iserj@coadvisorIIInstS}{#2}}

\newcommand{\iserj@coadvisorIII}{}
\newcommand{\iserj@coadvisorIIIT}{}
\newcommand{\coadvisorIII}[2]{%
  \renewcommand{\iserj@coadvisorIII}{#1}
  \renewcommand{\iserj@coadvisorIIIT}{#2}}

\newcommand{\iserj@coadvisorIIIR}{}
\newcommand{\coadvisorIIIR}[1]{\renewcommand{\iserj@coadvisorIIIR}{#1}}

\newcommand{\iserj@coadvisorIIIInst}{}
\newcommand{\iserj@coadvisorIIIInstS}{}
\newcommand{\coadvisorIIIInst}[2]{%
  \renewcommand{\iserj@coadvisorIIIInst}{#1}
  \renewcommand{\iserj@coadvisorIIIInstS}{#2}}

\newcommand{\iserj@title}{}
\renewcommand{\title}[1]{\renewcommand{\iserj@title}{#1}}

\newcommand{\iserj@titleuk}{}
\newcommand{\titleuk}[1]{\renewcommand{\iserj@titleuk}{#1}}

\newcommand{\iserj@subtitle}{}
\newcommand{\subtitle}[1]{\renewcommand{\iserj@subtitle}{#1}}

\newcommand{\iserj@day}{}
\renewcommand{\day}[1]{\renewcommand{\iserj@day}{#1}}

\newcommand{\iserj@month}{}
\renewcommand{\month}[1]{\renewcommand{\iserj@month}{#1}}

\newcommand{\iserj@year}{}
\renewcommand{\year}[1]{\renewcommand{\iserj@year}{#1}}

\newcommand{\iserj@city}{Rio de Janeiro}
\newcommand{\city}[1]{\renewcommand{\iserj@city}{#1}}

\newcommand{\iserj@department}{}
\newcommand{\department}[1]{\renewcommand{\iserj@department}{#1}}

\newcommand{\iserj@program}{}
\newcommand{\program}[1]{\renewcommand{\iserj@program}{#1}}

\newcommand{\iserj@school}{}
\newcommand{\school}[1]{\renewcommand{\iserj@school}{#1}}

\newcommand{\iserj@university}{Fundação de Apoio à Escola Técnica -- Instituto Superior de Educação}
\newcommand{\university}[1]{\renewcommand{\iserj@university}{#1}}

\newcommand{\iserj@uni}{Fundação de Apoio à Escola Técnica -- Instituto Superior de Educação}
\newcommand{\uni}[1]{\renewcommand{\iserj@uni}{#1}}

\newcommand{\iserj@CDD}{}
\newcommand{\CDD}[1]{\renewcommand{\iserj@CDD}{#1}}

\newcommand{\jurymember}[4]{}

\newcommand{\iserj@schoolheadtitle}{%
  \ifthenelse{\boolean{iserj@localebr}}%
  {}
{  Coordenador do Curso Técnico em Informática do \iserj@school}%
}

\newcommand{\schoolhead}[2]{\jurymember{#1}{#2}%
  {\iserj@schoolheadtitle}{\iserj@uni}}

\newcommand{\iserj@jury}{}
\newcommand{\jury}[1]{\renewcommand{\iserj@jury}{#1}}

\newcommand{\iserj@resume}{}
\newcommand{\resume}[1]{\renewcommand{\iserj@resume}{#1}}

\newboolean{hasdedication}
\setboolean{hasdedication}{false}
\newcommand{\iserj@dedication}{}
\newcommand{\dedication}[1]{%
  \renewcommand{\iserj@dedication}{#1}%
  \setboolean{hasdedication}{true}%
}

\newcommand{\iserj@acknowledgment}{}
\newcommand{\acknowledgment}[1]{\renewcommand{\iserj@acknowledgment}{#1}}

\newcommand{\catalogprekey}[1]{}
\newcommand{\iserj@catalogprekeywords}{}
\newcommand{\catalogprekeywords}[1]{\renewcommand{\iserj@catalogprekeywords}{#1}}

\newcommand{\key}[1]{}
\newcommand{\iserj@keywords}{}
\newcommand{\keywords}[1]{\renewcommand{\iserj@keywords}{#1}}

\newcommand{\iserj@keywordsuk}{}
\newcommand{\keywordsuk}[1]{\renewcommand{\iserj@keywordsuk}{#1}}

\newcommand{\iserj@abstract}{}
\ifthenelse{\boolean{iserj@twoside}}{%
  \newcommand{\abstract}[1]{\renewcommand{\iserj@abstract}{#1}}%
}{%
  \renewcommand{\abstract}[1]{\renewcommand{\iserj@abstract}{#1}}%
}

\newcommand{\iserj@abstractuk}{}
\newcommand{\abstractuk}[1]{\renewcommand{\iserj@abstractuk}{#1}}%

\newcommand{\iserj@tablesmode}{figtab}
\newcommand{\tablesmode}[1]{\renewcommand{\iserj@tablesmode}{#1}}

\newboolean{hasepigraph}
\setboolean{hasepigraph}{false}
\newcommand{\iserj@epigraph}{}
\newcommand{\epigraph}[1]{%
  \renewcommand{\iserj@epigraph}{#1}%
  \setboolean{hasepigraph}{true}%
}

\newcommand{\iserj@epigraphauthorA}{}
\newcommand{\epigraphauthorA}[1]{\renewcommand{\iserj@epigraphauthorA}{#1}}

\newcommand{\iserj@epigraphbook}{}
\newcommand{\epigraphbook}[1]{\renewcommand{\iserj@epigraphbook}{#1}}

\newcommand{\iserj@abreviationstitle}{Lista de Abreviaturas}
\newcommand{\abreviationstitle}[1]{\renewcommand{\iserj@abreviationstitle}{#1}}%

\newcommand{\iserj@abreviationstitleuk}{List of Abreviations}
\newcommand{\abreviationstitleuk}[1]{\renewcommand{\iserj@abreviationstitleuk}{#1}}%


%%%
%%% translations
%%%

\newcommand{\autor}[1]{\authorA{#1}}
\newcommand{\autorR}[1]{\authorRA{#1}}
\newcommand{\orientador}[2]{\advisor{#1}{#2}}
\newcommand{\orientadorR}[1]{\advisorR{#1}}
\newcommand{\orientadorInst}[1]{\advisorInst{#1}}
\newcommand{\coorientador}[1]{\coadvisor{#1}}
\newcommand{\coorientadorR}[1]{\coadvisorR{#1}}
\newcommand{\coorientadorInst}[1]{\coadvisorInst{#1}}
\newcommand{\coorientadorII}[1]{\coadvisorII{#1}}
\newcommand{\coorientadorIIR}[1]{\coadvisorIIR{#1}}
\newcommand{\coorientadorIIInst}[1]{\coadvisorIIInst{#1}}
\newcommand{\coorientadorIII}[1]{\coadvisorIII{#1}}
\newcommand{\coorientadorIIIR}[1]{\coadvisorIIIR{#1}}
\newcommand{\coorientadorIIIInst}[1]{\coadvisorIIIInst{#1}}
\newcommand{\titulo}[1]{\title{#1}}
\newcommand{\titulouk}[1]{\titleuk{#1}}
\newcommand{\subtitulo}[1]{\subtitle{#1}}
\newcommand{\dia}[1]{\day{#1}}
\newcommand{\mes}[1]{\month{#1}}
\newcommand{\ano}[1]{\year{#1}}
\newcommand{\cidade}[1]{\city{#1}}
\newcommand{\departamento}[1]{\department{#1}}
\newcommand{\programa}[1]{\program{#1}}
\newcommand{\centro}[1]{\school{#1}}
\newcommand{\universidade}[1]{\university{#1}}
%\newcommand{\uni}[1]{\uni{#1}}
%\newcommand{\CDD}[1]{\CDD{#1}}
\newcommand{\membrodabanca}[4]{\jurymember{#1}{#2}{#3}{#4}}
\newcommand{\coordenador}[2]{\schoolhead{#1}{#2}}
\newcommand{\banca}[1]{\jury{#1}}
\newcommand{\curriculo}[1]{\resume{#1}}
\newcommand{\dedicatoria}[1]{\dedication{#1}}
\newcommand{\agradecimentos}[1]{\acknowledgment{#1}}
\newcommand{\chave}[1]{\key{#1}}
\newcommand{\chaves}[1]{\keywords{#1}}
\newcommand{\chavesuk}[1]{\keywordsuk{#1}}
\newcommand{\resumo}[1]{\abstract{#1}}
\newcommand{\resumouk}[1]{\abstractuk{#1}}
\newcommand{\modotabelas}[1]{\tablesmode{#1}}
\newcommand{\epigrafe}[1]{\epigraph{#1}}
\newcommand{\epigrafeautor}[1]{\epigraphauthorA{#1}}
\newcommand{\epigrafelivro}[1]{\epigraphbook{#1}}
\newcommand{\tituloglossario}[1]{\abreviationstitle{#1}}


%%%
%%% The title
%%%

\newcommand{\iserj@thetitle}{%
  \ifthenelse{\boolean{iserj@localebr}}%
  {\iserj@titleuk}%
  {\iserj@title}%
}%


%%%
%%% cover
%%%

\newcommand{\iserj@showcover}{%
  \iserj@setmargins@cover%
  \thispagestyle{empty}%
  \singlespacing\arial%
  \begin{titlepage}%
    \setcounter{page}{0}%
    \renewcommand{\baselinestretch}{1.2}%
    \iserj@rightmargin{\LARGE \arial \textbf{\iserj@authorA} \normalsize}%
    \vspace*{\stretch{4}}%
    \par%
    \iserj@rightmargin{\LARGE \arial \textbf{\iserj@thetitle\relax} \normalsize}%
    \ifthenelse{\equal{\iserj@subtitle}{}}{}{%
      \vspace*{\stretch{0.5}}%
      \par%
      \iserj@rightmargin{\LARGE \arial \iserj@subtitle\relax \normalsize} }%
    \vspace*{\stretch{5}}%
    \par%
    \iserj@rightmargin{\Large \arial
      \textbf{\ifthenelse{\boolean{iserj@phd}}%
        {Trabalho de conclusão de curso}%
        {undefined}}}%
    \vspace*{\stretch{1.5}}%
    \par%
    %\iserj@rightmargin{\textbf{DEPARTAMENTO DE \MakeUppercase{\iserj@department}}}%
    %\vspace*{\stretch{0.5}}%
    \par%
    \renewcommand{\baselinestretch}{1.0}%
    \iserj@rightmargin{\Large \arial \iserj@program}%
    \vspace*{\stretch{9}}%
    \par%
    \iserj@rightmargin{\normalsize \arial \iserj@city \\ \iserj@month\ de \iserj@year}%
  \end{titlepage}%
  \setcounter{page}{1}%
}


%%%
%%% Front page
%%%

\newcommand{\iserj@approvedby}{Aprovada pela Comissão Examinadora abaixo
  assinada.}

\newcommand{\iserj@approvedbyuk}{Approved by the undersigned Examination
  Committee.}


\newcommand{\iserj@presentedforphduk}{
	%Thesis presented to the Programa de
  %Pós--graduação em \iserj@program\ of \iserj@uni ~in partial %fulfillment of
  %the requirements for the degree of Doutor em \iserj@program.
	Documento apresentado como requisito para a disciplina Projeto Final do Curso Técnico em Informática.
}

\newcommand{\iserj@presentedformsc}{Documento apresentado como requisito para a disciplina Projeto Final do Curso Técnico em Informática.}

\newcommand{\iserj@presentedformscuk}{}

\newcommand{\iserj@showfront}{%
  % %\cleardoublepage%
  \iserj@setmargins@front%
  \thispagestyle{empty}%
  \ifthenelse{\boolean{iserj@localebr}}%
  {\pdfbookmark[0]{\iserj@title}{anchor:title}}%
  {\pdfbookmark[0]{\iserj@titleuk}{anchor:title}}%
  \singlespacing\arial%
  %%%Aqui entra a figura
  \iserj@rightmargin{\includegraphics[height=8.2cm]{iserj}}%
  \vspace*{-1cm}%
  \par%
  \iserj@rightmargin{\large \arial \textbf{\iserj@authorA} \normalsize}%
  \vspace*{.6cm}%
  \par%
	\iserj@rightmargin{\large \arial \textbf{\iserj@authorB} \normalsize}%  
  \vspace*{.6cm}%
  \par%
	\iserj@rightmargin{\large \arial \textbf{\iserj@authorC} \normalsize}%  
	\vspace*{.6cm}%
  \par%
	\iserj@rightmargin{\large \arial \textbf{\iserj@authorD} \normalsize}%  
	\vspace*{.6cm}%  
	\par%
	\iserj@rightmargin{\large \arial \textbf{\iserj@authorE} \normalsize}%  
	\vspace*{.6cm}%
   \par%
	\iserj@rightmargin{\large \arial \textbf{\iserj@authorF} \normalsize}%  
	\vspace*{.6cm}%
   \par%
	\iserj@rightmargin{\large \arial \textbf{\iserj@authorG} \normalsize}%  
	\vspace*{\stretch{4}}%
  \par%
  \iserj@rightmargin{\large \arial \textbf{\iserj@thetitle\relax} \normalsize}%
  \ifthenelse{\equal{\iserj@subtitle}{}}{}{%
    \vspace*{\stretch{0.5}}%
    \par%
    \iserj@rightmargin{\arial \textbf{\iserj@subtitle} \relax} }%
  \vspace*{\stretch{5}}%
  \par%
  \iserj@rightmargin{\arial \textbf{\ifthenelse{\boolean{iserj@phd}}
      {Curso Técnico em Informática}
      {Dissertação de Mestrado}}}%
  \vspace*{\stretch{1.5}}%
  \par%
  \iserj@leftmargin{\arial%
    \ifthenelse{\boolean{iserj@phd}}%
    {\ifthenelse{\boolean{iserj@localebr}}%
      {\iserj@presentedforphd}%
      {\iserj@presentedforphduk}%
    }%
    {\ifthenelse{\boolean{iserj@localebr}}%
      {\iserj@presentedformsc}%
      {\iserj@presentedformscuk}%
    }%
  }%
  \vspace*{\stretch{1}}%
  \par%
  %\iserj@rightmargin{\begin{tabular}{l@{: }r@{}}%
   %   \iserj@advisorlabel\ & \iserj@advisorT\ \iserj@advisor%
    %  \ifthenelse{\equal{\iserj@coadvisor}{}}{}{%
     %   \\ \iserj@coadvisorlabel\ & \iserj@coadvisorT\ \iserj@coadvisor}%
    %  \ifthenelse{\equal{\iserj@coadvisorII}{}}{}{%
      %  \\ \iserj@coadvisorlabel\ & \iserj@coadvisorIIT\ \iserj@coadvisorII}%
    %  \ifthenelse{\equal{\iserj@coadvisorIII}{}}{}{%
     %   \\ \iserj@coadvisorlabel\ & \iserj@coadvisorIIIT\ \iserj@coadvisorIII}%
   % \end{tabular}}%
  \vspace*{\stretch{6}}%
  \par%
  \iserj@rightmargin{\iserj@city \\
  \ifthenelse{\boolean{iserj@localebr}}%
  {\iserj@month\ de \iserj@year}%
  {\iserj@month\ \iserj@year}}%
}


%%%
%%% Jury
%%%

\newcommand{\iserj@showjury}{%
  \cleardoublepage%
  \iserj@setmargins@front%
  \thispagestyle{empty}%
  \singlespacing\arial%
  \iserj@rightmargin{\includegraphics[height=8.2cm]{iserj}}%
  \vspace*{\stretch{0.5}}%
%  \par%
%  \iserj@rightmargin{\large \arial \textbf{\iserj@authorA}\quad \textbf{\iserj@authorB}\quad \textbf{\iserj@authorC}  \normalsize}%
%  \vspace*{\stretch{1}}%
  \par%
  \iserj@rightmargin{\large \arial \textbf{\iserj@thetitle\relax} \normalsize}%
  \ifthenelse{\equal{\iserj@subtitle}{}}{}{%
    \vspace*{\stretch{0.1}}%
    \par%
    \iserj@rightmargin{\arial \textbf{\iserj@subtitle} \relax} }%
  \vspace*{\stretch{1.5}}%
  \par%
  \iserj@leftmargin{\arial%
    \ifthenelse{\boolean{iserj@phd}}%
    {\ifthenelse{\boolean{iserj@localebr}}%
      {\iserj@presentedforphd ~\iserj@approvedby}%
      {\iserj@presentedforphduk ~\iserj@approvedbyuk}%
    }%
    {\ifthenelse{\boolean{iserj@localebr}}%
      {\iserj@presentedformsc ~\iserj@approvedby}%
      {\iserj@presentedformscuk ~\iserj@approvedbyuk}%
    }%
  }%
  \vspace*{\stretch{1}}%
  \renewcommand{\jurymember}[4]{\ifthenelse{\equal{##1}{}}{}{%
      \iserj@rightmargin{\textbf{##2 ##1}\\##3  ##4}
      \vspace*{\stretch{1}}\par}}%
  \par%
  
  \ifthenelse{\equal{\iserj@advisorInst}{}}{%
    \jurymember{\iserj@advisor}{\iserj@advisorT}%
    {\iserj@advisorlabel\ \\ Departamento de \iserj@department}{\iserj@uni}}{%
    \jurymember{\iserj@advisor}{\iserj@advisorT}%
    {\iserj@advisorlabel\ \\ \iserj@advisorInst}{\iserj@advisorInstS}}
  \ifthenelse{\equal{\iserj@coadvisorInst}{}}{%
    \jurymember{\iserj@coadvisor}{\iserj@coadvisorT}
    {\iserj@coadvisorlabel\ \\ Departamento de \iserj@department}{\iserj@uni}}{%
    \jurymember{\iserj@coadvisor}{\iserj@coadvisorT}%
    {\iserj@coadvisorlabel \\ \iserj@coadvisorInst}{\iserj@coadvisorInstS}}
  \ifthenelse{\equal{\iserj@coadvisorIIInst}{}}{%
    \jurymember{\iserj@coadvisorII}{\iserj@coadvisorIIT}%
    {\iserj@coadvisorlabel \\ Departamento de \iserj@department}{\iserj@uni}}{%
    \jurymember{\iserj@coadvisorII}{\iserj@coadvisorIIT}%
    {\iserj@coadvisorlabel \\ \iserj@coadvisorIIInst}{\iserj@coadvisorIIInstS}}
  \ifthenelse{\equal{\iserj@coadvisorIIIInst}{}}{%
    \jurymember{\iserj@coadvisorIII}{\iserj@coadvisorIIIT}%
    {\iserj@coadvisorlabel \\ Departamento de \iserj@department}{\iserj@uni}}{%
    \jurymember{\iserj@coadvisorIII}{\iserj@coadvisorIIIT}%
    {\iserj@coadvisorlabel \\ \iserj@coadvisorIIIInst}{\iserj@coadvisorIIIInstS}}%
%-----------------%
    \iserj@jury%
    %\iserj@advisorPF
%-----------------%
  \iserj@rightmargin{\iserj@city, \\
    \ifthenelse{\boolean{iserj@localebr}}%
	{\nth{\iserj@day} de \iserj@month\ de \iserj@year}%
	{{\iserj@day} de \iserj@month\ de  \iserj@year}.}%
}


%%%
%%% copyright
%%%

\newcommand{\iserj@showcopyrights}{%
  \cleardoublepage%
  \iserj@setmargins@front%
  \thispagestyle{empty}%
  \singlespacing\arial%
  \iserj@leftmargin{\normalfont \normalsize%
    \ifthenelse{\boolean{iserj@localebr}}%
    {Todos os direitos reservados. É proibida a reprodução total ou
      parcial do trabalho sem autorização da universidade, do autor e do
      orientador.}%
    {}}%
  \vspace*{\stretch{2}}%
  \par%
  \iserj@rightmargin{\arial \textbf{\iserj@authorA}}%
  \vspace*{\stretch{0.2}}%
   \par%
 \iserj@rightmargin{\arial \textbf{\iserj@authorB}}%
 \vspace*{\stretch{0.2}}% 
   \par%
 \iserj@rightmargin{\arial \textbf{\iserj@authorC}}%
 \vspace*{\stretch{0.2}}%
  \par%
	\iserj@rightmargin{\arial \textbf{\iserj@authorD}}%
	\vspace*{\stretch{0.2}}% 
  \par%
	\iserj@rightmargin{\arial \textbf{\iserj@authorE}}%
	\vspace*{\stretch{0.2}}% 	
  \par%
	\iserj@rightmargin{\arial \textbf{\iserj@authorF}}%
	\vspace*{\stretch{0.2}}% 
  \par%
	\iserj@rightmargin{\arial \textbf{\iserj@authorG}}%
	\vspace*{\stretch{0.2}}% 
  \par%
  \iserj@leftmargin{\normalfont \iserj@resume}%
  \vspace*{\stretch{2}}%
  \par%
  \iserj@rightmargin{\small \arial \iserj@bibliographicdatalabel}%
  \par%
  \iserj@leftmargin{%
    \hspace{.5mm}%
    \begin{tabular}{|p{0.95\linewidth}|} \hline%
      \noindent \bf{\it{\iserj@authorRA, \iserj@authorRB, \iserj@authorRC, \iserj@authorRD, \iserj@authorRE, \iserj@authorRF, \iserj@authorRG}} \\ \\ \par%
      \hspace*{.6cm} \iserj@thetitle\relax\ / \iserj@authorA; \iserj@authorB; \iserj@authorC; \iserj@authorD; \iserj@authorE; \iserj@authorF; \iserj@authorG;
      %\iserj@advisorlabellc:
      %\iserj@advisor\ifthenelse{\equal{\iserj@coadvisor}{}}{}{;
      %\iserj@coadvisorlabellc
      %\ifthenelse{\equal{\iserj@coadvisorII}{}}{}{es}:
      %\iserj@coadvisor}\ifthenelse{\equal{\iserj@coadvisorII}{}}%{}{,
      %\iserj@coadvisorII}\ifthenelse{\equal{\iserj@coadvisorIII}{}}{}{,
      %\iserj@coadvisorIII}. 
      -- Rio de janeiro: \iserj@uni, %Departamento de
      %\iserj@department, 
      \iserj@year. \\ \\ \par%
      \hspace*{.6cm} v., \pageref{LastPage} f: il.; 30 cm \\ \\ \par%
      \hspace*{.6cm} \ifthenelse{\boolean{iserj@phd}}{Trabalho de conclusão de curso}{} - \iserj@university, Departamento de \iserj@department. \\ \\ \par%
      \hspace*{.6cm} Inclui bibliografia \\ \\ \par%
      \hspace*{.6cm}%
        \newcounter{keycount}\setcounter{keycount}{1}%
        \renewcommand{\catalogprekey}[1]{\arabic{keycount}. ##1 -- Trabalho de conclusão de curso técnico.\addtocounter{keycount}{1}\ }%        
        \iserj@catalogprekeywords%
        \renewcommand{\key}[1]{\arabic{keycount}. ##1.\addtocounter{keycount}{1}\ }%        
        \iserj@keywords%
        \setcounter{keycount}{1}%
        \renewcommand{\key}[1]{\ifthenelse{\equal{##1}{}}{}{\Roman{keycount}. ##1.\addtocounter{keycount}{1}\ }}%
        \key{\iserj@advisorR}%
        \key{\iserj@coadvisorR}%
        \key{\iserj@coadvisorIIR}%
        \key{\iserj@coadvisorIIIR}%
        \key{\iserj@university.}%
        \key{Título}%
      \\%
    \hline \end{tabular}%
    }%
  \renewcommand{\footnoterule}{}\renewcommand{\@makefnmark}{\relax}%
  \footnotetext{\begin{flushright}\normalsize CDD: \iserj@CDD \end{flushright}}%
  \renewcommand{\@makefnmark}{\@textsuperscript{\normalfont\@thefnmark}}%
%  \clearpage
  %\ifthenelse{\boolean{iserj@tight}}{}{\onehalfspacing}\normalfont%
%  \renewcommand{\footnoterule}{\kern-3\p@\hrule width 2truein \kern 2.6\p@}%
}


%%%
%%% dedication
%%%

\newcommand{\iserj@showdedication}{%
  \cleardoublepage%
  \iserj@setmargins@dedication%
  \markboth{Dedicatória}{Dedicatória}%
  \thispagestyle{empty}%
  \singlespacing\normalfont%
  \vspace*{\stretch{1}}%
  \iserj@rightmargin{%
%-------------%
 \iserj@dedication
%-------------%
  }%
}

%%%
%%% acknowledgment
%%%

\newcommand{\iserj@showacknowledgment}{%
  \cleardoublepage%
  \iserj@setmargins@dedication%
  \markboth{Agradecimentos}{Agradecimentos}%
  \thispagestyle{empty}%
  \onehalfspacing\normalfont%
  \ifthenelse{\boolean{iserj@localebr}}{%
    \noindent \large \arial \textbf{Agradecimentos}%
    }{%
    \noindent \large \arial \textbf{Agradecimentos}
    }%

	\vspace{2cm}

  \normalfont \normalsize
  \par
  \iserj@acknowledgment%
}

%%%
%%% abstract (br)
%%%

\newcommand{\iserj@showabstract}{%
  \clearpage%
  \ifthenelse{\boolean{iserj@localeus}}%
  {\selectlanguage{brazilian}}%
  {}%
  \iserj@setmargins@dedication%
  \markboth{Resumo}{Resumo}%
  \thispagestyle{empty}%
  \singlespacing\normalfont%
  \pdfbookmark[0]{Resumo}{anchor:abstract}%
  \noindent \large \arial \textbf{Resumo} \normalfont \normalsize%
  \vspace{\stretch{3}}%
  \par\indent%
  \begin{minipage}{12cm}\singlespacing%
  \iserj@authorRA; \iserj@advisorR\ifthenelse{\equal{\iserj@coadvisor}{}}{}{; \iserj@coadvisorR}\ifthenelse{\equal{\iserj@coadvisorII}{}}{}{; \iserj@coadvisorIIR}\ifthenelse{\equal{\iserj@coadvisorIII}{}}{}{; \iserj@coadvisorIIIR}. \textbf{\iserj@title}. \iserj@city, \iserj@year. \pageref{LastPage}p.   \ifthenelse{\boolean{iserj@phd}}{Trabalho de conclusão de curso}{} -- \iserj@university.%
  \end{minipage}\onehalfspacing%
  \vspace*{\stretch{1}}%
  \par%
  \noindent%
  \begin{minipage}{13.5cm}%
    % --------%
    \hspace*{.8cm} \iserj@abstract%
    % --------%
  \end{minipage}%
  \vspace*{\stretch{3}}%
  \par%
  \noindent \large \arial \textbf{Palavras-chave} \normalfont \normalsize%
  \par%
  \renewcommand{\key}[1]{##1 \hspace{3mm}}%
  \indent \iserj@keywords%
  \vspace*{\stretch{4}}%
  \par%
  \ifthenelse{\boolean{iserj@localeus}}%
  {\selectlanguage{american}}%
  {}%
}

%%%
%%% abstract (uk)
%%%

\newcommand{\iserj@showabstractuk}{%
  \clearpage%
  \ifthenelse{\boolean{iserj@localebr}}%
  {\selectlanguage{american}}%
  {}%
  \iserj@setmargins@dedication%
  \markboth{Abstract}{Abstract}%
  \thispagestyle{empty}%
  \singlespacing\normalfont%
  \noindent \large \arial \textbf{Abstract} \normalfont \normalsize%
  \vspace{\stretch{3}}%
  \par\indent%
  \begin{minipage}{12cm}\singlespacing%
  \iserj@authorRA;
  \iserj@advisorR~(Advisor)\ifthenelse{\equal{\iserj@coadvisor}{}}{}{;
    \iserj@coadvisorR~(Co-Advisor)}\ifthenelse{\equal{\iserj@coadvisorII}{}}{}{;
    \iserj@coadvisorIIR~(Co-Advisor)}\ifthenelse{\equal{\iserj@coadvisorIII}{}}{}{;
    \iserj@coadvisorIIIR~(Co-Advisor)}. \textbf{\iserj@titleuk}. \iserj@city,
  \iserj@year. \pageref{LastPage}p.   \ifthenelse{\boolean{iserj@phd}}{Trabalho de conclusão de curso}{} -- \iserj@university.%
  \end{minipage}\onehalfspacing%
  \vspace*{\stretch{1}}%
  \par%
  \noindent\begin{minipage}{13.5cm}%
    % --------%
    \hspace*{.8cm} \iserj@abstractuk%
    % --------%
  \end{minipage}%
  \vspace*{\stretch{3}}%
  \par%
  \noindent \large \arial \textbf{Keywords} \normalfont \normalsize%
  \par%
  \renewcommand{\key}[1]{##1 \hspace{3mm}}%
  \indent \iserj@keywordsuk%
  \vspace*{\stretch{4}}%
  \par%
  \ifthenelse{\boolean{iserj@localebr}}%
  {\selectlanguage{brazilian}}%
  {}%
}


%%%
%%% tables
%%%

\newcommand{\iserj@figuretext}{Figura}
\newcommand{\iserj@figuretextuk}{Figure}

\newcommand{\iserj@tabletext}{Tabela}
\newcommand{\iserj@tabletextuk}{Table}

\renewcommand{\cftfigfont}{%
  \ifthenelse{\boolean{iserj@localebr}}%
  {\iserj@figuretext~}%
  {\iserj@figuretextuk~}}

\renewcommand{\cfttabfont}{%
  \ifthenelse{\boolean{iserj@localebr}}%
  {\iserj@tabletext~}%
  {\iserj@tabletextuk~}}

\newcommand{\iserj@showtables}{%
  \cleardoublepage%
  \iserj@setmargins@dedication%
  \ifthenelse{\boolean{iserj@localebr}}{%
    \renewcommand{\contentsname}{Sumário}%
    \renewcommand{\listfigurename}{Lista de figuras}%
    \renewcommand{\listtablename}{Lista de tabelas}%
  }{%
    \renewcommand{\contentsname}{Table of contents}%
    \renewcommand{\listfigurename}{List of figures}%
    \renewcommand{\listtablename}{List of tables}%
  }%
  \markboth{\contentsname}{\contentsname}%
  \thispagestyle{empty}%
  \pdfbookmark[0]{\contentsname}{anchor:contents}%
  \singlespacing\normalfont%
  \tableofcontents%
  \ifthenelse{\equal{\iserj@tablesmode}{fig} \or \equal{\iserj@tablesmode}{figtab}}%
  {%
    \clearpage%
    \markboth{\listfigurename}{\listfigurename}%
    \thispagestyle{empty}%
    \listoffigures%
  }{}%
  \ifthenelse{\equal{\iserj@tablesmode}{tab} \or \equal{\iserj@tablesmode}{figtab}}%
  {%
    \clearpage%
    \markboth{\listtablename}{\listtablename}%
    \thispagestyle{empty}%
    \listoftables%
  }{}%
}


%%%
%%% epigraph
%%%

\newcommand{\iserj@showepigraph}{%
	Dedicatória\\
  \cleardoublepage%
  \iserj@setmargins@text%
  \markboth{\contentsname}{\contentsname}%
  \thispagestyle{empty}%
  \singlespacing\normalfont%
  \vspace*{\stretch{1}}\par\indent%
  \hspace*{\stretch{2}}%
  \begin{minipage}[c]{8.2cm}%
  \it \iserj@epigraph%
  \end{minipage}%
  \hspace*{\stretch{1}}%
  \par%
  \begin{flushright}%
  \textbf{\iserj@epigraphauthorA}, \textit{\iserj@epigraphbook}.%
  \end{flushright}%
  }


%%%
%%% index (to have the right bookmark in the pdf)
%%%

\renewenvironment{theindex}{%
  \if@twocolumn%
    \@restonecolfalse%
  \else%
    \@restonecoltrue%
  \fi%
  \twocolumn%
  \columnseprule \z@%
  \columnsep 35\p@%
  \chapter*{\indexname}%
  \addcontentsline{toc}{chapter}{\indexname}%
  \markboth{\indexname}{\indexname}
  \parskip\z@ \@plus .3\p@\relax%
  \let\item\@idxitem%
}{%
  \if@restonecol\onecolumn\else\clearpage\fi%
}


%%%
%%% summary of notations (to have the right bookmark in the pdf)
%%%

% \newcommand{\notationsname}{Sumário das notações}%
\newenvironment{thenotations}{%
  \ifthenelse{\boolean{iserj@localebr}}
  {%
    \chapter*{\iserj@abreviationstitle}%
    \markboth{\iserj@abreviationstitle}{\iserj@abreviationstitle}%
  }{}
  \ifthenelse{\boolean{iserj@localeus}}
  {%
    \chapter*{\iserj@abreviationstitleuk}%
    \markboth{\iserj@abreviationstitleuk}{\iserj@abreviationstitleuk}%
  }{}
}{%
}


%%%
%%% all front matter
%%%

\newcommand{\iserj@showfrontmatter}{%
  \pagestyle{empty}%
  %% \iserj@showcover%
  \iserj@showfront%
  \iserj@showjury%
  \iserj@showcopyrights%
  % 
  \ifthenelse{\boolean{hasdedication}}{\iserj@showdedication}{}%
  \iserj@showacknowledgment%
  \ifthenelse{\boolean{iserj@localebr}}%
  {%
    \iserj@showabstract%
    \iserj@showabstractuk%
    \selectlanguage{brazilian}%
  }{%
    \iserj@showabstractuk%
    \iserj@showabstract%
    \selectlanguage{american}%
  }
  \iserj@showtables%
  \ifthenelse{\boolean{hasepigraph}}{\iserj@showepigraph}{}%
  % 
  \iserj@setmargins@text%
  \ifthenelse{\boolean{iserj@tight}}{}{\onehalfspacing}%
  \normalfont%
  \iserj@setpagestyle%
}


\AtBeginDocument{%
  \bibliographystyle{ThesisPUC}%
  \renewcommand{\key}[1]{#1. }
  \ifthenelse{\boolean{iserj@localebr}}%
  {\special{ pdf: docinfo << /Author (\iserj@authorA) /Title (\iserj@title)
      /Keywords (\iserj@keywords) >> }}%
  {\special{ pdf: docinfo << /Author (\iserj@authorA) /Title (\iserj@titleuk) /Keywords (\iserj@keywords) >> }}%
}

%% caps odities, we won't fight and define both the capitilzaed and
%% laower case version of the labels we need.

\AfterBegin{document}%
  {
   \ifthenelse{\boolean{iserj@localebr}}%
   {%
     \renewcommand{\iserj@bibliographicdatalabel}{Ficha Catalográfica}%
     \renewcommand{\iserj@advisorlabel}{Orientador}%
     \renewcommand{\iserj@advisorlabellc}{orientador}%
     \renewcommand{\iserj@coadvisorlabel}{Co-orientador}%
     \renewcommand{\iserj@coadvisorlabellc}{co-orientador}%
     \addto\captionsbrazilian{\renewcommand{\bibname}{Referências bibliográficas}}%
   }{%
     \renewcommand{\iserj@bibliographicdatalabel}{Ficha catalográfica}%
     \renewcommand{\iserj@advisorlabel}{Advisor}%
     \renewcommand{\iserj@advisorlabellc}{advisor}%
     \renewcommand{\iserj@coadvisorlabel}{Co-advisor}%
     \renewcommand{\iserj@coadvisorlabellc}{co-advisor}%
%     \addto\captionsamerican{\renewcommand\bibname{Bibliography references}}
   }%
   \makeatletter\iserj@showfrontmatter\makeatother%
 }


%% Local Variables:
%% mode: LaTeX
%% End:
\endinput
%%
%% End of file `ThesisPUC.cls'.
