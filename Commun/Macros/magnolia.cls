%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% magnolia.cls, LaTeX class for the free teaching project Velvia
% Copyright (C) 2004-2006 François Fayard <fayard.prof@gmail.com>.
% 
% This program is free software; you can redistribute it and/or
% modify it under the terms of the GNU General Public License
% as published by the Free Software Foundation; either version 2
% of the License, or (at your option) any later version.
% 
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
% 
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software Foundation
% Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% PLEASE DO NOT MAKE ANY CHANGES TO THIS FILE!
% 
% If you wish to make changes to this file, rename this file
% to something other than exam.cls BEFORE YOU MAKE THE CHANGES!
% 
% If there's some feature that you'd like that this file doesn't
% provide, tell me about it.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}[]
\ProvidesClass{magnolia}[4/12/2006 Francois Fayard
                         Classe magnolia.cls
                         Projet Velvia pour le libre enseignement]
%
% Paramètres de base
%   On charge la classe article sauf si l'option book est passée à la classe
%   magnolia
%
\RequirePackage{ifthen}
\newboolean{mag@article}
\DeclareOption{article}{\setboolean{mag@article}{true}}
\DeclareOption{book}{\setboolean{mag@article}{false}}
\DeclareOption*{
  \ifthenelse{\boolean{mag@article}}%
  {\PassOptionsToClass{\CurrentOption}{article}}%
  {\PassOptionsToClass{\CurrentOption}{book}}%
}
\ExecuteOptions{article}
\ProcessOptions\relax
\ifthenelse{\boolean{mag@article}}%
  {\LoadClass{article}}%
  {\LoadClass{book}}
%
% Paramètres pour la langue française
%
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[frenchb]{babel}
%
% Paquets à charger
%
\usepackage{
  ifthen,                 %% Nécessaire aux macros magnolia
                          %%   est dans latex/base
  calc,                   %% Pour effectuer des calculs sur les longueurs
                          %%   est dans latex/tools
  xspace,                 %% Pour gérer les espaces après un texte
                          %%   est dans latex/tools
  geometry,               %% Pour le format des pages
                          %%   n'est ni dans latex/base ou latex/tools
  multicol,caption,minitoc,tikz,listings}               %% Pour afficher du texte sur plusieurs colonnes
                          %%   est dans latex/tools
\usepackage{pdftricks}
\usepackage{bbding}
\usepackage[most]{tcolorbox}
\begin{psinputs}
\usepackage{pstricks,pst-plot}
\end{psinputs}
\usepackage{dsfont}
\usepackage{xcolor}
\usepackage{colortbl}
\usepackage{verbatim}
\usepackage{bm}
\usepackage[edges]{forest}
\tcbuselibrary{theorems,breakable,skins,minted}
\usepackage{algorithm}
\usepackage{algpseudocode}
\usepackage{siunitx}
\usepackage{tabularx}
\floatname{algorithm}{Algorithme}

\algrenewcommand\algorithmicwhile{\textbf{tant que}}
\algrenewcommand\algorithmicdo{\textbf{faire}}
\algrenewcommand\algorithmicend{\textbf{fin}}
\algrenewcommand\algorithmicfor{\textbf{pour}}
\algrenewcommand\algorithmicforall{\textbf{pour}}
\algrenewcommand\algorithmicif{\textbf{si}}
\algrenewcommand\algorithmicthen{\textbf{alors}}
\algrenewcommand\algorithmicelse{\textbf{sinon}}
\algrenewcommand\algorithmicfunction{\textbf{fonction}}
\algrenewcommand\algorithmicreturn{\textbf{renvoyer}}
\algrenewcommand\algorithmicrequire{\textbf{Entrées :}}
\algrenewcommand\algorithmicensure{\textbf{Sorties :}}

