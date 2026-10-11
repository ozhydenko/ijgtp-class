\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ijgtp}[2026/10/11 IJGTP]

\GenericInfo{}{\space
 Copyright (c) 2026 Alexander Zhidenko. Prepared with assistance from OpenAI Codex CLI.^^J
 Licensed under the CC BY: https://creativecommons.org/licenses/by/4.0/^^J
 Adapted REVTeX page-grid code is under LPPL 1.3 or later; see source.^^J
 International Journal of Gravitation and Theoretical Physics%
 \@gobble
}%

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

\LoadClass[10pt]{article}

% BEGIN REVTeX 4.1r page-grid implementation (2010/07/25).
% Copied/adapted from revtex4-1.cls, ltxutil/ltxgrid portions.
% Copyright (C) 1999, 2009 Arthur Ogawa and (C) 2009 APS.
% Portions licensed from W. E. Baxter. This block is under LPPL 1.3 or later.
% https://www.latex-project.org/lppl.txt
% IJGTP adapters below use grid state for titles/contents and provide the
% public onecolumn, twocolumn and widetext interfaces. No REVTeX package
% is loaded. See THIRD-PARTY-NOTICES.md for source and adaptation details.

\newif\ifijgtp@initialtwocolumn
\if@twocolumn\ijgtp@initialtwocolumntrue\fi
\def\class@name{ijgtp}
\def\class@err#1{\ClassError{ijgtp}{#1}\@eha}
\def\class@warn#1{\ClassWarningNoLine{ijgtp}{#1}}
\def\class@info#1{\ClassInfo{ijgtp}{#1}}
\let\document@inithook\@empty
\let\class@documenthook\@empty
\mathchardef\@twopowerfourteen="4000
\def\t@{to}%
\dimendef\dimen@iii\thr@@
\def\halignt@{\halign\t@}%
\chardef\f@ur=4\relax
\chardef\cat@letter=11\relax
\chardef\other=12\relax
\def\let@environment#1#2{%
 \expandafter\let
 \csname#1\expandafter\endcsname\csname#2\endcsname
 \expandafter\let
 \csname end#1\expandafter\endcsname\csname end#2\endcsname
}%
\def\glet@environment#1#2{%
 \global\expandafter\let
 \csname#1\expandafter\endcsname\csname#2\endcsname
 \global\expandafter\let
 \csname end#1\expandafter\endcsname\csname end#2\endcsname
}%
\newcommand\tracingplain{%
 \tracingonline\z@\tracingcommands\z@\tracingstats\z@
 \tracingpages\z@\tracingoutput\z@\tracinglostchars\@ne
 \tracingmacros\z@\tracingparagraphs\z@\tracingrestores\z@
 \showboxbreadth5\showboxdepth3\relax %\errorstopmode
 }%
