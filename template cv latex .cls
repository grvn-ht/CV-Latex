\ProvidesClass{Vrais-CV-phalus}[2018/10/22 CV class]
\LoadClass{article}
\NeedsTeXFormat{LaTeX2e}



%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%PACKAGES%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[utf8]{inputenc}
\RequirePackage{calc}
\RequirePackage[default]{raleway} %plus d'espace entre les parties
\RequirePackage{fontawesome}
\RequirePackage{array , tabularx}
\RequirePackage[sfdefault]{ClearSans} %change la font
\RequirePackage{tikz}
\RequirePackage{bclogo}
\RequirePackage{parskip} %plus d'espace entre les parties
\RequirePackage[a4paper,margin = 0mm]{geometry}
\RequirePackage{hyperref}
\RequirePackage{marvosym}
\RequirePackage[marvosym]{tikzsymbols}
\RequirePackage{fp}
\RequirePackage{ifthen,forloop,lscape}



%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%Colors%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%

\definecolor{colorone}{HTML}{E7E7E7} 
\definecolor{colortwo}{HTML}{ebebeb}
\definecolor{colorthree}{HTML}{efefef} 
\definecolor{colorfour}{HTML}{f4f4f4} 
%\definecolor{colorfive}{HTML}{f8f8f8} 
\definecolor{colorfive}{HTML}{fcfcfc} 

\definecolor{darkblue}{RGB}{0,80,130}
\colorlet{thirdcol}{darkblue}

%%% Set de couleurs choisies pour le CV
\definecolor{lapislazuli}{HTML}{2a7a9c} 
\definecolor{alloyorange}{HTML}{d16014} 
\definecolor{yellowmunsell}{HTML}{efca08} 
\definecolor{palegreen}{HTML}{aef78e} 
\definecolor{darkestblue}{RGB}{0,50,80}
%%%

\colorlet{c1}{alloyorange}
\colorlet{c2}{yellowmunsell}
\colorlet{c3}{palegreen}

\colorlet{Back}{white!100}
\colorlet{bb}{lapislazuli}

\colorlet{titletext}{white}
\colorlet{textcol}{darkestblue}




%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%Construction%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%

% Adjusts the size of the wheel:
\def\innerradiusN{\unitheight/2 - 2 mm}
\def\outerradiusN{\unitheight/2 - 1 mm}

\def\innerradiusT{\unitheight/2 - 3 mm}
\def\outerradiusT{\unitheight/2 - 2 mm}

\def\innerradiusS{\baseheight/25*8 - 0.8 mm}
\def\outerradiusS{\baseheight/25*8 + 0.2 mm}

%paramètres
\def\baseheight{\paperheight/7}
\def\unitheight{\baseheight/3}
\def\hs{-13pt}


\newcommand{\imsize}{\linewidth}
\newlength\imagewidth
\newlength\imagescale
\renewcommand{\imsize}{0.618\linewidth}
\pgfmathsetlength{\imagewidth}{5cm}%
\pgfmathsetlength{\imagescale}{\imagewidth/600}%

\newcolumntype{C}{>{\centering\arraybackslash}m}
\newcolumntype{L}{>{\raggedleft\arraybackslash}m}
\newcolumntype{G}{>{\raggedright\arraybackslash}m}
\newcolumntype{R}{>{\raggedleft\arraybackslash}X}
\newcolumntype{H}{>{\centering\arraybackslash}X}
\newcolumntype{F}{>{\raggedright\arraybackslash}X}

