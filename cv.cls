\LoadClass[12pt]{extreport}

\usepackage{ifthen}
\usepackage[german]{babel}
\usepackage[utf8x]{inputenc}
\usepackage{geometry}
\usepackage{array}
\usepackage{enumitem}
\usepackage{hyperref}
\usepackage{xltabular}
\usepackage{graphicx}
\usepackage{outlines}
\usepackage{xcolor}
\usepackage{fontawesome5}
\usepackage{tikz}
\usepackage{setspace}
\usepackage{dashrule}

\geometry{a4paper,
	left={0.5in},
	right={0.5in},
	top={0.3in},
	bottom={0.3in}
}

\linespread{1.15}

\pagenumbering{gobble}

\definecolor{dimgray}{HTML}{6C6D75}

\newcommand{\icon}[1]{\textcolor{dimgray}{\faIcon{#1}}}
\newcommand{\iconr}[1]{\textcolor{dimgray}{\faIcon[regular]{#1}}}

\newcommand{\rate}[1]{%
	\begingroup
	\newcount\counter
	\counter=0
	\@whilenum\counter<#1\do{\icon{circle} \advance\counter\@ne}%
	\endgroup
	\begingroup
	\newcount\counter
	\counter=#1
	\@whilenum\counter<5\do{\iconr{circle} \advance\counter\@ne}%
	\endgroup
}

\newcommand{\divider}{\textcolor{dimgray}{\hdashrule{0.5\linewidth}{0.5pt}{0.5ex}}}

\newcommand{\badge}[1]{%
	\tikz[baseline]\node[anchor=base,draw=dimgray,rounded corners,inner xsep=1ex,inner ysep=0.75ex,text height=1.5ex,text depth=.15ex]{#1};
}

\newcommand{\badgelist}[1]{%
	\raggedright
	{\setstretch{1.4}
		\foreach \i in {#1}{\badge{\i}}
		\par
	}
}

\setlist[itemize]{leftmargin=*,itemsep=1pt}

\newenvironment{csection}[2]{
	\textbf{#1}\phantom{g}
	\vspace{0.15cm}
	\hrule
	{#2}
}{}

\newenvironment{listing}[4]{
	{\textbf{#1} \leavevmode\newline}
		{\footnotesize
			\ifthenelse{\equal{#2}{}}{}{{#2 \leavevmode\newline}}
			\ifthenelse{\equal{#3}{}}{}{{\textit{#3}}}
		}
	\ifthenelse{\equal{#4}{}}{}{\par\raggedright{\scriptsize\setstretch{0.5}\foreach \i in {#4}{\badge{\i}}\par}}
}{}

\newenvironment{nestedlisting}[2]{
	\textbf{#1}
	\begin{itemize}[itemsep=-1pt,topsep=0pt]
		{\footnotesize
		\foreach \i\j in {#2}{\item
		      \ifthenelse{\equal{\i}{}}{}{{\i}}
		      \ifthenelse{\equal{\j}{}}{}{{\leavevmode\newline\textit{\j}}}
		      }
		      }
	\end{itemize}
}{}