\newcommand\traceoutput{%
 \appdef\@resetactivechars{\showoutput}%
}%
\newcommand\say[1]{\typeout{<\noexpand#1=\meaning#1>}}%
\newcommand\saythe[1]{\typeout{<\noexpand#1=\the#1>}}%
\def\fullinterlineskip{\prevdepth\z@}%
\countdef\count@i\@ne
\countdef\count@ii\tw@
\long\def\prepdef#1#2{%
 \@ifxundefined#1{\toks@{}}{\toks@\expandafter{#1}}%
 \toks@ii{#2}%
 \edef#1{\the\toks@ii\the\toks@}%
}%
\long\def\appdef#1#2{%
 \@ifxundefined#1{\toks@{}}{\toks@\expandafter{#1}}%
 \toks@ii{#2}%
 \edef#1{\the\toks@\the\toks@ii}%
}%
\long\def\gappdef#1#2{%
 \@ifxundefined#1{\toks@{}}{\toks@\expandafter{#1}}%
 \toks@ii{#2}%
 \global\edef#1{\the\toks@\the\toks@ii}%
}%
\long\def\appdef@val#1#2{%
 \appdef#1{{#2}}%
}%
\long\def\appdef@e#1#2{%
 \expandafter\appdef
 \expandafter#1%
 \expandafter{#2}%
}%
\long\def\appdef@eval#1#2{%
 \expandafter\appdef@val
 \expandafter#1%
 \expandafter{#2}%
}%
\toksdef\toks@ii=\tw@
\long\def\@ifxundefined#1{\@ifx{\undefined#1}}%
\long\def\@ifnotrelax#1#2#3{\@ifx{\relax#1}{#3}{#2}}%
\long\def\@argswap#1#2{#2#1}%
\long\def\@argswap@val#1#2{#2{#1}}%
\def\@ifxundefined@cs#1{\expandafter\@ifx\expandafter{\csname#1\endcsname\relax}}%
\def\@boolean#1#2{%
  \long\def#1{%
    #2% \if<something>
      \expandafter\true@sw
    \else
      \expandafter\false@sw
    \fi
  }%
}%
\def\@boole@def#1#{\@boolean{#1}}% Implicit #2
\def\@booleantrue#1{\let#1\true@sw}%
\def\@booleanfalse#1{\let#1\false@sw}%
\@boole@def\@ifx#1{\ifx#1}%
\@boole@def\@ifx@empty#1{\ifx\@empty#1}%
\@boole@def\@if@empty#1{\if!#1!}%
\def\@if@sw#1#2{#1\expandafter\true@sw\else\expandafter\false@sw#2}%
\@boole@def\@ifdim#1{\ifdim#1}%
\@boole@def\@ifeof#1{\ifeof#1}%
\@boole@def\@ifhbox#1{\ifhbox#1}%
\@boole@def\@ifhmode{\ifhmode}%
\@boole@def\@ifinner{\ifinner}%
\@boole@def\@ifmmode{\ifmmode}%
\@boole@def\@ifnum#1{\ifnum#1}%
\@boole@def\@ifodd#1{\ifodd#1}%
\@boole@def\@ifvbox#1{\ifvbox#1}%
\@boole@def\@ifvmode{\ifvmode}%
\@boole@def\@ifvoid#1{\ifvoid#1}%
\long\def\true@sw#1#2{#1}%
\long\def\false@sw#1#2{#2}%
\long\def\loopuntil#1{#1{}{\loopuntil{#1}}}%
\long\def\loopwhile#1{#1{\loopwhile{#1}}{}}%
\def\@provide#1{%
 \@ifx{\undefined#1}{\true@sw}{\@ifx{\relax#1}{\true@sw}{\false@sw}}%
 {\def#1}{\def\j@nk}%
}%
\let\@@mark\mark
\let\@@topmark\topmark
\let\@@firstmark\firstmark
\let\@@botmark\botmark
\let\@@splitfirstmark\splitfirstmark
\let\@@splitbotmark\splitbotmark
\def\@themark{{}{}{}{}}%
\def\nul@mark{{}{}{}{}\@@nul}%
\def\set@mark@netw@#1#2#3#4#5#6#7{\gdef#1{{#6}{#7}{#4}{#5}}\do@mark}%
\def\set@marktw@#1#2#3#4#5#6{\gdef#1{{#2}{#6}{#4}{#5}}\do@mark}%
\def\set@markthr@@#1#2#3#4#5#6{\gdef#1{{#2}{#3}{#6}{#5}}\do@mark}%
\def\get@mark@@ne#1#2#3#4#5\@@nul{#1}%
\def\get@mark@tw@#1#2#3#4#5\@@nul{#2}%
\def\get@mark@thr@@#1#2#3#4#5\@@nul{#3}%
\def\get@mark@f@ur#1#2#3#4#5\@@nul{#4}%
\def\mark@netw@{\expandafter\set@mark@netw@\expandafter\@themark\@themark}%
\def\marktw@{\expandafter\set@marktw@\expandafter\@themark\@themark}%
\def\markthr@@{\expandafter\set@markthr@@\expandafter\@themark\@themark}%
\def\do@mark{\do@@mark\@themark\nobreak@mark}%
\def\do@@mark#1{%
 \begingroup
  \let@mark
  \@@mark{#1}%
 \endgroup
}%
\def\let@mark{%
 \let\protect\@unexpandable@protect
 \let\label\relax
 \let\index\relax
 \let\glossary\relax
}%
\def\nobreak@mark{%
 \@if@sw\if@nobreak\fi{\@ifvmode{\nobreak}{}}{}%
}%
\def\mark@envir{\markthr@@}%
\def\bot@envir{%
 \expandafter\expandafter
 \expandafter\get@mark@thr@@
 \expandafter\@@botmark
             \nul@mark
}%
\def\markboth{\mark@netw@}%
\def\markright{\marktw@}%
\def\leftmark{%
 \expandafter\expandafter
 \expandafter\get@mark@@ne
 \expandafter\saved@@botmark
             \nul@mark
}%
\def\rightmark{%
 \expandafter\expandafter
 \expandafter\get@mark@tw@
 \expandafter\saved@@firstmark
             \nul@mark
}%
\let\primitive@output\output
\long\def\@tempa#1\@@nil{#1}%
            \toks@
\expandafter\expandafter
\expandafter{%
\expandafter \@tempa
             \the\primitive@output
             \@@nil
             }%
\newtoks\output@latex
\output@latex\expandafter{\the\toks@}%
\let\output\output@latex
\primitive@output{\dispatch@output}%
\def\dispatch@output{%
 \let\par\@@par
 \expandafter\let\expandafter\output@procedure\csname output@\the\outputpenalty\endcsname
 \@ifnotrelax\output@procedure{}{%
  \expandafter\def\expandafter\output@procedure\expandafter{\the\output@latex}%
 }%
 \expandafter\@ifx\expandafter{\csname output@-\the\execute@message@pen\endcsname\output@procedure}{%
  \let\output@procedure\@message@saved
 }{}%
 \ltxgrid@info@sw{\class@info{\string\dispatch@output}\say\output@procedure\saythe\holdinginserts}{}%
 \outputdebug@sw{\output@debug}{}%
 \output@procedure
}%
\def\set@output@procedure#1#2{%
 \count@\outputpenalty\advance\count@-#2%
 \expandafter\let\expandafter#1\csname output@\the\count@\endcsname
}%
\def\output@debug{%
 \def\@tempa{\save@message}%
 \@ifx{\output@procedure\@tempa}{%
  \true@sw
 }{%
  \@ifnum{\outputpenalty=-\save@column@insert@pen}{%
   \@ifnum{\holdinginserts>\z@}%
  }{%
   \false@sw
  }%
 }%
 {}{\output@debug@}%
}%
\def\output@debug@{%
  \saythe\outputpenalty
  \saythe\interlinepenalty
  \saythe\brokenpenalty
  \saythe\clubpenalty
  \saythe\widowpenalty
  \saythe\displaywidowpenalty
  \saythe\predisplaypenalty
  \saythe\interdisplaylinepenalty
  \saythe\postdisplaypenalty
  \saythe\badness
  \say\thepagegrid
  \saythe\pagegrid@col
  \saythe\pagegrid@cur
  \saythe\insertpenalties
  \say\@@botmark
  \saythe\pagegoal
  \saythe\pagetotal
  \saythe{\badness\@cclv}%
  \say\@toplist
  \say\@botlist
  \say\@dbltoplist
  \say\@deferlist
  \trace@scroll{%
  \showbox\@cclv
  \showbox\@cclv@saved
  \showbox\pagesofar
  \showbox\csname col@1\endcsname
  \showbox\footsofar
  \showbox\footins
  \showbox\footins@saved
  \showlists
  }%
}%
\@ifxundefined{\outputdebug@sw}{%
 \@booleanfalse\outputdebug@sw
}{}%
\def\trace@scroll#1{\begingroup\showboxbreadth\maxdimen\showboxdepth\maxdimen\scrollmode#1\endgroup}%
\def\trace@box#1{\trace@scroll{\showbox#1}}%
\prepdef\@outputpage{\@outputpage@head}%
\let\@outputpage@head\@empty
\appdef\@outputpage{\@outputpage@tail}%
\let\@outputpage@tail\@empty
\def\show@box@size#1#2{%
 \show@box@size@sw{%
  \begingroup
   \setbox\z@\vbox{\unvcopy#2\hrule}%
   \class@info{Show box size: #1^^J%
    (\the\ht\z@\space X \the\wd\z@)
    \the\c@page\space\space\the\pagegrid@cur\space\the\pagegrid@col
   }%
  \endgroup
 }{}%
}%
\def\show@text@box@size{%
 \show@box@size{Text column}\@outputbox
 \tally@box@size@sw{%
  \@ifdim{\wd\@outputbox>\z@}{%
   \dimen@\ht\@outputbox\divide\dimen@\@twopowerfourteen
   \advance\dimen@-\dp\csname box@size@\the\pagegrid@col\endcsname
   \@ifdim{\dimen@>\z@}{%
    \advance\dimen@ \ht\csname box@size@\the\pagegrid@col\endcsname
    \global\ht\csname box@size@\the\pagegrid@col\endcsname\dimen@
    \show@box@size@sw{%
     \class@info{Column: \the\dimen@}%
    }{}%
   }{}%
  }{}%
  \global\dp\csname box@size@\the\pagegrid@col\endcsname\z@
 }{}%
}%
\def\show@pagesofar@size{%
 \show@box@size{Page so far}\pagesofar
 \dimen@\ht\pagesofar\divide\dimen@\@twopowerfourteen
 \global\dp\csname box@size@1\endcsname\dimen@
 \show@box@size@sw{%
  \class@info{Pagesofar: \the\dimen@}%
 }{}%
}%
\@booleanfalse\tally@box@size@sw
\@booleanfalse\show@box@size@sw
\expandafter\newbox\csname box@size@1\endcsname
\expandafter\setbox\csname box@size@1\endcsname\hbox{}%
\expandafter\newbox\csname box@size@2\endcsname
\expandafter\setbox\csname box@size@2\endcsname\hbox{}%
\def\total@text{%
 \@tempdima\the\ht\csname box@size@2\endcsname\divide\@tempdima\@twopowertwo\@tempcnta\@tempdima
 \@tempdimb\the\ht\csname box@size@1\endcsname\divide\@tempdimb\@twopowertwo\@tempcntb\@tempdimb
 \class@info{Total text: Column(\the\@tempcnta pt), Page(\the\@tempcntb pt)}%
}%
\def\natural@output{\toggle@insert{\output@holding}{\output@moving}}%
\output@latex{\natural@output}%
\def\output@holding{%
 \csname output@init@\bot@envir\endcsname
 \@if@exceed@pagegoal{\unvcopy\@cclv}{%
  \setbox\z@\vbox{\unvcopy\@cclv}%
  \outputdebug@sw{\trace@box\z@}{}%
  \dimen@\ht\@cclv\advance\dimen@-\ht\z@
  \dead@cycle@repair\dimen@
 }{%
  \dead@cycle
 }%
}%
\def\@if@exceed@pagegoal#1{%
 \begingroup
  \setbox\z@\vbox{#1}%
  \dimen@\ht\z@\advance\dimen@\dp\z@
  \outputdebug@sw{\saythe\dimen@}{}%
  \@ifdim{\dimen@>\pagegoal}{%
   \setbox\z@\vbox{\@@mark{}\unvbox\z@}%
   \splittopskip\topskip
   \splitmaxdepth\maxdepth
   \vbadness\@M
   \vfuzz\maxdimen
   \setbox\tw@\vsplit\z@ to\pagegoal
   \outputdebug@sw{\trace@scroll{\showbox\tw@\showbox\z@}}{}%
   \setbox\tw@\vbox{\unvbox\tw@}%
   \@ifdim{\ht\tw@=\z@}{%
    \ltxgrid@info{Found overly large chunk while preparing to move insertions. Attempting repairs}%
    \aftergroup\true@sw
   }{%
    \aftergroup\false@sw
   }%
 }{%
  \aftergroup\false@sw
 }%
 \endgroup
}%
\def\output@moving{%
 \set@top@firstmark
 \@ifnum{\outputpenalty=\do@newpage@pen}{%
  \setbox\@cclv\vbox{%
   \unvbox\@cclv
   \remove@lastbox
   \@ifdim{\ht\z@=\ht\@protection@box}{\box\lastbox}{\unskip}%
  }%
 }{}%
 \@cclv@nontrivial@sw{%
  \expandafter\output@do@prep\csname output@prep@\bot@envir \endcsname
  \@makecolumn\true@sw
  \expandafter\output@column@do\csname output@column@\thepagegrid\endcsname
  \protect@penalty\do@startcolumn@pen
  \clearpage@sw{%
   \protect@penalty\do@endpage@pen
  }{}%
  \expandafter\let\expandafter\output@post@\csname output@post@\bot@envir \endcsname
  \outputdebug@sw{\say\output@post@}{}%
  \@ifx{\output@post@\relax}{\output@post@document}{\output@post@}%
 }{%
  \void@cclv
 }%
 \set@colht
 \global\@mparbottom\z@
 \global\@textfloatsheight\z@
}%
\def\output@do@prep#1{%
 \outputdebug@sw{\class@info{Prep: \string#1}}{}%
 \@ifx{#1\relax}{\output@prep@document}{#1}%
}%
\def\output@column@do#1{%
  \outputdebug@sw{\class@info{Output column: \string#1}}{}%
  \@ifx{#1\relax}{\output@column@one}{#1}%
}%
\def\void@cclv{\begingroup\setbox\z@\box\@cclv\endgroup}%
\def\remove@lastbox{\setbox\z@\lastbox}%
\def\@cclv@nontrivial@sw{%
 \@ifx@empty\@toplist{%
  \@ifx@empty\@botlist{%
   \@ifvoid\footins{%
    \@ifvoid\@cclv{%
     \false@sw
    }{%
     \setbox\z@\vbox{\unvcopy\@cclv}%
     \@ifdim{\ht\z@=\topskip}{%
      \setbox\z@\vbox\bgroup
       \unvbox\z@
       \remove@lastbox
       \dimen@\lastskip\unskip
       \@ifdim{\ht\z@=\ht\@protection@box}{%
        \advance\dimen@\ht\z@
        \@ifdim{\dimen@=\topskip}{%
         \aftergroup\true@sw
        }{%
         \aftergroup\false@sw
        }%
       }{%
        \aftergroup\false@sw
       }%
      \egroup
      {%
       \false@sw
      }{%
       \true@sw
      }%
     }{%
      \@ifdim{\ht\z@=\z@}{%
       \ltxgrid@info{Found trivial column. Discarding it}%
       \outputdebug@sw{\trace@box\@cclv}{}%
       \false@sw
      }{%
       \true@sw
      }%
     }%
    }%
   }{%
    \true@sw
   }%
  }{%
   \true@sw
  }%
 }{%
  \true@sw
 }%
}%
\def\protect@penalty#1{\protection@box\penalty-#1\relax}%
\newbox\@protection@box
\setbox\@protection@box\vbox to1986sp{\vfil}%
\def\protection@box{\nointerlineskip\copy\@protection@box}%
\def\dead@cycle@repair#1{%
 \expandafter\do@@mark
 \expandafter{%
              \@@botmark
             }%
 \unvbox\@cclv
 \nointerlineskip
 \vbox to#1{\vss}%
 \@ifnum{\outputpenalty<\@M}{\penalty\outputpenalty}{}%
}%
\def\dead@cycle@repair@protected#1{%
 \expandafter\do@@mark
 \expandafter{%
              \@@botmark
             }%
 \begingroup
  \unvbox\@cclv
  \remove@lastbox
  \nointerlineskip
  \advance#1-\ht\@protection@box
  \vbox to#1{\vss}%
  \protection@box % Reinsert protection box
  \@ifnum{\outputpenalty<\@M}{\penalty\outputpenalty}{}%
 \endgroup
}%
\def\dead@cycle{%
 \expandafter\do@@mark
 \expandafter{%
              \@@botmark
             }%
 \unvbox\@cclv
 \@ifnum{\outputpenalty<\@M}{\penalty\outputpenalty}{}%
}%
\def\output@init@document{%
 \ltxgrid@info@sw{\class@info{\string\output@init@document}}{}%
 \global\vsize\vsize
}%
\def\output@prep@document{%
 \ltxgrid@foot@info@sw{\class@info{\string\output@prep@document}\trace@scroll{\showbox\footins\showbox\footsofar}}{}%
 \@ifvoid\footsofar{%
 }{%
  \global\setbox\footins\vbox\bgroup
   \unvbox\footsofar
   \@ifvoid\footins{}{%
    \marry@baselines
    \unvbox\footins
   }%
  \egroup
  \ltxgrid@foot@info@sw{\trace@box\footins}{}%
 }%
}%
\def\output@post@document{}%
\let\@opcol\@undefined
\def\@makecolumn#1{%
 \ltxgrid@foot@info@sw{\class@info{\string\@makecolumn\string#1}}{}%
 \setbox\@outputbox\vbox\bgroup
  \boxmaxdepth\@maxdepth
  \@tempdima\dp\@cclv
  \unvbox\@cclv
  \vskip-\@tempdima
 \egroup
 \xdef\@freelist{\@freelist\@midlist}\global\let\@midlist\@empty
 \show@text@box@size
 \@combinefloats
 #1{%
  \@combineinserts\@outputbox\footins
 }{%
  \combine@foot@inserts\footsofar\footins
 }%
 \set@adj@colht\dimen@
 \count@\vbadness
 \vbadness\@M
 \setbox\@outputbox\vbox to\dimen@\bgroup
  \@texttop
  \dimen@\dp\@outputbox
  \unvbox\@outputbox
  \vskip-\dimen@
  \@textbottom
 \egroup
 \vbadness\count@
 \global\maxdepth\@maxdepth
}%
\let\@makespecialcolbox\@undefined
\def\@combineinserts#1#2{%
 \ltxgrid@foot@info@sw{\class@info{\string\@combineinserts\string#1\string#2}\trace@box#2}{}%
 \setbox#1\vbox\bgroup
  \unvbox#1%
  \@ifvoid{#2}{}{%
   \dimen@\ht#2\advance\dimen@\dp#2\advance\dimen@\skip#2%
   \show@box@size{Combining inserts}#2%
   \vskip\skip#2%
   \setbox\z@\vbox{\footnoterule}\dimen@i\ht\z@
   \color@begingroup
   \normalcolor
   \cleaders\box\z@\vskip\dimen@i\kern-\dimen@i
   \csname combine@insert@\the\pagegrid@col\endcsname#2%
   \color@endgroup
   \kern-\dimen@\kern\dimen@
  }%
 \egroup
 \ltxgrid@foot@info@sw{\trace@box#1}{}%
}%
\def\combine@insert@tw@#1{%
 \compose@footnotes@two#1\@ifvbox{#1}{\unvbox}{\box}#1%
}%
\def\combine@insert@@ne#1{%
 \compose@footnotes@one#1\@ifvbox{#1}{\unvbox}{\box}#1%
}%
\def\twocolumn@grid@setup{%
 \expandafter\let\csname combine@insert@1\endcsname\combine@insert@tw@
 \expandafter\let\csname combine@insert@2\endcsname\combine@insert@@ne
}%
\def\onecolumn@grid@setup{%
 \expandafter\let\csname combine@insert@1\endcsname\combine@insert@@ne
 \expandafter\let\csname combine@insert@2\endcsname\combine@insert@@ne
}%
\let\columngrid@setup\onecolumn@grid@setup
\columngrid@setup
\appdef\@floatplacement{%
 \global\@fpmin\@fpmin
}%
\mathchardef\pagebreak@pen=\@M
\expandafter\let\csname output@-\the\pagebreak@pen\endcsname\relax
\mathchardef\do@startcolumn@pen=10005
\@namedef{output@-\the\do@startcolumn@pen}{\do@startcolumn}%
\def\do@startcolumn{%
 \setbox\@cclv\vbox{\unvbox\@cclv\remove@lastbox\unskip}%
 \clearpage@sw{\@clearfloatplacement}{\@floatplacement}%
 \set@colht
 \@booleanfalse\pfloat@avail@sw
 \begingroup
  \@colht\@colroom
  \@booleanfalse\float@avail@sw
  \@tryfcolumn\test@colfloat
  \float@avail@sw{\aftergroup\@booleantrue\aftergroup\pfloat@avail@sw}{}%
 \endgroup
 \fcolmade@sw{%
  \setbox\@cclv\vbox{\unvbox\@outputbox\unvbox\@cclv}%
  \outputpenalty-\pagebreak@pen
  \dead@cycle
 }{%
  \begingroup
   \let\@elt\@scolelt
   \let\reserved@b\@deferlist\global\let\@deferlist\@empty\reserved@b
  \endgroup
  \clearpage@sw{%
   \outputpenalty\@M
  }{%
   \outputpenalty\do@newpage@pen
  }%
  \dead@cycle
 }%
 \check@deferlist@stuck\do@startcolumn
 \set@vsize
}%
\def\@scolelt#1{\def\@currbox{#1}\@addtonextcol}%
\def\test@colfloat#1{%
 \csname @floatselect@sw@\thepagegrid\endcsname#1{}{\@testtrue}%
 \@if@sw\if@test\fi{}{\aftergroup\@booleantrue\aftergroup\float@avail@sw}%
}%
\def\@addtonextcol{%
 \begingroup
  \@insertfalse
  \@setfloattypecounts
  \csname @floatselect@sw@\thepagegrid\endcsname\@currbox{%
   \@ifnum{\@fpstype=8 }{}{%
     \@ifnum{\@fpstype=24 }{}{%
       \@flsettextmin
       \@reqcolroom \ht\@currbox
       \advance \@reqcolroom \@textmin
       \advance \@reqcolroom \vsize % take into account split insertions
       \advance \@reqcolroom -\pagegoal
       \@ifdim{\@colroom>\@reqcolroom}{%
         \@flsetnum \@colnum
         \@ifnum{\@colnum>\z@}{%
            \@bitor\@currtype\@deferlist
            \@if@sw\if@test\fi{}{%
              \@addtotoporbot
            }%
         }{}%
       }{}%
     }%
   }%
  }{}%
  \@if@sw\if@insert\fi{}{%
    \@cons\@deferlist\@currbox
  }%
 \endgroup
}%
\mathchardef\do@startpage@pen=10006
\@namedef{output@-\the\do@startpage@pen}{\do@startpage}%
\def\do@startpage{%
 \setbox\@cclv\vbox{\unvbox\@cclv\remove@lastbox\unskip}%
 \clearpage@sw{\@clearfloatplacement}{\@dblfloatplacement}%
 \set@colht
 \@booleanfalse\pfloat@avail@sw
 \begingroup
  \@booleanfalse\float@avail@sw
  \@tryfcolumn\test@dblfloat
  \float@avail@sw{\aftergroup\@booleantrue\aftergroup\pfloat@avail@sw}{}%
 \endgroup
 \fcolmade@sw{%
  \global\setbox\pagesofar\vbox{\unvbox\pagesofar\unvbox\@outputbox}%
  \@output@combined@page
 }{%
  \begingroup
   \@booleanfalse\float@avail@sw
   \let\@elt\@sdblcolelt
   \let\reserved@b\@deferlist\global\let\@deferlist\@empty\reserved@b
  \endgroup
  \@ifdim{\@colht=\textheight}{% No luck...
   \pfloat@avail@sw{% ...but a float *was* available!
    \forcefloats@sw{%
     \ltxgrid@warn{Forced dequeueing of floats stalled}%
    }{%
     \ltxgrid@warn{Dequeueing of floats stalled}%
    }%
   }{}%
  }{}%
  \outputpenalty\@M
  \dead@cycle
 }%
 \check@deferlist@stuck\do@startpage
 \set@colht
}%
\def\@output@combined@page{%
 \@combinepage\true@sw
 \@combinedblfloats
 \@outputpage
 \global\pagegrid@cur\@ne
 \protect@penalty\do@startpage@pen
}%
\def\@sdblcolelt#1{\def\@currbox{#1}\@addtodblcol}%
\def\test@dblfloat#1{%
 \@if@notdblfloat{#1}{\@testtrue}{}%
 \@if@sw\if@test\fi{}{\aftergroup\@booleantrue\aftergroup\float@avail@sw}%
}%
\def\@if@notdblfloat#1{\@ifdim{\wd#1<\textwidth}}%
\@booleanfalse\forcefloats@sw
\def\@addtodblcol{%
 \begingroup
  \@if@notdblfloat{\@currbox}{%
   \false@sw
  }{%
   \@setfloattypecounts
   \@getfpsbit \tw@
   \@bitor \@currtype \@deferlist
   \@if@sw\if@test\fi{%
    \false@sw
   }{%
    \@ifodd\@tempcnta{%
     \aftergroup\@booleantrue\aftergroup\float@avail@sw
     \@flsetnum \@dbltopnum
     \@ifnum{\@dbltopnum>\z@}{%
       \@ifdim{\@dbltoproom>\ht\@currbox}{%
        \true@sw
       }{%
        \@ifnum{\@fpstype<\sixt@@n}{%
         \begingroup
          \advance \@dbltoproom \@textmin
          \@ifdim{\@dbltoproom>\ht\@currbox}{%
           \endgroup\true@sw
          }{%
           \endgroup\false@sw
          }%
        }{%
         \false@sw
        }%
       }%
     }{%
      \false@sw
     }%
    }{%
     \false@sw
    }%
   }%
  }%
  {%
   \@tempdima -\ht\@currbox
   \advance\@tempdima
    -\@ifx{\@dbltoplist\@empty}{\dbltextfloatsep}{\dblfloatsep}%
   \global \advance \@dbltoproom \@tempdima
   \global \advance \@colht \@tempdima
   \global \advance \@dbltopnum \m@ne
   \@cons \@dbltoplist \@currbox
  }{%
   \@cons \@deferlist \@currbox
  }%
 \endgroup
}%
\def\@tryfcolumn#1{%
  \global\@booleanfalse\fcolmade@sw
  \@ifx@empty\@deferlist{}{%
    \global\let\@trylist\@deferlist
    \global\let\@failedlist\@empty
    \begingroup
      \dimen@\vsize\advance\dimen@-\pagegoal\@ifdim{\dimen@>\z@}{%
       \advance\@fpmin-\dimen@
      }{}%
      \def\@elt{\@xtryfc#1}\@trylist
    \endgroup
    \fcolmade@sw{%
      \global\setbox\@outputbox\vbox{\vskip \@fptop}%
      \let \@elt \@wtryfc \@flsucceed
      \global\setbox\@outputbox\vbox{\unvbox\@outputbox
        \unskip \vskip \@fpbot
      }%
      \let \@elt \relax
      \xdef\@deferlist{\@failedlist\@flfail}%
      \xdef\@freelist{\@freelist\@flsucceed}%
    }{}%
  }%
}%
\def\@wtryfc #1{%
  \global\setbox\@outputbox\vbox{\unvbox\@outputbox
    \box #1\vskip\@fpsep
  }%
}%
\def\@xtryfc#1#2{%
  \@next\reserved@a\@trylist{}{}% trim \@trylist. Ugly!
  \@currtype \count #2%
  \divide\@currtype\@xxxii\multiply\@currtype\@xxxii
  \@bitor \@currtype \@failedlist
  \@testfp #2%
  #1#2%
  \@ifdim{\ht #2>\@colht   }{\@testtrue}{}%
  \@if@sw\if@test\fi{%
   \@cons\@failedlist #2%
  }{%
   \begingroup
     \gdef\@flsucceed{\@elt #2}%
     \global\let\@flfail\@empty
     \@tempdima\ht #2%
     \def \@elt {\@ztryfc#1}\@trylist
     \@ifdim{\@tempdima >\@fpmin}{%
       \global\@booleantrue\fcolmade@sw
     }{%
       \@cons\@failedlist #2%
     }%
   \endgroup
   \fcolmade@sw{%
     \let \@elt \@gobble
   }{}%
  }%
}%
\def\@ztryfc #1#2{%
  \@tempcnta \count#2%
  \divide\@tempcnta\@xxxii\multiply\@tempcnta\@xxxii
  \@bitor \@tempcnta {\@failedlist \@flfail}%
  \@testfp #2%
  #1#2%
  \@tempdimb\@tempdima
  \advance\@tempdimb \ht#2\advance\@tempdimb\@fpsep
  \@ifdim{\@tempdimb >\@colht}{%
    \@testtrue
  }{}%
  \@if@sw\if@test\fi{%
    \@cons\@flfail #2%
  }{%
    \@cons\@flsucceed #2%
    \@tempdima\@tempdimb
  }%
}%
\def\newpage@prep{%
  \if@noskipsec
    \ifx \@nodocument\relax
      \leavevmode
      \global \@noskipsecfalse
    \fi
  \fi
  \if@inlabel
    \leavevmode
    \global \@inlabelfalse
  \fi
  \if@nobreak \@nobreakfalse \everypar{}\fi
  \par
}%
\def \newpage {%
 \newpage@prep
 \do@output@MVL{%
  \vfil
  \penalty-\pagebreak@pen
 }%
}%
\def\clearpage{%
 \newpage@prep
 \do@output@MVL{%
  \vfil
  \penalty-\pagebreak@pen
  \global\@booleantrue\clearpage@sw
  \protect@penalty\do@startcolumn@pen
  \protect@penalty\do@endpage@pen
 }%
 \do@output@MVL{%
  \global\@booleanfalse\clearpage@sw
 }%
}%
\def\cleardoublepage{%
 \clearpage
 \@if@sw\if@twoside\fi{%
  \@ifodd\c@page{}{%
   \null\clearpage
  }%
 }{}%
}%
\@booleanfalse\clearpage@sw
\mathchardef\do@endpage@pen=10007
\@namedef{output@-\the\do@endpage@pen}{\csname end@column@\thepagegrid\endcsname}%
\mathchardef\do@newpage@pen=10001
\expandafter\let\csname output@-\the\do@newpage@pen\endcsname\relax
\def\@clearfloatplacement{%
 \global\@topnum     \maxdimen
 \global\@toproom    \maxdimen
 \global\@botnum     \maxdimen
 \global\@botroom    \maxdimen
 \global\@colnum     \maxdimen
 \global\@dbltopnum  \maxdimen
 \global\@dbltoproom \maxdimen
 \global\@textmin    \z@
 \global\@fpmin      \z@
 \let\@testfp\@gobble
 \appdef\@setfloattypecounts{\@fpstype16\advance\@fpstype\m@ne}%
}%
\let\@doclearpage\@undefined
\let\@makefcolumn\@undefined
\let\@makecol\@undefined
\def\clr@top@firstmark{%
 \global\let\saved@@topmark\@undefined
 \global\let\saved@@firstmark\@empty
 \global\let\saved@@botmark\@empty
}%
\clr@top@firstmark
\def\set@top@firstmark{%
 \@ifxundefined\saved@@topmark{\expandafter\gdef\expandafter\saved@@topmark\expandafter{\@@topmark}}{}%
 \@if@empty\saved@@firstmark{\expandafter\gdef\expandafter\saved@@firstmark\expandafter{\@@firstmark}}{}%
 \@if@empty\@@botmark{}{\expandafter\gdef\expandafter\saved@@botmark\expandafter{\@@botmark}}%
}%
\appdef\@outputpage@tail{%
 \clr@top@firstmark
}%
\def\@float#1{%
 \@ifnextchar[{%
  \@yfloat\width@float{#1}%
 }{%
  \@ifxundefined@cs{fps@#1}{}{\expandafter\let\expandafter\fps@\csname fps@#1\endcsname}%
  \expandafter\@argswap\expandafter{\expandafter[\fps@]}{\@yfloat\width@float{#1}}%
 }%
}%
\def\@dblfloat#1{%
 \@ifnum{\pagegrid@col=\@ne}{%
  \@float{#1}%
 }{%
  \@ifnextchar[{%
   \@yfloat\widthd@float{#1}%
  }{%
   \@ifxundefined@cs{fpsd@#1}{}{\expandafter\let\expandafter\fpsd@\csname fpsd@#1\endcsname}%
   \expandafter\@argswap\expandafter{\expandafter[\fpsd@]}{\@yfloat\widthd@float{#1}}%
  }%
 }%
}%
\def\@yfloat#1#2[#3]{%
 \@xfloat{#2}[#3]%
 \hsize#1\linewidth\hsize
 \let\set@footnotewidth\@empty
 \minipagefootnote@init
}%
\def\fps@{tbp}%
\def\fpsd@{tp}%
\def\width@float{\columnwidth}%
\def\widthd@float{\textwidth}%
\def\end@float{%
 \end@@float{%
  \check@currbox@count
 }%
}%
\def\end@dblfloat{%
 \@ifnum{\pagegrid@col=\@ne}{%
  \end@float
 }{%
  \end@@float{%
   \@iffpsbit\@ne{\global\advance\count\@currbox\m@ne}{}%
   \@iffpsbit\f@ur{\global\advance\count\@currbox-4\relax}{}%
   \global\wd\@currbox\textwidth % Klootch
   \check@currbox@count
  }%
 }%
}%
\def\end@@float#1{%
 \minipagefootnote@here
 \@endfloatbox
 #1%
 \@ifnum{\@floatpenalty <\z@}{%
  \@largefloatcheck
  \@cons\@currlist\@currbox
  \@ifnum{\@floatpenalty <-\@Mii}{%
   \do@output@cclv{\@add@float}%
  }{%
   \vadjust{\do@output@cclv{\@add@float}}%
   \@Esphack
  }%
 }{}%
}%
\newcommand\float@end@float{%
 \@endfloatbox
 \global\setbox\@currbox\float@makebox\columnwidth
 \let\@endfloatbox\relax
 \end@float
}%
\newcommand\float@end@ltx{%
 \end@@float{%
  \global\setbox\@currbox\float@makebox\columnwidth
  \check@currbox@count
 }%
}%
\newcommand\newfloat@float[3]{%
 \@namedef{ext@#1}{#3} %!
 \let\float@do=\relax
 \xdef\@tempa{\noexpand\float@exts{\the\float@exts \float@do{#3}}}%
 \@tempa
 \floatplacement{#1}{#2}%
 \@ifundefined{fname@#1}{\floatname{#1}{#1}}{} %!
 \expandafter\edef\csname ftype@#1\endcsname{\value{float@type}}%
 \addtocounter{float@type}{\value{float@type}} %!
 \restylefloat{#1}%
 \expandafter\edef\csname fnum@#1\endcsname{%
  \expandafter\noexpand\csname fname@#1\endcsname{} %!
  \expandafter\noexpand\csname the#1\endcsname
 }
 \@ifnextchar[%]
  {%
   \float@newx{#1}%
  }{%
   \@ifundefined{c@#1}{\newcounter{#1}\@namedef{the#1}{\arabic{#1}}}{}%
  }%
}%
\newcommand\newfloat@ltx[3]{%
 \@namedef{ext@#1}{#3}%
 \let\float@do=\relax
 \xdef\@tempa{\noexpand\float@exts{\the\float@exts \float@do{#3}}}%
 \@tempa
 \floatplacement{#1}{#2}%
 \@ifundefined{fname@#1}{\floatname{#1}{#1}}{}%
 \expandafter\edef\csname ftype@#1\expandafter\endcsname\expandafter{\the\c@float@type}%
 \addtocounter{float@type}{\value{float@type}}%
 \restylefloat{#1}%
 \expandafter\edef\csname fnum@#1\endcsname{%
  \expandafter\noexpand\csname fname@#1\endcsname{}%
  \expandafter\noexpand\csname the#1\endcsname
 }
 \@ifnextchar[%]
  {%
   \float@newx{#1}%
  }{%
   \@ifundefined{c@#1}{\newcounter{#1}\@namedef{the#1}{\arabic{#1}}}{}%
  }%
}%
\appdef\document@inithook{%
 \@ifxundefined\newfloat{}{%
  \@ifx{\float@end\float@end@float}{%
   \@ifx{\newfloat\newfloat@float}{\true@sw}{\false@sw}%
   }{\false@sw}%
   {%
    \class@warn{Repair the float package}%
    \let\float@end\float@end@ltx
    \let\newfloat\newfloat@ltx
   }{%
    \class@warn{Failed to patch the float package}%
   }%
 }%
}%
\def\@iffpsbit#1{%
 \begingroup
  \@tempcnta\count\@currbox
  \divide\@tempcnta#1\relax
  \@ifodd\@tempcnta{\aftergroup\true@sw}{\aftergroup\false@sw}%
 \endgroup
}%
\def\check@currbox@count{%
 \@ifnum{\count\@currbox>\z@}{%
  \count@\count\@currbox\divide\count@\sixt@@n\multiply\count@\sixt@@n
  \@tempcnta\count\@currbox\advance\@tempcnta-\count@
  \@ifnum{\@tempcnta=\z@}{%
   \ltxgrid@warn{Float cannot be placed}%
  }{}%
  \expandafter\tally@float\expandafter{\@captype}%
 }{%
 }%
}%
\providecommand\minipagefootnote@init{}%
\providecommand\minipagefootnote@here{}%
\providecommand\tally@float[1]{}%
\let\@specialoutput\@undefined
\def\@add@float{%
 \@pageht\ht\@cclv\@pagedp\dp\@cclv
 \unvbox\@cclv
 \@next\@currbox\@currlist{%
  \csname @floatselect@sw@\thepagegrid\endcsname\@currbox{%
   \@ifnum{\count\@currbox>\z@}{%
    \advance \@pageht \@pagedp
    \advance \@pageht \vsize \advance \@pageht -\pagegoal
    \@addtocurcol
   }{%
    \@addmarginpar
   }%
  }{%
   \@resethfps
   \@cons\@deferlist\@currbox
  }%
 }{\@latexbug}%
 \@ifnum{\outputpenalty<\z@}{%
  \@if@sw\if@nobreak\fi{%
   \nobreak
  }{%
   \addpenalty \interlinepenalty
  }%
 }{}%
 \set@vsize
}%
\let\@reinserts\@undefined
\def \@addtocurcol {%
   \@insertfalse
   \@setfloattypecounts
   \ifnum \@fpstype=8
   \else
     \ifnum \@fpstype=24
     \else
       \@flsettextmin
       \advance \@textmin \@textfloatsheight
       \@reqcolroom \@pageht
       \ifdim \@textmin>\@reqcolroom
         \@reqcolroom \@textmin
       \fi
       \advance \@reqcolroom \ht\@currbox
       \ifdim \@colroom>\@reqcolroom
         \@flsetnum \@colnum
         \ifnum \@colnum>\z@
           \@bitor\@currtype\@deferlist
           \if@test
           \else
             \@bitor\@currtype\@botlist
             \if@test
               \@addtobot
             \else
               \ifodd \count\@currbox
                 \advance \@reqcolroom \intextsep
                 \ifdim \@colroom>\@reqcolroom
                   \global \advance \@colnum \m@ne
                   \global \advance \@textfloatsheight \ht\@currbox
                   \global \advance \@textfloatsheight 2\intextsep
                   \@cons \@midlist \@currbox
                   \if@nobreak
                     \nobreak
                     \@nobreakfalse
                     \everypar{}%
                   \else
                     \addpenalty \interlinepenalty
                   \fi
                   \vskip \intextsep
                   \unvbox\@currbox %AO
                   \penalty\interlinepenalty
                   \vskip\intextsep
                   \ifnum\outputpenalty <-\@Mii \vskip -\parskip\fi
                   \outputpenalty \z@
                   \@inserttrue
                 \fi
               \fi
               \if@insert
               \else
                 \@addtotoporbot
               \fi
             \fi
           \fi
         \fi
       \fi
     \fi
   \fi
   \if@insert
   \else
     \@resethfps
     \@cons\@deferlist\@currbox
   \fi
}%
\@twocolumnfalse
\let\@twocolumntrue\@twocolumnfalse
\def\@addmarginpar{%
 \@next\@marbox\@currlist{%
  \@cons\@freelist\@marbox\@cons\@freelist\@currbox
 }\@latexbug
 \setbox\@marbox\hb@xt@\columnwidth{%
  \csname @addmarginpar@\thepagegrid\endcsname{%
   \hskip-\marginparsep\hskip-\marginparwidth
   \box\@currbox
  }{%
   \hskip\columnwidth\hskip\marginparsep
   \box\@marbox
  }%
  \hss
 }%
 \setbox\z@\box\@currbox
    \@tempdima\@mparbottom
    \advance\@tempdima -\@pageht
    \advance\@tempdima\ht\@marbox
 \@ifdim{\@tempdima >\z@}{%
   \@latex@warning@no@line {Marginpar on page \thepage\space moved}%
 }{%
   \@tempdima\z@
 }%
    \global\@mparbottom\@pageht
    \global\advance\@mparbottom\@tempdima
    \global\advance\@mparbottom\dp\@marbox
    \global\advance\@mparbottom\marginparpush
    \advance\@tempdima -\ht\@marbox
    \global\setbox \@marbox
                   \vbox {\vskip \@tempdima
                          \box \@marbox}%
    \global \ht\@marbox \z@
    \global \dp\@marbox \z@
    \kern -\@pagedp
    \nointerlineskip
  \box\@marbox
    \nointerlineskip
    \hbox{\vrule \@height\z@ \@width\z@ \@depth\@pagedp}%
}%
\newenvironment{turnpage}{%
 \def\width@float{\textheight}%
 \def\widthd@float{\textheight}%
 \appdef\@endfloatbox{%
  \@ifxundefined\@currbox{%
   \ltxgrid@warn{Cannot rotate! Not a float}%
  }{%
   \setbox\@currbox\vbox to\textwidth{\vfil\unvbox\@currbox\vfil}%
   \global\setbox\@currbox\vbox{\rotatebox{90}{\box\@currbox}}%
  }%
 }%
}{%
}%
\def\rotatebox@dummy#1#2{%
 \ltxgrid@warn{You must load the graphics or graphicx package in order to use the turnpage environment}%
 #2%
}%
\appdef\document@inithook{%
 \@ifxundefined\rotatebox{\let\rotatebox\rotatebox@dummy}{}%
}%
\@namedef{output@-1073741824}{%
 \deadcycles\z@
 \void@cclv
}%
\mathchardef\save@column@pen=10016
\@namedef{output@-\the\save@column@pen}{\save@column}%
\let \@cclv@saved \@holdpg
\let \@holdpg \@undefined
\def\save@column{%
 \@ifvoid\@cclv@saved{%
  \set@top@firstmark
  \global\@topmark@saved\expandafter{\@@topmark}%
 }{}%
 \global\setbox\@cclv@saved\vbox{%
  \@ifvoid\@cclv@saved{}{%
   \unvbox\@cclv@saved
   \marry@baselines
  }%
  \unvbox\@cclv
  \lose@breaks
  \remove@lastbox
 }%
}%
\newtoks\@topmark@saved
\def\prep@cclv{%
 \void@cclv
 \setbox\@cclv\box\@cclv@saved
 \vbadness\@M
}%
\mathchardef\save@column@insert@pen=10017
\@namedef{output@-\the\save@column@insert@pen}{\toggle@insert{\savecolumn@holding}{\savecolumn@moving}}%
\def\savecolumn@holding{%
 \@if@exceed@pagegoal{\unvcopy\@cclv\remove@lastbox}{%
  \setbox\z@\vbox{\unvcopy\@cclv\remove@lastbox}%
  \outputdebug@sw{\trace@box\z@}{}%
  \dimen@\ht\@cclv\advance\dimen@-\ht\z@
  \dead@cycle@repair@protected\dimen@
 }{%
  \dead@cycle
 }%
}%
\def\savecolumn@moving{%
 \ltxgrid@info@sw{\class@info{\string\savecolumn@moving}}{}%
 \@cclv@nontrivial@sw{%
  \save@column
 }{%
  \void@cclv
 }%
 \@ifvoid\footins{}{%
  \ltxgrid@foot@info@sw{\class@info{\string\savecolumn@moving}\trace@scroll{\showbox\footins@saved\showbox\footins}}{}%
  \@ifvoid\footins@saved{%
   \global\setbox\footins@saved\box\footins
  }{%
   \global\setbox\footins@saved\vbox\bgroup
    \unvbox\footins@saved
    \marry@baselines
    \unvbox\footins
   \egroup
  }%
  \ltxgrid@foot@info@sw{\trace@box\footins@saved}{}%
  \protect@penalty\save@column@insert@pen
 }%
}%
\newbox\footins@saved
\newbox\footins@recovered
\newbox\column@recovered
\mathchardef\save@message@pen=10018
\@namedef{output@-\the\save@message@pen}{\save@message}%
\def\save@message{%
 \void@cclv
 \toks@\expandafter{\@@firstmark}%
 \expandafter\gdef\expandafter\@message@saved\expandafter{\the\toks@}%
 \expandafter\do@@mark\expandafter{\the\@topmark@saved}%
}%
\gdef\@message@saved{}%
\mathchardef\execute@message@pen=10019
\@namedef{output@-\the\execute@message@pen}{\@message@saved}%
\def\execute@message{%
 \@execute@message\save@column@pen
}%
\def\execute@message@insert#1{%
 \@execute@message\save@column@insert@pen{%
  \setbox \footins \box \footins@saved
  \ltxgrid@foot@info@sw{\class@info{\string\execute@message@insert}\trace@box\footins}{}%
  #1%
 }%
}%
\long\def\@execute@message#1#2{%
 \begingroup
  \dimen@\prevdepth\@ifdim{\dimen@<\z@}{\dimen@\z@}{}%
  \setbox\z@\vbox{%
   \protect@penalty#1%
   \protection@box
   \toks@{\prep@cclv#2}%
   \@@mark{\the\toks@}%
   \penalty-\save@message@pen
   \setbox\z@\null\dp\z@\dimen@\ht\z@-\dimen@
   \nointerlineskip\box\z@
   \penalty-\execute@message@pen
  }\unvbox\z@
 \endgroup
}%
\def\do@output@cclv{\execute@message}%
\def\do@output@MVL#1{%
 \@ifvmode{%
  \begingroup\execute@message{\unvbox\@cclv#1}\endgroup
 }{%
  \@ifhmode{%
   \vadjust{\execute@message{\unvbox\@cclv#1}}%
  }{%
   \@latexerr{\string\do@output@MVL\space cannot be executed in this mode!}\@eha
  }%
 }%
}%
\def\lose@breaks{%
 \loopwhile{%
  \count@\lastpenalty
  \@ifnum{\count@=\@M}{%
   \unpenalty\true@sw
  }{%
   \false@sw
  }%
 }%
}%
\def\removestuff{\do@output@MVL{\unskip\unpenalty}}%
\def\removephantombox{%
 \vadjust{%
  \execute@message{%
   \unvbox\@cclv
   \remove@lastbox
   \unskip
   \unskip
   \unpenalty
   \penalty\predisplaypenalty
   \vskip\abovedisplayskip
  }%
 }%
}%
\def\addstuff#1#2{\edef\@tempa{\noexpand\do@output@MVL{\noexpand\@addstuff{#1}{#2}}}\@tempa}%
\def\@addstuff#1#2{%
 \skip@\lastskip\unskip
 \count@\lastpenalty\unpenalty
 \@if@empty{#1}{}{\penalty#1\relax}%
 \@ifnum{\count@=\z@}{}{\penalty\count@}%
 \vskip\skip@
 \@if@empty{#2}{}{\vskip#2\relax}%
}%
\def\replacestuff#1#2{\edef\@tempa{\noexpand\do@output@MVL{\noexpand\@replacestuff{#1}{#2}}}\@tempa}%
\def\@replacestuff#1#2{%
 \skip@\lastskip\unskip
 \count@\lastpenalty\unpenalty
 \@if@empty{#1}{}{%
 \@ifnum{\count@>\@M}{}{%
   \@ifnum{\count@=\z@}{\count@=#1\relax}{%
    \@ifnum{\count@<#1\relax}{}{%
     \count@=#1\relax
    }%
   }%
 }%
 }%
 \@ifnum{\count@=\z@}{}{\penalty\count@}%
 \@if@empty{#2}{}{%
  \@tempskipa#2\relax
  \@ifdim{\z@>\@tempskipa}{%
   \advance\skip@-\@tempskipa
  }{%
   \@ifdim{\skip@>\@tempskipa}{}{%
    \skip@\@tempskipa
   }%
  }%
 }%
 \vskip\skip@
}%
\def\move@insertions{\global\holdinginserts\z@}%
\def\hold@insertions{\global\holdinginserts\@ne}%
\hold@insertions
\def\toggle@insert#1#2{%
 \@ifnum{\holdinginserts>\z@}{\move@insertions#1}{\hold@insertions#2}%
}%
\def\do@columngrid#1#2{%
 \par
 \expandafter\let\expandafter\@tempa\csname open@column@#1\endcsname
 \@ifx{\relax\@tempa}{%
  \ltxgrid@warn{Unknown page grid #1. No action taken}%
 }{%
  \do@output@MVL{\start@column{#1}{#2}}%
 }%
}%
\def\start@column#1#2{%
 \def\@tempa{#1}\@ifx{\@tempa\thepagegrid}{%
  \ltxgrid@info{Already in page grid \thepagegrid. No action taken}%
 }{%
  \expandafter\execute@message@insert
  \expandafter{%
               \csname shut@column@\thepagegrid\expandafter\endcsname
               \csname open@column@#1\endcsname{#2}%
               \set@vsize
             }%
 }%
}%
\def\thepagegrid{one}%
\newbox\pagesofar
\newbox\footsofar
\def\combine@foot@inserts#1#2{%
  \ltxgrid@info@sw{\class@info{\string\combine@foot@inserts\string#1\string#2}}{}%
  \@ifvoid#1{%
    \ltxgrid@foot@info@sw{\trace@box#2}{}\global\setbox#1\box#2%
  }{%
   \global\setbox#1\vbox\bgroup
    \ltxgrid@foot@info@sw{\trace@box#1}{}\unvbox#1%
    \@ifvoid#2{}{%
     \marry@baselines
     \ltxgrid@foot@info@sw{\trace@box#2}{}\unvbox#2%
    }%
   \egroup
  }%
  \ltxgrid@foot@info@sw{\trace@scroll{\showbox#1\showbox#2}}{}%
}%
\newcommand\onecolumngrid{\do@columngrid{one}{\@ne}}%
\let\onecolumn\@undefined
\def\open@column@one#1{%
 \ltxgrid@info@sw{\class@info{\string\open@column@one\string#1}}{}%
 \unvbox\pagesofar
 \@ifvoid{\footsofar}{}{%
  \insert\footins\bgroup\unvbox\footsofar\egroup
  \penalty\z@
 }%
 \gdef\thepagegrid{one}%
 \global\pagegrid@col#1%
 \global\pagegrid@cur\@ne
 \global\count\footins\@m
 \global\divide\count\footins\tw@
 \set@column@hsize\pagegrid@col
 \set@colht
}%
\def\shut@column@one{%
 \ltxgrid@info@sw{\class@info{\string\shut@column@one}}{}%
 \@makecolumn\false@sw
 \global\setbox\pagesofar\vbox\bgroup
  \recover@column\@outputbox\footsofar\column@recovered\footins@recovered
 \egroup
 \begingroup\setbox\z@\box\@outputbox\endgroup
 \combine@foot@inserts\footsofar\footins
 \set@colht
}%
\def\float@column@one{%
 \@makecolumn\true@sw
 \@outputpage
}%
\def\end@column@one{%
 \unvbox\@cclv\remove@lastbox
 \protect@penalty\do@newpage@pen
}%
\def\output@column@one{%
 \@outputpage
}%
\def\@addmarginpar@one{%
 \@if@sw\if@mparswitch\fi{%
  \@ifodd\c@page{\false@sw}{\true@sw}%
 }{\false@sw}{%
  \@if@sw\if@reversemargin\fi{\false@sw}{\true@sw}%
 }{%
  \@if@sw\if@reversemargin\fi{\true@sw}{\false@sw}%
 }%
}%
\def\@floatselect@sw@one#1{\true@sw}%
\def\onecolumngrid@push{%
 \do@output@MVL{%
  \@ifnum{\pagegrid@col=\@ne}{%
   \global\let\restorecolumngrid\@empty
  }{%
   \xdef\restorecolumngrid{%
    \noexpand\start@column{\thepagegrid}{\the\pagegrid@col}%
   }%
   \start@column{one}{\@ne}%
  }%
 }%
}%
\def\onecolumngrid@pop{%
 \do@output@MVL{\restorecolumngrid}%
}%
\newcommand\twocolumngrid{\do@columngrid{mlt}{\tw@}}%
\let\twocolumn\@undefined
\let\@topnewpage\@undefined
\def\open@column@mlt#1{%
 \ltxgrid@info@sw{\class@info{\string\open@column@mlt\string#1}}{}%
 \@ifvoid{\footsofar}{}{%
  \insert\footins\bgroup\unvbox\footsofar\egroup
 }%
 \gdef\thepagegrid{mlt}%
 \global\pagegrid@col#1%
 \global\pagegrid@cur\@ne
 \global\count\footins\@m
 \set@column@hsize\pagegrid@col
 \set@colht
}%
\def\shut@column@mlt{%
 \ltxgrid@info@sw{\class@info{\string\shut@column@mlt}}{}%
 \@cclv@nontrivial@sw{%
  \@makecolumn\false@sw
  \@ifnum{\pagegrid@cur<\pagegrid@col}{%
   \expandafter\global\expandafter\setbox\csname col@\the\pagegrid@cur\endcsname\box\@outputbox
   \global\advance\pagegrid@cur\@ne
  }{}%
 }{%
  \void@cclv
 }%
 \@ifnum{\pagegrid@cur>\@ne}{%
  \csname balance@\the\pagegrid@col\endcsname
  \grid@column\@outputbox{}%
  \@combinepage\false@sw
  \@combinedblfloats
  \global\setbox\pagesofar\box\@outputbox
  \show@pagesofar@size
 }{}%
 \set@colht
}%
\def\float@column@mlt{%
  \@output@combined@page
}%
\def\end@column@mlt{%
 \@ifx@empty\@toplist{%
  \@ifx@empty\@botlist{%
   \@ifx@empty\@dbltoplist{%
    \@ifx@empty\@deferlist{%
     \@ifnum{\pagegrid@cur=\@ne}{%
      \false@sw
     }{%
      \true@sw
     }%
    }{%
     \true@sw
    }%
   }{%
    \true@sw
   }%
  }{%
   \true@sw
  }%
 }{%
  \true@sw
 }%
 % true = kick out a column and try again
 {%
  \@cclv@nontrivial@sw{%
   \unvbox\@cclv\remove@lastbox
  }{%
   \unvbox\@cclv\remove@lastbox\unskip\null
  }%
  \protect@penalty\do@newpage@pen
  \protect@penalty\do@endpage@pen
 }{%
  \unvbox\@cclv\remove@lastbox
 }%
}%
\def\output@column@mlt{%
 \@ifnum{\pagegrid@cur<\pagegrid@col}{%
  \expandafter\global\expandafter\setbox\csname col@\the\pagegrid@cur\endcsname\box\@outputbox
  \global\advance\pagegrid@cur\@ne
 }{%
  \set@adj@colht\dimen@
  \grid@column\@outputbox{}%
  \@output@combined@page
 }%
}%
\let\@outputdblcol\@undefined
\def\@floatselect@sw@mlt#1{\@if@notdblfloat{#1}}%
\def\@addmarginpar@mlt{% emits a boolean
 \@ifnum{\pagegrid@cur=\@ne}%
}%
\def\set@footnotewidth@one{%
 \hsize\columnwidth
 \linewidth\hsize
}%
\def\set@footnotewidth@two{\set@footnotewidth@mlt\tw@}%
\def\set@footnotewidth@mlt#1{%
 \hsize\textwidth
 \advance\hsize\columnsep
 \divide\hsize#1%
 \advance\hsize-\columnsep
 \linewidth\hsize
}%
\def\compose@footnotes@one#1{%
 \ltxgrid@foot@info@sw{\class@info{\string\compose@footnotes@one\string#1}\trace@box#1}{}%
}%
\let\compose@footnotes\compose@footnotes@one
\def\compose@footnotes@two#1{%
 \ltxgrid@foot@info@sw{\class@info{\string\compose@footnotes@two\string#1}\trace@box#1}{}%
 \setbox\z@\box\@tempboxa
 \let\recover@column\recover@column@null
 \let\marry@baselines\@empty
 \balance@two#1\@tempboxa
 \global\setbox#1\hbox to\textwidth{\box#1\hfil\box\@tempboxa}%
 \ltxgrid@foot@info@sw{\trace@box#1}{}%
}%
\let\pagegrid@cur\col@number
\let\col@number\@undefined
\newcount\pagegrid@col
\pagegrid@cur\@ne
\expandafter\let\csname col@\the\pagegrid@cur\endcsname\@leftcolumn
\let\@leftcolumn\@undefined
\pagegrid@col\tw@
\def\pagegrid@init{%
 \advance\pagegrid@cur\@ne
 \@ifnum{\pagegrid@cur<\pagegrid@col}{%
  \csname newbox\expandafter\endcsname\csname  col@\the\pagegrid@cur\endcsname
  \pagegrid@init
 }{%
 }%
}%
\appdef\class@documenthook{%
 \pagegrid@init
}%
\def\grid@column#1#2{%
 \ltxgrid@info@sw{\class@info{\string\grid@column\string#1}}{}%
 \global\setbox#1\vbox\bgroup
  \hb@xt@\textwidth\bgroup
   \vrule\@height\z@\@width\z@\@if@empty{#2}{}{\@depth#2}%
   \pagegrid@cur\@ne
   \@ifnum{\pagegrid@cur<\pagegrid@col}{\loopwhile{\append@column@\pagegrid@cur\pagegrid@col}}{}%
   \box@column#1%
  \egroup
  \vskip\z@skip
 \egroup
}%
\def\append@column@#1#2{%
 \expandafter\box@column\csname col@\the#1\endcsname
 \hfil\vrule\@width\columnseprule\hfil
 \advance#1\@ne
 \@ifnum{#1<#2}%
}%
\def\box@column#1{%
 \ltxgrid@info@sw{\class@info{\string\box@column\string#1}}{}%
 \raise\topskip
 \hb@xt@\columnwidth\bgroup
  \dimen@\ht#1\@ifdim{\dimen@>\@colht}{\dimen@\@colht}{}%
  \count@\vbadness\vbadness\@M
  \dimen@ii\vfuzz\vfuzz\maxdimen
  \ltxgrid@info@sw{\saythe\@colht\saythe\dimen@}{}%
  \vtop to\dimen@\bgroup
   \hrule\@height\z@
   \unvbox#1%
   \raggedcolumn@skip
  \egroup
  \vfuzz\dimen@ii
  \vbadness\count@
  \hss
 \egroup
}%
\def\marry@baselines{%
 \begingroup
  \setbox\z@\lastbox
  \@ifvoid{\z@}{%
   \endgroup
  }{%
   \aftergroup\kern
   \aftergroup-%
   \expandafter\box\expandafter\z@\expandafter\endgroup\the\dp\z@\relax
  }%
 \vskip\marry@skip\relax
}%
\gdef\marry@skip{\z@skip}%
\def\set@marry@skip{%
 \begingroup
  \skip@\baselineskip\advance\skip@-\topskip
  \@ifdim{\skip@>\z@}{%
   \xdef\marry@skip{\the\skip@}%
  }{}%
 \endgroup
}%
\appdef\document@inithook{%
 \@ifxundefined\raggedcolumn@sw{\@booleanfalse\raggedcolumn@sw}{}%
}%
\def\raggedcolumn@skip{%
 \vskip\z@\raggedcolumn@sw{\@plus.0001fil\@minus.0001fil}{}\relax
}%
\def\@combinepage#1{%
 \ltxgrid@foot@info@sw{\class@info{\string\@combinepage\string#1}}{}%
 \@ifvoid\pagesofar{}{%
  \setbox\@outputbox\vbox{%
   \unvbox\pagesofar
   \marry@baselines
   \unvbox\@outputbox
  }%
 }%
 #1{%
  \@ifvoid\footsofar{}{%
   \show@box@size{Combining page footnotes}\footsofar
   \setbox\footins\box\footsofar
   \compose@footnotes
   \@combineinserts\@outputbox\footins
  }%
 }{%
 }%
}%
\def \@cflt{%
 \let \@elt \@comflelt
 \setbox\@tempboxa \vbox{}%
 \@toplist
 \setbox\@outputbox \vbox{%
  \boxmaxdepth \maxdepth
  \unvbox\@tempboxa\unskip
  \topfigrule\vskip \textfloatsep
  \unvbox\@outputbox
 }%
 \let\@elt\relax
 \xdef\@freelist{\@freelist\@toplist}%
 \global\let\@toplist\@empty
}%
\def \@cflb {%
 \let\@elt\@comflelt
 \setbox\@tempboxa \vbox{}%
 \@botlist
 \setbox\@outputbox \vbox{%
  \unvbox\@outputbox
  \vskip \textfloatsep\botfigrule
  \unvbox\@tempboxa\unskip
 }%
 \let\@elt\relax
 \xdef\@freelist{\@freelist\@botlist}%
 \global \let \@botlist\@empty
}%
\def\@combinedblfloats{%
 \@ifx@empty\@dbltoplist{}{%
  \setbox\@tempboxa\vbox{}%
  \let\@elt\@comdblflelt\@dbltoplist
  \let\@elt\relax\xdef\@freelist{\@freelist\@dbltoplist}%
  \global\let\@dbltoplist\@empty
  \setbox\@outputbox\vbox{%
   %\boxmaxdepth\maxdepth   %% probably not needed, CAR
   \unvbox\@tempboxa\unskip
   \@ifnum{\@dbltopnum>\m@ne}{\dblfigrule}{}%FIXME: how is \@dbltopnum maintained?
   \vskip\dbltextfloatsep
   \unvbox\@outputbox
  }%
 }%
}%
\def\set@column@hsize#1{%
 \pagegrid@col#1%
 \global\columnwidth\textwidth
 \global\advance\columnwidth\columnsep
 \global\divide\columnwidth\pagegrid@col
 \global\advance\columnwidth-\columnsep
 \global\hsize\columnwidth
 \global\linewidth\columnwidth
 \skip@\baselineskip\advance\skip@-\topskip
 \@ifnum{\pagegrid@col>\@ne}{\set@marry@skip}{}%
}%
\def\set@colht{%
 \set@adj@textheight\@colht
 \global\let\enlarge@colroom\@empty
 \set@colroom
}%
\def\set@adj@textheight#1{%
 \ltxgrid@info@sw{\class@info{\string\set@adj@textheight\string#1}\saythe\textheight}{}%
 #1\textheight
 \def\@elt{\adj@page#1}%
 \@booleantrue\firsttime@sw\@dbltoplist
 \let\@elt\relax
 \global#1#1\relax
 \ltxgrid@info@sw{\saythe#1}{}%
}%
\def\set@colroom{%
 \ltxgrid@info@sw{\class@info{\string\set@colroom}}{}%
 \set@adj@colht\@colroom
 \@if@empty\enlarge@colroom{}{%
  \global\advance\@colroom\enlarge@colroom\relax
  \ltxgrid@info@sw{\saythe\@colroom}{}%
 }%
 \@ifdim{\@colroom>\topskip}{}{%
  \ltxgrid@info{Not enough room: \string\@colroom=\the\@colroom; increasing to \the\topskip}%
  \@colroom\topskip
 }%
 \global\@colroom\@colroom
 \set@vsize
}%
\def\set@vsize{%
 \global\vsize\@colroom
 \ltxgrid@info@sw{\class@info{\string\set@vsize\string\vsize=\string\colroom}\saythe\vsize}{}%
}%
\def\set@adj@colht#1{%
 #1\@colht
 \ltxgrid@info@sw{\class@info{\string\set@adj@colht\string#1-\string\pagesofar}\saythe#1}{}%
 \@ifvoid\pagesofar{}{%
  \advance#1-\ht\pagesofar\advance#1-\dp\pagesofar
  \ltxgrid@info@sw{\class@info{\string\pagesofar}\saythe#1}{}%
 }%
 \def\@elt{\adj@column#1}%
 \@booleantrue\firsttime@sw\@toplist
 \@booleantrue\firsttime@sw\@botlist
 \let\@elt\relax
}%
\def\adj@column#1#2{%
 \advance#1-\ht#2%
 \advance#1-\firsttime@sw{\textfloatsep\@booleanfalse\firsttime@sw}{\floatsep}%
 \ltxgrid@info@sw{\class@info{\string\adj@column\string#1-\string#2}\saythe#1}{}%
}%
\def\adj@page#1#2{%
 \advance#1-\ht#2%
 \advance#1-\firsttime@sw{\dbltextfloatsep\@booleanfalse\firsttime@sw}{\dblfloatsep}%
 \ltxgrid@info@sw{\class@info{\string\adj@page\string#1-\string#2}\saythe#1}{}%
}%
\def\set@adj@box#1#2{%
 \@ifvoid#2{}{%
  \advance#1-\ht#2\advance#1-\dp#2%
  \@booleantrue\temp@sw
  \ltxgrid@foot@info@sw{\class@info{\string\set@adj@box\string#2}\saythe#1}{}%
 }%
}%
\appdef\@outputpage@tail{%
 \set@colht          % FIXME: needed?
 \@floatplacement    % FIXME: needed?
 \@dblfloatplacement % FIXME: needed?
}%
\begingroup
 \catcode`\1=\cat@letter
 \catcode`\2=\cat@letter
 \toks@{%
  \setbox\footins\box\footsofar
  \balance@two\col@1\@outputbox
  \global\setbox\col@1\box\col@1
  \global\setbox\@outputbox\box\@outputbox
  \combine@foot@inserts\footsofar\footins
 }%
 \aftergroup\def\aftergroup\balance@2\expandafter
\endgroup\expandafter{\the\toks@}%
\def\balance@two#1#2{%
 \ltxgrid@info@sw{\class@info{\string\balance@two\string#1\string#2}}{}%
 \outputdebug@sw{\trace@scroll{\showbox#1\showbox#2}}{}%
 \setbox\thr@@\copy\footsofar
 \setbox\@ne\vbox\bgroup
  \@ifvoid{#1}{}{%
   \recover@column#1\footsofar\column@recovered\footins@recovered
   \@ifvoid{#2}{}{\marry@baselines}%
  }%
  \@ifvoid{#2}{}{%
   \recover@column#2\footsofar\column@recovered\footins@recovered
  }%
 \egroup
 \outputdebug@sw{\trace@scroll{\showbox\@ne}}{}%
 \ltxgrid@foot@info@sw{\trace@scroll{\showbox\footsofar}}{}%
 \dimen@\ht\@ne\divide\dimen@\tw@
 \dimen@i\dimen@
 \vbadness\@M
 \vfuzz\maxdimen
 \splittopskip\topskip
 \loopwhile{%
  \setbox\z@\copy\@ne\setbox\tw@\vsplit\z@ to\dimen@
  \remove@depth\z@\remove@depth\tw@
  \dimen@ii\ht\tw@\advance\dimen@ii-\ht\z@
  \dimen@i=.5\dimen@i
  \ltxgrid@info@sw{\saythe\dimen@\saythe\dimen@i\saythe\dimen@ii}{}%
  \@ifdim{\dimen@ii<.5\p@}{%
   \@ifdim{\dimen@ii>-.5\p@}%
  }{%
   \false@sw
  }%
  {%
   \true@sw
  }{%
   \@ifdim{\dimen@i<.5\p@}%
  }%
  {%
   \false@sw
  }%
  {%
   \advance\dimen@\@ifdim{\dimen@ii<\z@}{}{-}\dimen@i
   \true@sw
  }%
 }%
 \ltxgrid@info@sw{\saythe\dimen@\saythe\dimen@i\saythe\dimen@ii}{}%
 \@ifdim{\ht\z@=\z@}{%
  \@ifdim{\ht\tw@=\z@}%
 }{%
  \true@sw
 }%
 {%
 }{%
  \ltxgrid@info{Unsatifactorily balanced columns: giving up}%
  \setbox\tw@\box#1%
  \setbox\z@ \box#2%
  \global\setbox\footsofar\box\thr@@
 }%
 \setbox\tw@\vbox{\unvbox\tw@\vskip\z@skip}%
 \setbox\z@ \vbox{\unvbox\z@ \vskip\z@skip}%
 \set@colht
 \dimen@\ht\z@\@ifdim{\dimen@<\ht\tw@}{\dimen@\ht\tw@}{}%
 \@ifdim{\dimen@>\@colroom}{\dimen@\@colroom}{}%
 \ltxgrid@info@sw{\saythe{\ht\z@}\saythe{\ht\tw@}\saythe\@colroom\saythe\dimen@}{}%
 \setbox#1\vbox to\dimen@{\unvbox\tw@\unskip\raggedcolumn@skip}%
 \setbox#2\vbox to\dimen@{\unvbox\z@ \unskip\raggedcolumn@skip}%
 \outputdebug@sw{\trace@scroll{\showbox#1\showbox#2}}{}%
}%
\def\remove@depth#1{%
  \setbox#1\vbox\bgroup
   \unvcopy#1%
   \setbox\z@\vbox\bgroup
    \unvbox#1%
    \setbox\z@\lastbox
    \aftergroup\kern\aftergroup-\expandafter
   \egroup
   \the\dp\z@\relax
  \egroup
}%
\def\recover@column#1#2#3#4{%
 \ltxgrid@info@sw{\class@info{\string\recover@column\string#1\string#2\string#3\string#4}}{}%
 \setbox#4\vbox{\unvcopy#1}%
 \ltxgrid@foot@info@sw{\trace@scroll{\showbox#4}}{}%
 \dimen@\ht#4%
 \ltxgrid@foot@info@sw{\saythe\dimen@}{}%
 \setbox#4\vbox\bgroup
  \unvbox#4\unskip
  \dimen@i\lastkern\unkern\advance\dimen@i\lastkern
  \@ifdim{\dimen@i=\z@}{%
   \dimen@i\lastkern\unkern
   \ltxgrid@foot@info@sw{\saythe\dimen@i}{}%
   \aftergroup\dimen@i
   \expandafter\egroup\the\dimen@i\relax
  }{%
   \egroup
  }%
 \@ifdim{\dimen@i<\z@}{%
  \advance\dimen@\dimen@i
  \ltxgrid@foot@info@sw{\saythe\dimen@i\saythe\dimen@}{}%
  \splittopskip\z@skip
  \global\setbox#3\vsplit#4 to\dimen@
  \global\setbox#4\vbox{\unvbox#4}%
  \ltxgrid@foot@info@sw{\trace@scroll{\showbox#1\showbox#2\showbox#3\showbox#4}}{}%
  \global\setbox#2\vbox\bgroup\unvbox#2\vskip\z@skip\unvbox#4\egroup
 }{%
  \setbox#3\box#4%
  \ltxgrid@foot@info@sw{\trace@scroll{\showbox#1\showbox#2\showbox#3\showbox#4}}{}%
 }%
 \unvbox#3%
 \loopwhile{\dimen@\lastskip\@ifdim{\dimen@>\z@}{\unskip\true@sw}{\false@sw}}%
}%
\def\recover@column@null#1#2#3#4{%
 \unvcopy#1%
}%
\prepdef\@begindocumenthook{%
 \open@column@one\@ne
 % open@column@one already sets the column height and available space.
 \@floatplacement
 \@dblfloatplacement
}%
\def\longtable@longtable{%
 \par
 \ifx\multicols\@undefined\else\ifnum\col@number>\@ne\@twocolumntrue\fi\fi
 \if@twocolumn\LT@err{longtable not in 1-column mode}\@ehc\fi
 \begingroup
 \@ifnextchar[\LT@array{\LT@array[x]}%
}%
\def\longtable@new{%
 \par
  \@ifnextchar[\LT@array{\LT@array[x]}%
}%
\def\endlongtable@longtable{%
  \crcr
  \noalign{%
    \let\LT@entry\LT@entry@chop
    \xdef\LT@save@row{\LT@save@row}}%
  \LT@echunk
  \LT@start
  \unvbox\z@
  \LT@get@widths
  \if@filesw
    {\let\LT@entry\LT@entry@write\immediate\write\@auxout{%
      \gdef\expandafter\noexpand
        \csname LT@\romannumeral\c@LT@tables\endcsname
          {\LT@save@row}}}%
  \fi
  \ifx\LT@save@row\LT@@save@row
  \else
    \LT@warn{Column \@width s have changed\MessageBreak
             in table \thetable}%
    \LT@final@warn
  \fi
  \endgraf\penalty -\LT@end@pen
  \endgroup
  \global\@mparbottom\z@
  \pagegoal\vsize
  \endgraf\penalty\z@\addvspace\LTpost
  \ifvoid\footins\else\insert\footins{}\fi
}%
\def\endlongtable@new{%
  \crcr
  \noalign{%
   \let\LT@entry\LT@entry@chop
   \xdef\LT@save@row{\LT@save@row}%
  }%
  \LT@echunk
  \LT@start
  \unvbox\z@
  \LT@get@widths
  \@if@sw\if@filesw\fi{%
   {%
    \let\LT@entry\LT@entry@write
    \immediate\write\@auxout{%
     \gdef\expandafter\noexpand\csname LT@\romannumeral\c@LT@tables\endcsname
     {\LT@save@row}%
    }%
   }%
  }{}%
  \@ifx{\LT@save@row\LT@@save@row}{}{%
   \LT@warn{%
    Column \@width s have changed\MessageBreak in table \thetable
   }\LT@final@warn
  }%
  \endgraf
  \nobreak
  \box\@ifvoid\LT@lastfoot{\LT@foot}{\LT@lastfoot}%
 \global\@mparbottom\z@
 \endgraf
 \LT@post
}%
\def\LT@start@longtable{%
  \let\LT@start\endgraf
  \endgraf\penalty\z@\vskip\LTpre
  \dimen@\pagetotal
  \advance\dimen@ \ht\ifvoid\LT@firsthead\LT@head\else\LT@firsthead\fi
  \advance\dimen@ \dp\ifvoid\LT@firsthead\LT@head\else\LT@firsthead\fi
  \advance\dimen@ \ht\LT@foot
  \dimen@ii\vfuzz
  \vfuzz\maxdimen
    \setbox\tw@\copy\z@
    \setbox\tw@\vsplit\tw@ to \ht\@arstrutbox
    \setbox\tw@\vbox{\unvbox\tw@}%
  \vfuzz\dimen@ii
  \advance\dimen@ \ht
        \ifdim\ht\@arstrutbox>\ht\tw@\@arstrutbox\else\tw@\fi
  \advance\dimen@\dp
        \ifdim\dp\@arstrutbox>\dp\tw@\@arstrutbox\else\tw@\fi
  \advance\dimen@ -\pagegoal
  \ifdim \dimen@>\z@\vfil\break\fi
      \global\@colroom\@colht
  \ifvoid\LT@foot\else
    \advance\vsize-\ht\LT@foot
    \global\advance\@colroom-\ht\LT@foot
    \dimen@\pagegoal\advance\dimen@-\ht\LT@foot\pagegoal\dimen@
    \maxdepth\z@
  \fi
  \ifvoid\LT@firsthead\copy\LT@head\else\box\LT@firsthead\fi
\nobreak
  \output{\LT@output}%
}%
\def\LT@start@new{%
 \let\LT@start\endgraf
 \endgraf
 \markthr@@{}%
 \LT@pre
 \@ifvoid\LT@firsthead{\LT@top}{\box\LT@firsthead\nobreak}%
 \mark@envir{longtable}%
}%
\def\LT@end@hd@ft@longtable#1{%
 \LT@echunk
 \ifx\LT@start\endgraf
  \LT@err{Longtable head or foot not at start of table}{Increase LTchunksize}%
 \fi
 \setbox#1\box\z@
 \LT@get@widths\LT@bchunk
}%
\def\LT@end@hd@ft@new#1{%
 \LT@echunk
 \@ifx{\LT@start\endgraf}{%
  \LT@err{Longtable head or foot not at start of table}{Increase LTchunksize}%
 }%
 \global\setbox#1\box\z@
 \LT@get@widths
 \LT@bchunk
}%
\def\LT@array@longtable[#1]#2{%
  \refstepcounter{table}\stepcounter{LT@tables}%
  \if l#1%
    \LTleft\z@ \LTright\fill
  \else\if r#1%
    \LTleft\fill \LTright\z@
  \else\if c#1%
    \LTleft\fill \LTright\fill
  \fi\fi\fi
  \let\LT@mcol\multicolumn
  \let\LT@@tabarray\@tabarray
  \let\LT@@hl\hline
  \def\@tabarray{%
    \let\hline\LT@@hl
    \LT@@tabarray}%
  \let\\\LT@tabularcr\let\tabularnewline\\%
  \def\newpage{\noalign{\break}}%
  \def\pagebreak{\noalign{\ifnum`}=0\fi\@testopt{\LT@no@pgbk-}4}%
  \def\nopagebreak{\noalign{\ifnum`}=0\fi\@testopt\LT@no@pgbk4}%
  \let\hline\LT@hline \let\kill\LT@kill\let\caption\LT@caption
  \@tempdima\ht\strutbox
  \let\@endpbox\LT@endpbox
  \ifx\extrarowheight\@undefined
    \let\@acol\@tabacol
    \let\@classz\@tabclassz \let\@classiv\@tabclassiv
    \def\@startpbox{\vtop\LT@startpbox}%
    \let\@@startpbox\@startpbox
    \let\@@endpbox\@endpbox
    \let\LT@LL@FM@cr\@tabularcr
  \else
    \advance\@tempdima\extrarowheight
    \col@sep\tabcolsep
    \let\@startpbox\LT@startpbox\let\LT@LL@FM@cr\@arraycr
  \fi
  \setbox\@arstrutbox\hbox{\vrule
    \@height \arraystretch \@tempdima
    \@depth \arraystretch \dp \strutbox
    \@width \z@}%
  \let\@sharp##\let\protect\relax
   \begingroup
    \@mkpream{#2}%
    \xdef\LT@bchunk{%
       \global\advance\c@LT@chunks\@ne
       \global\LT@rows\z@\setbox\z@\vbox\bgroup
       \LT@setprevdepth
       \tabskip\LTleft \noexpand\halign to\hsize\bgroup
      \tabskip\z@ \@arstrut \@preamble \tabskip\LTright \cr}%
  \endgroup
  \expandafter\LT@nofcols\LT@bchunk&\LT@nofcols
  \LT@make@row
  \m@th\let\par\@empty
  \everycr{}\lineskip\z@\baselineskip\z@
  \LT@bchunk}%
\def\LT@LR@l{\LTleft\z@   \LTright\fill}%
\def\LT@LR@r{\LTleft\fill \LTright\z@  }%
\def\LT@LR@c{\LTleft\fill \LTright\fill}%
\def\LT@array@new[#1]#2{%
 \refstepcounter{table}\stepcounter{LT@tables}%
 \table@hook
 \LTleft\fill \LTright\fill
 \csname LT@LR@#1\endcsname
 \let\LT@mcol\multicolumn
 \let\LT@@hl\hline
 \prepdef\@tabarray{\let\hline\LT@@hl}%
 \let\\\LT@tabularcr
 \let\tabularnewline\\%
 \def\newpage{\noalign{\break}}%
 \def\pagebreak{\noalign{\ifnum`}=0\fi\@testopt{\LT@no@pgbk-}4}%
 \def\nopagebreak{\noalign{\ifnum`}=0\fi\@testopt\LT@no@pgbk4}%
 \let\hline\LT@hline
 \let\kill\LT@kill
 \let\caption\LT@caption
 \@tempdima\ht\strutbox
 \let\@endpbox\LT@endpbox
 \@ifxundefined\extrarowheight{%
  \let\@acol\@tabacol
  \let\@classz\@tabclassz
  \let\@classiv\@tabclassiv
  \def\@startpbox{\vtop\LT@startpbox}%
  \let\@@startpbox\@startpbox
  \let\@@endpbox\@endpbox
  \let\LT@LL@FM@cr\@tabularcr@LaTeX
  \let\@xtabularcr\@xtabularcr@LaTeX
 }{%
  \advance\@tempdima\extrarowheight
  \col@sep\tabcolsep
  \let\@startpbox\LT@startpbox
  \let\LT@LL@FM@cr\@arraycr@array
 }%
 \let\@acoll\@tabacoll
 \let\@acolr\@tabacolr
 \let\@acol\@tabacol
 \setbox\@arstrutbox\hbox{%
  \vrule
  \@height \arraystretch \@tempdima
  \@depth \arraystretch \dp \strutbox
  \@width \z@
 }%
 \let\@sharp##%
 \let\protect\relax
 \begingroup
  \@mkpream{#2}%
  \@mkpream@relax
  \edef\@preamble{\@preamble}%
  \prepdef\@preamble{%
   \global\advance\c@LT@chunks\@ne
   \global\LT@rows\z@
   \setbox\z@\vbox\bgroup
    \LT@setprevdepth
    \tabskip\LTleft
    \halign to\hsize\bgroup
     \tabskip\z@
     \@arstrut
  }%
  \appdef\@preamble{%
     \tabskip\LTright
     \cr
  }%
  \global\let\LT@bchunk\@preamble
 \endgroup
 \expandafter\LT@nofcols\LT@bchunk&\LT@nofcols
 \LT@make@row
 \m@th
 \let\par\@empty
 \everycr{}%
 \lineskip\z@
 \baselineskip\z@
 \LT@bchunk
}%
\appdef\table@hook{}%
\def\switch@longtable{%
 \@ifpackageloaded{longtable}{%
  \@ifx{\longtable\longtable@longtable}{%
   \@ifx{\endlongtable\endlongtable@longtable}{%
    \@ifx{\LT@start\LT@start@longtable}{%
     \@ifx{\LT@end@hd@ft\LT@end@hd@ft@longtable}{%
      \@ifx{\LT@array\LT@array@longtable}{%
       \true@sw
      }{\false@sw}%
     }{\false@sw}%
    }{\false@sw}%
   }{\false@sw}%
  }{\false@sw}%
  {%
   \class@info{Patching longtable package}%
  }{%
   \class@info{Patching unrecognized longtable package. (Proceeding with fingers crossed)}%
  }%
  \let\longtable\longtable@new
  \let\endlongtable\endlongtable@new
  \let\LT@start\LT@start@new
  \let\LT@end@hd@ft\LT@end@hd@ft@new
  \let\LT@array\LT@array@new
  \newenvironment{longtable*}{%
   \onecolumngrid@push
   \longtable
  }{%
   \endlongtable
   \onecolumngrid@pop
  }%
 }{}%
}%
\def\LT@pre{\penalty\z@\vskip\LTpre}%
\def\LT@bot{\nobreak\copy\LT@foot\vfil}%
\def\LT@top{\copy\LT@head\nobreak}%
\def\LT@post{\penalty\z@\addvspace\LTpost\mark@envir{\curr@envir}}%
\def\LT@adj{%
 \setbox\z@\vbox{\null}\dimen@-\ht\z@
 \setbox\z@\vbox{\unvbox\z@\LT@bot}\advance\dimen@\ht\z@
 \global\advance\vsize-\dimen@
}%
\def\output@init@longtable{\LT@adj}%
\def\output@prep@longtable{\setbox\@cclv\vbox{\unvbox\@cclv\LT@bot}}%
\def\output@post@longtable{\LT@top}%
\let\output@init@theindex\@empty
\let\output@prep@theindex\@empty
\def\output@post@theindex{%
 \@ifodd\c@page{}{%
  \@ifnum{\pagegrid@cur=\@ne}{%
  }%
 }%
}%
\def\check@aux{\do@output@MVL{\do@check@aux}}%
\def\check@deferlist@stuck#1{%
 \@ifx{\@deferlist@postshipout\@empty}{}{%
  \@ifx{\@deferlist@postshipout\@deferlist}{%
   \@fltstk
   \clearpage@sw{%
    \ltxgrid@warn{Deferred float stuck during \string\clearpage\space processing}%
   }{%
    \force@deferlist@stuck#1%
   }%
  }{%
  }%
  \global\let\@deferlist@postshipout\@empty
 }%
}%
\def\@fltstk{%
 \@latex@warning{A float is stuck (cannot be placed without \string\clearpage)}%
}%
\appdef\@outputpage@tail{%
 \global\let\@deferlist@postshipout\@deferlist
}%
\def\@next#1#2{%
 \@ifx{#2\@empty}{\false@sw}{%
  \expandafter\@xnext#2\@@#1#2%
  \true@sw
 }%
}%
\def\@xnext\@elt#1#2\@@#3#4{%
 \def#3{#1}%
 \gdef#4{#2}%
 \def\@tempa{#4}\def\@tempb{\@freelist}%
 \@ifx{\@tempa\@tempb}{%
  \@ifx{#4\@empty}{%
   \force@deferlist@empty%{Float register pool exhausted}%
  }{}%
 }{}%
}%
\def\force@deferlist@stuck#1{%
 \force@deferlist@sw{%
  \@booleantrue\clearpage@sw
  \@booleantrue\forcefloats@sw
  #1%
 }{%
 }%
}%
\def\force@deferlist@empty{%
 \force@deferlist@sw{%
  \penalty-\pagebreak@pen
  \protect@penalty\do@forcecolumn@pen
 }{%
 }%
}%
\@booleanfalse\force@deferlist@sw
\mathchardef\do@forcecolumn@pen=10009
\@namedef{output@-\the\do@forcecolumn@pen}{\do@forcecolumn}%
\def\do@forcecolumn{%
 \@booleantrue\clearpage@sw
 \@booleantrue\forcefloats@sw
 \do@startcolumn
}%
\def\enlargethispage{%
 \@ifstar{%
  \@enlargethispage{}%
 }{%
  \@enlargethispage{}%
 }%
}%
\def\@enlargethispage#1#2{%
 \begingroup
  \dimen@#2\relax
  \edef\@tempa{#1}%
  \edef\@tempa{\noexpand\@@enlargethispage{\@tempa}{\the\dimen@}}%
  \expandafter\do@output@MVL\expandafter{\@tempa}%
 \endgroup
}%
\def\@@enlargethispage#1#2{%
 \def\@tempa{one}%
 \@ifx{\thepagegrid\@tempa}{%
  \true@sw
 }{%
  \def\@tempa{mlt}%
  \@ifx{\thepagegrid\@tempa}{%
   \@ifnum{\pagegrid@cur=\@ne}{%
    \gdef\enlarge@colroom{#2}%
    \true@sw
   }{%
    \ltxgrid@warn{Too late to enlarge this page; move the command to the first column.}%
    \false@sw
   }%
  }{%
   \ltxgrid@warn{Unable to enlarge a page of this kind.}%
   \false@sw
  }%
 }%
 {%
  \class@info{Enlarging page \thepage\space by #2}%
  \global\advance\@colroom#2\relax
  \set@vsize
 }{%
 }%
}%
\let\enlarge@colroom\@empty
\let\@kludgeins\@undefined
\@booleantrue\textheight@sw
\prepdef\@outputpage@head{%
 \textheight@sw{%
  \count@\vbadness\vbadness\@M
  \dimen@\vfuzz\vfuzz\maxdimen
  \setbox\@outputbox\vbox to\textheight{\unvbox\@outputbox}%
  \vfuzz\dimen@
  \vbadness\count@
 }{}%
}%
\appdef\@outputpage@head{%
 \@ifx{\LS@rot\@undefined}{}{\LS@rot}%
}%
\def\ltxgrid@info{%
 \ltxgrid@info@sw{\class@info}{\@gobble}%
}%
\@booleanfalse\ltxgrid@info@sw
\def\ltxgrid@warn{%
 \ltxgrid@warn@sw{\class@warn}{\@gobble}%
}%
\@booleantrue\ltxgrid@warn@sw
\@booleanfalse\ltxgrid@foot@info@sw
\def\def@next@handler#1#2#3{%
 \advance#1\@ne\mathchardef#2\the#1%
 \expandafter\def\csname output@-\the#1\endcsname{#3}%
}%
\def\def@line@handler#1#2{%
 \begingroup
  \@tempcnta\int@parpenalty
  \advance\@tempcnta-#1%
  \aftergroup\def
  \expandafter\aftergroup\csname output@-\the\@tempcnta\endcsname
 \endgroup{#2}%
}%
\mathchardef\int@parpenalty11012
\def@line@handler\z@{\@handle@line@ltx{}{}{}}%
\def@line@handler\@ne{\@handle@line@ltx{}{}{\brokenpenalty@ltx}}%
\def@line@handler\tw@{\@handle@line@ltx{}{\clubpenalty@ltx}{}}%
\def@line@handler\thr@@{\@handle@line@ltx{\clubpenalty@ltx}{}{\brokenpenalty@ltx}}%
\def@line@handler\f@ur{\@handle@line@ltx{\widowpenalty@ltx}{}{}}%
\def@line@handler{5}{\@handle@line@ltx{\widowpenalty@ltx}{}{\brokenpenalty@ltx}}%
\def@line@handler{6}{\@handle@line@ltx{\widowpenalty@ltx}{\clubpenalty@ltx}{}}%
\def@line@handler{7}{\@handle@line@ltx{\widowpenalty@ltx}{\clubpenalty@ltx}{\brokenpenalty@ltx}}%
\def@line@handler{8}{\@handle@line@ltx{\displaywidowpenalty@ltx}{}{}}%
\def@line@handler{9}{\@handle@line@ltx{\displaywidowpenalty@ltx}{}{\brokenpenalty@ltx}}%
\def@line@handler{10}{\@handle@line@ltx{\displaywidowpenalty@ltx}{\clubpenalty@ltx}{}}%
\def@line@handler{11}{\@handle@line@ltx{\displaywidowpenalty@ltx}{\clubpenalty@ltx}{\brokenpenalty@ltx}}%
\def\@handle@line@ltx#1#2#3{%
 \@@handle@line@ltx
 \@tempcnta\lastpenalty
 \@tempcntb\interlinepenalty@ltx\relax
 \@if@empty{#1}{}{\advance\@tempcntb#1\relax}%
 \@if@empty{#2}{}{\advance\@tempcntb#2\relax}%
 \@if@empty{#3}{}{\advance\@tempcntb#3\relax}%
 \penalty\@ifnum{\@tempcnta<\@tempcntb}{\@tempcntb}{\@tempcnta}%
}%
\let\@@handle@line@ltx\@empty
\@tempcnta\int@parpenalty
\def@next@handler\@tempcnta\int@postparpenalty{\reset@queues@ltx\handle@par@ltx}%
\def@next@handler\@tempcnta\int@vadjustpenalty{\handle@vadjust@ltx}%
\def@next@handler\@tempcnta\int@whatsitpenalty{\handle@whatsit@ltx}%
\def@next@handler\@tempcnta\int@predisplaypenalty{\reset@queues@ltx\@handle@display@ltx{\predisplaypenalty@ltx}}%
\def@next@handler\@tempcnta\int@interdisplaylinepenalty{\@handle@display@ltx{\interdisplaylinepenalty@ltx}}%
\def@next@handler\@tempcnta\int@postdisplaypenalty{\@handle@display@ltx{\postdisplaypenalty@ltx}}%
\def\@handle@display@ltx#1{%
 \@@handle@display@ltx
 \@tempcnta\lastpenalty
 \@tempcntb#1%
 \penalty\@ifnum{\@tempcnta<\@tempcntb}{\@tempcntb}{\@tempcnta}%
}%
\let\@@handle@display@ltx\@empty
\def\handle@par@ltx{}%
\def\set@linepenalties{%
 \expandafter\def\expandafter\interlinepenalty@ltx\expandafter{\the\interlinepenalty}%
 \interlinepenalty-\int@parpenalty
 \expandafter\def\expandafter\brokenpenalty@ltx\expandafter{\the\brokenpenalty}%
 \brokenpenalty\@ne
 \expandafter\def\expandafter\clubpenalty@ltx\expandafter{\the\clubpenalty}%
 \clubpenalty\tw@
 \expandafter\def\expandafter\widowpenalty@ltx\expandafter{\the\widowpenalty}%
 \widowpenalty\f@ur
 \expandafter\def\expandafter\displaywidowpenalty@ltx\expandafter{\the\displaywidowpenalty}%
 \displaywidowpenalty8\relax
}%
\def\restore@linepenalties{%
 \interlinepenalty\interlinepenalty@ltx
 \brokenpenalty\brokenpenalty@ltx
 \clubpenalty\clubpenalty@ltx
 \widowpenalty\widowpenalty@ltx
 \displaywidowpenalty\displaywidowpenalty@ltx
 \relax
}%
\def\set@displaypenalties#1{%
 \expandafter\def\expandafter\predisplaypenalty@ltx\expandafter{\the\predisplaypenalty}%
 \expandafter\def\expandafter\interdisplaylinepenalty@ltx\expandafter{\the\interdisplaylinepenalty}%
 \expandafter\def\expandafter\postdisplaypenalty@ltx\expandafter{\the\postdisplaypenalty}%
 \@ifhmode{\predisplaypenalty-\int@predisplaypenalty\relax}{}%
 #1{\interdisplaylinepenalty-\int@interdisplaylinepenalty\relax}{}%
 #1{\postdisplaypenalty-\int@postdisplaypenalty\relax}{}%
}%
\def\enqueue@whatsit@ltx#1{%
 \gappdef\g@whatsit@queue{{#1}}%
 \vadjust{\penalty-\int@whatsitpenalty}%
}%
\def\handle@whatsit@ltx{%
 \unvbox\@cclv
 \g@pop@ltx\g@whatsit@queue\@tempa
 \expandafter\do@whatsit\expandafter{\@tempa}%
}%
\def\do@whatsit#1{}%
\def\g@pop@ltx#1#2{%
 \expandafter\@g@pop@ltx#1{}{}\@@#1#2%
}%
\def\@g@pop@ltx#1#2\@@#3#4{%
 \gdef#3{#2}%
 \def#4{#1}%
}%
\let\vspace@ltx\vspace
\let\pagebreak@ltx\pagebreak
\let\nopagebreak@ltx\nopagebreak
\let\endline@ltx\\
\let\@arrayparboxrestore@ltx\@arrayparboxrestore
\def\@vspace@org #1{%
  \ifvmode
    \vskip #1
    \vskip\z@skip
   \else
     \@bsphack
     \vadjust{\@restorepar
              \vskip #1
              \vskip\z@skip
              }%
     \@esphack
   \fi
}%
\def\@vspace@ltx#1{%
 \@ifvmode{%
  \vskip#1\vskip\z@skip
 }{%
  \@bsphack
  \ex@vadjust@ltx{%
   \@restorepar
   \nobreak
   \vskip#1\vskip\z@skip
  }%
  \@esphack
 }%
}%
\def\@vspacer@org#1{%
  \ifvmode
    \dimen@\prevdepth
    \hrule \@height\z@
    \nobreak
    \vskip #1
    \vskip\z@skip
    \prevdepth\dimen@
  \else
    \@bsphack
    \vadjust{\@restorepar
             \hrule \@height\z@
             \nobreak
             \vskip #1
             \vskip\z@skip}%
    \@esphack
\fi
}%
\def\@vspacer@ltx#1{%
 \@ifvmode{%
  \dimen@\prevdepth
  \hrule\@height\z@
  \nobreak
  \vskip#1\vskip\z@skip
  \prevdepth\dimen@
 }{%
  \@bsphack
  \ex@vadjust@ltx{%
   \@restorepar
   \hrule\@height\z@
   \nobreak
   \vskip#1\vskip\z@skip
  }%
  \@esphack
 }%
}%
\def\@no@pgbk@org #1[#2]{%
  \ifvmode
    \penalty #1\@getpen{#2}%
  \else
    \@bsphack
    \vadjust{\penalty #1\@getpen{#2}}%
    \@esphack
  \fi
}%
\def\@no@pgbk@ltx#1[#2]{%
 \@ifvmode{%
  \penalty#1\@getpen{#2}%
 }{%
  \@bsphack
  \ex@vadjust@ltx{%
   \penalty#1\@getpen{#2}%
  }%
  \@esphack
 }%
}%
\long\def\end@line@org{%
 \let\reserved@e\relax
 \let\reserved@f\relax
 \@ifstar{%
  \let\reserved@e\vadjust
  \let\reserved@f\nobreak
  \@xnewline
 }%
 \@xnewline
}%
\long\def\end@line@ltx{%
 \let\reserved@e\relax
 \let\reserved@f\relax
 \@ifstar{%
  \let\reserved@e\ex@vadjust@ltx
  \let\reserved@f\nobreak
  \@xnewline
 }{%
  \@xnewline
 }%
}%
\def\@newline@org[#1]{%
 \let\reserved@e\vadjust
 \@gnewline{\vskip#1}%
}%
\def\@newline@ltx[#1]{%
 \let\reserved@e\ex@vadjust@ltx
 \@gnewline{\vskip#1}%
}%
 \@ifx{\@vspace\@vspace@org}{%
  \@ifx{\@vspacer\@vspacer@org}{%
   \@ifx{\@no@pgbk\@no@pgbk@org}{%
    \@ifx{\@newline\@newline@org}{%
     \expandafter\@ifx\expandafter{\csname\expandafter\@gobble\string\\ \endcsname\end@line@org}{%
      \true@sw
     }{\false@sw}%
    }{\false@sw}%
   }{\false@sw}%
  }{\false@sw}%
 }{\false@sw}%
 {%
  \class@info{Overriding \string\@vspace, \string\@vspacer, \string\@no@pgbk, \string\@newline, and \string\\ }%
  \let\@normalcr\end@line@ltx
  \expandafter\let\csname\expandafter\@gobble\string\\ \endcsname\@normalcr
  \let\@newline\@newline@ltx
  \let\@vspace\@vspace@ltx
  \let\@vspacer\@vspacer@ltx
  \let\@no@pgbk\@no@pgbk@ltx
 }{%
  \class@warn{%
   Failed to recognize \string\@vspace, \string\@vspacer, \string\@no@pgbk, \string\@newline, and \string\\;
   no patches applied. Please get a more up-to-date class,
  }%
 }%
\let\ex@vadjust@ltx\vadjust
\def\enqueue@vadjust@ltx#1{%
 \gappdef\g@vadjust@queue{{#1}}%
 \vadjust{\penalty-\int@vadjustpenalty}%
}%
\def\handle@vadjust@ltx{%
 \unvbox\@cclv
 \g@pop@ltx\g@vadjust@queue\@tempa
 \expandafter\gappdef\expandafter\g@vadjust@line\expandafter{\@tempa}%
}%
\let\g@vadjust@line\@empty
\def\reset@queues@ltx{%
 \global\let\g@whatsit@queue\@empty
 \global\let\g@vadjust@queue\@empty
}%
\newcommand\linenomathWithnumbers@LN{%
  \ifLineNumbers
    \ifnum\interlinepenalty>-\linenopenaltypar
      \global\holdinginserts\thr@@
      \advance\interlinepenalty \linenopenalty
     \ifhmode
      \advance\predisplaypenalty \linenopenalty
     \fi
      \advance\postdisplaypenalty \linenopenalty
      \advance\interdisplaylinepenalty \linenopenalty
    \fi
  \fi
  \ignorespaces
}%
\newcommand\linenomathNonumbers@LN{%
  \ifLineNumbers
    \ifnum\interlinepenalty>-\linenopenaltypar
      \global\holdinginserts\thr@@
      \advance\interlinepenalty \linenopenalty
     \ifhmode
      \advance\predisplaypenalty \linenopenalty
     \fi
    \fi
  \fi
  \ignorespaces
}%
\def\endlinenomath@LN{%
  \ifLineNumbers
   \global\holdinginserts\@LN@outer@holdins
  \fi
  \global\@ignoretrue
}
\def\linenumberpar@LN{%
  \ifvmode \@@@par \else
    \ifinner \@@@par \else
      \xdef\@LN@outer@holdins{\the\holdinginserts}%
      \advance \interlinepenalty \linenopenalty
      \linenoprevgraf \prevgraf
      \global \holdinginserts \thr@@
      \@@@par
      \ifnum\prevgraf>\linenoprevgraf
        \penalty-\linenopenaltypar
      \fi
      \@LN@parpgbrk
      \global\holdinginserts\@LN@outer@holdins
      \advance\interlinepenalty -\linenopenalty
    \fi
  \fi
}%
\appdef\class@documenthook{%
 \@ifpackageloaded{lineno}{%
  \@ifx{\linenomathWithnumbers\linenomathWithnumbers@LN}{%
   \@ifx{\linenomathNonumbers\linenomathNonumbers@LN}{%
    \@ifx{\endlinenomath\endlinenomath@LN}{%
     \@ifx{\linenumberpar\linenumberpar@LN}{%
      \true@sw
     }{\false@sw}%
    }{\false@sw}%
   }{\false@sw}%
  }{\false@sw}%
  {%
   \class@info{Overriding lineo.sty, restoring output routine,}%
   \let\linenumberpar\linenumberpar@ltx
   \let\endlinenomath\endlinenomath@ltx
   \expandafter\let\csname endlinenomath*\endcsname\endlinenomath@ltx
   \let\linenomathWithnumbers\linenomathWithnumbers@ltx
   \let\linenomathNonumbers\linenomathNonumbers@ltx
   \let\ex@vadjust@ltx\ex@vadjust@line
   \let\@LN@postlabel\enqueue@whatsit@ltx
   \let\do@whatsit\write@linelabel
   \let\handle@par@ltx\handle@par@LN
   \let\@@handle@line@ltx\Make@LineNo@ltx
   \let\@@handle@display@ltx\Make@LineNo@ltx
   \output@latex{\natural@output}%
   \let\vspace\vspace@ltx
   \let\pagebreak\pagebreak@ltx
   \let\nopagebreak\nopagebreak@ltx
   \let\@arrayparboxrestore\@arrayparboxrestore@ltx
   \let\\\endline@ltx
   \appdef\set@footnotefont{%
    \let\par\@@@par
    \let\@@par\@@@par
   }%
   \@if@sw\ifLineNumbers\fi{%
    \class@info{Reinvoke \string\linenumbers}%
    \let\@@par\linenumberpar
    \@ifx{\@par\linenumberpar@LN}{\let\@par\linenumberpar}{}%
    \@ifx{\par\linenumberpar@LN}{\let\par\linenumberpar}{}%
   }{%
    \class@info{Line numbering not turned on yet}%
   }%
  }{%
   \class@warn{Failed to recognize lineno.sty procedures; no patches applied. Please get a more up-to-date class.}%
  }%
 }{%
 }%
}%
\def\linenumberpar@ltx{\@ifvmode{\@@@par}{\@linenumberpar}}%
\def\@linenumberpar{%
   \linenoprevgraf\prevgraf
   \set@linepenalties
   \@@@par
   \@ifnum{\prevgraf>\linenoprevgraf}{
    \penalty-\int@postparpenalty
   }{}%
   \@LN@parpgbrk
   \restore@linepenalties
}%
\newcommand\linenomathWithnumbers@ltx{\@linenomathnumbers@ltx\true@sw}%
\newcommand\linenomathNonumbers@ltx{\@linenomathnumbers@ltx\false@sw}%
\def\@linenomathnumbers@ltx#1{%
 \@if@sw\ifLineNumbers\fi{%
   \set@linepenalties
   \set@displaypenalties#1%
 }{}%
 \ignorespaces
}%
\def\endlinenomath@ltx{%
 \global\@ignoretrue
}%
\def\handle@par@LN{%
 \Make@LineNo@ltx
 \@tempcnta\lastpenalty
 \@ifnum{\@tempcnta=\z@}{}{%
  \expandafter\gdef
  \expandafter\@LN@parpgbrk
  \expandafter{%
   \expandafter\penalty
               \the\@tempcnta
   \global\let\@LN@parpgbrk\@LN@screenoff@pen
  }%
 }%
}%
\def\Make@LineNo@ltx{%
 \@LN@maybe@normalLineNumber
 \boxmaxdepth\maxdimen\setbox\z@\vbox{\unvbox\@cclv}%
 \@tempdima\dp\z@
 \unvbox\z@
 \sbox\@tempboxa{\hb@xt@\z@{\makeLineNumber}}%
 \ht\@tempboxa\z@
 \@LN@depthbox
 \stepLineNumber
 \g@vadjust@line
 \global\let\g@vadjust@line\@empty
}%
\def\write@linelabel#1{%
 \protected@write\@auxout{}{%
  \string\newlabel{#1}{{\theLineNumber}{\thepage}{}{}{}}%
 }%
}%
\def\ex@vadjust@line{%
 \@if@sw\ifLineNumbers\fi{\enqueue@vadjust@ltx}{\vadjust}%
}%

% Public switches use REVTeX's grid rather than the kernel twocolumn flag.
\def\onecolumn{\onecolumngrid}
\def\twocolumn{\@ifnextchar[\ijgtp@twocolumnblock{\twocolumngrid}}
\long\def\ijgtp@twocolumnblock[#1]{\onecolumngrid #1\par\twocolumngrid}
% REVTeX's widetext@grid rules are leaders in discardable vertical glue:
% they disappear at a page break rather than becoming orphaned rules.
\newbox\ijgtp@widetop
\newbox\ijgtp@widebottom
\newenvironment{widetext}{%
  \let\ijgtp@endwide\relax
  \ifnum\pagegrid@col>1
    \let\ijgtp@endwide\ijgtp@endwidetext
    \par
    \setbox\ijgtp@widetop\vbox{%
      \hb@xt@\hsize{\leaders\hrule\hfil\vrule\@height6\p@}}%
    \setbox\ijgtp@widebottom\hb@xt@\hsize{%
      \vrule\@depth6\p@\leaders\hrule\hfil}%
    \onecolumngrid
    \vskip10\p@
    \dimen@\ht\ijgtp@widetop\advance\dimen@\dp\ijgtp@widetop
    \cleaders\box\ijgtp@widetop\vskip\dimen@
    \vskip6\p@
    \prepdef\equation{\ijgtp@prepmath}%
    \prepdef\eqnarray{\ijgtp@prepmath}%
  \fi
  \ignorespaces
}{\ijgtp@endwide}
\def\ijgtp@prepmath{\@ifvmode{\everypar{{\setbox\z@\lastbox}}}{}}%
\def\ijgtp@endwidetext{%
  \par\vskip6\p@
  \setbox\ijgtp@widebottom\vbox{%
    \hb@xt@\hsize{\hfil\box\ijgtp@widebottom}}%
  \dimen@\ht\ijgtp@widebottom\advance\dimen@\dp\ijgtp@widebottom
  \cleaders\box\ijgtp@widebottom\vskip\dimen@
  \vskip8.5\p@
  \twocolumngrid\global\@ignoretrue\@endpetrue
}
\AtBeginDocument{\document@inithook\class@documenthook
  \ifijgtp@initialtwocolumn\twocolumngrid\fi}
% END REVTeX page-grid implementation.


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
  \onecolumngrid % recover any full-width material saved above the columns
  \clearpage % finish the old paper, including its pending body transition
  % Keep the old paper's pending transition active while REVTeX drains
  % its queued float pages. User geometry commands cancel that transition.
  \ijgtp@originalnewgeometry{left=2.5cm,right=2.5cm,top=1.9cm,bottom=1.95cm}%
  \xdef\ijgtp@bodygeometry{%
    \global\topmargin=\the\topmargin\relax
    \global\textheight=\the\textheight\relax
    \global\@colht=\the\textheight\relax}%
  \ijgtp@originalnewgeometry{left=2.5cm,right=2.5cm,top=0.82cm,bottom=2.3cm}%
  \set@column@hsize\pagegrid@col\set@colht
  \global\ijgtp@bodygeometrypendingtrue
}
\AtBeginDocument{%
  % Explicit layout changes override the scheduled body layout. Cancel before
  % their clearpage, so shipping the title cannot undo the user's request.
  \let\ijgtp@originalnewgeometry\newgeometry
  \renewcommand*{\newgeometry}[1]{%
    \global\ijgtp@bodygeometrypendingfalse
    \ijgtp@originalnewgeometry{#1}%
    \set@column@hsize\pagegrid@col\set@colht}%
  \let\ijgtp@originalrestoregeometry\restoregeometry
  \renewcommand*{\restoregeometry}{%
    \global\ijgtp@bodygeometrypendingfalse
    \ijgtp@originalrestoregeometry
    \set@column@hsize\pagegrid@col\set@colht}%
  \let\ijgtp@originalloadgeometry\loadgeometry
  \renewcommand*{\loadgeometry}[1]{%
    \global\ijgtp@bodygeometrypendingfalse
    \ijgtp@originalloadgeometry{#1}%
    \set@column@hsize\pagegrid@col\set@colht}%
  % Run after a complete physical page (both columns in two-column mode).
  % The output routine then derives the next column room from @colht.
  % Do not call newgeometry here: its clearpage would re-enter page output.
  \g@addto@macro\@outputpage{%
    \ifijgtp@bodygeometrypending
      \global\ijgtp@bodygeometrypendingfalse
      \ijgtp@bodygeometry
      \set@colht
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
% REVTeX queues page output. Write LastPage only after that queue drains,
% using the same output callback as REVTeX's clear@document.
\AtBeginDocument{%
  \let\ijgtp@putlastpagelabel\lastpage@putl@bel
  \def\lastpage@putl@bel{\do@output@cclv{\ijgtp@putlastpagelabel}}%
}
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
  \@ifstar\ijgtp@widecontents\ijgtp@printcontents
}
\newcommand*{\ijgtp@widecontents}{%
  \onecolumngrid@push
  \ijgtp@printcontents
  % Finish queued grid operations before checking the remaining page space.
  % REVTeX clamps a nearly empty column to topskip, which cannot accommodate
  % a section heading and its first lines. Break while still full-width.
  \penalty\z@
  \ifx\restorecolumngrid\@empty\else
    \begingroup
      \dimen@\pagegoal \advance\dimen@-\pagetotal
      \ifdim\dimen@<4\baselineskip
        \newpage\penalty\z@
      \fi
    \endgroup
  \fi
  \onecolumngrid@pop
}
\newcommand*{\ijgtp@printcontents}{%
  \begingroup
    \hypersetup{linkcolor=black}%
    \ijgtp@tocpaper{0}%
    \let\ijgtp@origcontentsline\contentsline
    \def\contentsline##1##2##3##4{%
      \ifnum\value{ijgtpmaketitlecount}=0\relax
        \ijgtp@origcontentsline{##1}{##2}{##3}{##4}%
      \else
        \ifnum\ijgtp@tocpaperid=\value{ijgtpmaketitlecount}\relax
          \ijgtp@origcontentsline{##1}{##2}{##3}{##4}%
        \fi
      \fi
    }%
    \ifijgtp@tocfirstcall
      \section*{\contentsname
        \@mkboth{\MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
      \ijgtp@cachedtoc
    \else
      \global\ijgtp@tocfirstcalltrue
      \ijgtp@originaltableofcontents
    \fi
    \par
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
% LaTeX uses \abstract as the environment's begin command. Dispatch by
% the current environment so both public forms share the same collector.
\let\ijgtp@abstractenvironment\abstract
\renewcommand{\abstract}{%
  \def\ijgtp@abstractname{abstract}%
  \ifx\@currenvir\ijgtp@abstractname
    \let\ijgtp@abstractnext\ijgtp@abstractenvironment
  \else
    \let\ijgtp@abstractnext\ijgtp@abstractcommand
  \fi
  \ijgtp@abstractnext
}
\long\def\ijgtp@abstractcommand#1{\begin{abstract}#1\end{abstract}}

\newcommand{\ijgtp@papertypetext}{Article}
\newcommand{\papertype}[1]{%
  \gdef\ijgtp@papertypetext{#1}%
}

\let\articletype\papertype

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

\newcommand{\ijgtp@affiliationkey}[1]{%
  % Expand text macros but keep robust formatting commands (notably \\)
  % intact while constructing the duplicate-affiliation key.
  \protected@edef\ijgtp@affcandidate{#1}%
  \edef\ijgtp@affcandidate{\expandafter\detokenize\expandafter{\ijgtp@affcandidate}}%
}
\newcommand{\ijgtp@hashaffiliation}[1]{%
  \ijgtp@affiliationkey{#1}%
  \edef\ijgtp@affhash{\pdfmdfivesum{\ijgtp@affcandidate}}%
}
% A linear lookup is sufficient for the small affiliation list when the
% engine has no MD5 primitive. Use the same protected expansion and string key.
\@ifundefined{pdfmdfivesum}{%
  \renewcommand{\ijgtp@hashaffiliation}[1]{%
    \ijgtp@affiliationkey{#1}%
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

% Keep initialization and cleanup in sync when adding author metadata.
\newcommand*{\ijgtp@authorfields}[2]{%
  \forcsvlist{#1{#2}}{name,option,surname,initials,affidx,email,orcid,corresponding}%
}
\newcommand*{\ijgtp@initauthorfield}[2]{%
  \expandafter\global\expandafter\let\csname ijgtpauthor#2@#1\endcsname\@empty
}
\newcommand*{\ijgtp@clearauthorfield}[2]{%
  \expandafter\global\expandafter\let\csname ijgtpauthor#2@#1\endcsname\relax
}
\renewcommand{\author}[2][]{%
  \stepcounter{ijgtpauthorcount}%
  \setcounter{ijgtpcurrentauthor}{\value{ijgtpauthorcount}}%
  \ijgtp@authorfields\ijgtp@initauthorfield{\arabic{ijgtpauthorcount}}%
  \expandafter\gdef\csname ijgtpauthorcorresponding@\arabic{ijgtpauthorcount}\endcsname{0}%
  % Extract inline metadata now, while this author is current. Keeping it
  % out of the stored name also protects running heads and citation names.
  \let\ijgtp@authorwithoutorcid\@empty
  \ijgtp@scanauthor#2\ijgtp@authorend
  \expandafter\global\expandafter\let
    \csname ijgtpauthorname@\arabic{ijgtpauthorcount}\endcsname\ijgtp@authorwithoutorcid
  \ijgtp@authoroption{#1}%
  \expandafter\global\expandafter\let
    \csname ijgtpauthoroption@\arabic{ijgtpauthorcount}\endcsname\ijgtp@optiontext
}
\newif\ifijgtp@optionorcid
\newif\ifijgtp@optionemail
\newif\ifijgtp@optiondot
\newcount\ijgtp@optionsegment
\newcommand*{\ijgtp@authoroption}[1]{%
  \edef\ijgtp@optiontext{#1}%
  \edef\ijgtp@optiontext{\expandafter\detokenize\expandafter{\ijgtp@optiontext}}%
  \ifx\ijgtp@optiontext\@empty\else
    % Syntax recognition without engine-specific regular expressions.
    \ijgtp@optionorcidtrue\ijgtp@optionemailtrue\ijgtp@optiondotfalse
    \count@=0 \@tempcntb=0 \ijgtp@optionsegment=0
    \edef\ijgtp@optiontrim{\ijgtp@optiontext\space}%
    \edef\ijgtp@optiontrim{\expandafter\zap@space\ijgtp@optiontrim\@empty}%
    \ifx\ijgtp@optiontrim\ijgtp@optiontext\else
      \ijgtp@optionorcidfalse\ijgtp@optionemailfalse
    \fi
    \expandafter\@tfor\expandafter\ijgtp@char\expandafter:\expandafter=\ijgtp@optiontext\do{%
      \advance\count@\@ne
      \@tempcnta=\expandafter`\ijgtp@char\relax
      \ifnum\count@=5 \ijgtp@optionhyphen
      \else\ifnum\count@=10 \ijgtp@optionhyphen
      \else\ifnum\count@=15 \ijgtp@optionhyphen
      \else
        \ifnum\count@=19 \ifnum\@tempcnta=`X \@tempcnta=`0 \fi\fi
        \ifnum\@tempcnta<`0 \ijgtp@optionorcidfalse\fi
        \ifnum\@tempcnta>`9 \ijgtp@optionorcidfalse\fi
      \fi\fi\fi
      \@tempcnta=\expandafter`\ijgtp@char\relax
      \ifnum\@tempcnta=`@
        \advance\@tempcntb\@ne
        \ifnum\ijgtp@optionsegment=0 \ijgtp@optionemailfalse\fi
        \ijgtp@optionsegment=0
      \else
        \ifnum\@tempcnta=`. \ifnum\@tempcntb=1
          \ijgtp@optiondottrue
          \ifnum\ijgtp@optionsegment=0 \ijgtp@optionemailfalse\fi
          \ijgtp@optionsegment=-1
        \fi\fi
        \advance\ijgtp@optionsegment\@ne
      \fi}%
    \ifnum\count@=19\else\ijgtp@optionorcidfalse\fi
    \ifnum\@tempcntb=1\else\ijgtp@optionemailfalse\fi
    \ifijgtp@optiondot\else\ijgtp@optionemailfalse\fi
    \ifnum\ijgtp@optionsegment=0 \ijgtp@optionemailfalse\fi
    \ifijgtp@optionorcid
      \expandafter\orcid\expandafter{\ijgtp@optiontext}%
    \else\ifijgtp@optionemail
      \expandafter\email\expandafter{\ijgtp@optiontext}%
    \else
      % Other optional arguments are affiliation tags, retained for matching.
    \fi\fi
  \fi
}
\def\ijgtp@optionhyphen{\ifnum\@tempcnta=`-\else\ijgtp@optionorcidfalse\fi}
\long\def\ijgtp@appendauthor#1{%
  \edef\ijgtp@authorwithoutorcid{%
    \unexpanded\expandafter{\ijgtp@authorwithoutorcid}\unexpanded{#1}}}
% Inspect meanings without expanding name formatting. This also recognizes
% aliases made with \let\orcidlink\orcid, including inside name groups.
\def\ijgtp@authorend{\ijgtp@authorend}
\def\ijgtp@scanauthor{\futurelet\ijgtp@authortoken\ijgtp@scanauthor@}
\def\ijgtp@scanauthor@{%
  \ifx\ijgtp@authortoken\ijgtp@authorend
    \let\ijgtp@authornext\ijgtp@authorfinish
  \else\ifx\ijgtp@authortoken\orcid
    \let\ijgtp@authornext\ijgtp@authormetadata
  \else\ifx\ijgtp@authortoken\email
    \let\ijgtp@authornext\ijgtp@authormetadata
  \else\ifx\ijgtp@authortoken\@sptoken
    \let\ijgtp@authornext\ijgtp@authorspace
  \else\ifx\ijgtp@authortoken\bgroup
    \let\ijgtp@authornext\ijgtp@authorgroup
  \else
    \let\ijgtp@authornext\ijgtp@authorordinary
  \fi\fi\fi\fi\fi
  \ijgtp@authornext
}
\def\ijgtp@authorfinish\ijgtp@authorend{}
\long\def\ijgtp@authormetadata#1#2{#1{#2}\ijgtp@scanauthor}
\long\def\ijgtp@authorordinary#1{\ijgtp@appendauthor{#1}\ijgtp@scanauthor}
\long\def\ijgtp@authorgroup#1{%
  \begingroup
    \let\ijgtp@authorwithoutorcid\@empty
    \ijgtp@scanauthor#1\ijgtp@authorend
    \edef\ijgtp@authornext{\endgroup
      \noexpand\ijgtp@appendauthor{{\unexpanded\expandafter{\ijgtp@authorwithoutorcid}}}}%
  \ijgtp@authornext\ijgtp@scanauthor
}
\begingroup
  \def\:{\ijgtp@authorspace}% define a macro delimited by one space
  \expandafter\gdef\: {\ijgtp@appendauthor{ }\ijgtp@scanauthor}
\endgroup

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

\newcommand{\affiliation}{\@ifnextchar[\ijgtp@taggedaffiliation\ijgtp@currentaffiliation}
\newcommand{\ijgtp@currentaffiliation}[1]{%
  \ifnum\value{ijgtpcurrentauthor}=0
    \ClassError{ijgtp}{\string\affiliation\space used before \string\author}{Define an author before adding affiliations.}%
  \fi
  \ijgtp@getaffindex{#1}%
  \edef\ijgtp@currentfound{\ijgtp@found}%
  \ijgtp@appendaffindex{\arabic{ijgtpcurrentauthor}}{\ijgtp@currentfound}%
}

\let\affil\affiliation

% Protected so affiliation-key expansion never executes the metadata setter.
\protected\def\email#1{%
  \ifnum\value{ijgtpcurrentauthor}=0
    \ClassError{ijgtp}{\string\email\space used before \string\author}{Define an author before adding email.}%
  \fi
  \expandafter\gdef\csname ijgtpauthoremail@\arabic{ijgtpcurrentauthor}\endcsname{#1}%
}

\protected\def\ijgtp@affiliationemail#1{%
  \begingroup
    \ijgtp@normalizeemail{#1}%
    \ijgtp@emaillink
  \endgroup
}
\newcommand*{\ijgtp@affiliationmatches}{}
\long\def\ijgtp@taggedaffiliation[#1]#2{%
  \ijgtp@getaffindex{#2}%
  \edef\ijgtp@afftag{#1}%
  \edef\ijgtp@afftag{\expandafter\detokenize\expandafter{\ijgtp@afftag}}%
  % An explicitly empty tag lists the affiliation without assigning it.
  \ifx\ijgtp@afftag\@empty\else
    \edef\ijgtp@addaffmatch{\noexpand\g@addto@macro\noexpand\ijgtp@affiliationmatches{%
      \noexpand\ijgtp@matchaffiliation{\ijgtp@afftag}{\ijgtp@found}{1}}}%
    \ijgtp@addaffmatch
  \fi
}
\newcommand*{\ijgtp@matchaffiliation}[3]{%
  \ifnum#3>\value{ijgtpauthorcount}\else
    \edef\ijgtp@affmatchtest{\noexpand\in@{#1}{\csname ijgtpauthoroption@#3\endcsname}}%
    \ijgtp@affmatchtest
    \ifin@\ijgtp@appendaffindex{#3}{#2}\fi
    \ijgtp@matchaffiliation{#1}{#2}{\number\numexpr#3+1\relax}%
  \fi
}
\newcommand*{\ijgtp@extraemails}{}
\newcommand{\emailAdd}[1]{%
  \ifblank{#1}{}{\g@addto@macro\ijgtp@extraemails{\ijgtp@extraemail{#1}}}%
}

\newcommand{\orcid}[1]{%
  \ifnum\value{ijgtpcurrentauthor}=0
    \ClassError{ijgtp}{\string\orcid\space used before \string\author}{Define an author before adding ORCID.}%
  \fi
  \expandafter\gdef\csname ijgtpauthororcid@\arabic{ijgtpcurrentauthor}\endcsname{#1}%
}

\let\orcidlink\orcid

\newcommand{\corresponding}{%
  \ifnum\value{ijgtpcurrentauthor}=0
    \ClassError{ijgtp}{\string\corresponding\space used before \string\author}{Define an author before marking corresponding author.}%
  \fi
  \expandafter\gdef\csname ijgtpauthorcorresponding@\arabic{ijgtpcurrentauthor}\endcsname{1}%
}

\newcommand{\ijgtp@clearauthorfields}[1]{%
  \ifnum#1>\value{ijgtpauthorcount}
  \else
    \ijgtp@authorfields\ijgtp@clearauthorfield{#1}%
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
  \global\let\ijgtp@affiliationmatches\@empty
  \global\let\ijgtp@extraemails\@empty
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
    \ijgtp@getemail{#1}%
    \ifx\ijgtp@email\@empty
      \expandafter\gdef\csname ijgtpauthorcorresponding@#1\endcsname{0}%
      \def\ijgtp@iscor{0}%
    \fi
    \ifnum\ijgtp@iscor=1\relax
      \stepcounter{ijgtpcorrespondingcount}%
    \fi
    \expandafter\ijgtp@countcorresponding\expandafter{\number\numexpr#1+1\relax}%
  \fi
}

\newcommand{\ijgtp@setallcorrespondingflag}{%
  \setcounter{ijgtpcorrespondingcount}{0}%
  \ijgtp@countcorresponding{1}%
  \ifnum\value{ijgtpcorrespondingcount}=0
    \ijgtp@defaultcorresponding{1}%
  \fi
  \ifnum\value{ijgtpcorrespondingcount}=\value{ijgtpauthorcount}
    \global\ijgtp@allcorrespondingtrue
  \else
    \global\ijgtp@allcorrespondingfalse
  \fi
}

\newcommand*{\ijgtp@defaultcorresponding}[1]{%
  \ifnum#1>\value{ijgtpauthorcount}\else
    \ijgtp@getemail{#1}%
    \ifx\ijgtp@email\@empty\else
      \expandafter\gdef\csname ijgtpauthorcorresponding@#1\endcsname{1}%
      \stepcounter{ijgtpcorrespondingcount}%
    \fi
    \expandafter\ijgtp@defaultcorresponding\expandafter{\number\numexpr#1+1\relax}%
  \fi
}

% Normalize the usual escaped underscore as well as accepting literal underscores, so the visible address and mailto target use the same text.
\newcommand{\ijgtp@normalizeemail}[1]{%
  \begingroup
    \def\_{\string_}%
    \protected@xdef\ijgtp@email{#1}%
  \endgroup
  \expandafter\ifblank\expandafter{\ijgtp@email}{\global\let\ijgtp@email\@empty}{}%
}
\newcommand{\ijgtp@getemail}[1]{%
  \ijgtp@normalizeemail{\csname ijgtpauthoremail@#1\endcsname}%
}
% Counting and rendering traverse exactly the same ordered list.
\newcommand{\ijgtp@foreachcorremail}[1]{%
  \ifnum#1>\value{ijgtpauthorcount}
    \let\ijgtp@extraemail\ijgtp@visitcorremail
    \ijgtp@extraemails
  \else
    \edef\ijgtp@iscor{\csname ijgtpauthorcorresponding@#1\endcsname}%
    \ifnum\ijgtp@iscor=1\relax
      \ijgtp@visitcorremail{\csname ijgtpauthoremail@#1\endcsname}%
    \fi
    \expandafter\ijgtp@foreachcorremail\expandafter{\number\numexpr#1+1\relax}%
  \fi
}

\newcommand{\ijgtp@setcorremailcounts}{%
  \setcounter{ijgtpcorremailcount}{0}%
  \setcounter{ijgtpcorremailprinted}{0}%
  \begingroup
    \def\ijgtp@visitcorremail##1{%
      \ijgtp@normalizeemail{##1}%
      \ifx\ijgtp@email\@empty\else\stepcounter{ijgtpcorremailcount}\fi}%
    \ijgtp@foreachcorremail{1}%
  \endgroup
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
    \noindent
    \ifnum\value{ijgtpauthorcount}>1\relax%
      \textsuperscript{#1}\space%
    \fi
    \begingroup
      \let\email\ijgtp@affiliationemail
      \csname ijgtpaffiliation@#1\endcsname\par
    \endgroup
    \expandafter\ijgtp@printaffiliations\expandafter{\number\numexpr#1+1\relax}%
  \fi
}

\newcommand{\ijgtp@printcorremails}[1]{%
  \begingroup
    \let\ijgtp@visitcorremail\ijgtp@printextraemail
    \ijgtp@foreachcorremail{#1}%
  \endgroup
}

\newcommand*{\ijgtp@emaillink}{%
  \ifx\ijgtp@email\@empty\else
    \href{mailto:\ijgtp@email}{%
      \urlstyle{same}\expandafter\nolinkurl\expandafter{\ijgtp@email}}%
  \fi
}
\newcommand*{\ijgtp@printextraemail}[1]{%
  \begingroup
    \ijgtp@normalizeemail{#1}%
    \ifx\ijgtp@email\@empty\else
      \stepcounter{ijgtpcorremailprinted}%
      \ijgtp@emaillink
      \ifnum\value{ijgtpcorremailprinted}<\value{ijgtpcorremailcount},\space\fi
    \fi
  \endgroup
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
\newcommand*{\ijgtp@dateentry}[2]{%
  \ifx#2\@empty\else{\footnotesize #1: #2}\\\fi
}
\newcommand{\ijgtp@dates}{%
    \small
    \ijgtp@dateentry{Received}\ijgtp@receivedtext
    \ijgtp@dateentry{Revised}\ijgtp@revisedtext
    \ijgtp@dateentry{Accepted}\ijgtp@acceptedtext
    \ijgtp@dateentry{Published}\ijgtp@publishedtext
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
      \noindent\ifnum\value{ijgtpcorrespondingcount}>0\relax
        \ifijgtp@allcorresponding\else{*}\fi\fi%
      \space\parbox[t]{0.98\linewidth}{Correspondence: \ijgtp@printcorremails{1}}%
    \fi%
    \par\vspace{6pt}% keep the gap even when correspondence is absent
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
  \ijgtp@titlewascolumnsfalse
  \ifnum\pagegrid@col>1 \ijgtp@titlewascolumnstrue\fi

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
  \ijgtp@affiliationmatches % resolve tags after all authors have been declared
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

  \onecolumngrid
  \ijgtp@measuretitle
  \ijgtp@maketitleblock
  \par\@thanks
  \global\let\@thanks\@empty
  \ifijgtp@titlewascolumns\twocolumngrid\fi

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

\newcommand{\funding}[1]{\section*{Funding}\par #1\par}
\newcommand{\roles}[1]{\section*{Author Contributions}\par #1\par}
\newcommand{\data}[1]{\section*{Data Availability Statement}\par #1\par}
\newcommand{\suppdata}[1]{\section*{Supplementary data}\par #1\par}

% The same heading command also serves as the environment's begin code.
\newenvironment{acknowledgments}{\section*{Acknowledgments}}{\par}
\newcommand{\ack}[1]{\acknowledgments #1\par}

% Read a complete manuscript without reinitializing the master document.
% Save preamble declarations while they are still available. Packages are
% deliberately not loaded here: their initialization is not group-local.
\newcommand*{\ijgtp@restorepreamble}{}
\AtBeginDocument{%
  \begingroup
    \def\do#1{%
      \expandafter\global\expandafter\let
        \csname ijgtp@preamble@\string#1\endcsname#1%
      \g@addto@macro\ijgtp@restorepreamble{%
        \expandafter\let\expandafter#1\csname ijgtp@preamble@\string#1\endcsname}}%
    \@preamblecmds
  \endgroup
}
\newif\ifijgtp@ininputpaper
\newif\ifijgtp@inputbegun
\newif\ifijgtp@inputended
\newif\ifijgtp@documentstarted
\AtBeginDocument{\global\ijgtp@documentstartedtrue}
\newcommand*{\ijgtp@saveimportglobal}[1]{%
  \@ifundefined{ijgtp@tracked@#1}{%
    \expandafter\def\csname ijgtp@tracked@#1\endcsname{1}%
    \expandafter\let\csname ijgtp@importsaved@#1\expandafter\endcsname\csname#1\endcsname
    \edef\ijgtp@importcleanup{\unexpanded\expandafter{\ijgtp@importcleanup}%
      \noexpand\ijgtp@restoreimportglobal{#1}}%
  }{}%
}
\newcommand*{\ijgtp@restoreimportglobal}[1]{%
  \global\expandafter\let\csname#1\expandafter\endcsname\csname ijgtp@importsaved@#1\endcsname
}
\newcommand*{\ijgtp@trackimportcounter}[1]{%
  \@for\ijgtp@prefix:=c@,cl@,p@,the,theH,ijgtp@resetregistered@\do{%
    \expandafter\ijgtp@saveimportglobal\expandafter{\ijgtp@prefix#1}}%
}
\newcommand*{\ijgtp@trackimporttheorem}[1]{%
  \ijgtp@saveimportglobal{#1}%
  \ijgtp@saveimportglobal{end#1}%
  \ijgtp@trackimportcounter{#1}%
  \ijgtp@importnewtheorem{#1}%
}
\newcommand*{\ijgtp@trackimporttheoremstar}[1]{%
  \ijgtp@saveimportglobal{#1}%
  \ijgtp@saveimportglobal{end#1}%
  \ijgtp@importnewtheorem*{#1}%
}
\def\ijgtp@ignoreclass{\@ifnextchar[\ijgtp@ignoreclass@{\ijgtp@ignoreclass@[]}}
\def\ijgtp@ignoreclass@[#1]#2{\@ifnextchar[\ijgtp@ignoreversion{}}
\def\ijgtp@ignoreversion[#1]{}
% Package requests have the same argument syntax as the ignored class:
% silently consume options, names, and an optional version date.
\let\ijgtp@importpackage\ijgtp@ignoreclass
\newif\ifijgtp@importtitleprinted
\newif\ifijgtp@importabstractseen
\newif\ifijgtp@articleabstractpending
\def\ijgtp@ensureimporttitle{%
  \ifijgtp@importtitleprinted\else
    \ijgtp@importtitleprintedtrue
    \ijgtp@importoriginaltitle
  \fi
}
\def\ijgtp@importcontents{%
  \ifijgtp@importabstractseen
    \ijgtp@ensureimporttitle
    \expandafter\ijgtp@importoriginalcontents
  \else
    \expandafter\ijgtp@ignorecontents
  \fi
}
\def\ijgtp@importclass{\@ifnextchar[\ijgtp@importclass@{\ijgtp@importclass@[]}}
\def\ijgtp@importclass@[#1]#2{%
  \def\ijgtp@classname{#2}\def\ijgtp@articleclass{article}%
  \ifx\ijgtp@classname\ijgtp@articleclass
    \let\ijgtp@articleoriginaltitle\maketitle
    \let\maketitle\ijgtp@articlelookahead
  \fi
  \@ifnextchar[\ijgtp@ignoreversion{}%
}
\def\ijgtp@ignorecontents{\@ifstar{}{}% consume both contents forms
}
% Move the usual article title/abstract pair without collecting the whole
% manuscript, so verbatim text and manuscripts without an abstract still work.
\def\ijgtp@articlelookahead{%
  \@ifnextchar\par\ijgtp@articleskippar{%
    \@ifnextchar\abstract\ijgtp@articleabstractcommand{%
      \@ifnextchar\begin\ijgtp@articlebegin\ijgtp@articleoriginaltitle}}}
\long\def\ijgtp@articleabstractcommand\abstract#1{%
  \ijgtp@articleabstractpendingtrue
  \abstract{#1}%
}
\long\def\ijgtp@articleskippar\par{\ijgtp@articlelookahead}
\def\ijgtp@articlebegin\begin#1{%
  \def\ijgtp@envname{#1}\def\ijgtp@abstractname{abstract}%
  \ifx\ijgtp@envname\ijgtp@abstractname
    \ijgtp@articleabstractpendingtrue
  \else
    \ijgtp@articleoriginaltitle
  \fi
  \begin{#1}%
}
\def\ijgtp@articlefinishtitle{%
  \ijgtp@articleabstractpendingfalse
  \ijgtp@articleoriginaltitle
}
% Resolve manuscript resources from its directory before the master paths.
% These overrides live in the inputpaper group; the process cwd is unchanged.
\newcommand*{\ijgtp@importpaths}[1]{%
  \filename@parse{#1}%
  \let\ijgtp@paperpath\filename@area
  \let\ijgtp@fileexists\IfFileExists
  \long\def\IfFileExists##1##2##3{%
    \ijgtp@fileexists{\ijgtp@paperpath##1}{##2}{%
      \ifx\input@path\@undefined
        \def\ijgtp@pathnext{\ijgtp@fileexists{##1}{##2}{##3}}%
      \else
        \def\ijgtp@pathnext{\@iffileonpath{##1}{##2}{%
          \ijgtp@fileexists{##1}{##2}{##3}}}%
      \fi
      \ijgtp@pathnext}}%
  \let\ijgtp@graphicspath\graphicspath
  \def\graphicspath##1{%
    \let\ijgtp@graphicpaths\@empty
    \@tfor\ijgtp@path:=##1\do{%
      \edef\ijgtp@graphicpaths{\ijgtp@graphicpaths{\ijgtp@paperpath\ijgtp@path}}}%
    \edef\ijgtp@graphicpaths{\ijgtp@graphicpaths\unexpanded{##1}}%
    \expandafter\ijgtp@graphicspath\expandafter{\ijgtp@graphicpaths}}%
  \ifx\Ginput@path\@undefined\else
    \expandafter\graphicspath\expandafter{\Ginput@path}%
  \fi
  % BibTeX reads the aux file from the master directory, not this TeX group.
  % Write directory-qualified database names when a local database exists.
  \let\ijgtp@importputbib\putbib
  \def\putbib{\@ifnextchar[\ijgtp@importputbib@{\ijgtp@importputbib@[\bu@bibdata]}}%
}
\def\ijgtp@importputbib@[#1]{%
  \let\ijgtp@bibfiles\@empty
  \let\ijgtp@bibsep\@empty
  \@for\ijgtp@bibfile:=#1\do{%
    \ijgtp@fileexists{\ijgtp@paperpath\ijgtp@bibfile.bib}{%
      \edef\ijgtp@bibfiles{\ijgtp@bibfiles\ijgtp@bibsep\ijgtp@paperpath\ijgtp@bibfile}%
    }{%
      \edef\ijgtp@bibfiles{\ijgtp@bibfiles\ijgtp@bibsep\ijgtp@bibfile}}%
    \def\ijgtp@bibsep{,}}%
  \expandafter\ijgtp@importputbib\expandafter[\ijgtp@bibfiles]%
}
\long\def\ijgtp@importbegin#1{%
  \def\ijgtp@envname{#1}\def\ijgtp@documentname{document}%
  \ifx\ijgtp@envname\ijgtp@documentname
    \def\ijgtp@next{\ijgtp@inputbeguntrue\ijgtp@importbeginhook}%
  \else
    \def\ijgtp@next{\ijgtp@importoriginalbegin{#1}}%
  \fi
  \ijgtp@next
}
\long\def\ijgtp@importend#1{%
  \def\ijgtp@envname{#1}\def\ijgtp@documentname{document}%
  \ifx\ijgtp@envname\ijgtp@documentname
    \let\ijgtp@next\ijgtp@stopimport
  \else
    \def\ijgtp@next{\ijgtp@importoriginalend{#1}}%
    \def\ijgtp@abstractname{abstract}%
    \ifx\ijgtp@envname\ijgtp@abstractname
      \def\ijgtp@next{\ijgtp@importoriginalend{#1}%
        \ijgtp@importabstractseentrue
        \ifijgtp@articleabstractpending\ijgtp@articlefinishtitle\fi}%
    \fi
  \fi
  \ijgtp@next
}
% Consume the remainder of the physical line too: primitive endinput alone
% still executes tokens after end{document} on that same line. Make braces,
% comments and backslashes inert while discarding the tail (even invalid TeX).
\begingroup
  \catcode`\|=12 \lccode`\|=13
  \lowercase{\endgroup\long\def\ijgtp@discardimportline#1|}{\endgroup}
\def\ijgtp@stopimport{%
  \par\ijgtp@importendhook
  \ijgtp@inputendedtrue
  \endinput
  \begingroup
    \catcode`\^^M=12 \catcode`\%=12
    \catcode`\{=12 \catcode`\}=12 \catcode`\\=12
    \ijgtp@discardimportline
}
\newcommand*{\inputpaper}[1]{%
  \ifijgtp@documentstarted
  \ifijgtp@ininputpaper
    \ClassError{ijgtp}{Nested \string\inputpaper\space is not supported}{Use ordinary \string\input\space for sections within a paper.}%
  \else
    \IfFileExists{#1}{\ijgtp@inputpaper{#1}}{%
      \ClassError{ijgtp}{Paper file #1 not found}{Check the path passed to \string\inputpaper.}}%
  \fi
  \else
    \ClassError{ijgtp}{\string\inputpaper\space requires the document body}{Move it after \string\begin{document}.}%
  \fi
}
\newcommand*{\ijgtp@inputpaper}[1]{%
  % A real penalty runs TeX's page builder after REVTeX's queued clearpage.
  % Without it, header restoration can precede the final paper shipout.
  \par\clearpage\penalty\z@
  \begingroup
    \ijgtp@ininputpapertrue
    \ijgtp@inputbegunfalse\ijgtp@inputendedfalse
    \ijgtp@articleabstractpendingfalse
    \ijgtp@importtitleprintedfalse
    \ijgtp@importabstractseenfalse
    % Page-grid dimensions are global in REVTeX; restore them explicitly.
    \edef\ijgtp@afterimport{\endgroup
      \global\textwidth=\the\textwidth\relax
      \global\textheight=\the\textheight\relax
      \global\topmargin=\the\topmargin\relax
      \global\oddsidemargin=\the\oddsidemargin\relax
      \global\evensidemargin=\the\evensidemargin\relax
      \global\headheight=\the\headheight\relax
      \global\headsep=\the\headsep\relax
      \global\footskip=\the\footskip\relax
      \global\columnsep=\the\columnsep\relax
      \global\hoffset=\the\hoffset\relax
      \global\voffset=\the\voffset\relax
      \ifnum\pagegrid@col>1 \noexpand\twocolumngrid\else\noexpand\onecolumngrid\fi
      \noexpand\set@column@hsize\noexpand\pagegrid@col\noexpand\set@colht}%
    \ijgtp@restorepreamble
    \let\ijgtp@importoriginaltitle\maketitle
    \let\ijgtp@importoriginalcontents\tableofcontents
    \let\ijgtp@importoriginalsection\section
    \def\maketitle{%
      \ijgtp@importtitleprintedtrue
      \ijgtp@importoriginaltitle}%
    \let\tableofcontents\ijgtp@importcontents
    \def\section{\ijgtp@ensureimporttitle\ijgtp@importoriginalsection}%
    \let\documentclass\ijgtp@importclass
    \let\documentstyle\ijgtp@importclass
    \let\usepackage\ijgtp@importpackage
    \let\RequirePackage\ijgtp@importpackage
    \let\ijgtp@importoriginalbegin\begin
    \let\ijgtp@importoriginalend\end
    \let\begin\ijgtp@importbegin
    \let\end\ijgtp@importend
    \let\enddocument\ijgtp@stopimport
    \let\ijgtp@importbeginhook\@empty
    \let\ijgtp@importendhook\@empty
    \long\def\AtBeginDocument##1{\appto\ijgtp@importbeginhook{##1}}%
    \long\def\AtEndDocument##1{\appto\ijgtp@importendhook{##1}}%
    % Counter/theorem declarations use global definitions even in a group.
    % Track those declarations and their reset lists for explicit cleanup.
    \let\ijgtp@importcleanup\@empty
    \let\ijgtp@importdefinecounter\@definecounter
    \def\@definecounter##1{\ijgtp@trackimportcounter{##1}\ijgtp@importdefinecounter{##1}}%
    \let\ijgtp@importaddtoreset\@addtoreset
    \def\@addtoreset##1##2{\ijgtp@saveimportglobal{cl@##2}\ijgtp@importaddtoreset{##1}{##2}}%
    \let\ijgtp@importnewtheorem\newtheorem
    \def\newtheorem{\@ifstar\ijgtp@trackimporttheoremstar\ijgtp@trackimporttheorem}%
    \ijgtp@saveimportglobal{@title}%
    \ijgtp@saveimportglobal{@author}%
    \ijgtp@saveimportglobal{@date}%
    \ijgtp@saveimportglobal{@thanks}%
    % The journal title and appendix code deliberately update these globally.
    \@for\ijgtp@name:=thesection,theHsection,Hy@chapapp,ifijgtp@inappendix,ijgtp@lastnamesstring,ijgtp@copyrightyear,ijgtp@paperbibstyle\do{%
      \expandafter\ijgtp@saveimportglobal\expandafter{\ijgtp@name}}%
    % fancyhdr definitions must remain global while its internal groups run.
    \@for\ijgtp@name:=f@ncyelh,f@ncyolh,f@ncyech,f@ncyoch,f@ncyerh,f@ncyorh,f@ncyelf,f@ncyolf,f@ncyecf,f@ncyocf,f@ncyerf,f@ncyorf\do{%
      \expandafter\ijgtp@saveimportglobal\expandafter{\ijgtp@name}}%
    \ijgtp@importpaths{#1}%
    \input{#1}%
    \ifijgtp@inputbegun
      \ifijgtp@inputended\else
        \ClassWarning{ijgtp}{Imported paper #1 has no \string\end{document}}%
      \fi
    \fi
    \par\onecolumngrid\clearpage\penalty\z@
    \endbibunit
    \ijgtp@importcleanup
    \ijgtp@afterimport
  \ijgtp@startbibunit
}
