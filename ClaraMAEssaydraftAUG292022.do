*This version June 9th 

*In order to run this file, please type, once in the appropriate directory: "texdoc do ClaraMAEssaydraftAUG292022"

*First, in order to end up within the right working directory:

*Whoever uses this file must just create an ado file for this 
*In this ado file Rober uses "C:\Users\Terrry\Dropbox" 
*Others should use their own instead before saving the ado file, then typing 
*"Dropbox" should work equally for anyone) 

*Just delete all the *%%% below and then save with the name Dropbox.ado
*%%%program define Dropbox
*%%%version 13
*%%%cd "C:\Users\Terrry\Dropbox"
*%%%end
*Now this Dropbox command should work the same for everyone

*[we must then cd (change directory) into a particular subfolder of Dropbox where the tex file, packages, and dataset are]

Dropbox
cd "aaaMUN\SUPERVISION\2022\Clara"

capture log close

* date macro for filenames
local today: display %tdDDMonCCYY date(c(current_date), "DMY")
														
log using "ClaraMAEssaydraft`today'.smcl", replace
set more off
						
texdoc init "ClaraMAEssaydraft`today'.tex", replace

/*tex
\documentclass[12pt]{pdfathesis}

% This template has been adapted from the one provided by the Department of Mathematics and Statistics at MUN
% For further information and necessary latex packages see, https://www.mun.ca/math/graduate/grad-thesis/pdfathesis-doc.pdf
% and https://www.mun.ca/math/graduate/grad-thesis/

\setlength{\parskip}{6pt}

% Use '\doublespacing' for review/draft
\doublespacing



%March 2021. A simple trick is added to have the package acronym work with a ``list of abbreviations''
%March 2021. The option [hidelinks] is added to hyperref for a cleaner look

%\[disable]]todonotes
\usepackage[colorinlistoftodos,textsize=tiny,textwidth=2.8cm]{todonotes}

\usepackage{tocloft}
\usepackage{pdfathesis}
\usepackage{amsmath}
\usepackage{endnotes}
\usepackage{graphicx}
\usepackage{epsfig}
\usepackage{natbib}
\usepackage[hidelinks]{hyperref}
\usepackage{xcolor}
\usepackage{stata}
\usepackage{verbatim}
\usepackage{subfiles}
\usepackage{inputenc}
\usepackage{lscape}
%\usepackage[nolist]{acronym}
\usepackage{acronym}
\usepackage[title]{appendix}
\usepackage{bookmark}


\Title{Clara's MA Essay texdoc template for ECON6999} %% it shall not include LaTeX macros
\Author{Clara Daia Hilgenberg Daru}        %% ibidem
\DocumentType{essay}      % for research based degrees
\University{Memorial University of Newfoundland}
\AcademicUnit{Department of Economics}
\Degree{Master of Arts}
\Keywords{social welfare function\sep fuel prices} 
\Subject{MSC-xxxx subject descriptor}
%\DateSubmitted{}    % default: current month and year
%\ConvocationYear{}  % default: the nearest coming convocation year
\Supervisor{Dr. Roberto Martínez-Espi\~{n}eira}    % default: undefined
%\Cosupervisor{Name}  % default: undefined
\GradSchool{School of Graduate Studies}
\UniversityLogo{MUNLogoRGB} %% MUNLogoRGB.png is the file with university logo
\UniversityAddress{St. John's, \ Newfoundland and Labrador}

% If you do not know what a colorspace profile is, leave next macro alone
%\ColorspaceProfile{file}{profile description}{number of components}

\def\dnor#1#2{{N}\!\!\left(#1,\,#2\right)}
\def\real#1{{R}^{#1}}


\begin{document}

% pdfathesis sections
\begin{prefatory}
\frontpage

% Abstract is mandatory. It should not exceed 100 words
\abstract

Fossil fuels represent a large share of expenditure for Brazilian households. Demand is inelastic in the short-term, and pricing policies of the country's national . Frequent price changes affect families well-being, and it does so heterogeneously. To understand these heterogeneous effects, we use a social welfare function framework. We analyse the effect of gasoline prices on social welfare in Brazil using the transcendental logarithm social welfare function, and use those estimates to evaluate the import parity price policy implemented by Petrobras. We find that the policy affected families of median and above income x times more than families under the median income.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% optional
%\dedication
%{\flushright
%To whom you what to dedicate this work\\
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\acknowledgements

Intellectual and practical assistance, advice, encouragement and sources
of monetary support should be acknowledged. It is appropriate to acknowledge
the prior publication of any material included in the essay either in this section 
or in the introductory chapter of the essay.

Among other acknowledgements, the student should declare the
extent to which assistance (paid or unpaid) has been given by faculty
and staff members, fellow students, research assistants, technicians,
or others in the preparation of the thesis (including editorial help).

In addition, it is appropriate to recognize the supervision and advice
given by the thesis supervisor(s), supervisory committee members and
other advisors.

I would like to thank Thiago Lima for asking me the crucial question that led me to pursue this degree, and for supporting me through it, financially and emotionally.
Samia and Nahida.
My mother and father, with whom I had uncountable discussions on politics and who instilled in me all my life the desire to make the world better.

Dr. Martinez-Espi\~{n}eira who taught me about welfare economics, told me and my peers we must be very humble about our assumptions.
Dr. Locke, who first presented me to the concept of the social welfare function.
Dr. Hexsel.

The Informatics Department of UFPR Faculty.

Alanna, Rafaela, Anaïz, Marcela, Julia, Nicole, the inspiring women I am lucky to have met in this life.


\pagebreak


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\tableofcontents

\pagebreak
\listoftables    % if apply, otherwise comment
\pagebreak
\listoffigures   % if apply, otherwise comment
\pagebreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   List of symbols is optional, it is unlikely that you need one for your Economics MA Essay but you can choose to use it
%%   if, for instance you have a lot of econometric notation in your Essay
%%   It is like a two column tabular environment
%\begin{symbols}
%$\dnor{\mu}{\sigma^2}$ & %
  %  normal distribution with mean $\mu$ and variance $\sigma^2$\\
%$\real{}$ & real numbers\\
%\end{symbols}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%   List of abbreviations is optional
%%   Also, it is like a two column tabular environment

\begin{abbreviations}

Just insert your acronym package commands here and the list will appear as if they were abbreviations 
Note that the list will keep ``unused'' acronyms. \LaTeX will, however, flag ``undefined'' acronyms.


\end{abbreviations}

\begin{acronym}
\acro{IBGE}{Instituto Brasileiro de Geografia e Estatística}
\acro{IPP} {Import Parity Price}
\acrodefplural{OS}[OS's]{Operating Systems}

\acro{POF}{Pesquisa de Orçamentos Familiares}

\end{acronym}

\end{prefatory}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\listoftodos

\todo[inline]{Please do not delete these ``todo'' notes, we can disable them later but we need to use them to keep track of changes}
\todo[inline]{Make sure you rename ALL the relevant files in every version of the do file: do file. scml file, and tex file}
\todo[inline, color=pink!80]{I suggest that you agree to use notes of different colours to signify different things: orange for new comment? green for solved comment? red for important issue? or different authors have different colours? The todo package is very flexible }
\todo[inline, color=green!80]{Remember that all traces of notes can be made to disappear from the pdf produced by changing one line, so do not actually delete notes, keep them in the do file and tex file}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\chapter{Introduction}\label{intro}

According to an official survey run in 2017 and 2018, transportation was on average the second largest group of expenses for Brazilian families, corresponding to 18,1\% of their monthly budget \citep{ibge2019}. The demand for gasoline in Brazil is generally estimated to be price-inelastic \citep{Cardoso2019}, especially in the short run \citep{Bastos2016}.

Having a low price-elasticity of demand and representing a large share of expenditure means the impact of gasoline price fluctuations is severe on consumers' well-being. Reflecting that relevance, in the past two decades the pricing of petroleum and its products in Brazil has been the target of several important policy interventions. Section \ref{gas_policy_history} provides a brief history of these interventions.

In particular, in 2016, the Brazilian national petroleum company, Petrobras, implemented a new pricing policy, ending a long-term effective subsidy on the price of oil that had kept it up to 20\% lower for national distributors \citep{Ramalho2021}. The import parity price (IPP) policy  \footnote{Brazilian media uses the acronym ``PPI'' along with a variety of phrases such as ``International Parity Price'', ``International Parity Policy'' and ``International Prices Parity''. The Government webpage that tracks import prices of fossil fuels uses the name ``Import Parity Prices''. In the text, I use ``the IPP policy'' when referring to the policy implemented in 2016, and ``IPP'' when referring to prices.} made prices practiced within the country the same as the prices in the international market for oil, which resulted in more volatile prices of gasoline to consumers. 

There are two main reasons to reevaluate this policy: a methodological and a political one.
The methodological standpoint:
Previous work on the welfare impact of gas prices uses restricted/overly aggregated measures.

The political standpoint:
1. politicians often use gas price regulations as a popularity tool, especially near elections;
2. for environmental reasons, we may see an increase in gasoline consumption interventions in the near future
3. in the particular case of the 2016 policy, the expected benefits (more govt revenue, more profit for stock owners) should be weighted against a detailed account of the costs in social welfare loss

An evaluation of the impact of an intervention on gas prices using a robust ethical framework, that takes into consideration how different subgroups of the population are affected, can be used by policymakers when designing.


% * a review of the literature that establishes the student's familiarity with relevant work in the field;
% * sets out the objectives of the essay;
% * places the research into the larger context of the candidate's discipline; 
% * and provides overall thematic cohesiveness of the sections to follow. 

		

\textcolor{red}{A note on acronyms:}

This is an example of an acronym: \ac{MUN} in the singular form. Remember to define 
each acronym with the \textit{acronym} environment and then use 
the tags correctly, so that, say, \ac{MUN} is defined only at first use. 

This one is in the plural: \textit{There are several \acp{NGO}}. 

\ac{OS} is an acronym with a nonstandard plural:
\textit{These \acp{NGO} all operate with different \acp{OS}}

Also take a look at how the ``list of acronyms'' is made to appear as a ``list of abbreviations'' above.

This is an example of an undefined acronym for \ac{REM}.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\chapter{Literature Review}\label{litreview}

\section{Gas prices interventions}\label{gas_policy_history}
In 2002, the anti-trust ...

In June of 2022, Brazilian president Jair Bolsonaro sanctioned a bill setting the ceiling for the consumption tax (ICMS) on fuels, to a maximum of 18%. This was part of a series of attempts to keep inflation under control, with the upcoming elections in sight.


This is a citation of a technical report: \citet{AbdallaandDrohan10} 
Another one \citep{AbdallaandDrohan10}


\citet{Adgateetal14} wrote an article but \citet{Hayward12} wrote a book.

\section{IBGE's Quality of Life Loss Index}

\section{Estimating Social Welfare from Aggregate Consumer Behaviour}
% Adler 2019, Jorgenson 1990

 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\chapter{Methodology and Data}\label{methods}
\section{The Economic Model}

You describe your methodology. The description of the methodology should be sufficiently detailed so as to allow reproduction of the research by the reader. However, you should consider relegating lengthy technical details to appendices.  

\section{Study Variables}\label{variablessection}

\section {Econometric Model}

\section {Data}\label{datasection}

\subsection {Data Source}

The Family Budget Survey (Pesquisa de Orçamentos Familiares -- POF) run by the Brazilian Institute of Geography and Statistics (IBGE) \citep{ibgePOF}, provides detailed data on individual household expenditure on particular goods and services, as well as the cohort attributes mentioned in Section \ref{cohort_attributes}.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\chapter{Results}\label{resultssection}



Remember to include a self-explanatory combination of caption (title) and legend (note) with each float (table, figure). If needed, you can use shorter versions of the title in your tables of figures and tables but it is important that the reader can understand what appears in a float mostly by just looking at that float.



\todo{Rober shows an example of table and figure here but look up Jann's paper too}
tex*/

