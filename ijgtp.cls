\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ijgtp}[2026/09/23 IJGTP]

\GenericInfo{}{\space
 Copyright (c) 2026 Alexander Zhidenko. Prepared with assistance from OpenAI Codex CLI.^^J
 Licensed under the CC BY: https://creativecommons.org/licenses/by/4.0/^^J
 International Journal of Gravitation and Theoretical Physics%
 \@gobble
}%

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[10pt]{article}

\RequirePackage[numbers,sort&compress]{natbib}
\renewcommand{\bibnumfmt}[1]{#1.}
\renewcommand{\bibsection}{%
  \section*{\refname}%
  \phantomsection
  \addcontentsline{toc}{section}{\refname}%
}

\RequirePackage{bibunits}
\defaultbibliographystyle{scilight}
\RequirePackage{etoolbox}

% The style belongs to the current paper, not the document's main aux file.
% Delay its aux entry until the unit closes, so a style selected after the
% first citation still takes effect and BibTeX sees exactly one bibstyle.
\newcommand*{\ijgtp@paperbibstyle}{scilight}
\renewcommand*{\bibliographystyle}[1]{%
  \gdef\ijgtp@paperbibstyle{#1}%
  \gdef\@localbibstyle{#1}%
}
\patchcmd{\@startbibunit}
  {\immediate\write\@bibunitaux{\string\bibstyle{\@localbibstyle}}}
  {}{}
  {\ClassError{ijgtp}{Cannot defer the bibunits style entry}{The installed bibunits package is incompatible with this class.}}
\let\ijgtp@finishstartedbibunit\@finishstartedbibunit
\def\@finishstartedbibunit{%
  \if@filesw
    \immediate\write\@bibunitaux{\string\bibstyle{\@localbibstyle}}%
  \fi
  \ijgtp@finishstartedbibunit
}
\newcommand*{\ijgtp@startbibunit}{\bibunit[\ijgtp@paperbibstyle]}

% At end of a single-paper document, expose its bibliography unit to
% `bibtex jobname`. Keep the unit files for the existing multi-paper workflow.
\newcommand*{\ijgtp@singlebibunit}{}
\newcount\ijgtp@paperbibrequests
\newcommand*{\ijgtp@inputbbl}{%
  \ifnum\value{ijgtpmaketitlecount}=1
    \global\advance\ijgtp@paperbibrequests by1
    \ifnum\ijgtp@paperbibrequests=1
      \xdef\ijgtp@singlebibunit{\@bibunitname}%
    \fi
  \fi
  \IfFileExists{\@bibunitname.bbl}{\@input@{\@bibunitname.bbl}}{%
    \ifnum\value{ijgtpmaketitlecount}=1
      \ifnum\ijgtp@paperbibrequests=1
        \IfFileExists{\jobname.bbl}{\@input@{\jobname.bbl}}{\@input@{\@bibunitname.bbl}}%
      \else
        \@input@{\@bibunitname.bbl}%
      \fi
    \else
      \@input@{\@bibunitname.bbl}%
    \fi}%
}
\patchcmd{\@putbib}{\@input@{\@bibunitname.bbl}}{\ijgtp@inputbbl}{}%
  {\ClassError{ijgtp}{Cannot install the main bibliography fallback}{The installed bibunits package is incompatible with this class.}}
\newcommand*{\ijgtp@writesinglebibinput}{%
  \if@filesw
    \ifnum\value{ijgtpmaketitlecount}=1
      \ifnum\ijgtp@paperbibrequests=1
        \immediate\write\@mainaux{\string\@input{\ijgtp@singlebibunit.aux}}%
      \else
        \ifnum\ijgtp@paperbibrequests>1
          \ClassWarningNoLine{ijgtp}{Multiple bibliographies in one paper; run BibTeX on the individual auxiliary files}%
        \fi
      \fi
    \fi
  \fi
}

\def\@bibunitname{\jobname\the\@bibunitauxcnt}%
\def\@extra@b@citeb{@\@bibunitname}%
\renewcommand{\bibcite}[2]{\global\@namedef{b@#1\@extra@binfo}{#2}}%

\g@addto@macro\@startbibunit{%
  \if@filesw
    \begingroup
      \edef\@tempa{\string\expandafter\string\gdef
        \string\csname\space @extra@binfo\string\endcsname{\@extra@b@citeb}}%
      \immediate\write\@bibunitaux{\@tempa}%
    \endgroup
  \fi
}%

\g@addto@macro\document{%
  \let\ijgtp@orig@enddocument\enddocument
  \def\enddocument{%
    \endbibunit%
    \ijgtp@writesinglebibinput
    \ijgtp@orig@enddocument
  }%
  \ijgtp@startbibunit%
  \renewcommand{\bibliography}[1]{%
    \putbib[#1]%
    \endbibunit
    \ijgtp@startbibunit
  }%
}%

\g@addto@macro\endthebibliography{%
  \endbibunit%
  \ijgtp@startbibunit%
}%

\RequirePackage[a4paper,left=2.5cm,right=2.5cm,top=1.9cm,bottom=1.95cm]{geometry}

% Each paper starts with the journal layouts, independently of user geometry.
% Only the vertical text area differs between the title and body layouts.
% Capture the body dimensions for the actual paper size at each maketitle.
\newif\ifijgtp@bodygeometrypending
\newcommand*{\ijgtp@startpapergeometry}{%
  \clearpage % finish the old paper, including its pending body transition
  \newgeometry{left=2.5cm,right=2.5cm,top=1.9cm,bottom=1.95cm}%
  \xdef\ijgtp@bodygeometry{%
    \global\topmargin=\the\topmargin\relax
    \global\textheight=\the\textheight\relax
    \global\@colht=\the\textheight\relax}%
  \newgeometry{left=2.5cm,right=2.5cm,top=0.82cm,bottom=2.3cm}%
  \global\ijgtp@bodygeometrypendingtrue
}
\AtBeginDocument{%
  % Explicit layout changes override the scheduled body layout. Cancel before
  % their clearpage, so shipping the title cannot undo the user's request.
  \let\ijgtp@originalnewgeometry\newgeometry
  \renewcommand*{\newgeometry}[1]{%
    \global\ijgtp@bodygeometrypendingfalse
    \ijgtp@originalnewgeometry{#1}}%
  \let\ijgtp@originalrestoregeometry\restoregeometry
  \renewcommand*{\restoregeometry}{%
    \global\ijgtp@bodygeometrypendingfalse
    \ijgtp@originalrestoregeometry}%
  \let\ijgtp@originalloadgeometry\loadgeometry
  \renewcommand*{\loadgeometry}[1]{%
    \global\ijgtp@bodygeometrypendingfalse
    \ijgtp@originalloadgeometry{#1}}%
  % Run after a complete physical page (both columns in two-column mode).
  % The output routine then derives the next column room from @colht.
  % Do not call newgeometry here: its clearpage would re-enter page output.
  \g@addto@macro\@outputpage{%
    \ifijgtp@bodygeometrypending
      \global\ijgtp@bodygeometrypendingfalse
      \ijgtp@bodygeometry
    \fi}%
}

\RequirePackage{xcolor}
\definecolor{graycolor}{gray}{0.9}

\RequirePackage{microtype}
\RequirePackage{setspace}
\RequirePackage{times}
\RequirePackage{titlesec}

\RequirePackage{array}
\newcommand{\PreserveBackslash}[1]{\let\temp=\\#1\let\\=\temp}
\newcolumntype{C}[1]{>{\PreserveBackslash\centering}m{#1}}
\newcolumntype{R}[1]{>{\PreserveBackslash\raggedleft}m{#1}}
\newcolumntype{L}[1]{>{\PreserveBackslash\raggedright}m{#1}}
\RequirePackage{lineno}
\RequirePackage{graphicx}

\RequirePackage{caption}
\captionsetup[figure]{position=bottom, margin=0.75cm, labelfont={bf, small, stretch=1.17}, labelsep=period, textfont={small, stretch=1.17}, aboveskip=6pt, belowskip=12pt, justification=justified}
\captionsetup[scheme]{position=bottom, margin=0.75cm, labelfont={bf, small, stretch=1.17}, labelsep=period, textfont={small, stretch=1.17}, aboveskip=6pt, belowskip=12pt, justification=justified}
\captionsetup[table]{position=top, margin=0.75cm, labelfont={bf, small, stretch=1.17}, labelsep=period, textfont={small, stretch=1.17}, aboveskip=6pt, belowskip=12pt, justification=justified}
\captionsetup[boxenv]{position=top, margin=0.75cm, labelfont={bf, small, stretch=1.17}, labelsep=period, textfont={small, stretch=1.17}, aboveskip=6pt, belowskip=12pt, justification=justified}

\RequirePackage{fancyhdr}
\pagestyle{fancy}

\setlength{\parindent}{0.75cm}

\RequirePackage{lastpage}
\RequirePackage{catchfile}

\RequirePackage{hyperref}
\hypersetup{
	colorlinks=true,
	linkcolor=blue,
	filecolor=blue,
	urlcolor=black,
	citecolor=cyan,
}

% Text-safe negative thin space: multiple citations must not require amsmath.
\setcitestyle{open={[},close={]},citesep={,\kern-.16667em},numbers}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\headwidth}{\textwidth}
\renewcommand{\footrulewidth}{0.5pt}
\setstretch{1.1}

\setlength{\voffset}{0.6cm}
\setlength{\headsep}{0.4cm}

\titleformat {\section} [block] {\raggedright \fontsize{10}{10}\selectfont\bfseries} {\thesection. \space} {0pt} {}
\titlespacing {\section} {0pt} {12pt} {6pt}
\titleformat {\subsection} [block] {\raggedright \fontsize{10}{10}\selectfont\itshape} {\thesubsection .\space} {0pt} {}
\titlespacing {\subsection} {0pt} {12pt} {6pt}
\titleformat {\subsubsection} [block] {\raggedright \fontsize{10}{10}\selectfont} {\thesubsubsection .\space} {0pt} {}
\titlespacing {\subsubsection} {0pt} {12pt} {6pt}
\titleformat {\paragraph} [block] {\raggedright \fontsize{10}{10}\selectfont} {} {0pt} {}
\titlespacing {\paragraph} {0pt} {12pt} {6pt}

\newcounter{ijgtpmaketitlecount}

% Content counters are children of the paper counter. Preserve their
% existing hyperlink formats and their section/subsection dependencies.
% Register every content counter directly, also on older LaTeX versions
% where resetting a parent does not recursively reset its descendants.
% Use \ijgtpresetwithpaper{counter} for additional package-internal counters.
\newcommand*{\ijgtpresetwithpaper}[1]{%
  \@ifundefined{c@#1}{\@nocounterr{#1}}{%
    \@ifundefined{ijgtp@resetregistered@#1}{%
      \expandafter\gdef\csname ijgtp@resetregistered@#1\endcsname{}%
      \expandafter\let\expandafter\ijgtp@savedHcounter\csname theH#1\endcsname
      \@addtoreset{#1}{ijgtpmaketitlecount}%
      \expandafter\let\csname theH#1\endcsname\ijgtp@savedHcounter
    }{}%
  }%
}

% Prefix the generated destination, rather than changing printed numbers
% or the user's counter hierarchy. Autogenerated caption/unnumbered anchors
% and page anchors already have document-wide identifiers.
\let\ijgtp@originalmakecurrent\hyper@makecurrent
\def\ijgtp@scopedhref#1.#2\ijgtp@nil{%
  #1.ijgtp.\arabic{ijgtpmaketitlecount}.#2%
}
\def\hyper@makecurrent#1{%
  \ijgtp@originalmakecurrent{#1}%
  \xdef\HyperGlobalCurrentHref{%
    \expandafter\ijgtp@scopedhref\HyperGlobalCurrentHref\ijgtp@nil}%
  \let\HyperLocalCurrentHref\HyperGlobalCurrentHref
  \ifHy@localanchorname
    \let\@currentHref\HyperLocalCurrentHref
  \else
    \global\let\@currentHref\HyperGlobalCurrentHref
  \fi
}

% The auxiliary file holds namespaced labels plus a registry of their
% original names. Ordinary reference commands see aliases for the current
% paper, falling back to another paper only when the name is unique.
\newcommand*{\ijgtp@labelkeys}{}
\newif\ifijgtp@readinglabels
\ijgtp@readinglabelstrue
\newcommand*{\ijgtp@labelscope}[2]{%
  \ifijgtp@readinglabels
    \@ifundefined{ijgtp@labelowner@#2}{%
      \expandafter\gdef\csname ijgtp@labelowner@#2\endcsname{#1}%
      \g@addto@macro\ijgtp@labelkeys{\ijgtp@selectlabel{#2}}%
    }{%
      \ifnum\csname ijgtp@labelowner@#2\endcsname=#1\relax\else
        \expandafter\gdef\csname ijgtp@labelowner@#2\endcsname{-1}%
      \fi
    }%
  \fi
}
\newcommand*{\ijgtp@selectlabel}[1]{%
  \edef\ijgtp@labelkey{ijgtp.\arabic{ijgtpmaketitlecount}:#1}%
  \@ifundefined{r@\ijgtp@labelkey}{%
    \ifnum\csname ijgtp@labelowner@#1\endcsname<0\relax
      \expandafter\global\expandafter\let\csname r@#1\endcsname\relax
    \else
      \edef\ijgtp@labelkey{ijgtp.\csname ijgtp@labelowner@#1\endcsname:#1}%
      \ijgtp@aliaslabel{#1}%
    \fi
  }{\ijgtp@aliaslabel{#1}}%
}
\newcommand*{\ijgtp@aliaslabel}[1]{%
  \expandafter\global\expandafter\let\csname r@#1\expandafter\endcsname
    \csname r@\ijgtp@labelkey\endcsname
}
\AtBeginDocument{%
  \global\ijgtp@readinglabelsfalse
  \ijgtp@labelkeys
  \let\ijgtp@originallabel\label
  \def\label#1{%
    \@bsphack
    \ijgtp@originallabel{ijgtp.\arabic{ijgtpmaketitlecount}:#1}%
    \protected@write\@auxout{}{%
      \string\ijgtp@labelscope{\arabic{ijgtpmaketitlecount}}{#1}}%
    \@esphack
  }%
  % amsmath and nameref use this saved label command for display equations.
  \let\ltx@label\label
}

% Preserve the normal section format when a paper enters its appendices.
\newif\ifijgtp@inappendix
\let\ijgtp@originalappendix\appendix
\renewcommand{\appendix}{%
  \ifijgtp@inappendix\else
    \global\let\ijgtp@mainthesection\thesection
    \global\let\ijgtp@maintheHsection\theHsection
    \global\let\ijgtp@mainchapapp\Hy@chapapp
    \global\ijgtp@inappendixtrue
  \fi
  \ijgtp@originalappendix
  \renewcommand*{\theHsection}{\Alph{section}}%
}

\newcounter{ijgtpauthorcount}
\newcounter{ijgtpcurrentauthor}
\newcounter{ijgtpaffcount}

\newif\ifijgtp@tocfirstcall
\newcommand{\ijgtp@cachedtoc}{}
\let\ijgtp@originaltableofcontents\tableofcontents

% Explicit paper boundaries also cover unnumbered sections and references,
% whose hyperlink destinations do not encode the paper number.
\newcommand*{\ijgtp@tocpaper}[1]{\def\ijgtp@tocpaperid{#1}}

\IfFileExists{\jobname.toc}{%
  \CatchFileDef{\ijgtp@cachedtoc}{\jobname.toc}{}
}{}

\renewcommand{\tableofcontents}{%
  \begingroup
    \hypersetup{linkcolor=black}%
    \ijgtp@tocpaper{0}% front matter until a paper boundary is read
    \let\ijgtp@origcontentsline\contentsline
    \def\contentsline##1##2##3##4{%
      \ifnum\value{ijgtpmaketitlecount}=0\relax
        \ijgtp@origcontentsline{##1}{##2}{##3}{##4}%
      \else
        \ifnum\ijgtp@tocpaperid=\value{ijgtpmaketitlecount}\relax
          \ijgtp@origcontentsline{##1}{##2}{##3}{##4}%
        \fi
      \fi
    }
    \ifijgtp@tocfirstcall
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse
      \fi
      \section*{\contentsname
        \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
      \ijgtp@cachedtoc
      \if@restonecol\twocolumn\fi
    \else
      \global\ijgtp@tocfirstcalltrue
      \ijgtp@originaltableofcontents
    \fi
  \endgroup
}

\newif\ifijgtp@hasabstract
\newcommand{\ijgtp@abstracttext}{}
% Inspect paragraph-separated pieces without expanding the author's text.
% Spaces, tabs and line endings become spaces; blank lines become \par.
\long\def\ijgtp@checkabstractparts#1\par#2\ijgtp@nil{%
  \edef\ijgtp@abstractcheck{\expandafter\zap@space\detokenize{#1} \@empty}%
  \ifx\ijgtp@abstractcheck\@empty
    \if\relax\detokenize{#2}\relax\else
      \ijgtp@checkabstractparts#2\ijgtp@nil
    \fi
  \else
    \global\ijgtp@hasabstracttrue
  \fi
}
\newcommand{\ijgtp@setabstract}[1]{%
  \global\ijgtp@hasabstractfalse
  \ijgtp@checkabstractparts#1\par\ijgtp@nil
  \ifijgtp@hasabstract
    \gdef\ijgtp@abstracttext{\ignorespaces#1\unskip}%
  \else
    \gdef\ijgtp@abstracttext{}%
  \fi
}
\newtoks\ijgtp@abstractbodytoks
\def\ijgtp@collectabstractbody#1{%
  \ijgtp@abstractbodytoks{\expandafter#1\expandafter{\the\ijgtp@abstractbodytoks}}%
  \edef\ijgtp@processabstractbody{\the\ijgtp@abstractbodytoks\noexpand\end{\@currenvir}}%
  \ijgtp@abstractbodytoks={}%
  \def\ijgtp@abstractbeginstack{b}%
  \begingroup
  \expandafter\let\csname\@currenvir\endcsname\ijgtp@@collectabstractbody
  \edef\ijgtp@processabstractbody{%
    \expandafter\noexpand\csname\@currenvir\endcsname}%
  \ijgtp@processabstractbody
}
\long\def\ijgtp@pushabstractbegins#1\begin#2{%
  \ifx\end#2\else
    b\expandafter\ijgtp@pushabstractbegins
  \fi
}
\long\def\ijgtp@addtoabstractbody#1{%
  \global\ijgtp@abstractbodytoks\expandafter{\the\ijgtp@abstractbodytoks#1}%
}
\long\def\ijgtp@@collectabstractbody#1\end#2{%
  \edef\ijgtp@abstractbeginstack{%
    \ijgtp@pushabstractbegins#1\begin\end \expandafter\@gobble\ijgtp@abstractbeginstack}%
  \ifx\@empty\ijgtp@abstractbeginstack
    \endgroup
    \@checkend{#2}%
    \ijgtp@addtoabstractbody{#1}%
  \else
    \ijgtp@addtoabstractbody{#1\end{#2}}%
  \fi
  \ijgtp@processabstractbody
}
\let\abstract\relax
\let\endabstract\relax
\newenvironment{abstract}{%
  \ijgtp@collectabstractbody\ijgtp@setabstract
}{}

\newcommand{\ijgtp@papertypetext}{Article}
\newcommand{\papertype}[1]{%
  \gdef\ijgtp@papertypetext{#1}%
}

\newcommand{\ijgtp@setoptional}[2]{%
  \ifblank{#2}{\global\let#1\@empty}{\gdef#1{#2}}%
}

\newcommand*{\ijgtp@keywordstext}{}
\newcommand{\keywords}[1]{%
  \ijgtp@setoptional\ijgtp@keywordstext{#1}%
}

\newcommand*{\ijgtp@pacstext}{}
\newcommand{\pacs}[1]{%
  \ijgtp@setoptional\ijgtp@pacstext{#1}%
}

\newcommand*{\ijgtp@receivedtext}{}
\newcommand{\receiveddate}[1]{%
  \ijgtp@setoptional\ijgtp@receivedtext{#1}%
}

\newcommand*{\ijgtp@revisedtext}{}
\newcommand{\reviseddate}[1]{%
  \ijgtp@setoptional\ijgtp@revisedtext{#1}%
}

\newcommand*{\ijgtp@acceptedtext}{}
\newcommand{\accepteddate}[1]{%
  \ijgtp@setoptional\ijgtp@acceptedtext{#1}%
}

\newcommand*{\ijgtp@publishedtext}{}
\newcommand{\publisheddate}[1]{%
  \ijgtp@setoptional\ijgtp@publishedtext{#1}%
}

\newif\ifijgtp@haspublished
\newcommand{\ijgtp@pubyear}{undefined}
\newcommand{\ijgtp@pubvolume}{undefined}
\newcommand{\ijgtp@pubissue}{undefined}
\newcommand{\ijgtp@pubnumber}{undefined}
\newcommand{\ijgtp@doi}{undefined}
\newcommand{\ijgtp@unpublished}{%
  \global\ijgtp@haspublishedfalse
}%

\newcommand{\ijgtp@publishedwarning}{%
  \ClassWarning{ijgtp}{\string\ijgtppublished\space is ignored. Publication data is wrong}%
%  \ijgtp@unpublished%
}

\newif\ifijgtp@allDigits
\newif\ifijgtp@validpublished
\def\ijgtp@skipdigits#1\relax{}
\def\ijgtp@checkdigits#1{%
  \ifx#1\relax
    \let\ijgtp@next\relax
  \else
    \ifnum`#1<`0\relax
      \global\ijgtp@allDigitsfalse
      \let\ijgtp@next\ijgtp@skipdigits
    \else
      \ifnum`#1>`9\relax
        \global\ijgtp@allDigitsfalse
        \let\ijgtp@next\ijgtp@skipdigits
      \else
        % Accumulate only while the next digit fits TeX's integer range.
        \@tempcntb=`#1\relax
        \advance\@tempcntb-`0\relax
        \ifnum\@tempcnta>214748364\relax
          \global\ijgtp@allDigitsfalse
        \else\ifnum\@tempcnta=214748364\relax
          \ifnum\@tempcntb>7\relax\global\ijgtp@allDigitsfalse\fi
        \fi\fi
        \ifijgtp@allDigits
          \multiply\@tempcnta by10
          \advance\@tempcnta\@tempcntb
          \let\ijgtp@next\ijgtp@checkdigits
        \else
          \let\ijgtp@next\ijgtp@skipdigits
        \fi
      \fi
    \fi
  \fi
  \ijgtp@next
}
\newcommand{\ijgtp@setdigitflag}[1]{%
  \begingroup
    \edef\ijgtp@tmpdigits{\detokenize{#1}}%
    \@tempcnta=0
    \ifx\ijgtp@tmpdigits\@empty
      \global\ijgtp@allDigitsfalse
    \else
      \global\ijgtp@allDigitstrue
      \edef\ijgtp@digittrim{\ijgtp@tmpdigits\space}%
      \edef\ijgtp@digitnospace{\expandafter\zap@space\ijgtp@digittrim\@empty}%
      \ifx\ijgtp@tmpdigits\ijgtp@digitnospace
        \expandafter\ijgtp@checkdigits\ijgtp@tmpdigits\relax
      \else
        \global\ijgtp@allDigitsfalse
      \fi
    \fi
    \xdef\ijgtp@parsednumber{\number\@tempcnta}%
  \endgroup
}
\newcommand{\ijgtp@setpublishedvalidated}[4]{%
  \global\ijgtp@validpublishedtrue
  \ijgtp@setdigitflag{#1}%
  \ifijgtp@allDigits
    \let\ijgtp@newpubyear\ijgtp@parsednumber
    \ifnum\ijgtp@parsednumber<2025\relax
      \global\ijgtp@validpublishedfalse
    \fi
  \else
    \global\ijgtp@validpublishedfalse
  \fi
  \ijgtp@setdigitflag{#2}%
  \ifijgtp@allDigits
    \let\ijgtp@newpubvolume\ijgtp@parsednumber
    \ifnum\ijgtp@parsednumber>0\relax\else\global\ijgtp@validpublishedfalse\fi
  \else
    \global\ijgtp@validpublishedfalse
  \fi
  \ijgtp@setdigitflag{#3}%
  \ifijgtp@allDigits
    \let\ijgtp@newpubissue\ijgtp@parsednumber
    \ifnum\ijgtp@parsednumber>0\relax\else\global\ijgtp@validpublishedfalse\fi
  \else
    \global\ijgtp@validpublishedfalse
  \fi
  \ijgtp@setdigitflag{#4}%
  \ifijgtp@allDigits
    \let\ijgtp@newpubnumber\ijgtp@parsednumber
    \ifnum\ijgtp@parsednumber>0\relax\else\global\ijgtp@validpublishedfalse\fi
  \else
    \global\ijgtp@validpublishedfalse
  \fi
  \ifijgtp@validpublished
    \global\ijgtp@haspublishedtrue
    \global\let\ijgtp@pubyear\ijgtp@newpubyear
    \global\let\ijgtp@pubvolume\ijgtp@newpubvolume
    \global\let\ijgtp@pubissue\ijgtp@newpubissue
    \global\let\ijgtp@pubnumber\ijgtp@newpubnumber
    \gdef\ijgtp@doi{%
      10.53941/ijgtp.\ijgtp@pubyear.\ijgtp@pubissue%
      \ifnum\ijgtp@pubnumber<10 0000\else%
        \ifnum\ijgtp@pubnumber<100 000\else%
          \ifnum\ijgtp@pubnumber<1000 00\else%
            \ifnum\ijgtp@pubnumber<10000 0\fi%
          \fi%
        \fi%
      \fi%
      \ijgtp@pubnumber%
    }
  \else
    \ijgtp@publishedwarning
  \fi
}

\newcommand{\ijgtppublished}[4]{%
  \ijgtp@setpublishedvalidated{#1}{#2}{#3}{#4}%
}

\newif\ifijgtp@arxiv
\newif\ifijgtp@validarxiv
\newcommand{\ijgtp@arxivnumber}{undefined}
\newcommand{\ijgtp@unarxiv}{%
  \global\ijgtp@arxivfalse
  \gdef\ijgtp@arxivnumber{undefined}%
}
\newcommand{\ijgtp@arxivwarning}{%
  \ClassWarning{ijgtp}{\string\arxivnumber\space is ignored. ArXiv number is wrong}%
%  \ijgtp@unarxiv%
}
\newcommand{\ijgtp@checkarxivpattern}[1]{%
  \ifnum\pdfmatch{^[0-9][0-9][0-9][0-9][.][0-9][0-9][0-9][0-9]$}{#1}=1\relax
    \global\ijgtp@validarxivtrue
  \else\ifnum\pdfmatch{^[0-9][0-9][0-9][0-9][.][0-9][0-9][0-9][0-9][0-9]$}{#1}=1\relax
    \global\ijgtp@validarxivtrue
  \else\ifnum\pdfmatch{^[0-9][0-9][0-9][0-9][.][0-9][0-9][0-9][0-9]v[0-9][0-9]*$}{#1}=1\relax
    \global\ijgtp@validarxivtrue
  \else\ifnum\pdfmatch{^[0-9][0-9][0-9][0-9][.][0-9][0-9][0-9][0-9][0-9]v[0-9][0-9]*$}{#1}=1\relax
    \global\ijgtp@validarxivtrue
  \else\ifnum\pdfmatch{^[A-Za-z-][A-Za-z-]*/[0-9][0-9][0-9][0-9][0-9][0-9][0-9]$}{#1}=1\relax
    \global\ijgtp@validarxivtrue
  \else\ifnum\pdfmatch{^[A-Za-z-][A-Za-z-]*/[0-9][0-9][0-9][0-9][0-9][0-9][0-9]v[0-9][0-9]*$}{#1}=1\relax
    \global\ijgtp@validarxivtrue
  \else\ifnum\pdfmatch{^[A-Za-z-][A-Za-z-]*[.][A-Za-z-][A-Za-z-]*/[0-9][0-9][0-9][0-9][0-9][0-9][0-9]$}{#1}=1\relax
    \global\ijgtp@validarxivtrue
  \else\ifnum\pdfmatch{^[A-Za-z-][A-Za-z-]*[.][A-Za-z-][A-Za-z-]*/[0-9][0-9][0-9][0-9][0-9][0-9][0-9]v[0-9][0-9]*$}{#1}=1\relax
    \global\ijgtp@validarxivtrue
  \fi\fi\fi\fi\fi\fi\fi\fi
}
% Keep the pdfTeX validator unchanged. Older XeTeX engines have no regex
% primitive; this ASCII scanner accepts the same modern/legacy syntax.
\@ifundefined{pdfmatch}{%
  \newif\ifijgtp@arxivletter
  \def\ijgtp@arxivversion{%
    \count@=6 \@tempcntb=0 }
  \def\ijgtp@arxivletterstep{%
    \ifnum\count@=0 \count@=3 \fi
    \ifnum\count@=3 \advance\@tempcntb\@ne
    \else\ifnum\count@=4 \advance\@tempcntb\@ne
    \else\ifnum\@tempcnta=`v
      \ifnum\count@=2
        \ifnum\@tempcntb=4 \ijgtp@arxivversion
        \else\ifnum\@tempcntb=5 \ijgtp@arxivversion
        \else\count@=7 \fi\fi
      \else\ifnum\count@=5
        \ifnum\@tempcntb=7 \ijgtp@arxivversion
        \else\count@=7 \fi
      \else\count@=7 \fi\fi
    \else\count@=7 \fi\fi\fi}
  \def\ijgtp@arxivdigitstep{%
    \ifnum\count@=0 \count@=1 \fi
    \ifnum\count@=3 \count@=7 \fi
    \ifnum\count@=4 \count@=7 \fi
    \advance\@tempcntb\@ne}
  \def\ijgtp@arxivseparatorstep{%
    \ifnum\@tempcnta=`.
      \ifnum\count@=1
        \ifnum\@tempcntb=4 \count@=2 \@tempcntb=0
        \else\count@=7 \fi
      \else\ifnum\count@=3
        \count@=4 \@tempcntb=0
      \else\count@=7 \fi\fi
    \else\ifnum\@tempcnta=`/
      \ifnum\count@=3 \count@=4 \fi
      \ifnum\count@=4
        \ifnum\@tempcntb>0 \count@=5 \@tempcntb=0
        \else\count@=7 \fi
      \else\count@=7 \fi
    \else\count@=7 \fi\fi}
  \renewcommand*{\ijgtp@checkarxivpattern}[1]{%
    \edef\ijgtp@scantext{#1}%
    \edef\ijgtp@scantrim{\ijgtp@scantext\space}%
    \edef\ijgtp@nospace{\expandafter\zap@space\ijgtp@scantrim\@empty}%
    \ifx\ijgtp@scantext\ijgtp@nospace
      % States: start, modern prefix, modern serial, archive, subject,
      % legacy serial, version, invalid. The second count is field length.
      \count@=0 \@tempcntb=0
      \expandafter\@tfor\expandafter\ijgtp@char\expandafter:\expandafter=\ijgtp@scantext\do{%
        \@tempcnta=\expandafter`\ijgtp@char\relax
        \ijgtp@arxivletterfalse
        \ifnum\@tempcnta>`@ \ifnum\@tempcnta<`[ \ijgtp@arxivlettertrue\fi\fi
        \ifnum\@tempcnta>96 \ifnum\@tempcnta<123 \ijgtp@arxivlettertrue\fi\fi
        \ifnum\@tempcnta=`- \ijgtp@arxivlettertrue\fi
        \ifijgtp@arxivletter
          \ijgtp@arxivletterstep
        \else
          \ifnum\@tempcnta<`0 \ijgtp@arxivseparatorstep
          \else\ifnum\@tempcnta>`9 \ijgtp@arxivseparatorstep
          \else\ijgtp@arxivdigitstep\fi\fi
        \fi}%
      \ifnum\count@=2
        \ifnum\@tempcntb=4 \global\ijgtp@validarxivtrue\fi
        \ifnum\@tempcntb=5 \global\ijgtp@validarxivtrue\fi
      \fi
      \ifnum\count@=5 \ifnum\@tempcntb=7 \global\ijgtp@validarxivtrue\fi\fi
      \ifnum\count@=6 \ifnum\@tempcntb>0 \global\ijgtp@validarxivtrue\fi\fi
    \fi}%
}{}
\newcommand{\ijgtp@setarxivvalidated}[1]{%
  \begingroup
    \edef\ijgtp@arxivcandidate{\detokenize{#1}}%
    \global\ijgtp@validarxivfalse
    \ifx\ijgtp@arxivcandidate\@empty
    \else
      \ijgtp@checkarxivpattern{\ijgtp@arxivcandidate}%
    \fi
  \endgroup
  \ifijgtp@validarxiv
    \global\ijgtp@arxivtrue
    \gdef\ijgtp@arxivnumber{#1}%
  \else
    \ijgtp@arxivwarning
  \fi
}
\newcommand{\arxivnumber}[1]{%
  \ijgtp@setarxivvalidated{#1}%
}

\newcommand{\ijgtp@hashaffiliation}[1]{%
  \edef\ijgtp@affhash{\pdfmdfivesum{#1}}%
}
% A linear lookup is sufficient for the small affiliation list when the
% engine has no MD5 primitive. Compare expanded strings, as pdfmdfivesum does.
\@ifundefined{pdfmdfivesum}{%
  \renewcommand{\ijgtp@hashaffiliation}[1]{%
    \edef\ijgtp@affcandidate{#1}%
    \edef\ijgtp@affcandidate{\expandafter\detokenize\expandafter{\ijgtp@affcandidate}}%
    \edef\ijgtp@affhash{fallback.\number\numexpr\value{ijgtpaffcount}+1\relax}%
    \@tempcnta=1
    \loop\ifnum\@tempcnta>\value{ijgtpaffcount}\else
      \expandafter\ifx\csname ijgtpaffcompare@\number\@tempcnta\endcsname\ijgtp@affcandidate
        \edef\ijgtp@affhash{fallback.\number\@tempcnta}%
      \fi
      \advance\@tempcnta\@ne
    \repeat
    \expandafter\global\expandafter\let\csname ijgtpaffcompare@\number\numexpr\value{ijgtpaffcount}+1\relax\endcsname\ijgtp@affcandidate
  }%
}{}
\newcommand{\ijgtp@getaffindex}[1]{%
  \ijgtp@hashaffiliation{#1}%
  \expandafter\ifx\csname ijgtpaffhash@\ijgtp@affhash\endcsname\relax
    \stepcounter{ijgtpaffcount}%
    \expandafter\gdef\csname ijgtpaffiliation@\arabic{ijgtpaffcount}\endcsname{#1}%
    \expandafter\xdef\csname ijgtpaffindexhash@\arabic{ijgtpaffcount}\endcsname{\ijgtp@affhash}%
    \expandafter\xdef\csname ijgtpaffhash@\ijgtp@affhash\endcsname{\arabic{ijgtpaffcount}}%
    \xdef\ijgtp@found{\arabic{ijgtpaffcount}}%
  \else
    \xdef\ijgtp@found{\csname ijgtpaffhash@\ijgtp@affhash\endcsname}%
  \fi
}

\newcommand{\ijgtp@appendaffindex}[2]{%
  \edef\ijgtp@existing{\csname ijgtpauthoraffidx@#1\endcsname}%
  \ifx\ijgtp@existing\@empty
    \expandafter\xdef\csname ijgtpauthoraffidx@#1\endcsname{#2}%
  \else
    \edef\ijgtp@affneedle{,#2,}%
    \edef\ijgtp@afftrim{\ijgtp@existing\space}%
    \edef\ijgtp@affhaystack{,\expandafter\zap@space\ijgtp@afftrim\@empty,}%
    \edef\ijgtp@afftest{\noexpand\in@{\ijgtp@affneedle}{\ijgtp@affhaystack}}%
    \ijgtp@afftest
    \ifin@\else
      \expandafter\xdef\csname ijgtpauthoraffidx@#1\endcsname{\ijgtp@existing, #2}%
    \fi
  \fi
}

\renewcommand{\author}[1]{%
  \stepcounter{ijgtpauthorcount}%
  \setcounter{ijgtpcurrentauthor}{\value{ijgtpauthorcount}}%
  \expandafter\gdef\csname ijgtpauthorname@\arabic{ijgtpauthorcount}\endcsname{#1}%
  \expandafter\gdef\csname ijgtpauthorsurname@\arabic{ijgtpcurrentauthor}\endcsname{}%
  \expandafter\gdef\csname ijgtpauthorinitials@\arabic{ijgtpcurrentauthor}\endcsname{}%
  \expandafter\gdef\csname ijgtpauthoraffidx@\arabic{ijgtpauthorcount}\endcsname{}%
  \expandafter\gdef\csname ijgtpauthoremail@\arabic{ijgtpauthorcount}\endcsname{}%
  \expandafter\gdef\csname ijgtpauthororcid@\arabic{ijgtpauthorcount}\endcsname{}%
  \expandafter\gdef\csname ijgtpauthorcorresponding@\arabic{ijgtpauthorcount}\endcsname{0}%
}

% Optional explicit name parts for the current author. They affect running
% heads and How To Cite, leaving the displayed full name untouched. Family
% names and suffixes cannot in general be inferred reliably from spaces.
\newcommand{\authorname}[2]{%
  \ifnum\value{ijgtpcurrentauthor}=0
    \ClassError{ijgtp}{\string\authorname\space used before \string\author}{Define an author before specifying surname and initials.}%
  \fi
  \expandafter\gdef\csname ijgtpauthorsurname@\arabic{ijgtpcurrentauthor}\endcsname{#1}%
  \expandafter\gdef\csname ijgtpauthorinitials@\arabic{ijgtpcurrentauthor}\endcsname{#2}%
}

\newcommand{\affiliation}[1]{%
  \ifnum\value{ijgtpcurrentauthor}=0
    \ClassError{ijgtp}{\string\affiliation\space used before \string\author}{Define an author before adding affiliations.}%
  \fi
  \ijgtp@getaffindex{#1}%
  \edef\ijgtp@currentfound{\ijgtp@found}%
  \ijgtp@appendaffindex{\arabic{ijgtpcurrentauthor}}{\ijgtp@currentfound}%
}

\newcommand{\email}[1]{%
  \ifnum\value{ijgtpcurrentauthor}=0
    \ClassError{ijgtp}{\string\email\space used before \string\author}{Define an author before adding email.}%
  \fi
  \expandafter\gdef\csname ijgtpauthoremail@\arabic{ijgtpcurrentauthor}\endcsname{#1}%
}

\newcommand{\orcid}[1]{%
  \ifnum\value{ijgtpcurrentauthor}=0
    \ClassError{ijgtp}{\string\orcid\space used before \string\author}{Define an author before adding ORCID.}%
  \fi
  \expandafter\gdef\csname ijgtpauthororcid@\arabic{ijgtpcurrentauthor}\endcsname{#1}%
}

\newcommand{\corresponding}{%
  \ifnum\value{ijgtpcurrentauthor}=0
    \ClassError{ijgtp}{\string\corresponding\space used before \string\author}{Define an author before marking corresponding author.}%
  \fi
  \expandafter\gdef\csname ijgtpauthorcorresponding@\arabic{ijgtpcurrentauthor}\endcsname{1}%
}

\newcommand{\ijgtp@clearauthorfields}[1]{%
  \ifnum#1>\value{ijgtpauthorcount}
  \else
    \expandafter\global\expandafter\let\csname ijgtpauthorname@#1\endcsname\relax
    \expandafter\global\expandafter\let\csname ijgtpauthorsurname@#1\endcsname\relax
    \expandafter\global\expandafter\let\csname ijgtpauthorinitials@#1\endcsname\relax
    \expandafter\global\expandafter\let\csname ijgtpauthoraffidx@#1\endcsname\relax
    \expandafter\global\expandafter\let\csname ijgtpauthoremail@#1\endcsname\relax
    \expandafter\global\expandafter\let\csname ijgtpauthororcid@#1\endcsname\relax
    \expandafter\global\expandafter\let\csname ijgtpauthorcorresponding@#1\endcsname\relax
    \expandafter\ijgtp@clearauthorfields\expandafter{\number\numexpr#1+1\relax}%
  \fi
}

\newcommand{\ijgtp@clearaffiliations}[1]{%
  \ifnum#1>\value{ijgtpaffcount}
  \else
    \edef\ijgtp@currentaffhash{\csname ijgtpaffindexhash@#1\endcsname}%
    \expandafter\global\expandafter\let\csname ijgtpaffhash@\ijgtp@currentaffhash\endcsname\relax
    \expandafter\global\expandafter\let\csname ijgtpaffiliation@#1\endcsname\relax
    \expandafter\global\expandafter\let\csname ijgtpaffindexhash@#1\endcsname\relax
    \expandafter\ijgtp@clearaffiliations\expandafter{\number\numexpr#1+1\relax}%
  \fi
}

\newcommand{\ijgtp@unauthorinfo}{%
  \ijgtp@clearauthorfields{1}%
  \ijgtp@clearaffiliations{1}%
  \setcounter{ijgtpauthorcount}{0}%
  \setcounter{ijgtpcurrentauthor}{0}%
  \setcounter{ijgtpaffcount}{0}%
  \setcounter{ijgtpcorrespondingcount}{0}%
  \setcounter{ijgtpcorremailcount}{0}%
  \setcounter{ijgtpcorremailprinted}{0}%
  \global\ijgtp@allcorrespondingfalse
}

\newif\ifijgtp@allcorresponding
\newcounter{ijgtpcorrespondingcount}
\newcounter{ijgtpcorremailcount}
\newcounter{ijgtpcorremailprinted}

\newcommand{\ijgtp@countcorresponding}[1]{%
  \ifnum#1>\value{ijgtpauthorcount}
  \else
    \edef\ijgtp@iscor{\csname ijgtpauthorcorresponding@#1\endcsname}%
    \ifnum\ijgtp@iscor=1\relax
      \stepcounter{ijgtpcorrespondingcount}%
    \fi
    \expandafter\ijgtp@countcorresponding\expandafter{\number\numexpr#1+1\relax}%
  \fi
}

\newcommand{\ijgtp@setallcorrespondingflag}{%
  \setcounter{ijgtpcorrespondingcount}{0}%
  \ijgtp@countcorresponding{1}%
  \ifnum\value{ijgtpcorrespondingcount}=\value{ijgtpauthorcount}
    \global\ijgtp@allcorrespondingtrue
  \else
    \global\ijgtp@allcorrespondingfalse
  \fi
}

% Normalize the usual escaped underscore as well as accepting literal underscores, so the visible address and mailto target use the same text.
\newcommand{\ijgtp@getemail}[1]{%
  \begingroup
    \def\_{\string_}%
    \protected@xdef\ijgtp@email{\csname ijgtpauthoremail@#1\endcsname}%
  \endgroup
  \expandafter\ifblank\expandafter{\ijgtp@email}{\global\let\ijgtp@email\@empty}{}%
}
\newcommand{\ijgtp@countcorremails}[1]{%
  \ifnum#1>\value{ijgtpauthorcount}
  \else
    \edef\ijgtp@iscor{\csname ijgtpauthorcorresponding@#1\endcsname}%
    \ifnum\ijgtp@iscor=1\relax
      \ijgtp@getemail{#1}%
      \ifx\ijgtp@email\@empty
      \else
        \stepcounter{ijgtpcorremailcount}%
      \fi
    \fi
    \expandafter\ijgtp@countcorremails\expandafter{\number\numexpr#1+1\relax}%
  \fi
}

\newcommand{\ijgtp@setcorremailcounts}{%
  \setcounter{ijgtpcorremailcount}{0}%
  \setcounter{ijgtpcorremailprinted}{0}%
  \ijgtp@countcorremails{1}%
}

\newcommand{\ijgtp@correspondingmark}[1]{%
  \ifijgtp@allcorresponding\else%
    \ifnum\csname ijgtpauthorcorresponding@#1\endcsname=1 %
      \expandafter\ifx\csname ijgtpauthoraffidx@#1\endcsname\@empty\else,\fi
      *%
    \fi%
  \fi%
}

% Author notes belong only to the displayed author line, not to running heads or the citation suggestion. Remove them before splitting the name.
\newcommand{\ijgtp@prepareauthorname}[1]{%
  \begingroup
    \let\thanks\@gobble
    \protected@xdef\ijgtp@plainauthorname{#1 }%
  \endgroup
}
\newcommand{\ijgtp@formatauthorforlist}[1]{%
  \def\ijgtp@lastname{}%
  \def\ijgtp@initials{}%
  \ijgtp@prepareauthorname{#1}%
  \expandafter\ijgtp@splitauthorforlist@aux\ijgtp@plainauthorname\ijgtp@nil
  \ijgtp@lastname%
  \ifx\ijgtp@initials\@empty\else,~\ijgtp@initials\fi%
}

\def\ijgtp@splitauthorforlist@aux#1 #2\ijgtp@nil{%
  \def\ijgtp@currenttoken{#1}%
  \def\ijgtp@remainingtokens{#2}%
  \ifx\ijgtp@currenttoken\@empty
    \ifx\ijgtp@remainingtokens\@empty
    \else
      \expandafter\ijgtp@splitauthorforlist@aux\ijgtp@remainingtokens\ijgtp@nil
    \fi
  \else
    \ifx\ijgtp@remainingtokens\@empty
      \expandafter\def\expandafter\ijgtp@lastname\expandafter{\ijgtp@currenttoken}%
    \else
      \expandafter\ijgtp@appendinitial\ijgtp@currenttoken\ijgtp@nil
      \expandafter\ijgtp@splitauthorforlist@aux\ijgtp@remainingtokens\ijgtp@nil
    \fi
  \fi
}

\def\ijgtp@appendinitial#1#2\ijgtp@nil{%
  \protected@edef\ijgtp@initials{\ijgtp@initials#1.}%
}

\newcommand{\ijgtp@setauthorlastname}[1]{%
  \def\ijgtp@lastname{}%
  \ijgtp@prepareauthorname{#1}%
  \expandafter\ijgtp@splitauthorlastname@aux\ijgtp@plainauthorname\ijgtp@nil
}
\newcommand{\ijgtp@getauthorlastname}[1]{%
  \ijgtp@setauthorlastname{#1}%
  \ijgtp@lastname%
}

\def\ijgtp@splitauthorlastname@aux#1 #2\ijgtp@nil{%
  \def\ijgtp@currenttoken{#1}%
  \def\ijgtp@remainingtokens{#2}%
  \ifx\ijgtp@currenttoken\@empty
    \ifx\ijgtp@remainingtokens\@empty
    \else
      \expandafter\ijgtp@splitauthorlastname@aux\ijgtp@remainingtokens\ijgtp@nil
    \fi
  \else
    \ifx\ijgtp@remainingtokens\@empty
      \expandafter\def\expandafter\ijgtp@lastname\expandafter{\ijgtp@currenttoken}%
    \else
      \expandafter\ijgtp@splitauthorlastname@aux\ijgtp@remainingtokens\ijgtp@nil
    \fi
  \fi
}

\newcommand{\ijgtp@formatauthorbyindex}[1]{%
  \expandafter\ifx\csname ijgtpauthorsurname@#1\endcsname\@empty
    \expandafter\ijgtp@formatauthorforlist\expandafter{\csname ijgtpauthorname@#1\endcsname}%
  \else
    \csname ijgtpauthorsurname@#1\endcsname%
    \expandafter\ifx\csname ijgtpauthorinitials@#1\endcsname\@empty\else
      ,~\csname ijgtpauthorinitials@#1\endcsname%
    \fi
  \fi
}
\newcommand{\ijgtp@setlastnamebyindex}[1]{%
  \expandafter\ifx\csname ijgtpauthorsurname@#1\endcsname\@empty
    \expandafter\ijgtp@setauthorlastname\expandafter{\csname ijgtpauthorname@#1\endcsname}%
  \else
    \protected@edef\ijgtp@lastname{\csname ijgtpauthorsurname@#1\endcsname}%
  \fi
}
\newcommand{\ijgtp@printlistofauthorsloop}[1]{%
  \ifnum#1>\value{ijgtpauthorcount}%
  \else%
    \ijgtp@formatauthorbyindex{#1}%
    \ifnum#1<\value{ijgtpauthorcount};\space\fi%
    \expandafter\ijgtp@printlistofauthorsloop\expandafter{\number\numexpr#1+1\relax}%
  \fi%
}
\newcommand{\ijgtp@printlistofauthors}{%
  \ifnum\value{ijgtpauthorcount}>3\relax
    \ijgtp@formatauthorbyindex{1}\space et~al.%
  \else
    \ijgtp@printlistofauthorsloop{1}%
  \fi
}

\newcommand{\ijgtp@lastnamesstring}{}
\newcommand{\ijgtp@setlastnamesstring}{%
  \ifnum\value{ijgtpauthorcount}=0\relax
    \gdef\ijgtp@lastnamesstring{}%
  \else\ifnum\value{ijgtpauthorcount}=1\relax
    \ijgtp@setlastnamebyindex{1}%
    \protected@xdef\ijgtp@lastnamesstring{\ijgtp@lastname}%
  \else\ifnum\value{ijgtpauthorcount}=2\relax
    \ijgtp@setlastnamebyindex{1}%
    \protected@edef\ijgtp@lastnamea{\ijgtp@lastname}%
    \ijgtp@setlastnamebyindex{2}%
    \protected@edef\ijgtp@lastnameb{\ijgtp@lastname}%
    \protected@xdef\ijgtp@lastnamesstring{\ijgtp@lastnamea\space and\space\ijgtp@lastnameb}%
  \else
    \ijgtp@setlastnamebyindex{1}%
    \protected@xdef\ijgtp@lastnamesstring{\ijgtp@lastname\space et~al.}%
  \fi\fi\fi
}

\newcommand{\ijgtp@printauthors}[1]{%
  \ifnum#1>\value{ijgtpauthorcount}%
  \else%
    \edef\ijgtp@orcid{\csname ijgtpauthororcid@#1\endcsname}%
    \edef\ijgtp@authorsup{\csname ijgtpauthoraffidx@#1\endcsname\ijgtp@correspondingmark{#1}}%
    \csname ijgtpauthorname@#1\endcsname%
    \ifnum\value{ijgtpauthorcount}>1\relax
      \ifx\ijgtp@authorsup\@empty%
      \else%
        \space\textsuperscript{\ijgtp@authorsup}%
      \fi%
    \fi%
    \ifx\ijgtp@orcid\@empty%
    \else%
      \space\href{https://orcid.org/\ijgtp@orcid}{\includegraphics[width=8pt]{orcid}}%
    \fi%
    \ifnum#1<\value{ijgtpauthorcount}%
      \ifnum\numexpr#1+1\relax=\value{ijgtpauthorcount}%
         \space and\space%
      \else%
      ,\space%
      \fi%
    \fi%
    \expandafter\ijgtp@printauthors\expandafter{\number\numexpr#1+1\relax}%
  \fi%
}

\newcommand{\ijgtp@printaffiliations}[1]{%
  \ifnum#1>\value{ijgtpaffcount}
  \else
    \ifnum\value{ijgtpauthorcount}>1\relax%
      \noindent\textsuperscript{#1}\space%
    \fi
    \csname ijgtpaffiliation@#1\endcsname\par
    \expandafter\ijgtp@printaffiliations\expandafter{\number\numexpr#1+1\relax}%
  \fi
}

\newcommand{\ijgtp@printcorremails}[1]{%
  \ifnum#1>\value{ijgtpauthorcount}
  \else
    \edef\ijgtp@iscor{\csname ijgtpauthorcorresponding@#1\endcsname}%
    \ifnum\ijgtp@iscor=1\relax
      \ijgtp@getemail{#1}%
      \ifx\ijgtp@email\@empty
      \else
        \stepcounter{ijgtpcorremailprinted}%
        %\csname ijgtpauthorname@#1\endcsname:
        \href{mailto:\ijgtp@email}{%
          \urlstyle{same}\expandafter\nolinkurl\expandafter{\ijgtp@email}}%
        \ifnum\value{ijgtpcorremailprinted}<\value{ijgtpcorremailcount},\space\fi
      \fi
    \fi
    \expandafter\ijgtp@printcorremails\expandafter{\number\numexpr#1+1\relax}%
  \fi
}

% Keep the compact title unchanged; use breakable paragraphs for an
% oversized title. Trial typesetting is local and cannot write aux records.
\newif\ifijgtp@longtitle
\newif\ifijgtp@titlewascolumns
\newbox\ijgtp@titletrial
\newbox\ijgtp@datesbox
\long\def\ijgtp@discardwrite#1#{\@gobble}
\newcommand*{\ijgtp@measuretitle}{%
  \ijgtp@longtitlefalse
  \begingroup
  \let\ijgtp@savedthanks\@thanks
  \def\ijgtp@restorecounts{}%
  \def\@elt##1{%
    \edef\ijgtp@restorecounts{\ijgtp@restorecounts
      \global\csname c@##1\endcsname=\number\csname c@##1\endcsname\relax}}%
  \cl@@ckpt
  \setbox\ijgtp@titletrial=\vbox{%
    % Resolve citations in the upcoming unit without starting it or opening
    % its output stream. The real title starts the unit exactly once.
    \ifx\@startbibunitorrelax\relax\else
      \advance\@bibunitauxcnt by1
      \InputIfFileExists{\@bibunitname.aux}{}{}%
    \fi
    \let\@startbibunitorrelax\relax
    \@fileswfalse
    \let\write\ijgtp@discardwrite
    \let\immediate\relax
    \let\label\@gobble
    \hsize=\textwidth \linewidth=\textwidth \columnwidth=\textwidth
    \ijgtp@maketitleblock
    \par\@thanks
  }%
  \ijgtp@restorecounts
  \global\let\@thanks\ijgtp@savedthanks
  \global\ijgtp@longtitlefalse
  % Reserve the usual gap and at least one line of body text.
  \@tempdima=\dimexpr\ht\ijgtp@titletrial+\dp\ijgtp@titletrial+\dbltextfloatsep+2\baselineskip\relax
  \ifdim\@tempdima>\textheight \global\ijgtp@longtitletrue\fi
  \endgroup
}
\newcommand{\ijgtp@dates}{%
    \small
    \ifx\ijgtp@receivedtext\@empty
    \else
      {\footnotesize Received: \ijgtp@receivedtext}\\
    \fi
    \ifx\ijgtp@revisedtext\@empty
    \else
      {\footnotesize Revised: \ijgtp@revisedtext}\\
    \fi
    \ifx\ijgtp@acceptedtext\@empty
    \else
      {\footnotesize Accepted: \ijgtp@acceptedtext}\\
    \fi
    \ifx\ijgtp@publishedtext\@empty
    \else
      {\footnotesize Published: \ijgtp@publishedtext}\\
    \fi
    \mbox{} %empty paragraph is still 10.5 em wide
}
\newcommand{\ijgtp@metadata}{%
    \let\ijgtp@metadatasep\@empty
    \ifijgtp@hasabstract
      \textbf{Abstract:} \ijgtp@abstracttext
      \def\ijgtp@metadatasep{\par\addvspace{\bigskipamount}}%
    \fi
    \ifx\ijgtp@keywordstext\@empty
    \else
      \ijgtp@metadatasep\noindent\textbf{Keywords:} \ijgtp@keywordstext
      \def\ijgtp@metadatasep{\par\addvspace{\bigskipamount}}%
    \fi
    \ifx\ijgtp@pacstext\@empty
    \else
      \ijgtp@metadatasep\noindent\textbf{PACS:} \ijgtp@pacstext
    \fi
}
\newcommand*{\ijgtp@flowmetadata}{%
  \begingroup
    \setbox\ijgtp@datesbox=\vtop{\hsize=10.5em \parindent=0pt \ijgtp@dates}%
    % Match the compact metadata box on every page, while keeping its
    % paragraphs breakable. A list also gives nested environments the
    % correct linewidth and preserves the offset across page breaks.
    \list{}{%
      \leftmargin=11em \rightmargin=0pt
      \labelwidth=0pt \labelsep=0pt
      \itemindent=0pt \listparindent=0pt
      \topsep=0pt \partopsep=0pt \parsep=0pt \itemsep=0pt}%
    \item[]\relax
    \noindent\smash{\llap{\hbox to0pt{\hskip-10.5em\box\ijgtp@datesbox\hss}}}%
    \ijgtp@metadata\par
    \endlist
  \endgroup
}

% Shared title material for one- and two-column papers.
\newcommand{\ijgtp@maketitleblock}{%
  \centerline{
  \parbox[c]{3.0cm}{\centering\includegraphics[scale=0.035]{header}}%
  \colorbox{graycolor}{\parbox[c]{10.5cm}{
    \centering\bigskip
    \textit{International Journal of Gravitation and Theoretical Physics}\\[-1pt]
    \href{https://www.sciltp.com/journals/ijgtp}{https://www.sciltp.com/journals/ijgtp}\\\bigskip
  }}%
  \parbox[c]{2.6cm}{\centering\includegraphics[scale=0.047]{F1}}%
  }%
  \medskip

  \phantomsection
  % Paper titles belong to the document-wide contents, not to a paper's
  % own contents. The following entries belong to this paper until the
  % next maketitle. The number is frozen by addtocontents when written.
  \addtocontents{toc}{\protect\ijgtp@tocpaper{0}}%
  \addcontentsline{toc}{section}{\Large\@title}
  \addtocontents{toc}{\protect\ijgtp@tocpaper{\arabic{ijgtpmaketitlecount}}}%

  \noindent\rule[0.15\baselineskip]{\textwidth}{0.5pt}
  \vspace{0.5em}
  {\noindent \textit{\ijgtp@papertypetext}}
  \vspace{0.5em} \\
  {\fontsize{18pt}{10pt} \textbf{\@title} }
  \vspace{16pt} \\
  {\large
    % As in hyperref's standard maketitle, deferred title notes use unlinked marks; their footnotetext is emitted below with a number.
    \@ifundefined{H@@footnotemark}{}{\let\@footnotemark\H@@footnotemark}%
    \ijgtp@printauthors{1} }
  \vspace{6pt}
  \begin{spacing}{0.9}
  {\setlength{\emergencystretch}{3em}
    \noindent\small\ijgtp@printaffiliations{1}
    \ifnum\value{ijgtpcorremailcount}>0\relax
      \noindent\ifijgtp@allcorresponding\else{*}\fi%
      \space\parbox[t]{0.98\linewidth}{Correspondence: \ijgtp@printcorremails{1}}%
      \vspace{6pt}
    \fi%
    \ifijgtp@haspublished
      \par\noindent\footnotesize\textbf{How To Cite}: \ijgtp@printlistofauthors\space\@title.%
      \newline\emph{International Journal of Gravitation and Theoretical Physics} \textbf{\ijgtp@pubyear}, \emph{\ijgtp@pubvolume}(\ijgtp@pubissue), \ijgtp@pubnumber. \href{https://doi.org/\ijgtp@doi}{https://doi.org/\ijgtp@doi}%
      \ifijgtp@arxiv\space\href{https://arxiv.org/abs/\ijgtp@arxivnumber}{[arXiv:\ijgtp@arxivnumber]}\fi
    \else\ifijgtp@arxiv
      \par\noindent\footnotesize\textbf{How To Cite}: \ijgtp@printlistofauthors\space\@title.%
      \space\href{https://arxiv.org/abs/\ijgtp@arxivnumber}{arXiv:\ijgtp@arxivnumber}
    \fi\fi
  }
  \end{spacing}\vspace{1em}
  \ifijgtp@longtitle
    \par\@thanks
    \global\let\@thanks\@empty
  \fi
  \noindent\rule[0.15\baselineskip]{\textwidth}{0.5pt}
  \ifijgtp@longtitle
    \par\nobreak
    \ijgtp@flowmetadata
    \par\addvspace{0.5em}%
  \else
    \parbox[t]{0.5em}{~}%
    \parbox[t]{10.5em}{\ijgtp@dates}%
    \parbox[t]{\dimexpr\columnwidth-11em\relax}{\ijgtp@metadata}%
    \vspace{0.5em}\\
  \fi
  \noindent\rule[0.15\baselineskip]{\textwidth}{0.5pt}

  \par
}

\newcommand*{\ijgtp@copyrightyear}{\number\year}
\renewcommand{\maketitle}{%
  \normalsize

  \fancypagestyle{firstpage}{
    \setlength{\headsep}{0pt}
    \setlength{\footskip}{0.82cm}
    \fancyhf{}% clear default for head and foot
    \renewcommand{\headrule}{}
    \renewcommand{\footrule}{}
    \fancyfoot[C]{
      \parbox[c]{0.15\textwidth}{\includegraphics[scale=0.67]{cc-by}}%
      \parbox[c]{0.85\textwidth}{\scriptsize \textbf{Copyright:} \textcopyright{} \ijgtp@copyrightyear\space by the authors. This is an open access article under the terms and conditions of the Creative Commons Attribution (\mbox{CC BY}) license (\href{https://creativecommons.org/licenses/by/4.0/}{https://creativecommons.org/licenses/by/4.0/}). \\ \textbf{Publisher\textquoteright s Note:} Scilight stays neutral with regard to jurisdictional claims in published maps and institutional affiliations.}
    }
  }
  \ijgtp@startpapergeometry
  \ifijgtp@haspublished
    \global\let\ijgtp@copyrightyear\ijgtp@pubyear
  \else
    \xdef\ijgtp@copyrightyear{\number\year}%
  \fi
  % Close any remaining citations with the old paper's style before resetting.
  \endbibunit
  \gdef\ijgtp@paperbibstyle{scilight}%
  \ijgtp@startbibunit
  % Ship the preceding paper before changing its numbering or anchor state.
  \ifijgtp@inappendix
    \global\let\thesection\ijgtp@mainthesection
    \global\let\theHsection\ijgtp@maintheHsection
    \global\let\Hy@chapapp\ijgtp@mainchapapp
    \global\ijgtp@inappendixfalse
  \fi
  \stepcounter{ijgtpmaketitlecount} % number of papers in the document
  % lineno stores the next printed line number, and its pagewise counter
  % is a document-wide ID. Reset only its running-number sequence to one.
  \resetlinenumber
  \ijgtp@labelkeys % activate this paper's label aliases
  \thispagestyle{firstpage}
  \ifLineNumbers
    \let\ijgtp@restorelinenumbers\linenumbers
  \else
    \let\ijgtp@restorelinenumbers\relax
  \fi
  \nolinenumbers
  \ijgtp@setallcorrespondingflag
  \ijgtp@setcorremailcounts
  \ijgtp@setlastnamesstring

  \lhead{\noindent\footnotesize{\ijgtp@lastnamesstring}}

  \chead{}
  \ifijgtp@haspublished
      % Freeze this paper's metadata after newgeometry has shipped the preceding paper. Setters can then safely prepare the next paper.
      \let\ijgtp@runningpubyear\ijgtp@pubyear
      \let\ijgtp@runningpubvolume\ijgtp@pubvolume
      \let\ijgtp@runningpubissue\ijgtp@pubissue
      \let\ijgtp@runningpubnumber\ijgtp@pubnumber
      \edef\ijgtp@runningdoi{\ijgtp@doi}%
      \rhead{\footnotesize{\emph{Int. J. Gravit. Theor. Phys.} \textbf{\ijgtp@runningpubyear}, \emph{\ijgtp@runningpubvolume}(\ijgtp@runningpubissue), \ijgtp@runningpubnumber}}
      \lfoot{\footnotesize{\href{https://doi.org/\ijgtp@runningdoi}{https://doi.org/\ijgtp@runningdoi}}}
  \else
      \rhead{\footnotesize{Prepared for publication in \emph{Int. J. Gravit. Theor. Phys.}}}
      \lfoot{}
  \fi

  \ijgtp@measuretitle
  \ijgtp@titlewascolumnsfalse
  \ifijgtp@longtitle
    \if@twocolumn
      \ijgtp@titlewascolumnstrue
      \onecolumn
    \fi
    \ijgtp@maketitleblock
  \else
  \if@twocolumn
    % Use the standard full-width top block; the body and floats retain LaTeX's normal two-column output routine.
    \twocolumn[{%
      \begingroup
        \columnwidth\textwidth
        \ijgtp@maketitleblock
      \endgroup
    }]%
  \else
    \ijgtp@maketitleblock
  \fi

  \fi

  \par\@thanks
  \global\let\@thanks\@empty
  \ifijgtp@titlewascolumns\twocolumn\fi

  \papertype{Article} % default paper
  \pacs{} %reset pacs numbers
  \keywords{} %reset keywords
  \receiveddate{} %reset received date
  \reviseddate{} %reset revised date
  \accepteddate{} %reset accepted date
  \publisheddate{} %reset published date
  \ijgtp@setabstract{} %reset abstract for the next paper
  \ijgtp@unpublished %reset journal information
  \ijgtp@unarxiv %reset arXiv information
  \ijgtp@unauthorinfo %reset author information
  \suppressfloats % keep floating figures and tables off the title page
  \ijgtp@restorelinenumbers
}

\lfoot{}
\cfoot{}
\rfoot{\footnotesize\thepage~\hspace{1pt}~of~\hspace{1pt}~\pageref*{LastPage}}

% Register content counters after all class packages have been loaded.
% Page numbers, layout limits, metadata counts and PDF bookkeeping stay
% document-wide. New user/theorem counters are registered automatically.
\@for\ijgtp@counter:=part,section,subsection,subsubsection,paragraph,subparagraph,equation,figure,table,footnote,mpfootnote,enumi,enumii,enumiii,enumiv,parentequation,ContinuedFloat\do{%
  \@ifundefined{c@\ijgtp@counter}{}{%
    \expandafter\ijgtpresetwithpaper\expandafter{\ijgtp@counter}}%
}
\let\ijgtp@originaldefinecounter\@definecounter
\def\@definecounter#1{%
  \ijgtp@originaldefinecounter{#1}%
  \in@{@}{#1}% package-private counters are not article content
  \ifin@\else
    \ijgtpresetwithpaper{#1}%
  \fi
}
