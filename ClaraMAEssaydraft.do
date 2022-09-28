/***********************************************************
 *  Clara Daia Hilgenberg Daru                             *
 *  September 2022                                         *
 *                                                         *
 *  Regressing utility parameters on observed expenditure  *
 *  shares, aggregate expenditure over time and household  *
 *  attributes.                                            *
 ***********************************************************/

Dropbox
// Where the output and data files are
cd "aaaMUN\SUPERVISION\2022\Clara"

capture log close

log using "ClaraMAEssaydraft.smcl", replace
set more off

texdoc init "ClaraMAEssaydraft.tex", replace

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
\usepackage{tabularx}
\usepackage{booktabs}


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

Fossil fuels represent a large share of expenditure for Brazilian households. Demand is inelastic in the short-term, and pricing policies implemented by Petrobras. Frequent price changes affect families well-being, and it does so heterogeneously. To understand these heterogeneous effects, we use a social welfare function framework. We analyse the effect of gasoline prices on social welfare in Brazil using the transcendental logarithm social welfare function, and use those estimates to evaluate the import parity price policy implemented by Petrobras. We find that the policy affected families of median and above income x times more than families under the median income, and that families living in rural areas were x times more affected than families in urban areas.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Dedication placeholder
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\acknowledgements

Thiago.
Samia and Nahida.
My mother and father.

Dr. Martinez-Espi\~{n}eira who taught me about welfare economics and to stay humble about our assumptions.
Dr. Locke, who first presented me to the concept of the social welfare function and to the translog utility function.
Dr. Hexsel.

The Informatics Department of UFPR Faculty.

\pagebreak


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\tableofcontents