texdoc stlog, nolog
webuse auto 



scatter price weight
graph2tex, epsfile(priceweightscatter) caption(Scatter of price and weight) label(priceweightscatter) 

quietly sutex  price length, minmax  title(Descriptives of summary measures of price and car length) key(pricelengthsummarymeasures) file(pricelengthsummarymeasures.tex) replace labels

quietly outreg2 using morepricelengthsummarymeasures, keep(price length) sum(log) noparen dec(4) tex(frag) replace label title(More descriptives of summary measures \label{morepricelengthsummarymeasures})
texdoc stlog close

texdoc write \input{pricelengthsummarymeasures.tex}

reg price length 
esttab using RRR, star nose  tex replace



/*tex


\input{RRRlazy}

\input{RRR}

Note that Table \ref{RRR} and its regression have been clumsily placed outsise stlog calls, so that they need to be generated afresh every time, even when the option ``nodo'' is added to texdoc when running the do file. This is not the case of the graphs and should not be the case of any lengthy STATA process.

Take a look at Table \ref{RRR} and compare it with a more basic (just using default options) Table \ref{RRRlazy}.


Now Table \ref{RRRsuper} also contains added stats. I ran a simple F test to show you how to add that test statistic to the table. 

\input{RRRsuper}



\input{morepricelengthsummarymeasures}


\begin{figure}[h]
\begin{centering}
  \includegraphics[height=3in]{priceweightscatter}
  \caption{Scatter of price and weight}
  \label{priceweightscatter}
\end{centering}
\end{figure}


\textcolor{purple}{This is to reference Figure \ref{priceweightscatter}. These tables and figure are automatically replicable .}


\todo{Rober shows an example of table and figure here but look up Jann's paper too \citep{Jann16}}
tex*/