\newcommand*\icon[1]{\tikz[baseline=(char.base)]{
            \node[shape=circle,draw,inner sep=1pt, fill=bb,bb,text=white] (char) {#1};}}

% create a coloured box with arrow and title as cv section headline
% param 1: section title
%
\newcommand{\cvsection}[2] {
	\textcolor{titletext}{\uppercase{\textbf{#1}}}
}

\newcommand{\cvsect}[4]{
	\textcolor{#3}{\hrule} %trait du dessus
	\colorbox{#3}{ {\cvsection{#1}{#4}}} %text plus encadrement
}


% param 1:	type de bulle
\newcommand{\Wini}[1]{
	\FPifeq{#1}{1}
		\def\innerradius{\innerradiusN}
		\def\outerradius{\outerradiusN}
		\def\rotate{0}
		\def\yscale{1}
		\def\xscale{1}
		\def\textanchor{west}
		\def\midangle{180}
		\def\coef{3/2}
		\def\wid{4 cm}
	\else
		\FPifeq{#1}{2}
			\def\innerradius{\innerradiusN}
		 	\def\outerradius{\outerradiusN}
			\def\rotate{90}
			\def\yscale{1}
			\def\xscale{1}
			\def\textanchor{west}
			\def\midangle{90}
			\def\coef{2}
			\def\wid{2.5 cm}
		\else
			\FPifeq{#1}{3}
				\def\innerradius{\innerradiusT}
			 	\def\outerradius{\outerradiusT}
				\def\rotate{90}
				\def\yscale{1}
				\def\xscale{1}
				\def\coef{2}
			\else
				\FPifeq{#1}{4}
					\def\innerradius{\innerradiusN}
				 	\def\outerradius{\outerradiusN}
					\def\rotate{90}
					\def\yscale{1}
					\def\xscale{1}
					\def\coef{2}
				\else
					\def\innerradius{\innerradiusS}
				 	\def\outerradius{\outerradiusS}
					\def\rotate{90}
					\def\yscale{1}
					\def\xscale{-1}
					\def\midangle{180}
	\fi
}

% param 1:	type bule
% param 2:	legende
% param 3:  color
\newcommand{\legend}[3]{
	\FPifeq{#1}{3}
		\node [text width=3.4cm, align=center,text=textcol] at (180:\outerradius + 5pt) {#2};
    \else
    	\FPifeq{#1}{4}
    	\else
    		\FPifeq{#1}{5}
		        \draw [*-,thin,#3] 
		          node [rounded corners=5pt,very thick,draw=#3, fill=Back, text=textcol, text width=\unitheight/2,minimum height=\unitheight/3, align=center] 
		          at (0:\outerradius) [xshift=0 cm,inner sep=0pt, outer sep=0,anchor=south]
		          {\textbf{#2}};

    		\else
		      \pgfmathsetmacro\labelshiftdir{1-2*(-\midangle>180)}
		      \draw [*-,thin,#3] 
		        node [ rounded corners=5pt, very thick, draw=#3,
		                fill=Back, text=textcol, text width=\wid,minimum height=\unitheight - 0.1cm, align=center, 
		                append after command={(\midangle:-\midradius pt) -- 
		                  (\midangle:-\outerradius - 0ex) -- (\tikzlastnode)}] 
		              at (\midangle:-\outerradius - 0ex) [xshift=\labelshiftdir*0.1cm, %xshift: tailler segment légende
		                inner sep=0pt, outer sep=0pt,anchor=\textanchor]
		              {\small #2};
    \fi
}

% param 1:	type bule
% param 2:	lien image/text pour skills
% param 3:  color
\newcommand{\bulle}[3]{
	\FPifeq{#1}{5}
      \node[circle,minimum size=(\innerradius)*2,fill=Back, text=textcol,align=center,draw=#3]{\Large #2};
      \draw[#3] (0,0) circle (\innerradius);
    \else
      \draw[#3] (0,0) circle (\outerradius) circle (\innerradius);
      \node[circle,minimum size=(\innerradius)*2,draw,path picture={
               \node at (path picture bounding box.center){
                   \includegraphics[width=(\innerradius)*\coef]{#2}
               };
           }]{};
    \fi
}

% param 1:	type bule
% param 2:	value/color
\newcommand{\boucle}[2]{
      \pgfmathsetmacro{\cumnum}{0}
      \foreach \value/\colour in {#2} {
            \pgfmathsetmacro{\newcumnum}{\cumnum + \value/\totalnum*360}

            % Calculate the percent value
            \pgfmathsetmacro{\percentage}{\value/\totalnum*100}

            \fill[\colour] (-\cumnum:\outerradius) arc (-\cumnum:-(\newcumnum):\outerradius) --
            (-\newcumnum:\innerradius) arc (-\newcumnum:-(\cumnum):\innerradius) -- cycle;

            % Set the old cumulated angle to the new value
            \global\let\cumnum=\newcumnum
        }
}


% param 1:	percentage competence + color
% param 2:	lien ou text skills
% param 3:  legende ou num skill
% param 4:	color
% param 5:	style bulle
\newcommand{\wheelchart}[5]{
    % Calculate total
    \pgfmathsetmacro{\totalnum}{0}
    \foreach \value/\colour/\name in {#1} {
        \pgfmathparse{\value+\totalnum}
        \global\let\totalnum=\pgfmathresult
    }

    \begin{tikzpicture}
      \Wini{#5}
	  \pgfmathparse{\outerradius-\innerradius}
	  \global\let\wheelwidth=\pgfmathresult
	  \pgfmathparse{(\outerradius+\innerradius)/2}
	  \global\let\midradius=\pgfmathresult

      \begin{scope}[yscale=\yscale,xscale=\xscale, rotate=\rotate]
      % Loop through each valu*e set. \cumnum keeps track of where we are in the wheel
      \boucle{#5}{#1}

      \legend{#5}{#3}{#4}

      \end{scope}

      \bulle{#5}{#2}{#4}

      \end{tikzpicture}
}



%pouvoir choisir le nombre de figures par catégories
\newcounter{nbRow}
\newcounter{nbCol}

\newcommand*{\CreateTableau}[3]{%
\begin{tabular}{|l|*{#2}{c|}}\hline%
  \forLoop{1}{#1}{nbRow}{%
   \ifthenelse{\equal{\value{nbRow}}{1}}{#3}{}%
   \forLoop{1}{#2}{nbCol}{%
    \ifthenelse{\equal{\value{nbRow}}{1}}{&\thenbCol}{&}  }%
   \tabularnewline\hline%
   }
\end{tabular}%
}%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%
% Presentation %
%%%%%%%%%%%%%%%%

%%%%Definition des commandes que l'on pourra appeler dans le fichier .tex
\newcommand{\profilepic}[1]{\renewcommand{\givenprofilepic}{#1}}

\newcommand{\cvname}[1]{\renewcommand{\givencvname}{#1}}
\newcommand{\cvjobtitle}[1]{\renewcommand{\givencvjobtitle}{#1}}

\newcommand{\nationality}[1]{\renewcommand{\givennationality}{#1}}
\newcommand{\birth}[1]{\renewcommand{\givenbirth}{#1}}
\newcommand{\licenceone}[1]{\renewcommand{\givenlicenceone}{#1}}
\newcommand{\licencetwo}[1]{\renewcommand{\givenlicencetwo}{#1}}

\newcommand{\cvmail}[1]{\renewcommand{\givencvmail}{#1}}
\newcommand{\cvnumberphone}[1]{\renewcommand{\givennumberphone}{#1}}
\newcommand{\cvaddress}[1]{\renewcommand{\givencvaddress}{#1}}


\newcommand{\givenprofilepic}{}
\newcommand{\givencvname}{}
\newcommand{\givencvjobtitle}{}

\newcommand{\givennationality}{}
\newcommand{\givenbirth}{} 
\newcommand{\givenlicenceone}{}
\newcommand{\givenlicencetwo}{}

\newcommand{\givencvmail}{}
\newcommand{\givennumberphone}{}
\newcommand{\givencvaddress}{}

%%%%On défini la commande qui va créer la première partie "présentation" du CV
\newcommand{\makeprofile}
{
\begin{center} %on veut donner une couleur de fond au tableau on utilise "center" pour ajuster la reference de tizkpicture
\begin{tikzpicture}[remember picture,overlay]
   	 \node [rectangle, fill=colorone, anchor=north, minimum width=\paperwidth, minimum height=\paperheight/7] (box) at (0cm,0.5cm){}; %paramètres du rectangle de couleur
\end{tikzpicture}
\end{center}

\vspace{- 0.45 cm} %décaler vers le haut le tableau (meilleur visuel)

\begin{tabularx}{\paperwidth}{XC{8.3cm}R} %tableau largeur de la feuille

	\vspace{- 1.7 cm} %décaler vers le haut la colonne gauche du tableau (meilleur visuel)
	\setlength{\logowidth}{11.7pt} %défini la taille du logo issu de "bclogo" (un paquet)

	\begin{tabular}{ll} %on ajuste toutes les tailles des icon
		\ifthenelse{\equal{\givennationality}{}}{}{\textsc{\icon{\bcdfrance}} & \givennationality\\}
		\ifthenelse{\equal{\givenbirth}{}}{}{\textsc{\fontsize{13.3pt}{0}\icon{\faBirthdayCake}} & \givenbirth\\}
		\ifthenelse{\equal{\givenlicenceone}{}}{}{\textsc{\fontsize{13pt}{0}\icon{\faCar}} & \givenlicenceone\\}
		\ifthenelse{\equal{\givenlicencetwo}{}}{}{\textsc{\fontsize{13.3pt}{0}\icon{\faAnchor}} & \givenlicencetwo\\}
	\end{tabular} &

	\begin{tikzpicture}[x=\imagescale,y=-\imagescale] %paramètre de l'image importée
	    \clip (600/2, 567/2) circle (567/4*1.2);
		\node[anchor=north west, inner sep=0pt, outer sep=0pt] at (0,50) {\includegraphics[width=\imagewidth]{\givenprofilepic}};
	\end{tikzpicture} 

	{\Large\color{black!80}\givencvname}

	{\huge\color{lapislazuli}\givencvjobtitle} &

	\vspace{- 1.7 cm} %décaler vers le haut la colonne droite du tableau (meilleur visuel)

	\begin{tabular}{L{4cm}l} %on ajuste toutes les tailles des icon, p{} pour que le text revienne à la ligne dans les cellules du tableau (ex pour l'adresse)
		\href{mailto:\givencvmail}{\givencvmail} & \ifthenelse{\equal{\givencvmail}{}}{}{\textsc{\fontsize{15.3pt}{0}\selectfont\icon{\faAt}}\\}
		\givennumberphone & \ifthenelse{\equal{\givennumberphone}{}}{}{\textsc{\fontsize{16.7pt}{0}\icon{\faPhone}}\\}
		\givencvaddress & \ifthenelse{\equal{\givencvaddress}{}}{}{\textsc{\fontsize{18.3pt}{0}\icon{\faMapMarker}} \\}
	\end{tabular} \\

\end{tabularx}
\vspace{ -0.62 cm}
}


%%%%%%%%%%
% Skills %
%%%%%%%%%%
\newcommand{\skilla}[1]{\renewcommand{\givenskilla}{#1}}
\newcommand{\skillb}[1]{\renewcommand{\givenskillb}{#1}}
\newcommand{\skillc}[1]{\renewcommand{\givenskillc}{#1}}

\newcommand{\givenskilla}{}
\newcommand{\givenskillb}{}
\newcommand{\givenskillc}{}

\newcommand{\makeskills}
{

\begin{center} %on veut donner une couleur de fond au tableau on utilise "center" pour ajuster la reference de tizkpicture
\begin{tikzpicture}[remember picture,overlay]
   	 \node [rectangle, fill=colortwo, anchor=north, minimum width=\paperwidth, minimum height=\paperheight/7] (box) at (0cm,0cm){}; %paramètres du rectangle de couleur
\end{tikzpicture}
\end{center}

\vspace{- 0.18 cm}

\begin{tabularx}{\paperwidth}{HHH}
	\hspace{\hs}
	\raisebox{-.4\height}{\wheelchart{100/c1,0/white}{\givenskilla}{1}{c1}{5}} &
	\hspace{\hs}
	\raisebox{-.4\height}{\wheelchart{100/c2,0/white}{\givenskillb}{2}{c2}{5}} &
	\hspace{\hs}
	\raisebox{-.4\height}{\wheelchart{100/c3,0/white}{\givenskillc}{3}{c3}{5}} \\
\end{tabularx}
\vspace{-0.63cm}
}


%%%%%%%%%%%%%%%%
% Hobbies %
%%%%%%%%%%%%%%%%
\newcommand{\logohobbya}[1]{\renewcommand{\givenlogohobbya}{#1}}
\newcommand{\logohobbyb}[1]{\renewcommand{\givenlogohobbyb}{#1}}
\newcommand{\logohobbyc}[1]{\renewcommand{\givenlogohobbyc}{#1}}
\newcommand{\legendehobbya}[1]{\renewcommand{\givenlegendehobbya}{#1}}
\newcommand{\legendehobbyb}[1]{\renewcommand{\givenlegendehobbyb}{#1}}
\newcommand{\legendehobbyc}[1]{\renewcommand{\givenlegendehobbyc}{#1}}

\newcommand{\givenlogohobbya}{}
\newcommand{\givenlogohobbyb}{}
\newcommand{\givenlogohobbyc}{}
\newcommand{\givenlegendehobbya}{}
\newcommand{\givenlegendehobbyb}{}
\newcommand{\givenlegendehobbyc}{}

\newcommand{\makehobbies}
{
\begin{center} %on veut donner une couleur de fond au tableau on utilise "center" pour ajuster la reference de tizkpicture
\begin{tikzpicture}[remember picture,overlay]
   	 \node [rectangle, fill=colorthree, anchor=north, minimum width=\paperwidth, minimum height=\paperheight/21] (box) at (0cm,0cm){}; %paramètres du rectangle de couleur
\end{tikzpicture}
\end{center}

\vspace{- 0.18 cm}

\begin{tabularx}{\paperwidth}{HHH}
	\raisebox{-.4\height}{\wheelchart{100/bb}{\givenlogohobbya}{\givenlegendehobbya}{bb}{1}} &
	\raisebox{-.4\height}{\wheelchart{100/bb}{\givenlogohobbyb}{\givenlegendehobbyb}{bb}{1}} &
	\raisebox{-.4\height}{\wheelchart{100/bb}{\givenlogohobbyc}{\givenlegendehobbyc}{bb}{1}} \\
\end{tabularx}
\vspace{-0.62cm}
}


%%%%%%%%%%%%%
% Languages %
%%%%%%%%%%%%%
\newcommand{\languagea}[1]{\renewcommand{\givenlanguagea}{#1}}
\newcommand{\languageb}[1]{\renewcommand{\givenlanguageb}{#1}}
\newcommand{\languagec}[1]{\renewcommand{\givenlanguagec}{#1}}
\newcommand{\languaged}[1]{\renewcommand{\givenlanguaged}{#1}}
\newcommand{\legendelanguagea}[1]{\renewcommand{\givenlegendelanguagea}{#1}}
\newcommand{\legendelanguageb}[1]{\renewcommand{\givenlegendelanguageb}{#1}}
\newcommand{\legendelanguagec}[1]{\renewcommand{\givenlegendelanguagec}{#1}}
\newcommand{\legendelanguaged}[1]{\renewcommand{\givenlegendelanguaged}{#1}}

\newcommand{\givenlanguagea}{}
\newcommand{\givenlanguageb}{}
\newcommand{\givenlanguagec}{}
\newcommand{\givenlanguaged}{}
\newcommand{\givenlegendelanguagea}{}
\newcommand{\givenlegendelanguageb}{}
\newcommand{\givenlegendelanguagec}{}
\newcommand{\givenlegendelanguaged}{}


\newcommand{\makelanguages}
{
\begin{center} %on veut donner une couleur de fond au tableau on utilise "center" pour ajuster la reference de tizkpicture
\begin{tikzpicture}[remember picture,overlay]
   	 \node [rectangle, fill=colorfour, anchor=north, minimum width=\paperwidth, minimum height=\paperheight/21] (box) at (0cm,0cm){}; %paramètres du rectangle de couleur
\end{tikzpicture}
\end{center}

\vspace{- 0.18 cm}

\begin{tabularx}{\paperwidth}{HHHH}
	\raisebox{-.4\height}{\wheelchart{100/bb,0/white}{\givenlanguagea}{\givenlegendelanguagea}{bb}{2}} &
	\raisebox{-.4\height}{\wheelchart{90/bb,10/white}{\givenlanguageb}{\givenlegendelanguageb}{bb}{2}} &
	\raisebox{-.4\height}{\wheelchart{45/bb,55/white}{\givenlanguagec}{\givenlegendelanguagec}{bb}{2}} &
	\raisebox{-.4\height}{\wheelchart{35/bb,65/white}{\givenlanguaged}{\givenlegendelanguaged}{bb}{2}} \\
\end{tabularx}
\vspace{-0.62cm}
}


%%%%%%%%%
% Tools %
%%%%%%%%%
\newcommand{\toola}[1]{\renewcommand{\giventoola}{#1}}
\newcommand{\toolb}[1]{\renewcommand{\giventoolb}{#1}}
\newcommand{\toolc}[1]{\renewcommand{\giventoolc}{#1}}
\newcommand{\toold}[1]{\renewcommand{\giventoold}{#1}}
\newcommand{\toole}[1]{\renewcommand{\giventoole}{#1}}
\newcommand{\toolf}[1]{\renewcommand{\giventoolf}{#1}}

\newcommand{\giventoola}{}
\newcommand{\giventoolb}{}
\newcommand{\giventoolc}{}
\newcommand{\giventoold}{}
\newcommand{\giventoole}{}
\newcommand{\giventoolf}{}

\newcommand{\maketools}
{
\begin{center} %on veut donner une couleur de fond au tableau on utilise "center" pour ajuster la reference de tizkpicture
\begin{tikzpicture}[remember picture,overlay]
   	 \node [rectangle, fill=colorfive, anchor=north, minimum width=\paperwidth, minimum height=\paperheight/21] (box) at (0cm,0cm){}; %paramètres du rectangle de couleur
\end{tikzpicture}
\end{center}

\vspace{- 0.18 cm}

\begin{tabularx}{\paperwidth}{HHHHHH}
	\raisebox{-.4\height}{\wheelchart{85/bb,15/white}{\giventoola}{\small d'ingénierie système }{bb}{3}} &
	\raisebox{-.4\height}{\wheelchart{75/bb,25/white}{\giventoolb}{\small de CAO }{blue!70}{3}} &
	\raisebox{-.4\height}{\wheelchart{60/bb,40/white}{\giventoolc}{\small Matlab}{bb}{3}} &
	\raisebox{-.3\height}{\wheelchart{70/bb,30/white}{\giventoold}{0}{bb}{4}} &
	\raisebox{-.3\height}{\wheelchart{50/bb,50/white}{\giventoole}{0}{bb}{4}} &
	\raisebox{-.4\height}{\hspace{-0.5cm}\wheelchart{90/bb,10/white}{\giventoolf}{\small Pack Office}{bb}{3}} \\
\end{tabularx}
}
	%\raisebox{-.3\height}{\wheelchart{90/blue!70,10/white}{\giventoolf}{0}{blue!70}{4}}


%%%%%%%%%
% Title %
%%%%%%%%%
\newcommand{\maketit}
{

\vspace{-8.8cm}
\hspace{-1.5mm}
\begin{tabularx}{0.1cm}{l}	
	\rotatebox{70}{\small \textbf{Compétences:}}
	\rule[-\baseheight/13]{0cm}{\baseheight } \\
	\rotatebox{70}{\small \textbf{Loisirs:}} 
	\rule[0cm]{0cm}{\unitheight - 1.5mm}\\
	\rotatebox{70}{\small \textbf{Langues:}}
	\rule[0cm]{0cm}{\unitheight - 1.5mm} \\
	\rotatebox{70}{\small \textbf{Outils:}}
	\rule[0cm]{0cm}{\unitheight - 1.5mm} \\
\end{tabularx}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\newcommand{\Cini}[1]{
	\FPifeq{#1}{1}
		\def\side{1}
		\def\xp{1}
		\def\nsk{1}
		\def\anchor{west}
	\else
		\FPifeq{#1}{2}
			\def\side{-1}
			\def\xp{1}
			\def\nsk{1}
			\def\anchor{east}
		\else
			\FPifeq{#1}{3}
				\def\side{1}
				\def\xp{2}
				\def\nsk{1}
				\def\anchor{west}
			\else
				\FPifeq{#1}{4}
					\def\side{-1}
					\def\xp{2}
					\def\nsk{1}
					\def\anchor{east}
				\else
					\FPifeq{#1}{5}
						\def\side{1}
						\def\xp{3}
						\def\nsk{2}
						\def\anchor{west}
					\else
						\def\side{1}
						\def\xp{4}
						\def\nsk{2}
						\def\anchor{west}
	\fi

}


% param 1:	position ini
% param 2:	condition if
% param 3:  color
% param 4:	variation horizontale
% param 5:	variation hauteur
\newcommand{\connect}[5]{
	\ifdim#5pt<0pt
		\pgfmathparse{-#5}
		\global\let\vh\pgfmathresult
		\pgfmathparse{-#2}
		\global\let\cd\pgfmathresult

	\else
		\pgfmathparse{#5}
		\global\let\vh\pgfmathresult
		\pgfmathparse{#2}
		\global\let\cd\pgfmathresult

	\fi

	\ifnum\nsk=1

		\ifdim\vh pt<#2pt%\FPiflt{#5}{#2}
		\draw[draw=textcol, line width=1pt] (\side*0.6 + #4, \midexp + #5) -- (\side*0.2 + #4,\midexp + #5);

		\else
		\draw[draw=textcol, line width=1pt] (\side*0.6 + #4, \midexp + #5) -- (\side*0.35 + #4,\midexp + #5);
		\draw[draw=textcol, line width=1pt] (\side*0.35 + #4, \midexp + #5) -- (\side*0.35 + #4,\midexp + \cd);
		\draw[draw=textcol, line width=1pt] (\side*0.35 + #4, \midexp + \cd) -- (\side*0.2 + #4,\midexp + \cd);

		\fi

	\else
		\draw[white] (0,\startexp) circle (0.3) node{\textsc{\fontsize{10pt}{0}\icon{\faMortarBoard}}};

		\draw[draw=textcol, line width=1pt] (0.3, \startexp) -- (0.4,\startexp);
		\draw[draw=textcol, line width=1pt] (0.4, \startexp + #5) -- (0.6,\startexp + #5);
		\draw[draw=textcol, line width=1pt] (0.4, \startexp) -- (0.4,\startexp + #5);


	\fi
}


% param 1:	logo
% param 2:  color
% param 3:	variation hauteur
% param 4:	name
% param 5:	subname
% param 6:	description
\newcommand{\eexp}[6]{
	\ifnum\xp=1
		\draw [*-,line width=2pt,textcol]
		  node[rounded corners=2pt, fill=white, draw=#2,minimum height=0.5 , anchor=\anchor, align=left] at (\side*0.6 , \midexp + #3 ) { 
		  \begin{tabularx}{\paperwidth/5}{L{0.4 cm}C{\paperwidth/5 - 0.8cm}}%RC{\paperwidth/5 - 0.4cm}}
		  		 
			 \hspace{-3.55mm}\includegraphics[width=0.7 cm]{#1} &  \hspace{-10mm} #4\\ %\vspace{-5mm}\hspace{-4mm}
			 \hline
			 \multicolumn{2}{C{\paperwidth/5}}{\vspace{0.5mm} #5} \\
			 \hline
			 \multicolumn{2}{C{\paperwidth/5 - 0.3cm}}{\vspace{0.5mm} #6}
		  \end{tabularx}
		  };
	\else
		\ifnum\xp=2
			\draw [*-,line width=2pt,textcol]
				  node[rounded corners=2pt, fill=white, draw=#2,minimum height=0.5 ,  anchor=\anchor, align=center] at (\side*0.6 , \midexp + #3 ) { 
				  \begin{tabularx}{\paperwidth/5}{H}	
						 #4 \\
						 \hline
						 \vspace{0.05mm}#5
				  \end{tabularx}
				  };
		\else
			\ifnum\xp=3

				\draw [*-,thin,textcol]
				  node[rounded corners=2pt, fill=white, draw=#2,minimum width=\paperwidth/5, minimum height=0.5 ,  anchor=\anchor] at (\side*0.6 , \startexp + #3 ) { 

				  \begin{tabularx}{\paperwidth/5}{L{1.1 cm}X}
				  		 \hspace{-7mm}
						 \includegraphics[width=1.4 cm]{#1} & \vspace{-7.5mm}\hspace{-4mm} #4\\
				  \end{tabularx}
				  };

			\else
				
				\draw [*-,thin,textcol]
				  node[rounded corners=2pt, fill=white, draw=#2,minimum width=\paperwidth/5, minimum height=0.5 ,  anchor=\anchor] at (0.5 , \startexp ) { 

				  \begin{tabularx}{\paperwidth/5}{C{\paperwidth/5}}
						 #4
				  \end{tabularx}
				  };
			\fi
		\fi
	\fi
}


% param 1:	color
% param 2:	variation hauteur
% param 3:  numero skill
\newcommand{\numeroskill}[3]{
	\ifnum\nsk=1
		\node [rectangle,line width=2pt, rounded corners=2pt, fill=white,text=textcol, anchor=\anchor,draw=#1] (box) at (\side*\paperwidth/5 + \side*14,\midexp + #2){\small \textbf #3};
	\else
	\fi

}



% define global counters
\newcounter{yearcount}

\newcounter{leftcount}

\newcommand{\pic}[1]{\renewcommand{\givenpic}{#1}}
\newcommand{\givenpic}{}

% env cvtimeline
%
% creates a vertical cv timeline
%
% param 1: start year
% param 2: end year
% param 3: overall width
% param 4: overall height
\newenvironment{cvtimeline}[3]{

	
	\newcommand{\cvcategory}[2]{
		\node[label=\mbox{\colorbox{##1}{\strut\hspace{2pt}}\colorbox{white}{\textcolor{textcol}{##2}}}] at (0,-5) {}; %start year
	}

	\newcommand{\bxwidth}{4.5}
	\newcommand{\bxheight}{2}


	% creates a stretched box as cv entry headline followed by two paragraphs about 
	% the work you did
	% param 1:	event start (month/year)
	% param 2:	event end or in beetween (month/year/style de flèche/style de trait)
	% param 3:  color
	% param 4:	parameters (déplacement horizontale bulle, déplacement verticale bulle)
	% param 5:	lien logo
	% param 6:	type de case / numéro de la skill
	% param 7:	name
	% param 8:	subname
	% param 9:	description
	\newcommand{\cv}[9] {

		\foreach \t/\ns in {##6} {
			\pgfmathparse{\t}
  			\global\let\type\pgfmathresult
			\pgfmathparse{\ns}
  			\global\let\numskill\pgfmathresult
		}

		\Cini{\type}

		\foreach \h/\v in {##4} {
			\pgfmathparse{\h}
  			\global\let\ho\pgfmathresult
			\pgfmathparse{\v}
  			\global\let\ve\pgfmathresult
		}

		\foreach \monthf/\yearf in {##1} {
			\pgfmathparse{#3/\fullrange*((\yearf-#1)+(\monthf/12))}
  			\global\let\startexp\pgfmathresult
			

			\ifnum\nsk=1
				\foreach \montht/\yeart/\arrrow/\style in {##2} {
					\pgfmathparse{#3/\fullrange*((\yeart-#1)+(\montht/12))}
		  			\global\let\endexp\pgfmathresult

					\draw[draw=textcol, line width=1.5pt,\arrrow,\style] (\side*0.2 + \ho, \startexp) -- (\side*0.2 + \ho,\endexp);

					\pgfmathparse{\endexp}
					\global\let\startexp\pgfmathresult
		 			%insérer fonction qui définit les lignes de liaison de la légende
				}

				\pgfmathparse{#3/\fullrange*((\yearf-#1)+(\monthf/12))}
		  		\global\let\startexp\pgfmathresult
						
				\pgfmathparse{1/(\endexp-\startexp+1)}
			  	\global\let\lenexp\pgfmathresult
				\pgfmathparse{0.5*\endexp+0.5*\startexp}
		  		\global\let\midexp\pgfmathresult

				\pgfmathparse{0.5*\endexp-0.5*\startexp-0.2}
				\global\let\cond\pgfmathresult

			\else
				\pgfmathparse{0}
		  		\global\let\midexp\pgfmathresult
			\fi


			%insérer fonction qui définit la case de légende

			%insérer fonction qui définit en fonction du type, numéro ref, logo diplome, 
		}

		\connect{\midexp}{\cond}{##3}{\ho}{\ve}
		\eexp{##5}{##3}{\ve}{##7}{##8}{##9}
		\numeroskill{##3}{\ve}{\numskill}

	}



	%--------------------------------------------------------------------------------------
	%	BEGIN
	%--------------------------------------------------------------------------------------
	
	\begin{tikzpicture}

	\setcounter{leftcount}{1}

	%calc fullrange= number of years
 	\pgfmathparse{(#2-#1)}
  	\let\fullrange\pgfmathresult
	\draw[draw=textcol,line width=4pt] (0,0) -- (0,#3) ;	%the timeline

	%for each year put a horizontal line in place
	\setcounter{yearcount}{1}
	\whiledo{\value{yearcount} < \fullrange}{
		\draw[fill=white,draw=textcol, line width=2pt]  (0,#3/\fullrange*\value{yearcount}) circle (0.1);
		\stepcounter{yearcount}
	}

	%start year
	\filldraw[fill=white!100,draw=textcol,line width=5pt] (-0.6,0) rectangle (0.6,0.12);
	\node[label=\textcolor{textcol}{\textbf{\normalsize#1}}] at (0,-0.65) {}; 

	%end year
	\filldraw[fill=white!100,draw=textcol,line width=5pt] (-0.7,#3) rectangle (0.7,#3-0.15);
	\node[label=\textcolor{textcol}{\textbf{\large#2}}] at (0,#3-0.1) {}; 

	\setcounter{leftcount}{0}

	\addtocounter{leftcount}{1}
	
}%end begin part of newenv
{\end{tikzpicture}



}