\pagebreak
\listoftables    % if apply, otherwise comment
\pagebreak
\listoffigures   % if apply, otherwise comment
\pagebreak

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% List of symbols placeholder
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Abbreviations placeholder
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\begin{acronym}
\acro{IBGE}{Instituto Brasileiro de Geografia e Estat\'{i}stica}
\acro{IPP} {Import Parity Price}
\acro{POF}{Pesquisa de Or\c{c}amentos Familiares}
\acro{ICMS}{Imposto sobre Circula\c{c}\~{a}o de Mercadorias e Servi\c{c}os}

\end{acronym}

\end{prefatory}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\listoftodos

\todo[inline]{Please do not delete these ``todo'' notes, we can disable them later but we need to use them to keep track of changes}
\todo[inline]{Make sure you rename ALL the relevant files in every version of the do file: do file. scml file, and tex file}
\todo[inline, color=pink!80]{I suggest that you agree to use notes of different colours to signify different things: orange for new comment? green for solved comment? red for important issue? or different authors have different colours? The todo package is very flexible }
\todo[inline, color=green!80]{Remember that all traces of notes can be made to disappear from the pdf produced by changing one line, so do not actually delete notes, keep them in the do file and tex file}



\todo[inline]{We need the acronyms translated into English. Then you can use footnotes or the bib reference to include the original name in Portuguese}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% A few shortcuts for todonotes and text colouring

\newcommand{\td}{\todo}
\newcommand{\tdFL}{\todo[fancyline]}
\newcommand{\tdIL}{\todo[inline]}
\newcommand{\tdILR}{\todo[inline, color=red!80]}


\newcommand{\tr}{\textcolor{red}}
\newcommand{\tde}{\todo{ENW}}
\newcommand{\tdeFL}{\todo[fancyline]{ENW}}
\newcommand{\tdeIL}{\todo[inline]{ENW}}

\newcommand{\tdp}{\todo{PNW}}
\newcommand{\tdpFL}{\todo[fancyline]{PNW}}

\td{these are just macros and their checks to save Rober some typing, please ignore}


%checking:
\tr{checking red}
\tde
\tdeFL
\tdIL{this in line}
\tdILR{this in line red}


\tdpFL

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\todo[inline,color=yellow,size=\huge]{This version: \today}

\pagebreak



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\chapter{Introduction}\label{intro}

\tdIL{Rober suggests italicizing the original Portuguese, curently missing a special c or a z or something in the acronym definition, translating it here into English and creating the acronym for FBS instead or POF. Same with IBGE}

\tdIL{checkspelling in bib entries, remember the accents in \TeX: Estatística will yield a missing vowel, use Estat\'{i}stica. }

\tdIL{Also consider using the acronyms in the author field of your bib file, so it looks more tidy. That is, use ``{I}nstituto {B}rasileiro de {G}eografia e {E}statística'' in a ``note'' but only IBGE in the ``author'' field }


According to the 2017-2018 Family Budget Survey (\ac{POF}) run by the Brazilian Institute of Geography and Statistics (\ac{IBGE}) \citep{ibgePOF}, transportation was on average the second largest group of expenses for Brazilian families, corresponding to 18,1\% of their monthly budget \citep{ibge2019}. The demand for gasoline in Brazil is generally estimated to be price-inelastic \citep{Cardoso2019}, especially in the short run \citep{Bastos2016}.

\tdIL{Obviously all these paragraphs will need a lot of rewriting as you go in order to thread a story together...}

Having a low price-elasticity of demand and representing a large share of expenditure means the impact of gasoline price fluctuations is severe on consumers' well-being. Reflecting that relevance, in the past two decades the pricing of petroleum and its products in Brazil has been the target of several important policy interventions. Section \ref{gas_policy_history} provides a brief history of these interventions.

\tdIL{perhaps also add that the price of oil can fluctuate a lot?}

In particular, in 2016, the Brazilian national petroleum company, Petrobras, implemented a new pricing policy, ending a long-term effective subsidy on the price of oil that had kept it up to 20\% lower \tdFL{tha what?} for national distributors than the international average price \citep{Ramalho2021}. The \ac{IPP} policy \tdFL{big extra space here: fix} \footnote{The Brazilian media uses the acronym ``PPI'' along with a variety of phrases such as ``International Parity Price'', ``International Parity Policy'' and ``International Prices Parity''. The Government webpage that tracks import prices of fossil fuels uses the name ``Import Parity Prices''. In the text, I use ``the IPP policy'' when referring to the policy implemented in 2016, and ``IPP'' when referring to prices.} made prices practiced within the country the same as the prices in the international market for oil, which resulted in more volatile prices of gasoline to consumers.

From the \tdFL{ENW: English needs work} methodological standpoint, I find that previous work on the impact on welfare of gas prices uses measures such as dead-weight loss, which precludes an evaluation of effects on population subgroups, or investigate effects on specific regions rather than a nation-wide study.

\tdIL{We will need a few references to back this up}

There are also political aspects of interest in analysing the effect of gas price changes. Politicians often use gas price regulations as a popularity tool, especially near elections.\tdFL{refes needed} For environmental reasons, it is likely we will see an increase in gasoline consumption interventions in the near future, as countries strive to reduce their carbon footprints. Better understanding of demand \tde for gasoline and welfare effect of price changes can yield more effective policies. As for the 2016 \ac{IPP} policy, the benefits (more government revenue, more profit for stock owners) can be weighted against a detailed account of the costs in social welfare loss.

\tdIL{THis makes it sound that the governmnet revenue and the profits are NOT somehow part of social welfare BUT they are: rethink and reword. The government is not a person, so you may want to measure those gains in goverment revenue in terms of the saved tax distortion in other markets but the stock oweners are indivudals with standing.}

		
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\chapter{Literature Review}\label{litreview}

\section{Gas prices interventions}\label{gas_policy_history}
In 2002, the anti-trust ...

In June of 2022, Brazilian president Jair Bolsonaro sanctioned a bill setting the ceiling for the consumption tax (\ac{ICMS}) on fuels, to a maximum of 18\%. This was part of a series of attempts to keep inflation under control.


\section{\ac{IBGE}'s Quality of Life Loss Index}
For comparison. IBGE uses its own deflators.

\section{Estimating Social Welfare from Aggregate Consumer Behaviour}
% Adler 2019, Jorgenson1990, JorgensonSlesnick1987, JorgensonSlesnick2014

 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\chapter{Methodology and Data}\label{methods}
We want to characterize the differences in the demand for gasoline across households of different compositions and attributes.
Following \cite{Jorgenson1990}, I assume \tr{that} households behave as individuals when it comes to maximizing utility, and that households with the same attributes have a utility function of the \textit{transcendental logarithm} form \cite{JorgensonChristensenLau1975}:

\begin{equation}
- \ln U = \alpha_0 + \sum \alpha_i \ln X_i + \frac{\sum{\sum{B_{ij} \ln X_i \ln X_j}}}{2}
\end{equation}

Where $i$ and $j$ identify available goods and $X_i$ represents the quantities consumed. By maximizing this utility function and incorporating differences related to demographic characteristics of households, we obtain an indirect utility function \citep{JorgensonSlesnick1987}:

\begin{equation}
\ln V_k = \ln \left( \frac{p}{M_k} \right) \alpha_p + \frac{1}{2} \ln \left( \frac{p}{M_k} \right)B_{pp} \ln \left( \frac{p}{M_k} \right) + \ln \left( \frac{p}{M_k} \right)B_{pA}A_k
\end{equation}

Where
\begin{itemize}
	\item $k$ identifies a household,
	\item $A_k$ is the vector of attributes of household $k$,
	\item $\alpha_p$, $B_pp$ characterize general preferences and
	\item $B_{pA}$ characterize preferences according to observed attributes.
\end{itemize}

Differences in preferences are captured by \textit{commodity-specific household equivalence scales}:

\begin{equation}
\ln m(A_k) = B_{pp}^{-1}B_{pA}A_k
\end{equation}

\section{Study Variables}\label{variablessection}
\subsection{Cohort Attributes} \label{cohort_attributes}
Following \cite{Slesnick2000}, I use the following attributes to characterize cohorts:

\begin{enumerate}
	\item Household Size
	\item Age of Head of the Household
	\item Region of Residence
	\item Race of Head of the Household
	\item Type of Residence \tdFL{fix spacing} \footnote{\cite{Slesnick2000} uses ``farm or nonfarm'' for the type of residence, while \cite{Jorgenson1990} uses ``urban or rural''. The \ac{POF} classifies households as ``urban or rural'', so I use this classification.}
	\item Gender of Head of the Household
\end{enumerate}

See Table \ref{attribute_vars} for the variables from the dataset used to extract each of these attributes.

\setlength{\extrarowheight}{3pt}
\begin{table}[]
\begin{tabular}{p{0.25\textwidth}p{0.75\textwidth}}
\toprule
\textbf{Attribute}                       & \textbf{Source}                                                                                                                                          \\ \midrule
Household Size                  & The dataset \verb|MORADOR| contains one row per household member, I count the rows in each household and use 7 or more as the upper limit.                               \\
Age of Head of the Household    & Variable \verb|V0403| in the \verb|MORADOR| dataset contains the age of each member. I grouped the ages into 5 buckets using frequencies (?).                            \\
Region of Residence             & Variable \verb|UF| in \verb|MORADOR| contains the state where the household is located. I mapped the states into their official regions of Brazil, namely Centro-Oeste, Nordeste, Norte, Sudeste e Sul. \\
Race of Head of the Household   & Variable \verb|V0405| in \verb|MORADOR| classifies the head of the household as ``white'', ``black'', ``asian'', ``mixed'', ``indigenous'' or ``undeclared''. \\
Type of Residence               & Variable \verb|TIPO\_SITUACAO\_REG| in \verb|MORADOR| classifies households as ``urban'' or ``rural''.                                        \\
Gender of Head of the Household & Variable \verb|V0404| in \verb|MORADOR| classifies the head of the household as ``male'' or ``female''.                             \\

\bottomrule
\end{tabular}
\caption{Source variables of household attributes} \label{attribute_vars}
\end{table}




\subsection{Commodity Groups} \label{commodity_groups}
\cite{Jorgenson1990} and \cite{Slesnick2000} use the following commodity groups:
\begin{enumerate}
 \item Energy
 \item Food
 \item Consumer Goods
 \item Capital Services
 \item Consumer Services
\end{enumerate}

In order to isolate the effect of gasoline prices, I subdivide the ``energy'' group into ``gasoline'' and ``others'', and the ``consumer services'' group into ``public transportation'' and ``others''.


\section {Econometric Model}
The model for individual expenditure shares is given by:

\begin{equation}
- w_k = \omega_p - B_{pp}i \ln M_k + B_{pA}A_k + \mu_k
\end{equation}

, where
\begin{itemize}
	\item $w_k$ is the vector of expenditure shares for each commodity group for the $k$th \tdFL{FNW: fix subscript format} household;
	\item $M_k$ is the household income;
	\item $A_k$ is the vector of household attributes described in Section \ref{cohort_attributes};
	\item $\mu_k$ is the stochastic component for the $k$th household;
	\item $\omega_p$, $B_{pp}i$ \tdFL{FNW check the formatting of subscripts} and $B_{pA}$ are the parameters we want to estimate.
\end{itemize}

\section {Data}\label{datasection}

\subsection {Data Source}

The \ac{POF} provides detailed data on individual household expenditure on particular goods and services, as well as the cohort attributes mentioned in Section \ref{cohort_attributes}. For the cross-sectional estimation of the utility parameters I used the most recent survey, run between 2017 and 2018.

The National Accounts provide the time-series aggregate data on consumption and prices.
(In the event this data turns out to not be enough, I can potentially aggregate the expenditures from earlier \acp{POF} and use that as the time-series component, but this will probably mean low significance.)

\tdIL{I am a bit confused, you are going to use to runs of the survey, so that will NOT be a time-series approach correct?}

\tdIL{Rober SEPT 19: you do not name a variable "urban\_or\_rural" (also because the underscores tend to be a nuisance in \LaTeX), since that is not going to help: name it EITHER urban OR rural and lable the 0 and 1 values accordingly. Same with "gender" "marital status" etc. Use male (or female, or additional binary indicators) and "married", "single", "divorced", etc. }

\tdIL{so can we start seeing tables of descriptives of whatever data you already have, you do have some data.}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\chapter{Results}\label{resultssection}

tex*/

texdoc stlog, nolog

***Rober SEPT 19 This would go to the data subfolderand unzips the big compressed file:
*** cd aaaMUN\SUPERVISION\2022\Clara\Data
*** unzipfile DataCLARA, replace

*BUT that uncompressed folder is WAYYY too big for Rober's Dropbox, so he just unzipped one dataset for now, as needed below

***Rober SEPT 19: Then the next command should "use" that individual dataset without trouble


 // Open household demographic information
use "Data\Dados_20210304\MORADOR.dta", clear

// Obtain regions from states
// Norte: 11 - Rondônia, 12 - Acre, 13 - Amazonas, 14 - Roraima, 15 - Pará, 16 - Amapá, 17 - Tocantins,
// Nordeste: 21 - Maranhão, 22 - Piauí, 23 - Ceará, 24 - Rio Grande do Norte, 25 - Paraíba, 26 - Pernambuco, 27 - Alagoas, 28 - Sergipe, 29 - Bahia
// Sudeste: 31 - Minas Gerais, 32 - Espírito Santo, 33 - Rio de Janeiro, 35 - São Paulo
// Sul: 41 - Paraná, 42 - Santa Catarina, 43 - Rio Grande do Sul
// Centro-Oeste: 50 - Mato Grosso do Sul, 51 - Mato Grosso, 52 - Goiás, 53 - Distrito Federal
gen region = floor(UF/10)
label define brazil_regions 1 "Norte" 2 "Nordeste" 3 "Sudeste" 4 "Sul" 5 "Centro-Oeste"
label values region brazil_regions

// Household identification is UPA + domicilio + unidade consumidora
// Total households surveyed are total unique combinations of these
unique COD_UPA NUM_DOM NUM_UC
local household_count = r(unique)

// Type of residence
// 1 == urban, 2 == rural
rename TIPO_SITUACAO_REG residence_type

// Gender
// 1 == male, 2 == female
rename V0404 gender
label define genders 1 "male" 2 "female"
label values gender genders

// Race
// 1 == white
// 2 == black
// 3 == asian
// 4 == mixed
// 5 == indigenous
rename V0405 race
label define races 1 "white" 2 "black" 3 "asian" 4 "mixed" 5 "indigenous" 9 "undeclared"
label values race races


// Age
rename V0403 age
// tbd: age groups

// Count number of people in the household
// UPA = Unidade Primária de Amostragem = "Primary Sampling Unit"
// DOM = Domicílio = "House"
// UC = Unidade Consumidora = "Household"
bysort COD_UPA NUM_DOM NUM_UC: gen n_people=_N

// 7 is code for "7 or more"
replace n_people = 7 if n_people >= 7

// keep only person of reference in the household (aka "head")
keep if V0306 == 1



// Open income data
use "Data\Dados_20210304\RENDIMENTO_TRABALHO.dta", clear

texdoc stlog close

/*tex


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\chapter{Conclusions}\label{conclusions}

It would be nice to have an annual survey of family expenditures in Brazil, so we could also track changes in time.

\bibliographystyle{chicago}
\bibliography{ClaraMAEssaybibfile}
\end{document}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% appendix placeholder
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\end{document}


tex*/