texdoc stlog, nolog
webuse auto , clear

sum price
local meanprice = r(mean)
quietly local meanprice: di %7.2f `meanprice'

texdoc stlog close

texdoc write Using `meanprice' dynamically like this is easier and safer than having to manually copy and paste.
texdoc write This might be needed for complicated bits of tables, if esttab etc. do not do exactly what we need.
texdoc write Remember that these macros will show empty when you ``texdoc, nodo'' your do file.


reg price length weight foreign  mpg

esttab using RRRlazy, star tex replace title(A lazy table of regression results. \label{RRRlazy}) 


esttab using RRR, star nose not tex replace title(A still simple, yet more elegant, table of regression results. \label{RRR}) coeflabels(_cons "A beautiful constant") nonumber  stats(ll N, labels("Log-Likelihood" "Number of vehicles"))

test length=42


estadd scalar Ftestfromregression = r(F)
local Ftestfromregression = r(F)

quietly local Ftestfromregression: di %5.2f `Ftestfromregression'



esttab using RRRsuper, star nose not tex replace title(A somewhat super-sophisticated, but still quasi-simple, table of regression results with added test statistics. \label{RRRsuper}) coeflabels(_cons "Just the constant") nonumber  stats(ll N Ftestfromregression, labels("Log-Likelihood" "Number of vehicles" "The F stat we came up with"))

texdoc write Similarly, Table \ref{RRRsuper} simply uses a macro for that F stat that takes the value `Ftestfromregression'. 
texdoc write  Again, note that it will show empty here when you ``texdoc, nodo'' your
texdoc write  do file. You do need to remember to fully ``texdoc'' all your do file (slow 
texdoc write regressions and all) right before generating a tex file as a final output.

/*tex


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\chapter{Conclusions}\label{conclusions}


\bibliographystyle{chicago}
\bibliography{ClaraMAEssaybibfile}
\end{document}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\appendix

\chapter{Title of Appendix A}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\chapter{Title of Appendix B}

\end{document}


tex*/