% \usepackage{minted}
% \usemintedstyle{xcode}
% \newenvironment{pythoncode}{\VerbatimEnvironment\begin{minted}[xleftmargin=20pt,linenos]{python}}{\end{minted}}
\usepackage{tkz-tab}
\usepackage{tkz-graph}
\usetikzlibrary{backgrounds, shadows, fit, positioning,arrows,automata}
\usetikzlibrary{shapes.misc, shapes.geometric, positioning}
\usetikzlibrary{positioning}
\usetikzlibrary{matrix}
\usetikzlibrary{arrows.meta}
\lstset{%
  frame            = tb,    % draw frame at top and bottom of code block
  tabsize          = 2,     % tab space width
	% xleftmargin = 0.5cm,
	% frameround = fttt,
	numbersep = 5pt,
	numberstyle = \tiny,
	numbers = none,
  % numbers          = left,  % display line numbers on the left
  framesep         = 3pt,   % expand outward
  framerule        = 0.4pt, % expand outward 
  commentstyle     = \color{colorLazoPink1},      % comment color
  keywordstyle     = \color{blue},       % keyword color
  stringstyle      = \color{red},    % string color
  backgroundcolor  = \color{colorLazoYellow1Light}, % backgroundcolor color
  showstringspaces = false,              % do not mark spaces in strings
  emph={int,char,double,float,unsigned,void,bool,uint64_t,T,uint32_t,set,uint8_t,bucket},
  emphstyle={\color{blue}},
  basicstyle       = \ttfamily,
  breaklines       = true,
  extendedchars    = true,
  literate         = {À}{{\`A}}1 {à}{{\`a}}1 {â}{{\ˆa}}1 {é}{{\'e}}1 {è}{{\'e}}1 {ê}{{\^e}}1 {ù}{{\`u}}1 {Ç}{{\c{C}}}1 {ç}{{\c{c}}}1,
	escapeinside={(*@}{@*)}
}
% \newenvironment{pythoncode}{\begin{lstlisting}[language=python]}{\end{lstlisting}}
\lstnewenvironment{pythoncode}{\lstset{language=python}}{}
\lstnewenvironment{pythoncodeline}{\lstset{language=python,numbers=left,stepnumber=1}}{}
\lstnewenvironment{ccode}{\lstset{language=c,numbers=left,stepnumber=1}}{}
\lstnewenvironment{sqlcode}{\lstset{language=sql}}{}
\lstnewenvironment{asmcode}{\lstset{language=[x86masm]Assembler}}{}
\lstnewenvironment{nasmcode}{\lstset{language=[x86masm]Assembler}}{}
\lstnewenvironment{camlcode}{\lstset{language=caml,numbers=left,stepnumber=1}}{}
\lstnewenvironment{shellcode}{\lstset{language=bash}}{}
% \newenvironment{pythoncode}{\verbatim}{\endverbatim}

\newcommand{\nom}{}%

\usepackage{float}
\restylefloat{table}
\usepackage{booktabs}
%\usepackage{tabularx, multirow}
\newcommand{\otoprule}{\midrule[\heavyrulewidth]}
\usepackage{multirow}
\usepackage{array}
\newcommand{\from}{\leftarrow}
  

\definecolor{colorLazoBlue1}{RGB}{1,40,174}
\definecolor{colorLazoBlue1Light}{RGB}{227,243,255}
\definecolor{colorLazoBlue2}{RGB}{92,134,195}
\definecolor{colorLazoBlue2Light}{RGB}{236,241,248}
\definecolor{colorLazoGreen}{RGB}{148,195,2}
\definecolor{colorLazoGreenLight}{RGB}{249,245,230}
\definecolor{colorLazoPink1}{RGB}{231,2,124}
\definecolor{colorLazoPink1Light}{RGB}{255,230,243}
\definecolor{colorLazoPink2}{RGB}{236,40,159}
\definecolor{colorLazoPink2Light}{RGB}{252,231,240}
\definecolor{colorLazoYellow1}{RGB}{253,189,3}
\definecolor{colorLazoYellow1Light}{RGB}{255,248,230}
\definecolor{colorLazoYellow2}{RGB}{243,212,128}
\definecolor{colorLazoYellow2Light}{RGB}{253,247,232}
%
%
\ifthenelse{\boolean{mag@article}}{%
  \newcommand{\magtoc}{\tableofcontents}%
  \newcommand{\magsection}{\section}%
  \newcommand{\magsubsection}[1]{\subsection*{\textit{#1}}}%
}{%
  \newcommand{\magtoc}{\minitoc}%
  %\setcounter{secnumdepth}{3}%
  \newcommand{\magsection}{\subsection}%
  \newcommand{\magsubsection}[1]{\subsubsection*{\textit{#1}}}%
  \setcounter{minitocdepth}{2}%
  \dominitoc

  %\mtcsettitle{chaptoc}{Voici}
}
\newcounter{numeroexercice}
\setcounter{numeroexercice}{1}
\newcounter{numeroexercicecours}
\setcounter{numeroexercicecours}{1}
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                     Options                                 %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
% Fiche signalitétique
%
\immediate\openout10=fiche.txt
\global\def\mag@misenpageauteur{}
\global\def\mag@preuve{non}
\global\def\mag@sol{non}
\global\def\mag@couleur@preuve{blue}
\global\def\mag@couleur@sol{purple}
\input{magnolia-conf}
%
% Gestion de la fiche du document
%
% document_nom=
% document_version=
% document_date_creation
% document_date_modification=
% document_licence=
% document_id=
% document_biblioid=
% document_connexeid=
% document_fichiers=
% auteur_nom=
% auteur_mail=
%
\newcommand{\magfiche}[1]{\setkeys{kv@magfiche}{#1}}
\define@key{kv@magfiche}{document_nom}
  {\@temptokena{Nom du document : #1}\immediate\write10{\the\@temptokena}
   \global\def\mag@document@nom{#1}}
\define@key{kv@magfiche}{document_version}
  {\@temptokena{Version : #1}\immediate\write10{\the\@temptokena}
   \global\def\mag@document@version{#1}}
\define@key{kv@magfiche}{document_date_creation}
  {\@temptokena{Date de creation : #1}\immediate\write10{\the\@temptokena}
   \global\def\mag@document@date@creation{#1}}
\define@key{kv@magfiche}{document_date_modification}
  {\@temptokena{Date de modification : #1}\immediate\write10{\the\@temptokena}
   \global\def\mag@document@date@modification{#1}}
\define@key{kv@magfiche}{document_licence}
  {\@temptokena{Licence : #1}\immediate\write10{\the\@temptokena}
   \global\def\mag@document@licence{#1}}
\define@key{kv@magfiche}{document_id}
  {\@temptokena{Magnolia ID : #1}\immediate\write10{\the\@temptokena}
   \global\def\mag@document@id{#1}}
\define@key{kv@magfiche}{document_biblioid}
  {\global\def\mag@document@biblioid{#1}}
\define@key{kv@magfiche}{document_connexeid}
  {\global\def\mag@document@connexeid{#1}}
\define@key{kv@magfiche}{document_fichiers}
  {\@temptokena{Liste des fichiers : #1}\immediate\write10{\the\@temptokena}
   \global\def\mag@document@fichiers{#1}}
\define@key{kv@magfiche}{auteur_nom}
  {\@temptokena{Nom de l'auteur : #1}\immediate\write10{\the\@temptokena}
   \global\def\mag@auteur@nom{#1}}
\define@key{kv@magfiche}{auteur_mail}
  {\@temptokena{Mail de l'auteur : #1}\immediate\write10{\the\@temptokena}
   \global\def\mag@auteur@mail{#1}}

\def\mag@typedocument{}
%
% Gestion des sujets de devoirs
%
% sujet_matiere=
% sujet_niveau=
% sujet_correctionid=
%   concours_nom=
%   concours_filiere=
%   concours_epreuve=
%   concours_annee=
% 
\def\mag@typesujet{}
\newcommand{\magsujet}[1]
  {\def\mag@typedocument{sujet}
   \setkeys{kv@magsujet}{#1}}
\define@key{kv@magsujet}{sujet_matiere}
  {\global\def\mag@sujet@matiere{#1}}
\define@key{kv@magsujet}{sujet_niveau}
  {\global\def\mag@sujet@niveau{#1}}
\define@key{kv@magsujet}{sujet_correctionid}
  {\@temptokena{Correction : #1}\immediate\write10{\the\@temptokena}
   \global\def\mag@sujet@correction{#1}}
\global\def\mag@sujet@calculatrice{non}
\define@key{kv@magsujet}{sujet_calculatrice}
  {\global\def\mag@sujet@calculatrice{#1}}
\define@key{kv@magsujet}{concours_nom}
  {\global\def\mag@typesujet{concours}
   \@temptokena{Concours : #1}\immediate\write10{\the\@temptokena}
   \global\def\mag@concours@nom{#1}}
\define@key{kv@magsujet}{concours_filiere}
  {\global\def\mag@concours@filiere{#1}}
\define@key{kv@magsujet}{concours_epreuve}
  {\global\def\mag@concours@epreuve{#1}}
\define@key{kv@magsujet}{concours_annee}
  {\global\def\mag@concours@annee{#1}}
%
% Gestion des feuilles d'exercices
%
% exos_matiere=
% exos_niveau=
% exos_theme=
%
\newcommand{\magexos}[1]
  {\def\mag@typedocument{exos}
   \setkeys{kv@magexos}{#1}}
\define@key{kv@magexos}{exos_matiere}
  {\global\def\mag@exos@matiere{#1}}
\define@key{kv@magexos}{exos_niveau}
  {\global\def\mag@exos@niveau{#1}}
\define@key{kv@magexos}{exos_chapitre_numero}
  {\@temptokena{Exos Numéro : #1}\immediate\write10{\the\@temptokena}
   \global\def\mag@exos@chapitrenumero{#1}}
\define@key{kv@magexos}{exos_theme}
  {\global\def\mag@exos@theme{#1}
   \@temptokena{Theme des exos : #1}\immediate\write10{\the\@temptokena}}
%
% Gestion des TPs
%
% tp_matiere=
% tp_niveau=
% tp_theme=
%
\newcommand{\magtp}[1]
  {\def\mag@typedocument{tp}
   \setkeys{kv@magtp}{#1}}
\define@key{kv@magtp}{tp_matiere}
  {\global\def\mag@tp@matiere{#1}}
\define@key{kv@magtp}{tp_niveau}
  {\global\def\mag@tp@niveau{#1}}
\define@key{kv@magtp}{tp_theme}
  {\global\def\mag@tp@theme{#1}
   \@temptokena{Theme : #1}\immediate\write10{\the\@temptokena}}
\define@key{kv@magtp}{tp_resume}
  {\global\def\mag@tp@resume{#1}
   \@temptokena{Resume : #1}\immediate\write10{\the\@temptokena}}
\define@key{kv@magtp}{tp_maple}
  {\global\def\mag@tp@resume{#1}
   \@temptokena{Maple : #1}\immediate\write10{\the\@temptokena}}
%
% Gestion des cours
%
% cours_matiere=
% cours_niveau=
% cours_chapitre_numero=
% cours_chapitre=
%
\newcommand{\magcours}[1]
  {\def\mag@typedocument{cours}
   \setkeys{kv@magcours}{#1}}
\define@key{kv@magcours}{cours_matiere}
  {\@temptokena{Matiere : #1}\immediate\write10{\the\@temptokena}
   \global\def\mag@cours@matiere{#1}}
\define@key{kv@magcours}{cours_niveau}
  {\@temptokena{Niveau : #1}\immediate\write10{\the\@temptokena}
   \global\def\mag@cours@niveau{#1}}
\define@key{kv@magcours}{cours_chapitre_numero}
  {\@temptokena{Chapitre Numéro : #1}\immediate\write10{\the\@temptokena}
   \global\def\mag@cours@chapitrenumero{#1}}
\define@key{kv@magcours}{cours_chapitre}
  {\@temptokena{Chapitre : #1}\immediate\write10{\the\@temptokena}
   \global\def\mag@cours@chapitre{#1}}
%
% Gestion des resumes
%
% resume_matiere=
% resume_niveau=
% resume_chapitre=
%
\newcommand{\magresume}[1]{\def\mag@typedocument{fiche}
  \setkeys{kv@magresume}{#1}}
\define@key{kv@magresume}{resume_matiere}
  {\@temptokena{Matiere : #1}\immediate\write10{\the\@temptokena}
   \global\def\mag@resume@matiere{#1}}
\define@key{kv@magresume}{resume_niveau}
  {\@temptokena{Niveau : #1}\immediate\write10{\the\@temptokena}
   \global\def\mag@resume@niveau{#1}}
\define@key{kv@magresume}{resume_numero}
   {\@temptokena{Numero : #1}\immediate\write10{\the\@temptokena}
    \global\def\mag@resume@numero{#1}}
\define@key{kv@magresume}{resume_chapitre}
  {\@temptokena{Chapitre : #1}\immediate\write10{\the\@temptokena}
   \global\def\mag@resume@chapitre{#1}}
%
% Gestion de la mise en page
%
\newcommand{\magmisenpage}[1]{\setkeys{kv@magmisenpage}{#1}}
\define@key{kv@magmisenpage}{misenpage_format}
  {\global\def\mag@format{#1}}
\define@key{kv@magmisenpage}{misenpage_nbcolonnes}
  {\global\def\mag@nb@colonnes{#1}}
\global\def\mag@colonnes@balanced{yes}
\define@key{kv@magmisenpage}{misenpage_colonnesbalanced}
  {\global\def\mag@colonnes@balanced{#1}}
\define@key{kv@magmisenpage}{misenpage_licence}
  {\global\def\mag@licence{#1}}
\define@key{kv@magmisenpage}{misenpage_preuve}
  {\global\def\mag@preuve{#1}}
\global\def\mag@exemple{non}
\define@key{kv@magmisenpage}{misenpage_exemple}
  {\global\def\mag@exemple{#1}}
\global\def\mag@prof{non}
\define@key{kv@magmisenpage}{misenpage_prof}
  {\global\def\mag@prof{#1}}
\define@key{kv@magmisenpage}{misenpage_sol}
  {\global\def\mag@sol{#1}}
\define@key{kv@magmisenpage}{misenpage_auteur}
  {\global\def\mag@misenpageauteur{#1}}
\global\def\mag@solutions{non}
\define@key{kv@magmisenpage}{misenpage_solutions}
  {\global\def\mag@solutions{#1}}
\ifthenelse{\equal{\mag@solutions}{oui}}{\usepackage{answers}}{}
\global\def\mag@fontes{computermodern}
\define@key{kv@magmisenpage}{misenpage_presentation}
  {\global\def\mag@presentation{#1}
   \ifthenelse{\equal{\mag@tex@minimal}{oui}}{\global\def\mag@presentation{minimal}}{}
   \ifthenelse{\equal{\mag@presentation}{tikzvelvia}}{\usepackage{color,tikz}}{}
   \ifthenelse{\equal{\mag@presentation}{centrale}}{%
     \global\def\mag@fontes{fouriernc}%
     \global\def\mag@colonnes@balanced{no}}{}}
\define@key{kv@magmisenpage}{misenpage_fontes}
  {\global\def\mag@fontes{#1}}
%
% Lieu de diffusion
%
\long\def\mag@lieudiff{internet}
\newcommand{\maglieudiff}[1]
  {\long\def\mag@lieudiff{classe}
   \setkeys{kv@maglieudiff}{#1}}
\define@key{kv@maglieudiff}{lieu_lycee}
    {\global\def\mag@lieu@lycee{#1}}
\define@key{kv@maglieudiff}{lieu_classe}
    {\global\def\mag@lieu@classe{#1}}
\define@key{kv@maglieudiff}{lieu_annee}
    {\global\def\mag@lieu@annee{#1}}
\define@key{kv@maglieudiff}{devoir_type}
    {\global\def\mag@devoir@type{#1}}
\define@key{kv@maglieudiff}{devoir_numero}
    {\global\def\mag@devoir@numero{#1}}
\define@key{kv@maglieudiff}{devoir_temps}
    {\global\def\mag@devoir@temps{#1}}
\define@key{kv@maglieudiff}{devoir_date}
    {\global\def\mag@devoir@date{#1}}
%
% Gestion de la version TeX
%
% tex_distribution=
% tex_plateforme=
% tex_driver=
%
\global\def\mag@tex@driver{dvips}
\newcommand{\magtex}[1]
  {\setkeys{kv@magtex}{#1}}
\global\def\mag@tex@distribution{texlive}
\define@key{kv@magtex}{tex_distribution}
  {\global\def\mag@tex@distribution{#1}}
\define@key{kv@magtex}{tex_plateforme}
  {\global\def\mag@tex@plateforme{#1}}
\define@key{kv@magtex}{tex_driver}
  {\global\def\mag@tex@driver{#1}%
   \ifthenelse{\equal{\mag@tex@driver}{dvips}\or
     \equal{\mag@tex@driver}{pdftex}}{}{%
       \PackageError{magnolia}{Seuls les drivers dvips et pdftex peuvent
         etre utilises.}}}
\global\def\mag@tex@minimal{non}
\define@key{kv@magtex}{tex_minimal}
  {\global\def\mag@tex@minimal{#1}}
\global\def\mag@tex@packages{}
\define@key{kv@magtex}{tex_packages}
  {\global\def\mag@tex@packages{#1}}
\global\def\mag@tex@pstricks{non}
\define@key{kv@magtex}{tex_pstricks}
  {\global\def\mag@tex@pstricks{#1}}
%
\define@key{prop@utile}{utile}{\def\mag@prop@utile{#1}}
\define@key{prop@utile}{nom}{\def\mag@prop@nom{#1}}
\define@key{def@utile}{utile}{\def\mag@def@utile{#1}}
\define@key{def@utile}{nom}{\def\mag@def@nom{#1}}
\define@key{theo@utile}{utile}{\def\mag@theo@utile{#1}}
\define@key{theo@utile}{nom}{\def\mag@theo@nom{#1}}
\define@key{algo@utile}{utile}{\def\mag@algo@utile{#1}}
\define@key{algo@utile}{nom}{\def\mag@algo@nom{#1}}
\define@key{remarque@utile}{utile}{\def\mag@remarque@utile{#1}}
\define@key{exo@utile}{utile}{\def\mag@exo@utile{#1}}
%
\define@key{mag@exercice}{nom}{\def\mag@exercice@nom{#1}}
\define@key{mag@exercice}{utile}{\def\mag@exercice@utile{#1}}
\define@key{mag@exercice}{difficulte}{\def\mag@exercice@difficulte{#1}}
%
% On s'occupe des options%
%
\newcommand{\magprocess}{
  \ifthenelse{\equal{\mag@fontes}{fourier}}{
    \usepackage{fourier}}{}
  \ifthenelse{\equal{\mag@fontes}{fouriernc}}{
    \usepackage{fouriernc}}{}
  \ifthenelse{\equal{\mag@fontes}{palatino}}{
    \usepackage{palatino}}{}
 \ifthenelse{\equal{\mag@fontes}{computermodern}}{
    \ifthenelse{\equal{\mag@tex@distribution}{tetex}}{%
    \usepackage{lmodern}}{}}{}
  \ifthenelse{\equal{\mag@tex@minimal}{oui}}{}{
    \usepackage{
%      comment,
      url,                  %% Pour Afficher des urls,  notamment celle du
                            %%   site Velvia
      varwidth,             %% Pour faire des boites qui s'adaptent à la taille
                            %%   du texte (utilisé pour encadrer les conclusions
                            %%   dans les corrigés)
      pifont,               %% Utile pour la liste itemize des remarques
      color,                %% semble utile à fancybox
      fancybox,             %% Pour afficher des textes encadrés
      stmaryrd}             %% utile par exemple pour faire des intervalles
                            %%   d'entiers.
      % \setlength{\shadowsize}{2pt}
    }
  \usepackage{\mag@tex@packages}
  %
  % Gestion des solutions dans les exercices
  %
  \ifthenelse{\equal{\mag@solutions}{oui}}{%
    \Newassociation{solution}{Solutions}{ans}
    \Newassociation{indication}{Indication}{ans1}
    \Opensolutionfile{ans}[solutions-exercices]
    \Opensolutionfile{ans1}[indications-exercices]}{%
       \newenvironment{solution}{
%\begin{Sbox}%
          \begin{minipage}{\linewidth}}%
         {\end{minipage}%
%\begin{Sbox}%
         }
% Pour debuger les exercices de Franz
%    \newenvironment{solution}{\par}{}
    \newenvironment{indication}{%
%\begin{Sbox}%
        \begin{minipage}{\linewidth}}%
      {\end{minipage}%
%\begin{Sbox}%
      }}
  %
  % Creation de l'en-tête                                                       %
  %
  \AtBeginDocument{%
    %%
    %% Présentation minimale :
    %%
    %% Elle est supposée marcher sur n'importe quelle distribution LaTeX
    %% même minimale
    %%
    \ifthenelse{\equal{\mag@presentation}{minimal}}{%
      \noindent\begin{center}\fbox{\begin{minipage}{\linewidth-7pt}
      \ifthenelse{\equal{\mag@lieudiff}{classe}}
        {\noindent{\it\mag@lieu@lycee}\hfill%
         {\it\mag@lieu@classe\xspace année \mag@lieu@annee}
         \begin{center}
         \ifthenelse{\equal{\mag@typedocument}{sujet}}
           {{\Large\sc Devoir \mag@devoir@type{} \no\mag@devoir@numero}\\
            \mag@devoir@date\\
            \ifthenelse{\equal{\mag@devoir@type}{surveillé}}
              {Temps de composition~: \mag@devoir@temps\\}{}
            Vous attacherez la plus grande importance à la clarté, à la
            précision et à la concision de la rédaction.
            \ifthenelse{\equal{\mag@sujet@calculatrice}{non}}{L'usage d'une
            calculatrice est interdit.}{}
            }{}
         \ifthenelse{\equal{\mag@typedocument}{exos}}
           {\Large\sc Exercices~: \mag@exos@theme}{}
         \ifthenelse{\equal{\mag@typedocument}{cours}}
           {\Large\sc Cours~: \mag@cours@chapitre}{}
         \ifthenelse{\equal{\mag@typedocument}{tp}}
           {\Large\sc TP Info~: \mag@tp@theme}{}
         \ifthenelse{\equal{\mag@typedocument}{fiche}}
           {\Large\sc Fiche~: \mag@resume@chapitre}{}
         \end{center}
         \ifthenelse{\equal{\mag@licence}{oui}}
           {\noindent\small\copyright{} {\sc \mag@auteur@nom},
            protégé par la GNU Free Documentation License
            \hfill source disponible sur
            http://www.velvia.org}{}
        }
        {\begin{center}
         {\Large\sc \mag@document@nom}
         \end{center}       
         {\noindent\small\copyright{} {\sc \mag@auteur@nom},
          protégé par la GNU Free Documentation License
          \hfill source disponible sur 
          http://www.velvia.org}
        }\end{minipage}}\end{center}}{}
    %%
    %% Présentation du style velvia :
    %%
    %% C'est la présentation par défaut, utilisée notamment pour compiler
    %% les fichiers déstinés à être présents sur le site
    %%
    \ifthenelse{\equal{\mag@presentation}{velvia}}{%  
  
        \ifthenelse{\equal{\mag@tex@driver}{dvips}}{%
          %%\hbox{}\vspace{-1.06\baselineskip}
          \begin{boxitpara}{box 0.9999 setgray fill}}{%
          %%\hbox{}\vspace{-3\baselineskip}
%\begin{Sbox}%
       \begin{minipage}{0.97\linewidth}}
        \ifthenelse{\equal{\mag@lieudiff}{classe}}
          {\noindent{\it\mag@lieu@lycee}\hfill%
           {\it\mag@lieu@classe\xspace année \mag@lieu@annee}
           \begin{center}
           \ifthenelse{\equal{\mag@typedocument}{sujet}}
             {{\Large\sc Devoir \mag@devoir@type{} \no\mag@devoir@numero}\\
              \mag@devoir@date\\
              \ifthenelse{\equal{\mag@devoir@type}{surveillé}}
                {Temps de composition~: \mag@devoir@temps\\}{}
              Vous attacherez la plus grande importance à la clarté, à la
              précision et à la concision de la rédaction.
              \ifthenelse{\equal{\mag@sujet@calculatrice}{non}}{L'usage d'une
              calculatrice est interdit.}{}
              }{}
           \ifthenelse{\equal{\mag@typedocument}{exos}}
             {\Large\sc Exercices~: \mag@exos@theme}{}
           \ifthenelse{\equal{\mag@typedocument}{cours}}
             {\Large\sc Cours~: \mag@cours@chapitre}{}
           \ifthenelse{\equal{\mag@typedocument}{tp}}
             {\Large\sc TP Info~: \mag@tp@theme}{}
           \ifthenelse{\equal{\mag@typedocument}{fiche}}
             {\Large\sc Fiche~: \mag@resume@chapitre}{}
           \end{center}
           \ifthenelse{\equal{\mag@licence}{oui}}
             {\noindent\small\copyright{} {\sc \mag@auteur@nom},
              protégé par la GNU Free Documentation License
              \hfill source disponible sur \url{http://www.velvia.org}}{}
          }
          {\begin{center}
           {\Large\sc \mag@document@nom}
           %\ifthenelse{\equal{\mag@tex@driver}{dvips}}{\\ \rhino{0.20cm}}{\vspace{1cm}}
           \end{center}       
           %%\vspace{-0.8cm}
           {\noindent\small\copyright{} {\sc \mag@auteur@nom},
            protégé par la GNU Free Documentation License
            \hfill source disponible sur \url{http://www.velvia.org}}
          }
      \ifthenelse{\equal{\mag@tex@driver}{dvips}}{
      \end{boxitpara}}{\end{minipage}
%\begin{Sbox}%
      \begin{center}
      \shadowbox{%
%\TheSbox%
      }\end{center}}}{}
    %%
    %% Présentation style tikzvelvia
    %%
    %% En cours d'essai : je m'amuse avec la librairie tikz. Cela a l'avantage
    %% d'être plus joli et d'être portable.
    %%
    \ifthenelse{\equal{\mag@presentation}{tikzvelvia}}{%  
      \ifthenelse{\boolean{mag@article}}{%
      \ifthenelse{\equal{\mag@typedocument}{cours}}{% 
        \begin{tcolorbox}[enhanced,colback=colorLazoBlue2,boxrule=0.25cm,colframe=colorLazoBlue2Light,%
          arc=0pt,outer arc=0pt,leftrule=0pt,rightrule=0pt,
          fontupper=\color{white}\sffamily\bfseries\huge,
          enlarge left by=-1in-\hoffset-\oddsidemargin, 
          enlarge right by=-\paperwidth+1in+\hoffset+\oddsidemargin+\textwidth,
          width=\paperwidth,left=1in+\hoffset+\oddsidemargin,
          right=\paperwidth-1in-\hoffset-\oddsidemargin-\textwidth,top=0.6cm,bottom=0.6cm,
          % overlay={\node[fill=colorLazoPink2,draw=colorLazoBlue2Light,line width=0.15cm,
          %   inner sep=0pt,text width=1.7cm,minimum height=1.7cm,align=center,
          %   font=\color{white}\sffamily\bfseries\fontsize{30}{36}\selectfont] 
          %   (chapname) at ([xshift=-4cm]frame.north east) {\mag@cours@chapitrenumero};
          %   \node[font=\small,anchor=south,inner sep=2pt] at (chapname.north) {\MakeUppercase\ };}
						]
        \mag@cours@chapitre
        \end{tcolorbox}}{}
      \ifthenelse{\equal{\mag@typedocument}{exos}}{% 
        \begin{tcolorbox}[enhanced,colback=colorLazoBlue2,boxrule=0.25cm,colframe=colorLazoBlue2Light,%
          arc=0pt,outer arc=0pt,leftrule=0pt,rightrule=0pt,
          fontupper=\color{white}\sffamily\bfseries\huge,
          enlarge left by=-1in-\hoffset-\oddsidemargin, 
          enlarge right by=-\paperwidth+1in+\hoffset+\oddsidemargin+\textwidth,
          width=\paperwidth,left=1in+\hoffset+\oddsidemargin,
          right=\paperwidth-1in-\hoffset-\oddsidemargin-\textwidth,top=0.6cm,bottom=0.6cm,
          % overlay={\node[fill=colorLazoPink2,draw=colorLazoBlue2Light,line width=0.15cm,
          %   inner sep=0pt,text width=1.7cm,minimum height=1.7cm,align=center,
          %   font=\color{white}\sffamily\bfseries\fontsize{30}{36}\selectfont] 
          %   (chapname) at ([xshift=-4cm,yshift=-0.6cm]frame.north east) {\mag@exos@chapitrenumero};
          %   \node[font=\small,anchor=south,inner sep=2pt] at (chapname.north) {\MakeUppercase\ };}
            ]
        \mag@exos@theme%
        \end{tcolorbox}}{}
      \ifthenelse{\equal{\mag@typedocument}{sujet}}{% 
        \begin{tcolorbox}[enhanced,colback=colorLazoBlue2,boxrule=0.25cm,colframe=colorLazoBlue2Light,%
          arc=0pt,outer arc=0pt,leftrule=0pt,rightrule=0pt,
          fontupper=\color{white}\sffamily\bfseries\huge,
          enlarge left by=-1in-\hoffset-\oddsidemargin, 
          enlarge right by=-\paperwidth+1in+\hoffset+\oddsidemargin+\textwidth,
          width=\paperwidth,left=1in+\hoffset+\oddsidemargin,
          right=\paperwidth-1in-\hoffset-\oddsidemargin-\textwidth,top=0.6cm,bottom=0.6cm,
          overlay={\node[fill=colorLazoPink2,draw=colorLazoBlue2Light,line width=0.15cm,
            inner sep=0pt,text width=1.7cm,minimum height=1.7cm,align=center,
            font=\color{white}\sffamily\bfseries\fontsize{30}{36}\selectfont] 
            (chapname) at ([xshift=-4cm,yshift=-0.6cm]frame.north east) {\mag@devoir@numero};
            \node[font=\small,anchor=south,inner sep=2pt] at (chapname.north) {\MakeUppercase\ };}]
        %\mag@devoir@type/\mag@devoir@date%
        \mag@devoir@date%
        \end{tcolorbox}}{}
      \ifthenelse{\equal{\mag@typedocument}{fiche}}{% 
        \begin{tcolorbox}[enhanced,colback=colorLazoBlue2,boxrule=0.25cm,colframe=colorLazoBlue2Light,%
          arc=0pt,outer arc=0pt,leftrule=0pt,rightrule=0pt,
          fontupper=\color{white}\sffamily\bfseries\huge,
          enlarge left by=-1in-\hoffset-\oddsidemargin, 
          enlarge right by=-\paperwidth+1in+\hoffset+\oddsidemargin+\textwidth,
          width=\paperwidth,left=1in+\hoffset+\oddsidemargin,
          right=\paperwidth-1in-\hoffset-\oddsidemargin-\textwidth,top=0.6cm,bottom=0.6cm,
          overlay={\node[fill=colorLazoPink2,draw=colorLazoBlue2Light,line width=0.15cm,
            inner sep=0pt,text width=1.7cm,minimum height=1.7cm,align=center,
            font=\color{white}\sffamily\bfseries\fontsize{30}{36}\selectfont] 
            (chapname) at ([xshift=-4cm,yshift=-0.6cm]frame.north east) {\mag@resume@numero};
            \node[font=\small,anchor=south,inner sep=2pt] at (chapname.north) {\MakeUppercase\ };}]
        \mag@resume@chapitre%
        \end{tcolorbox}}{}
      }{% For the book
      %\tableofcontents
      }
    }{}      
    %%
    %% Présentation style centrale
    %%
    %% C'est l'en-tête des devoirs de l'école polytechnique
    %% Bien sur, cela ne marche que si le fichier est un devoir de l'X
    %%
    \ifthenelse{\equal{\mag@presentation}{centrale}}{%
      \parskip=3pt
      \begin{multicols}{2}
      \noindent{\fontfamily{phv}\textit{MATHÉMATIQUES I \hfill Filière MP}}\\
      \rule{\linewidth}{0.3pt}
      \begin{center}{\fontfamily{phv}\Huge MATHÉMATIQUES I}\bigskip\end{center}
      \rule{\linewidth}{0.3pt}
      \noindent\textit{\fontfamily{phv}\textit{MATHÉMATIQUES I \hfill Filière MP}}\\
      \rule{\linewidth}{0.3pt}
      \begin{center}{\fontfamily{phv}\Huge Filière MP}\bigskip\end{center}
      \rule{\linewidth}{0.3pt}
      \end{multicols}
    }{}
    %%
    %% Présentation style polytechnique
    %%
    %% C'est l'en-tête des devoirs de l'école polytechnique
    %% Bien sur, cela ne marche que si le fichier est un devoir de l'X
    %%
    \ifthenelse{\equal{\mag@presentation}{polytechnique}}{%
      \noindent{\bf\large ÉCOLE POLYTECHNIQUE \hfill FILIÈRE} 
      \ifthenelse{\equal{\mag@concours@filiere}{mp}}{{\bf\huge MP}}{}
      \ifthenelse{\equal{\mag@concours@filiere}{pc}}{{\bf\huge PC}}{}
      \ifthenelse{\equal{\mag@concours@filiere}{psi}}{{\bf\huge PSI}}{}\\
  
      \bigskip
      \noindent{\bf\large CONCOURS D'ADMISSION \mag@concours@annee}\\
  
      \vspace{1cm}
      \begin{center}
      {\bf\large
       \ifthenelse{\equal{\mag@concours@epreuve}{1}}{PREMIÈRE}{}
       \ifthenelse{\equal{\mag@concours@epreuve}{2}}{DEUXIÈME}{}
       COMPOSITION DE MATHÉMATIQUES}\\
  
      \bigskip
      (Durée~: 4~heures)\\
  
      \bigskip
      L'utilisation des calculatrices n'est pas autorisée pour cette épreuve.\\
  
      \bigskip
      $\star\star\star$
      \end{center}
      \bigskip}{}
    %%
    %% Gestion du nombre de colonnes
    %%
    \ifthenelse{\equal{\mag@nb@colonnes}{2}}{%
      \ifthenelse{\equal{\mag@colonnes@balanced}{no}}%
        {\begin{multicols*}{2}}{\begin{multicols}{2}}}{}
  }
  %
  % Avant de fermer le fichier
  %
  \AtEndDocument{\immediate\closeout10


      \mag@verifie@fin@exercice

      \ifthenelse{\equal{\mag@presentation}{polytechnique}}{%
        \[*\quad *\] \[*\]}{}
      \ifthenelse{\equal{\mag@presentation}{centrale}}{%
        \par\noindent
        \begin{minipage}{\linewidth}
        \rule{\linewidth}{1pt}
        \centerline{$\bullet\bullet\bullet\quad$ \textbf{FIN} $\quad\bullet\bullet\bullet$}
        \rule{\linewidth}{1pt}
        \end{minipage}}{}
      \ifthenelse{\equal{\mag@nb@colonnes}{2}}{%
      \ifthenelse{\equal{\mag@colonnes@balanced}{no}}%
        {\end{multicols*}}{\end{multicols}}}{}

      \ifthenelse{\equal{\mag@solutions}{oui}}{%
        \Closesolutionfile{ans}
        \newpage
        \ifthenelse{\equal{\mag@nb@colonnes}{2}}{\begin{multicols}{2}}{}
         \section{Solutions}
         \input{solutions-exercices}
        \ifthenelse{\equal{\mag@nb@colonnes}{2}}{\end{multicols}}{}}{}
  }
  %
  % Présentation des cours
  % 
\tcbuselibrary{theorems}
\newtheorem{voila}{Voila}[section]
\newtcbtheorem[number within=section]{theoremeBlue1}{Théorème}%
  {breakable,enhanced jigsaw,colback=colorLazoBlue1Light,colframe=colorLazoBlue1,fonttitle=\bfseries}{th}
\newtcbtheorem[number within=section]{theoremeBlue2}{Théorème}%
  {breakable,enhanced jigsaw,colback=colorLazoBlue2Light,colframe=colorLazoBlue2,fonttitle=\bfseries}{th}
\newtcbtheorem[number within=section]{theoremeGreen}{Théorème}%
  {breakable,enhanced jigsaw,colback=colorLazoGreenLight,colframe=colorLazoGreen,fonttitle=\bfseries}{th}
\newtcbtheorem[number within=section]{theoremePink1}{Théorème}%
  {breakable,enhanced jigsaw,colback=colorLazoPink1Light,colframe=colorLazoPink1,fonttitle=\bfseries}{th}
\newtcbtheorem[number within=section]{theoremePink2}{Théorème}%
  {breakable,enhanced jigsaw,colback=colorLazoPink2Light,colframe=colorLazoPink2,fonttitle=\bfseries}{th}
\newtcbtheorem[number within=section]{theoremeYellow1}{Théorème}%
  {breakable,enhanced jigsaw,colback=colorLazoYellow1Light,colframe=colorLazoYellow1,fonttitle=\bfseries}{th}
\newtcbtheorem[number within=section]{theoremeYellow2}{Théorème}%
  {breakable,enhanced jigsaw,colback=colorLazoYellow2Light,colframe=colorLazoYellow2,fonttitle=\bfseries}{th}
\newtcbtheorem[number within=section,use counter*=voila]{tikzdefinition}{Définition}%
  {breakable,enhanced jigsaw,colback=colorLazoBlue2Light,colframe=colorLazoBlue2,fonttitle=\bfseries}{th}
\newtcbtheorem[number within=section,use counter*=voila]{tikzproposition}{Proposition}%
  {breakable,enhanced jigsaw,colback=colorLazoYellow1Light,colframe=colorLazoYellow1,fonttitle=\bfseries}{th}
\newtcbtheorem[number within=section,use counter*=voila]{tikztheoreme}{Théorème}%
  {breakable,enhanced jigsaw,colback=colorLazoPink2Light,colframe=colorLazoPink2,fonttitle=\bfseries}{th}
\newtcbtheorem[number within=section,use counter*=voila]{tikzalgorithme}{Algorithme}%
  {breakable,enhanced jigsaw,colback=colorLazoPink2Light,colframe=colorLazoPink2,fonttitle=\bfseries}{th}
\newtcbtheorem[number within=section,use counter*=voila]{tikzcorollaire}{Corollaire}%
  {breakable,enhanced jigsaw,colback=colorLazoGreenLight,colframe=colorLazoGreen,fonttitle=\bfseries}{th}

  \newtheorem{Definition}{Définition}
  \newtheorem{Proposition}{Proposition}
  \newtheorem{Theoreme}{Théorème}
  \newtheorem{Algorithme}{Algorithme}
  \newtheorem{Corollaire}{Corollaire}
  \ifthenelse{\equal{\mag@tex@minimal}{oui}}{
  %% Dans le cas ou on souhaite le moins d'extensions LaTeX
  % \newenvironment{definition}{\begin{minipage}{0.9\linewidth}\begin{Definition}}
  %   {\end{Definition}\end{minipage}}
    % \newenvironment{proposition}{\begin{minipage}{0.9\linewidth}\begin{Proposition}}
    %   {\end{Theoreme}\end{minipage}}
  % \newenvironment{theoreme}{\begin{minipage}{0.9\linewidth}\begin{Theoreme}}
  %   {\end{Theoreme}\end{minipage}}
  \newenvironment{corollaire}{\begin{minipage}{0.9\linewidth}\begin{Corollaire}}
    {\end{Corollaire}\end{minipage}}
    }%
  %% Si on accepte d'avoir un peu plus, par exemple fancybox
  {
  % \newenvironment{definition}{%\begin{Sbox}\begin{minipage}{0.9\linewidth}
  %   \begin{Definition}}
  %   {\end{Definition}\end{minipage}%\begin{Sbox}\begin{center}
  %    \shadowbox{%\TheSbox}\end{center}}
  %\newenvironment{proposition}[1][]{%
  %\setkeys{prop@utile}{#1}%
  %\begin{minipage}{0.9\linewidth}\begin{Proposition}%
  % \ifthenelse{\equal{\mag@prop@utile}{0}}{$\circ\circ\circ$}{}%
  % \ifthenelse{\equal{\mag@prop@utile}{1}}{$\bullet\circ\circ$}{}%
  % \ifthenelse{\equal{\mag@prop@utile}{2}}{$\bullet\bullet\circ$}{}%
  % \ifthenelse{\equal{\mag@prop@utile}{3}}{$\bullet\bullet\bullet$}{}%
  %}{\end{Proposition}\end{minipage}}
% \newenvironment{proposition}{%
%   \begin{minipage}{0.9\linewidth}\begin{Proposition}%
%   }{\end{Proposition}\end{minipage}}

  % \newenvironment{proposition}[1][utile=0]{%
  %   \setkeys{prop@utile}{#1}%
  %   %\begin{Sbox}\begin{minipage}{0.9\linewidth}
  %   \begin{Proposition}}
  %   {\end{Proposition}\end{minipage}%\begin{Sbox}\begin{center}
  %    \shadowbox{%\TheSbox}\end{center}}
  % \newenvironment{theoreme}{%\begin{Sbox}\begin{minipage}{0.9\linewidth}
  %   \begin{Theoreme}}
  %   {\end{Theoreme}\end{minipage}%\begin{Sbox}\begin{center}
  %    \shadowbox{%\TheSbox}\end{center}}
\newenvironment{corollaire}[1][utile=0]{
  \begin{tikzcorollaire}{}{}
}{%
  \end{tikzcorollaire}%
}%

  % \newenvironment{corollaire}{%\begin{Sbox}\begin{minipage}{0.9\linewidth}
  %   \begin{Corollaire}}
  %   {\end{Corollaire}\end{minipage}%\begin{Sbox}\begin{center}
  %    \shadowbox{%\TheSbox}\end{center}}
}


  %}
  % 
  % Packages à charger et à régler selon le driver
  %
  % Si on utilise pdftex
  %
  \ifthenelse{\equal{\mag@tex@driver}{pdftex}}{%
    \ifthenelse{\equal{\mag@tex@pstricks}{non}}{}{%
      \usepackage{color}
      \usepackage[pdf]{pstricks}
       %\begin{psinputs}
       \usepackage{pst-plot}
       \usepackage{auto-pst-pdf}
       \usepackage{amsmath}
       \usepackage{amssymb}
       \usepackage{magnolia-maths}
       %,\mag@tex@pstricks}
       %\end{psinputs}%
       }
    \ifthenelse{\equal{\mag@format}{a4-landscape}}
    {\geometry{a4paper,landscape,hmargin={0.5cm,0.5cm},vmargin={0.5cm,0.5cm},pdftex}}{}
\ifthenelse{\boolean{mag@article}}{%
    \ifthenelse{\equal{\mag@format}{a4}}
    {\geometry{a4paper,hmargin=1.5cm,vmargin={1cm,2cm},pdftex}}{}
}{
\ifthenelse{\equal{\mag@format}{a4}}
%     {\geometry{a4paper,hmargin={2.5cm,1.5cm},vmargin={2cm,2cm},pdftex}}{}
%\ifthenelse{\equal{\mag@format}{a4}}
    % {\geometry{a4paper,hmargin={2cm,1cm},vmargin={2cm,2cm},pdftex}}{}
    {\geometry{a4paper,hmargin={1.5cm,1.5cm},vmargin={2cm,2cm},pdftex}}{}
}
    \ifthenelse{\equal{\mag@format}{presentation}}
    {\geometry{paperheight=12cm,paperwidth=16cm,hmargin=0.5cm,vmargin={0.5cm,0.5cm},pdftex}}{}
    \ifthenelse{\equal{\mag@format}{a3}}
    {\geometry{a4paper,mag=707,truedimen,hmargin={0.5truecm,0.5truecm},nohead,nofoot,
               top=0.5truecm,bottom=0.5truecm,pdftex}}{}}{}
 % {\geometry{a4paper,mag=707,truedimen,hmargin={1.2truecm,-0.2truecm},nohead,nofoot,
 %               top=1.5truecm,bottom=0.5truecm,pdftex}}{}}{}
  %
  % Si on utilise dvips
  %
  \ifthenelse{\equal{\mag@tex@driver}{dvips}}{  
    \usepackage{psboxit}
    \ifthenelse{\equal{\mag@tex@pstricks}{non}}{}{%
    \usepackage{\mag@tex@pstricks}
    \newenvironment{pdfpic}{}{}}
    \ifthenelse{\equal{\mag@format}{a4-landscape}}
      {\geometry{a4paper,landscape,hmargin=0.5cm,vmargin={0.6cm,2.4cm},dvips}}{}
    \ifthenelse{\equal{\mag@format}{a4}}
      {\geometry{a4paper,hmargin=1.5cm,vmargin={1cm,2cm},dvips}}{}
    \ifthenelse{\equal{\mag@format}{a3}}
      {\ifthenelse{\equal{\mag@tex@distribution}{tetex}}{%
         \geometry{a4paper,mag=707,truedimen,hmargin=0.618truecm,nohead,nofoot,
                   top=0.4truecm,bottom=0.5truecm,dvips}}{}
       \ifthenelse{\equal{\mag@tex@distribution}{texlive}}{%
         \geometry{a4paper,mag=707,truedimen,hmargin={0.618truecm,0.8truecm},
                   nohead,nofoot,top=0.5truecm,bottom=0.5truecm,dvips}}{}}{}}{}
  %
  % Options de mise en page
  %
  \ifthenelse{\equal{\mag@sol}{oui}}{%  
    \newenvironment{sol}{\color{\mag@couleur@sol}\begin{proof}[Solution]}{\end{proof}\color{black}}%
  }{%
    \newenvironment{sol}{\expandafter\comment}{\expandafter\endcomment}%
  }


\ifthenelse{\equal{\mag@misenpageauteur}{francois}}{%
  \newenvironment{francois}{}{}%
  \newenvironment{victor}{%
	  \expandafter\comment}{\expandafter\endcomment%
  }%
  \newenvironment{laurence}{%
    \expandafter\comment}{\expandafter\endcomment%
  }%
}{}
\ifthenelse{\equal{\mag@misenpageauteur}{victor}}{%
  \newenvironment{victor}{}{}%
  \newenvironment{francois}{%
	  \expandafter\comment}{\expandafter\endcomment%
  }%
  \newenvironment{laurence}{%
	  \expandafter\comment}{\expandafter\endcomment%
  }%
}{}
\ifthenelse{\equal{\mag@misenpageauteur}{laurence}}{%
  \newenvironment{laurence}{}{}%
  \newenvironment{francois}{%
	  \expandafter\comment}{\expandafter\endcomment%
  }%
  \newenvironment{victor}{%
	  \expandafter\comment}{\expandafter\endcomment%
  }%%
}{}
\ifthenelse{\equal{\mag@misenpageauteur}{tous}}{%
  \newenvironment{francois}{}{}%
  \newenvironment{victor}{}{}%
  \newenvironment{laurence}{}{}%
}{}


  \ifthenelse{\equal{\mag@preuve}{oui}}{%
     \newenvironment{preuve}{\color{\mag@couleur@preuve}\begin{proof}}{\end{proof}\color{black}}
     \renewcommand{\proofname}{Démonstration}}
  {  \newenvironment{preuve}{%
%\begin{Sbox}%
\expandafter\comment
%\begin{minipage}{\linewidth}%
}%
{
\expandafter\endcomment
% \end{minipage}%
%\begin{Sbox}%
  }}
  \ifthenelse{\equal{\mag@prof}{oui}}{%
    \newenvironment{prof}{\color{red}\begin{itshape}}{\end{itshape}\color{black}}}
  {  \newenvironment{prof}{%
%\begin{Sbox}%
    \begin{minipage}{\linewidth}}%
      {\end{minipage}%
%\begin{Sbox}%
    }}
  % \ifthenelse{\equal{\mag@exemple}{oui}}{%
    \newenvironment{applications}
     {%
       \par\noindent
       {\bf Applications}
       \begin{list}{}{%
       \renewcommand{\makelabel}{\ding{241}}%
     %%  \setlength{\topsep}{0cm}
       \setlength{\labelwidth}{0.5cm}%
       \setlength{\labelsep}{0cm}%
       \setlength{\leftmargin}{0.5cm}%
       \setlength{\rightmargin}{0cm}%
       \setlength{\itemindent}{0cm}%
			 }
     }
     {
       \end{list} 
     }
     \newcommand{\application}{\item}
     % \newcommand{\remarque}{\item}
     \newcommand{\exemple}{\item}
     \newenvironment{remarqueUnique}
     {%
       \par\noindent%\hspace{0.4cm}%
       {\bf Remarque}%
       \begin{list}{}{%
       \renewcommand{\makelabel}{\ding{241}}%
       \setlength{\labelwidth}{0.5cm}%
       \setlength{\labelsep}{0cm}%
       \setlength{\leftmargin}{0.5cm}%
       \setlength{\rightmargin}{0cm}%
       \setlength{\itemindent}{0cm}\@beginparpenalty=10000}%
     }%
     {%
       \end{list}%
     }
     \newenvironment{remarques}
     {%
       \par\noindent%\hspace{0.4cm}%
       {\bf Remarques}%
       \begin{list}{}{%
       \renewcommand{\makelabel}{\ding{241}}%
       \setlength{\labelwidth}{0.5cm}%
       \setlength{\labelsep}{0cm}%
       \setlength{\leftmargin}{0.5cm}%
       \setlength{\rightmargin}{0cm}%
       \setlength{\itemindent}{0cm}
       \@beginparpenalty=10000
       }%
     }%
     {%
       \end{list}%
     }
     % \tcolorboxenvironment{remarques}{blanker, before skip=6pt,after skip=6pt, borderline west={3mm}{0pt}{colorLazoPink2}}
     % \tcolorboxenvironment{remarqueUnique}{blanker, before skip=6pt,after skip=6pt, borderline west={3mm}{0pt}{colorLazoPink2}}
     \newenvironment{exemples}
     {%
       \par\noindent%
       {\bf Exemples}%
       \begin{list}{}{%
       \renewcommand{\makelabel}{\ding{241}}%
       \setlength{\labelwidth}{0.5cm}%
       \setlength{\labelsep}{0cm}%
       \setlength{\leftmargin}{0.5cm}%
       \setlength{\rightmargin}{0cm}%
       \setlength{\itemindent}{0cm}\@beginparpenalty=10000}%
       % \setlength{\labelwidth}{0.2cm}%
 %       \setlength{\labelsep}{0cm}%
       % \setlength{\leftmargin}{0.5cm}%
 %       \setlength{\rightmargin}{0cm}%
       % \setlength{\itemindent}{0cm}
 %\@beginparpenalty=10000
     }%
     {%
       \end{list}%
     }
     \newenvironment{exempleUnique}
     {%
       \par\noindent%
       {\bf Exemple}%
       \begin{list}{}{%
       \renewcommand{\makelabel}{\ding{241}}%
       \setlength{\labelwidth}{0.5cm}%
       \setlength{\labelsep}{0cm}%
       \setlength{\leftmargin}{0.5cm}%
       \setlength{\rightmargin}{0cm}%
       \setlength{\itemindent}{0cm}\@beginparpenalty=10000}%
       % \setlength{\labelwidth}{0.2cm}%
 %       \setlength{\labelsep}{0cm}%
       % \setlength{\leftmargin}{0.5cm}%
 %       \setlength{\rightmargin}{0cm}%
       % \setlength{\itemindent}{0cm}
 %\@beginparpenalty=10000
     }%
     {%
       \end{list}%
     }
     \newenvironment{exos}
     {%
       %\vspace{2ex}
       \par\noindent\hspace{0.5cm}%
       {\bf Exercices \arabic{numeroexercicecours}}%
       \stepcounter{numeroexercicecours}
       \begin{list}{}{%
       \renewcommand{\makelabel}{\ding{241}}%
       \setlength{\labelwidth}{0.5cm}%
       \setlength{\labelsep}{0cm}%
       \setlength{\leftmargin}{1cm}%
       \setlength{\rightmargin}{0cm}%
       \setlength{\itemindent}{0cm}
       \@beginparpenalty=10000
       }%
       % \setlength{\labelwidth}{0.2cm}%
 %       \setlength{\labelsep}{0cm}%
       % \setlength{\leftmargin}{0.5cm}%
 %       \setlength{\rightmargin}{0cm}%
       % \setlength{\itemindent}{0cm}
 %\@beginparpenalty=10000
     }%
     {%
       \end{list}%
     }
     \newenvironment{exoUnique}
     {%
       %\vspace{2ex}
       \par\noindent\hspace{0.5cm}%
       {\bf Exercice \arabic{numeroexercicecours}}%
       \stepcounter{numeroexercicecours}
       \begin{list}{}{%
       \renewcommand{\makelabel}{\ding{241}}%
              \setlength{\labelwidth}{0.5cm}%
       \setlength{\labelsep}{0cm}%
       \setlength{\leftmargin}{1cm}%
       \setlength{\rightmargin}{0cm}%
       \setlength{\itemindent}{0cm}\@beginparpenalty=10000}%
       % \setlength{\labelwidth}{0.2cm}%
 %       \setlength{\labelsep}{0cm}%
       % \setlength{\leftmargin}{0.5cm}%
 %       \setlength{\rightmargin}{0cm}%
       % \setlength{\itemindent}{0cm}
 %\@beginparpenalty=10000
     }%
     {%
       \end{list}%
     }
     \tcolorboxenvironment{exos}{breakable, blanker, before skip=6pt,after skip=6pt, borderline west={3mm}{0pt}{colorLazoGreen}}
     \tcolorboxenvironment{exoUnique}{breakable, blanker, before skip=6pt,after skip=6pt, borderline west={3mm}{0pt}{colorLazoGreen}}
     %\newcommand{\exo}{\item}
     \newenvironment{cas}{\begin{enumerate}}{\end{enumerate}}

  %    }
  % {%
  %    \newcommand{\application}{\item}
  %    %\newcommand{\remarque}{\item}
  %    \newcommand{\exemple}{\item}
  %    \newcommand{\exoessai}{\item}
  %   \newenvironment{applications}{%\begin{Sbox}\begin{minipage}{\linewidth}%
  %     \begin{itemize}}{\end{itemize}\end{minipage}%\begin{Sbox}}
  %   \newenvironment{remarques}{%\begin{Sbox}\begin{minipage}{\linewidth}%
  %     \begin{itemize}}{\end{itemize}\end{minipage}%\begin{Sbox}}
  %   \newenvironment{exemples}{%\begin{Sbox}\begin{minipage}{\linewidth}%
  %     \begin{itemize}}{\end{itemize}\end{minipage}%\begin{Sbox}}
  %     }
  \ifthenelse{\boolean{mag@article}}{%
  \pagestyle{empty}}{}
}

% \newtheorem{Proposition}{Proposition}
%\begin{minipage}{0.9\linewidth}
%\end{minipage}
% \newenvironment{proposition}{\begin{Proposition}}{\end{Proposition}}

% \newenvironment{definition}[1][utile=0]{
%   \def\mag@def@nom{none}
%   \setkeys{def@utile}{#1}%
%   %\begin{Sbox}\begin{minipage}{0.9\linewidth}
%   \ifthenelse{\equal{\mag@def@nom}{none}}{\begin{Definition}[%
%   \ifthenelse{\equal{\mag@def@utile}{0}}{\mbox{$\circ\!\circ\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@def@utile}{-1}}{\mbox{$\bullet\!\circ\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@def@utile}{1}}{\mbox{$\bullet\!\circ\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@def@utile}{-2}}{\mbox{$\circ\!\bullet\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@def@utile}{2}}{\mbox{$\bullet\!\bullet\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@def@utile}{-3}}{\mbox{$\circ\!\circ\!\bullet$}}{}%
%   \ifthenelse{\equal{\mag@def@utile}{3}}{\mbox{$\bullet\!\bullet\!\bullet$}}{}]}{%
%   \begin{Definition}[(%
%   \ifthenelse{\equal{\mag@def@utile}{0}}{\mbox{$\circ\!\circ\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@def@utile}{-1}}{\mbox{$\bullet\!\circ\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@def@utile}{1}}{\mbox{$\bullet\!\circ\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@def@utile}{-2}}{\mbox{$\circ\!\bullet\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@def@utile}{2}}{\mbox{$\bullet\!\bullet\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@def@utile}{-3}}{\mbox{$\circ\!\circ\!\bullet$}}{}%
%   \ifthenelse{\equal{\mag@def@utile}{3}}{\mbox{$\bullet\!\bullet\!\bullet$}}{})
%   \textbf{\mag@def@nom}]}%
%   }{%
%   \end{Definition}\end{minipage}%\begin{Sbox}\begin{center}%
%   \shadowbox{%\TheSbox}\end{center}%
%   }

\newenvironment{definition}[1][utile=0]{
  \def\mag@def@nom{none}
  \setkeys{def@utile}{#1}%
  % \def\myscode{bbb}
  % \ifthenelse{\equal{\mag@def@utile}{-3}}{\def\myscode{aaa}}{}
  \ifthenelse{\equal{\mag@def@nom}{none}}{\begin{tikzdefinition}{}{}%
  % \ifthenelse{\equal{\mag@def@utile}{0}}{\mbox{$\circ\!\circ\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{-1}}{\mbox{$\bullet\!\circ\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{1}}{\mbox{$\bullet\!\circ\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{-2}}{\mbox{$\circ\!\bullet\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{2}}{\mbox{$\bullet\!\bullet\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{3}}{\mbox{$\bullet\!\bullet\!\bullet$}}{}
  }{%
  \begin{tikzdefinition}{\mag@def@nom}{}%
  }%
  % \begin{tikzdefinition}{(%
  % \ifthenelse{\equal{\mag@def@utile}{0}}{\mbox{$\circ\!\circ\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{-1}}{\mbox{$\bullet\!\circ\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{1}}{\mbox{$\bullet\!\circ\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{-2}}{\mbox{$\circ\!\bullet\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{2}}{\mbox{$\bullet\!\bullet\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{-3}}{\mbox{$\circ\!\circ\!\bullet$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{3}}{\mbox{$\bullet\!\bullet\!\bullet$}}{})
  % \textbf{\mag@def@nom}}{}%
  % \begin{tikzdefinition}{}{}
  }{%
  \end{tikzdefinition}%
  }

% \newenvironment{proposition}[1][utile=0]{
%   \def\mag@prop@nom{none}
%   \setkeys{prop@utile}{#1}%
%   %\begin{Sbox}\begin{minipage}{0.9\linewidth}
%   \ifthenelse{\equal{\mag@prop@nom}{none}}{\begin{Proposition}[%
%   \ifthenelse{\equal{\mag@prop@utile}{0}}{\mbox{$\circ\!\circ\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@prop@utile}{-1}}{\mbox{$\bullet\!\circ\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@prop@utile}{1}}{\mbox{$\bullet\!\circ\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@prop@utile}{-2}}{\mbox{$\circ\!\bullet\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@prop@utile}{2}}{\mbox{$\bullet\!\bullet\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@prop@utile}{-3}}{\mbox{$\circ\!\circ\!\bullet$}}{}%
%   \ifthenelse{\equal{\mag@prop@utile}{3}}{\mbox{$\bullet\!\bullet\!\bullet$}}{}]}{%
%   \begin{Proposition}[(%
%   \ifthenelse{\equal{\mag@prop@utile}{0}}{\mbox{$\circ\!\circ\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@prop@utile}{-1}}{\mbox{$\bullet\!\circ\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@prop@utile}{1}}{\mbox{$\bullet\!\circ\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@prop@utile}{-2}}{\mbox{$\circ\!\bullet\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@prop@utile}{2}}{\mbox{$\bullet\!\bullet\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@prop@utile}{-3}}{\mbox{$\circ\!\circ\!\bullet$}}{}%
%   \ifthenelse{\equal{\mag@prop@utile}{3}}{\mbox{$\bullet\!\bullet\!\bullet$}}{}) %
%   \textbf{\mag@prop@nom}]}%
%   }{%
%   \end{Proposition}\end{minipage}%\begin{Sbox}\begin{center}%
%   \shadowbox{%\TheSbox}\end{center}%
%   }

\newenvironment{proposition}[1][utile=0]{
  \def\mag@prop@nom{none}
  \setkeys{prop@utile}{#1}%
  \ifthenelse{\equal{\mag@prop@nom}{none}}{\begin{tikzproposition}{}{}}{%
  \begin{tikzproposition}{\mag@prop@nom}{}}
  % \ifthenelse{\equal{\mag@def@utile}{0}}{\mbox{$\circ\!\circ\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{-1}}{\mbox{$\bullet\!\circ\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{1}}{\mbox{$\bullet\!\circ\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{-2}}{\mbox{$\circ\!\bullet\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{2}}{\mbox{$\bullet\!\bullet\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{-3}}{\mbox{$\circ\!\circ\!\bullet$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{3}}{\mbox{$\bullet\!\bullet\!\bullet$}}{}
  %}{}%
  % \begin{tikzdefinition}{(%
  % \ifthenelse{\equal{\mag@def@utile}{0}}{\mbox{$\circ\!\circ\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{-1}}{\mbox{$\bullet\!\circ\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{1}}{\mbox{$\bullet\!\circ\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{-2}}{\mbox{$\circ\!\bullet\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{2}}{\mbox{$\bullet\!\bullet\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{-3}}{\mbox{$\circ\!\circ\!\bullet$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{3}}{\mbox{$\bullet\!\bullet\!\bullet$}}{})
  % \textbf{\mag@def@nom}}{}%
  % \begin{tikzdefinition}{}{}
  }{%
  \end{tikzproposition}
  }

% \newenvironment{theoreme}[1][utile=0]{
%   \def\mag@theo@nom{none}
%   \setkeys{theo@utile}{#1}%
%   %\begin{Sbox}\begin{minipage}{0.9\linewidth}
%   \ifthenelse{\equal{\mag@theo@nom}{none}}{\begin{Theoreme}[%
%   \ifthenelse{\equal{\mag@theo@utile}{0}}{\mbox{$\circ\!\circ\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@theo@utile}{-1}}{\mbox{$\bullet\!\circ\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@theo@utile}{1}}{\mbox{$\bullet\!\circ\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@theo@utile}{-2}}{\mbox{$\circ\!\bullet\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@theo@utile}{2}}{\mbox{$\bullet\!\bullet\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@theo@utile}{-3}}{\mbox{$\circ\!\circ\!\bullet$}}{}%
%   \ifthenelse{\equal{\mag@theo@utile}{3}}{\mbox{$\bullet\!\bullet\!\bullet$}}{}]}{
%   \begin{Theoreme}[(%
%   \ifthenelse{\equal{\mag@theo@utile}{0}}{\mbox{$\circ\!\circ\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@theo@utile}{-1}}{\mbox{$\bullet\!\circ\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@theo@utile}{1}}{\mbox{$\bullet\!\circ\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@theo@utile}{-2}}{\mbox{$\circ\!\bullet\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@theo@utile}{2}}{\mbox{$\bullet\!\bullet\!\circ$}}{}%
%   \ifthenelse{\equal{\mag@theo@utile}{-3}}{\mbox{$\circ\!\circ\!\bullet$}}{}%
%   \ifthenelse{\equal{\mag@theo@utile}{3}}{\mbox{$\bullet\!\bullet\!\bullet$}}{}) %
%   \textbf{\mag@theo@nom}]}%
%   }{%
%   \end{Theoreme}\end{minipage}%\begin{Sbox}\begin{center}
%   \shadowbox{%\TheSbox}\end{center}
%   }

\newenvironment{theoreme}[1][utile=0]{
  \def\mag@theo@nom{none}
  \setkeys{theo@utile}{#1}%
  \ifthenelse{\equal{\mag@theo@nom}{none}}{\begin{tikztheoreme}{}{}}{%
  \begin{tikztheoreme}{\mag@theo@nom}{}}
  % \ifthenelse{\equal{\mag@def@utile}{0}}{\mbox{$\circ\!\circ\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{-1}}{\mbox{$\bullet\!\circ\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{1}}{\mbox{$\bullet\!\circ\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{-2}}{\mbox{$\circ\!\bullet\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{2}}{\mbox{$\bullet\!\bullet\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{-3}}{\mbox{$\circ\!\circ\!\bullet$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{3}}{\mbox{$\bullet\!\bullet\!\bullet$}}{}
  %}{}%
  % \begin{tikzdefinition}{(%
  % \ifthenelse{\equal{\mag@def@utile}{0}}{\mbox{$\circ\!\circ\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{-1}}{\mbox{$\bullet\!\circ\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{1}}{\mbox{$\bullet\!\circ\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{-2}}{\mbox{$\circ\!\bullet\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{2}}{\mbox{$\bullet\!\bullet\!\circ$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{-3}}{\mbox{$\circ\!\circ\!\bullet$}}{}%
  % \ifthenelse{\equal{\mag@def@utile}{3}}{\mbox{$\bullet\!\bullet\!\bullet$}}{})
  % \textbf{\mag@def@nom}}{}%
  % \begin{tikzdefinition}{}{}
  }{%
  \end{tikztheoreme}
  }

\newenvironment{algorithme}[1][utile=0]{
  \def\mag@algo@nom{none}
  \setkeys{algo@utile}{#1}%
  \ifthenelse{\equal{\mag@algo@nom}{none}}{\begin{tikzalgorithme}{}{}}{%
  \begin{tikzalgorithme}{\mag@algo@nom}{}}
}{%
  \end{tikzalgorithme}
}


\newcommand{\remarque}[1][utile=0]{%
  \setlength{\labelwidth}{0.5cm}%
  \setlength{\labelsep}{0cm}%
  \setlength{\leftmargin}{0.5cm}%
  \setlength{\rightmargin}{0cm}%
  \setlength{\itemindent}{0cm}
  \setkeys{remarque@utile}{#1}%
  \item%
  % \ifthenelse{\equal{\mag@remarque@utile}{0}}{\mbox{($\circ\!\circ\!\circ$)}}{}%
  % \ifthenelse{\equal{\mag@remarque@utile}{-1}}{\mbox{($\bullet\!\circ\!\circ$)}}{}%
  % \ifthenelse{\equal{\mag@remarque@utile}{1}}{\mbox{($\bullet\!\circ\!\circ$)}}{}%
  % \ifthenelse{\equal{\mag@remarque@utile}{-2}}{\mbox{($\circ\!\bullet\!\circ$)}}{}%
  % \ifthenelse{\equal{\mag@remarque@utile}{2}}{\mbox{($\bullet\!\bullet\!\circ$)}}{}%
  % \ifthenelse{\equal{\mag@remarque@utile}{-3}}{\mbox{($\circ\!\circ\!\bullet$)}}{}%
  % \ifthenelse{\equal{\mag@remarque@utile}{3}}{\mbox{($\bullet\!\bullet\!\bullet$)}}{}
  \setlength{\labelsep}{0.2cm}%
  \setlength{\leftmargin}{0.2cm}%
  \setlength{\itemindent}{0.2cm}%
}
\newcommand{\exo}[1][utile=0]{%
 \setlength{\labelwidth}{0.5cm}%
 \setlength{\labelsep}{0cm}%
 \setlength{\leftmargin}{1cm}%
 \setlength{\rightmargin}{0cm}%
 \setlength{\itemindent}{0cm}
  \setkeys{exo@utile}{#1}%
  \item%
  % \ifthenelse{\equal{\mag@exo@utile}{0}}{\mbox{($\circ\!\circ\!\circ$)}}{}%
  % \ifthenelse{\equal{\mag@exo@utile}{-1}}{\mbox{($\bullet\!\circ\!\circ$)}}{}%
  % \ifthenelse{\equal{\mag@exo@utile}{1}}{\mbox{($\bullet\!\circ\!\circ$)}}{}%
  % \ifthenelse{\equal{\mag@exo@utile}{-2}}{\mbox{($\circ\!\bullet\!\circ$)}}{}%
  % \ifthenelse{\equal{\mag@exo@utile}{2}}{\mbox{($\bullet\!\bullet\!\circ$)}}{}%
  % \ifthenelse{\equal{\mag@exo@utile}{-3}}{\mbox{($\circ\!\circ\!\bullet$)}}{}%
  % \ifthenelse{\equal{\mag@exo@utile}{3}}{\mbox{($\bullet\!\bullet\!\bullet$)}}{}
  \setlength{\labelsep}{0.2cm}%
  \setlength{\leftmargin}{0.2cm}%
  \setlength{\itemindent}{0.2cm}%
}

%
% Mise en page
%
% Table des matières
%
\setcounter{tocdepth}{2}
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                 Le rhino en pstricks                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%
\newcommand{\rhino}[1]{
\psset{unit=#1}
\psset{linewidth=0.5pt}
\begin{pspicture}(0,0)(8.75,6.6)
\pscurve(4.83,5.83)(5.36,5.12)(6.07,4.43)(6.86,3.93)(7.31,3.72)(7.59,3.45)%
(7.80,2.93)(7.90,2.55)(7.92,2.17)(7.77,1.93)(7.50,1.72)(7.34,1.57)(7.32,1.40)%
(7.37,0.98)(7.27,0.78)(6.91,0.72)(6.59,0.85)(6.26,0.83)(5.94,0.95)(5.96,1.10)%
(5.97,1.38)(6.01,1.57)(5.71,1.52)(5.41,1.53)(5.23,1.60)(5.18,1.52)(5.14,1.23)%
(5.13,0.92)(5.16,0.70)(5.11,0.55)(4.81,0.43)(4.48,0.42)(4.33,0.50)(4.13,0.45)%
(3.86,0.47)(3.68,0.62)(3.59,0.78)(3.58,1.25)(3.59,1.92)(3.51,1.98)(2.86,1.75)%
(2.33,1.48)(2.00,1.43)(1.70,1.50)(1.46,1.70)(1.40,2.03)(1.45,2.33)(1.58,2.53)%
(1.55,2.63)(1.30,3.02)(1.10,3.42)(1.03,3.82)(1.15,3.80)(1.41,3.62)(1.80,3.35)%
(2.03,3.17)(2.13,3.23)(1.98,3.52)(2.03,3.93)(2.13,3.88)(2.31,3.73)(2.45,3.72)%
(2.53,3.85)(2.60,4.20)(2.63,4.62)(2.66,4.90)(2.58,4.97)(2.38,5.15)(2.26,5.37)%
(2.25,5.73)(2.35,6.02)(2.51,5.95)(2.75,5.68)(2.88,5.50)(2.96,5.58)(3.19,5.75)%
(3.59,5.85)(3.89,5.85)(4.21,5.97)(4.43,5.95)(4.63,6.05)(4.73,6.00)(4.83,5.83)
\pscurve(3.51,2.00)(3.94,2.17)(4.23,2.42)(4.43,2.73)(4.49,3.00)(4.46,3.32)%
(4.34,3.58)(4.23,3.92)(4.21,4.28)(4.26,4.58)(4.28,4.83)(4.39,4.92)(4.56,5.08)%
(4.66,5.30)(4.71,5.58)(4.79,5.83)(4.81,5.86)
\pscurve(3.59,5.85)(3.79,5.77)(3.93,5.62)(3.98,5.52)(4.06,5.60)(4.24,5.77)%
(4.43,5.95)
\pscurve(3.81,2.10)(4.01,1.87)(4.21,1.72)(4.34,1.77)(4.46,1.97)(4.58,2.15)%
(4.73,2.23)(4.93,2.20)(5.08,2.03)(5.23,1.82)(5.42,1.75)(5.77,1.73)(6.11,1.87)%
(6.39,2.10)(6.71,2.28)(7.02,2.38)(7.34,2.35)(7.49,2.28)(7.57,2.18)(7.62,2.25)%
(7.69,2.52)(7.60,2.90)(7.34,3.35)(6.97,3.65)(6.67,3.78)(6.39,3.93)(6.12,4.10)%
(5.79,4.38)(5.47,4.65)(5.14,5.02)(4.93,5.33)(4.81,5.48)(4.71,5.58)
\pscurve(4.23,5.75)(4.06,5.72)(3.91,5.68)
\pscurve(3.84,1.73)(4.19,1.43)(4.23,1.35)(4.26,0.98)(4.28,0.75)(4.14,0.67)%
(3.99,0.67)(3.89,0.73)(3.83,0.88)(3.84,1.23)(3.84,1.73)
\pscurve(4.48,1.47)(4.48,0.68)(4.54,0.63)(4.71,0.62)(4.91,0.68)(4.96,0.82)%
(4.91,1.00)(4.91,1.22)(4.98,1.45)(5.03,1.70)(4.98,1.92)(4.76,2.03)(4.64,1.92)%
(4.48,1.47)
\pscurve(6.19,1.62)(6.16,1.33)(6.12,1.08)(6.21,1.00)(6.36,0.97)(6.52,1.02)%
(6.54,1.22)(6.54,1.65)(6.47,1.75)(6.19,1.62)
\pscurve(6.71,1.92)(6.74,1.00)(6.91,0.88)(7.09,0.88)(7.16,1.03)(7.14,1.28)%
(7.11,1.55)(7.21,1.77)(7.37,2.02)(7.26,2.18)(7.01,2.18)(6.84,2.12)(6.71,1.92)
\pscurve(3.51,4.22)(3.64,4.35)(3.68,4.58)(3.59,4.68)(3.49,4.62)(3.44,4.45)%
(3.44,4.32)(3.51,4.22)
\pscurve(3.05,4.25)(3.19,4.35)(3.23,4.55)(3.18,4.72)(3.06,4.70)(3.00,4.55)%
(3.00,4.38)(3.05,4.25)
\pscurve(4.19,2.68)(3.93,2.47)(3.54,2.27)(3.05,2.03)(2.33,1.73)(2.110,1.65)%
(1.85,1.63)(1.66,1.75)(1.56,1.95)(1.58,2.22)(1.68,2.45)(1.80,2.40)(2.01,2.38)%
(2.20,2.53)(2.33,2.68)(2.31,2.87)(2.21,3.03)(2.28,3.08)(2.46,3.05)(2.65,3.17)%
(2.75,3.35)(2.71,3.52)(2.58,3.63)(2.66,3.75)(2.73,4.07)(2.78,4.60)(2.91,5.08)%
(3.16,5.55)(3.41,5.68)(3.44,5.43)(3.53,5.50)(3.61,5.68)(3.74,5.63)(3.83,5.47)%
(3.89,5.32)(4.04,5.38)(4.26,5.55)(4.56,5.78)(4.58,5.75)(4.56,5.48)(4.49,5.27)%
(4.36,5.12)(4.16,5.07)(4.03,5.05)(4.06,4.90)(4.09,4.68)(4.04,4.42)(4.01,4.10)%
(4.03,3.80)(4.16,3.53)(4.28,3.28)(4.34,3.00)(4.31,2.80)(4.19,2.68)
\pscurve(1.23,3.62)(1.23,3.43)(1.30,3.30)(1.46,3.03)(1.65,2.78)(1.81,2.57)%
(1.93,2.52)(2.05,2.55)(2.15,2.67)(2.16,2.80)(2.08,2.92)(1.90,3.02)(1.63,3.25)%
(1.45,3.38)(1.23,3.62)
\pscurve(2.41,3.18)(2.26,3.28)(2.13,3.48)(2.15,3.70)(2.25,3.65)(2.43,3.53)%
(2.60,3.45)(2.60,3.33)(2.51,3.22)(2.41,3.18)
\pscurve(2.70,5.07)(2.51,5.20)(2.40,5.38)(2.38,5.72)(2.45,5.80)(2.55,5.65)%
(2.65,5.52)(2.76,5.37)(2.81,5.28)(2.76,5.17)(2.70,5.07)
\end{pspicture}}
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Gestion des problemes                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
\newcommand\problemetitre%
  {\@startsection {section}{10}{\z@}%
                  {-3.5ex \@plus -1ex \@minus -.2ex}%
                  {2.3ex \@plus.2ex}%
                  {\center\normalfont%
                   \ifthenelse{\equal{\mag@presentation}{velvia}}{%
                     \Large\bfseries\sffamily}{}
                   \ifthenelse{\equal{\mag@presentation}{tikzvelvia}}{%
                     \Large\bfseries\sffamily}{}
                   \ifthenelse{\equal{\mag@presentation}{polytechnique}}{%
                     \large\bfseries}{}}}
\newcounter{enumpartie}
\newcounter{enumquestion}
\newcounter{questioncontinu}
\global\def\mag@probleme@numquestions{riendutout}
\newcommand{\probleme}[1]
  {\setkeys{kv@magprobleme}{#1}
   \ifthenelse{\equal{\mag@presentation}{centrale}}{}{
     \problemetitre{\mag@probleme@nom}}
   \setcounter{enumpartie}{0}
   \setcounter{enumquestion}{0}
   \setcounter{questioncontinu}{0}
  }
\define@key{kv@magprobleme}{probleme_nom}
    {\@temptokena{Nom du probleme : #1}\immediate\write10{\the\@temptokena}
     \global\def\mag@probleme@nom{#1}
     \global\def\mag@probleme@numparties{riendutout}
     \global\def\mag@probleme@numquestions{riendutout}}
\define@key{kv@magprobleme}{probleme_resume}
    {\@temptokena{Resume : #1}\immediate\write10{\the\@temptokena}
     \global\def\mag@probleme@resume{#1}}
\define@key{kv@magprobleme}{probleme_motscles}
    {\@temptokena{Mots cles : #1}\immediate\write10{\the\@temptokena}
     \global\def\mag@probleme@motscles{#1}}
\define@key{kv@magprobleme}{probleme_chapitres}
    {\@temptokena{chapitres : #1}\immediate\write10{\the\@temptokena}
     \global\def\mag@probleme@chapitres{#1}}
\define@key{kv@magprobleme}{probleme_duree}
    {\@temptokena{duree : #1}\immediate\write10{\the\@temptokena}
     \global\def\mag@probleme@duree{#1}}
\define@key{kv@magprobleme}{probleme_difficultee}
    {\@temptokena{difficultee : #1}\immediate\write10{\the\@temptokena}
     \global\def\mag@probleme@difficultee{#1}}
\define@key{kv@magprobleme}{probleme_numparties}
    {\global\def\mag@probleme@numparties{#1}}
\define@key{kv@magprobleme}{probleme_numquestions}
    {\global\def\mag@probleme@numquestions{#1}}
%
% partie d'un problème
%
\newcommand\partietitre%
  {\@startsection {section}{10}{\z@}%
                  {-3.5ex \@plus -1ex \@minus -.2ex}%
                  {2.3ex \@plus.2ex}%
                  {\center\normalfont
                   \ifthenelse{\equal{\mag@presentation}{velvia}}{%
                     \bfseries\sffamily}{}
                   \ifthenelse{\equal{\mag@presentation}{tikzvelvia}}{%
                     \bfseries\sffamily}{}
                   \ifthenelse{\equal{\mag@presentation}{centrale}}{%
                     \Large\bf}{}
                   \ifthenelse{\equal{\mag@presentation}{polytechnique}}{%
                     \bfseries}{}}}
\newcommand{\partie}[1]
  {\addtocounter{enumpartie}{1}
   \setkeys{kv@magpartie}{#1}
   \global\def\mag@probleme@numeropartie{}
   \ifthenelse{\equal{\mag@probleme@numparties}{Alph}}{%
     \global\def\mag@probleme@numeropartie{\Alph{enumpartie} - }}{}
   \ifthenelse{\equal{\mag@probleme@numparties}{Roman}}{%
     \global\def\mag@probleme@numeropartie{\Roman{enumpartie} - }}{}
   \ifthenelse{\equal{\mag@presentation}{centrale}}{%
     \global\def\mag@probleme@numeropartie{Partie \Roman{enumpartie} - }}{}
   \ifthenelse{\equal{\mag@presentation}{centrale}}{%
     \partietitre{\textit{\mag@probleme@numeropartie\mag@partie@nom}}}{%
     \partietitre{\mag@probleme@numeropartie\mag@partie@nom}}
   }

\define@key{kv@magpartie}{partie_nom}
  {\global\def\mag@partie@nom{#1}}
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Gestion des exercices                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
\newboolean{mag@exercice}
\setboolean{mag@exercice}{false}
\newcommand{\mag@verifie@fin@exercice}{%
  \ifthenelse{\boolean{mag@exercice}}{%
     \setboolean{mag@exercice}{false}%
     \ifthenelse{\equal{\mag@exercice@present}{non}}{%
       \end{minipage}%
%\begin{Sbox}%
       }{}}{}}
\newcommand{\fin}{\mag@verifie@fin@exercice}
% \let\mag@section\section
% \renewcommand{\section}{\exercice{interne=oui}\mag@section}
%
% Je ne comprends pas bien ce qui se passe, mais il semble qu'il faille
% appeler exercice pour clore un exercice. J'appelle donc un exercice
% avec une option qui ne fait rien
%
\newcommand{\exercice}[1]{%
   \mag@verifie@fin@exercice
   \global\def\mag@exercice@present{oui}
   \global\def\mag@exercice@interne{non}
   \global\def\mag@exercice@concours@nom{}
   \global\def\mag@exercice@concours@filiere{}
   \global\def\mag@exercice@nom{\ }
   \global\def\mag@exercice@utile{0}%
   \global\def\mag@exercice@difficulte{0}%
   \setkeys{kv@magexercice}{#1}
   \global\def\mag@exercice@utiledsp{}
   \global\def\mag@exercice@difficultedsp{}
   \global\def\mag@exercice@utiledsp{}
   \global\def\mag@exercice@difficultedsp{}
   % \ifthenelse{\equal{\mag@exercice@utile}{0}}{\global\def\mag@exercice@utiledsp{$\circ\!\circ\!\circ$}}{}
   % \ifthenelse{\equal{\mag@exercice@utile}{-1}}{\global\def\mag@exercice@utiledsp{$\bullet\!\circ\!\circ$}}{}%
   % \ifthenelse{\equal{\mag@exercice@utile}{1}}{\global\def\mag@exercice@utiledsp{$\bullet\!\circ\!\circ$}}{}%
   % \ifthenelse{\equal{\mag@exercice@utile}{-2}}{\global\def\mag@exercice@utiledsp{$\circ\!\bullet\!\circ$}}{}%
   % \ifthenelse{\equal{\mag@exercice@utile}{2}}{\global\def\mag@exercice@utiledsp{$\bullet\!\bullet\!\circ$}}{}%
   % \ifthenelse{\equal{\mag@exercice@utile}{-3}}{\global\def\mag@exercice@utiledsp{$\circ\!\circ\!\bullet$}}{}%
   % \ifthenelse{\equal{\mag@exercice@utile}{3}}{\global\def\mag@exercice@utiledsp{$\bullet\!\bullet\!\bullet$}}{}%
   % \ifthenelse{\equal{\mag@exercice@difficulte}{0}}{\global\def\mag@exercice@difficultedsp{\ding{73}\ding{73}\ding{73}}}{}
   % \ifthenelse{\equal{\mag@exercice@difficulte}{1}}{\global\def\mag@exercice@difficultedsp{\ding{72}\ding{73}\ding{73}}}{}%
   % \ifthenelse{\equal{\mag@exercice@difficulte}{2}}{\global\def\mag@exercice@difficultedsp{\ding{72}\ding{72}\ding{73}}}{}%
   % \ifthenelse{\equal{\mag@exercice@difficulte}{3}}{\global\def\mag@exercice@difficultedsp{\ding{72}\ding{72}\ding{72}}}{}%
   % \ifthenelse{\equal{\mag@exercice@utile}{0}}{%
   %   \global\def\mag@exercice@titre{($\circ\!\circ\!\circ$) \mag@exercice@nom}
   % }{%
   %   \global\def\mag@exercice@titre{\mag@exercice@nom}
   % }
   % \global\def\mag@exercice@titre{\mag@exercice@nom}
   % \global\def\mag@exercice@titre{%
   %     (\ifthenelse{\equal{\mag@exercice@utile}{0}}{\mbox{$\circ\!\circ\!\circ$}}{}%
   %     \ifthenelse{\equal{\mag@exercice@utile}{-1}}{\mbox{$\bullet\!\circ\!\circ$}}{}%
   %     \ifthenelse{\equal{\mag@exercice@utile}{1}}{\mbox{$\bullet\!\circ\!\circ$}}{}%
   %     \ifthenelse{\equal{\mag@exercice@utile}{-2}}{\mbox{$\circ\!\bullet\!\circ$}}{}%
   %     \ifthenelse{\equal{\mag@exercice@utile}{2}}{\mbox{$\bullet\!\bullet\!\circ$}}{}%
   %     \ifthenelse{\equal{\mag@exercice@utile}{-3}}{\mbox{$\circ\!\circ\!\bullet$}}{}%
   %     \ifthenelse{\equal{\mag@exercice@utile}{3}}{\mbox{$\bullet\!\bullet\!\bullet$}}{})%
   %     \mag@exercice@nom}
   \ifthenelse{\boolean{mag@article}}{%
\ifthenelse{\equal{\mag@exercice@nom}{}}{%
\subsubsection*{\mag@exercice@concours@nom\ - {\sc \mag@exercice@concours@filiere}}}{%
\subsubsection*{Exercice~\arabic{numeroexercice}~:~\mag@exercice@nom}}%
\stepcounter{numeroexercice}
%    \ifthenelse{\equal{\mag@exercice@interne}{non}}{%
%    \setboolean{mag@exercice}{true}
  

%    \ifthenelse{\equal{\mag@typedocument}{cours}}{%%%% Pour le cours d'ete
%    \ifthenelse{\equal{\mag@exercice@present}{oui}}{%
%      \ifthenelse{\equal{\mag@exercice@nom}{}}{%
%        \subsubsection{Exercice}}{%
%        \subsubsection{Exercice \mag@exercice@nom}}}%
%    {%
% %\begin{Sbox}%
%     \begin{minipage}{\linewidth}}%
%    }{%%%% Pour le cas classique
%    \ifthenelse{\equal{\mag@exercice@present}{oui}}{%
%      \ifthenelse{\equal{\mag@exercice@nom}{}}{%
%        \subsubsection{\mag@exercice@concours@nom\ -
%                                  {\sc \mag@exercice@concours@filiere}}}{%

%  %      \subsection{(\mag@exercice@utiledsp)\ \mag@exercice@nom}}}%
%        \subsection{\mag@exercice@nom}}}%
%    {%
% %\begin{Sbox}%
%     \begin{minipage}{\linewidth}}
%    }
%    }{}%
   }{%
      \ifthenelse{\equal{\mag@exercice@nom}{}}{%
      \subsubsection{\mag@exercice@concours@nom\ - {\sc \mag@exercice@concours@filiere}}}{%
       \subsubsection{Exercice~\arabic{numeroexercice}~:~\mag@exercice@nom}}%
      \stepcounter{numeroexercice}
   }
}
\define@key{kv@magexercice}{nom}
  {\global\def\mag@exercice@nom{#1}}
\define@key{kv@magexercice}{utile}
  {\def\mag@exercice@utile{#1}}
\define@key{kv@magexercice}{difficulte}
  {\global\def\mag@exercice@difficulte{#1}}
\define@key{kv@magexercice}{present}
  {\global\def\mag@exercice@present{#1}}
\define@key{kv@magexercice}{origine}{}
\define@key{kv@magexercice}{interne}
  {\global\def\mag@exercice@interne{#1}}
\define@key{kv@magexercice}{concours_nom}
  {\global\def\mag@exercice@concours@nom{#1}}
\define@key{kv@magexercice}{concours_filiere}
  {\global\def\mag@exercice@concours@filiere{#1}}
\define@key{kv@magexercice}{concours_annee}
  {\global\def\mag@exercice@concours@annee{#1}}
\define@key{kv@magexercice}{theme}
  {\global\def\mag@exercice@theme{#1}}

% \newboolean{mag@exercice}
% \setboolean{mag@exercice}{false}
% \newcommand{\mag@verifie@fin@exercice}{%
%   \ifthenelse{\boolean{mag@exercice}}{}}
% \newcommand{\fin}{\mag@verifie@fin@exercice}
% \let\mag@section\section
% \renewcommand{\section}{\exercice{exercice_interne={oui}}\mag@section}
% %
% \newcommand{\exercice}[1]{%
%   \mag@verifie@fin@exercice
%   \global\def\mag@exercice@present{oui}
%   \global\def\mag@exercice@interne{non}
%   \global\def\mag@exercice@concours@nom{}
%   \global\def\mag@exercice@concours@filiere{}
%   \global\def\mag@exercice@nom{}
%   \setkeys{mag@exercice}{#1}%

%   \ifthenelse{\equal{\mag@exercice@interne}{non}}{%
%   \setboolean{mag@exercice}{true}
%   \ifthenelse{\equal{\mag@exercice@present}{oui}}{%
%     \ifthenelse{\equal{\mag@exercice@nom}{}}{%
%       \subsubsection{\mag@exercice@concours@nom\ -
%                                {\sc \mag@exercice@concours@filiere}}}{%
%       \subsection{\mag@exercice@nom}}}%
%    {%\begin{Sbox}\begin{minipage}{\linewidth}}}{}
%   \subsection{\mag@exercice@nom}%
% }


%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Gestion des questions                            %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
  %
  % Début du style de questions Centrale
  %
%     \define@key{kv@magquestion}{label}{%
%       \ifthenelse{\equal{\thequestioncontinu}{0}}{%
%         \global\def\@avantquestionref{\Roman{enumpartie}.}}{%
%         \global\def\@avantquestionref{}}
%       \global\def\@currentlabel{\@avantquestionref
%       \ifcase\mag@question@depth\or \Alph{mag@questioni}.
%                                 \or \Alph{mag@questioni}.\arabic{mag@questionii}.\fi
%       }\label{#1}}
%    \let\qref\ref}{}
%
%
\newcounter{enumim}
\newcounter{enumiim}
\newcounter{enumiiim}
\newcounter{enumivm}
\newcounter{testuplevel}
\setcounter{testuplevel}{0}
% centrale
  \newcounter{mag@question@depth}
  \setcounter{mag@question@depth}{0}
  \newcounter{mag@questioni}[enumpartie]
  \newcounter{mag@questionii}[mag@questioni]
%
\newenvironment{questions}{%
  \ifthenelse{\equal{\mag@presentation}{centrale}}{%
    %% début du cas centrale
    \addtocounter{mag@question@depth}{1}%
     \ifthenelse{\equal{\themag@question@depth}{1}}{%
       \setcounter{mag@questioni}{0}}{}%
     \ifthenelse{\equal{\themag@question@depth}{2}}{%
       \setcounter{mag@questionii}{0}}{}}{%
    %% Fin du cas centrale
    \ifthenelse{\equal{\mag@probleme@numquestions}{continu}}{%
      \setcounter{questioncontinu}{1}}{}%
    \begin{enumerate}%
    \ifthenelse{\equal{\mag@probleme@numquestions}{continu}}{%
    \setcounter{enumi}{\theenumquestion}}{}}}{%
  %% cloture des questions
  \ifthenelse{\equal{\mag@presentation}{centrale}}{%
    \addtocounter{mag@question@depth}{-1}}{\end{enumerate}}}%
\def\uplevel{\setcounter{testuplevel}{1}%
             \ifcase\@enumdepth\or\setcounter{enumim}{\value{enumi}}%
                               \or\setcounter{enumiim}{\value{enumii}}%
                               \or\setcounter{enumiiim}{\value{enumiii}}%
                               \or\setcounter{enumivm}{\value{enumiv}}\fi%
             \end{enumerate}}%
\def\enduplevel{\setcounter{testuplevel}{0}%
                \begin{enumerate}%
                \ifcase\@enumdepth\or\setcounter{enumi}{\value{enumim}}%
                                  \or\setcounter{enumii}{\value{enumiim}}%
                                  \or\setcounter{enumiii}{\value{enumiiim}}%
                                  \or\setcounter{enumiv}{\value{enumivm}}\fi%
               }
\newcommand{\question}[1][]
  {\ifthenelse{\equal{\mag@presentation}{centrale}}{%
     %% dédut du cas centrale
     \ifthenelse{\equal{\themag@question@depth}{1}}{%
       \addtocounter{mag@questioni}{1}%
       \par\noindent{\bf \Roman{enumpartie}.\Alph{mag@questioni} - }}{}%
     \ifthenelse{\equal{\themag@question@depth}{2}}{%
       \addtocounter{mag@questionii}{1}%
       \par\noindent\Roman{enumpartie}.\Alph{mag@questioni}.%
                    \arabic{mag@questionii})\hspace{4truemm}}{}}{%
     %% début du cas général
     \ifthenelse{\equal{\value{testuplevel}}{1}}{\enduplevel}{}%
     \item%
     \setcounter{enumquestion}{\theenumi}}%
     \setkeys{kv@magquestion}{#1}%
   }
  \define@key{kv@magquestion}{label}{%
    \ifthenelse{\equal{\thequestioncontinu}{0}}{%
      \global\def\@avantquestionref{\Roman{enumpartie}.}}{%
      \global\def\@avantquestionref{}}
    \global\def\@currentlabel{\@avantquestionref
    \ifcase\@enumdepth\or \theenumi.
                      \or \theenumi.\theenumii.\fi
    }\label{#1}}
\def\enonce{\uplevel}
\let\qref\ref
% Pour les références croisées
\renewcommand{\p@enumi}{}
\renewcommand{\p@enumii}{\theenumi.}
\renewcommand{\p@enumiii}{\theenumi.\theenumii.}
\renewcommand{\p@enumiv}{\theenumi.\theenumii.\theenumiii.}
% Conclusion
\newenvironment{conclusion}[1][0.8]%
  {%
\begin{Sbox}%
  \begin{varwidth}{#1\linewidth}}
  {\end{varwidth}%
\end{Sbox}%
  \begin{center}\fbox{%
\TheSbox%
  }\end{center}}
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Gestion des cours                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
\newenvironment{enumeration}
{
  \begin{list}{}{
  \renewcommand{\makelabel}{\ding{227} }
  \setlength{\labelwidth}{0.5cm}
  \setlength{\labelsep}{0cm}
  \setlength{\leftmargin}{0.5cm}
  \setlength{\rightmargin}{0cm}
  \setlength{\itemindent}{0cm}}
}
{
  \end{list}
}
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                            Gestion des maths                                %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
\usepackage{magnolia-maths}
%
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                          Gestion de l'informatique                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%
%\input{magnolia-info.tex}

\newcount\exnum
\newcounter{exnumcounter}
\setcounter{exnumcounter}{0}

\newenvironment{exercicepython}[1]{%
  \addtocounter{exnumcounter}{1}%
  \setlength\topsep{\baselineskip}%
  \trivlist\item\relax%
  \hrule 
  \vskip 1mm
  {\bf{Exercice  \arabic{exnumcounter}} \hfill #1}
  \vskip 2mm
  \hrule
  \vskip 3mm
}{%
  \vskip 2mm\hrule\endtrivlist
}
