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
\usepackage{acronym}
\usepackage[title]{appendix}
\usepackage{bookmark}
\usepackage{tabularx}
\usepackage{booktabs}
\usepackage{multirow}
\usepackage{longtable}
\usepackage{array}
\usepackage{lscape}
\setlength{\LTcapwidth}{\textwidth}


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

Dr. Daniela Verzola Vaz and Dr. Rodolfo Hoffmann for their advice on the use of the \ac{FBS} dataset.
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
\acro{BIGS}{Brazilian Institute of Geography and Statistics}
\acro{IPP}{Import Parity Price}
\acro{FBS}{Family Budgets Survey}
\acro{PIGLOG}{Price-Independent Generalized Logarithmic}
\acro{PSU}{Primary Sampling Unit}
\acro{GSFT}{Goods and Services Flow Tax}
\acro{NSCPI}{National System of Consumer Price Indices}
\acro{ACPI}{Ample Consumer Price Index}

\end{acronym}

\end{prefatory}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\listoftodos

\todo[inline]{Please do not delete these ``todo'' notes, we can disable them later but we need to use them to keep track of changes}
\todo[inline]{Make sure you rename ALL the relevant files in every version of the do file: do file. scml file, and tex file}
\todo[inline, color=pink!80]{I suggest that you agree to use notes of different colours to signify different things: orange for new comment? green for solved comment? red for important issue? or different authors have different colours? The todo package is very flexible }
\todo[inline, color=green!80]{Remember that all traces of notes can be made to disappear from the pdf produced by changing one line, so do not actually delete notes, keep them in the do file and tex file}



\todo[inline, color=green]{We need the acronyms translated into English. Then you can use footnotes or the bib reference to include the original name in Portuguese}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% A few shortcuts for todonotes and text colouring

\newcommand{\td}{\todo}
\newcommand{\tdFL}{\todo[fancyline]}
\newcommand{\tdFLY}{\todo[fancyline, color=yellow]}
\newcommand{\tdIL}{\todo[inline]}
\newcommand{\tdILR}{\todo[inline, color=red!80]}
\newcommand{\tdILY}{\todo[inline, color=yellow]}
\newcommand{\tdILB}{\todo[inline, color=cyan]}


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

\tdILY{Rober suggests italicizing the original Portuguese, curently missing a special c or a z or something in the acronym definition, translating it here into English and creating the acronym for FBS instead or POF. Same with IBGE}

\tdIL{checkspelling in bib entries, remember the accents in \TeX: Estatística will yield a missing vowel, use Estat\'{i}stica. }

\tdILY{Also consider using the acronyms in the author field of your bib file, so it looks more tidy. That is, use ``{I}nstituto {B}rasileiro de {G}eografia e {E}statística'' in a ``note'' but only IBGE in the ``author'' field }

\tdIL{You could have somewhere in the intro something about how many/most countries subsidize oil for consumers and how much politcal unrest trying to eliminate those inefficient subsidies can cause.}


According to the 2017-2018 \ac{FBS} run by the \ac{BIGS} \citep{ibgePOF}, transportation was on average the second largest group of expenses for Brazilian families, corresponding to 18,1\% of their monthly budget \citep{ibge2019}. The demand for gasoline in Brazil is generally estimated to be price-inelastic \citep{Cardoso2019}, especially in the short run \citep{Bastos2016}.

\tdIL{Obviously all these paragraphs will need a lot of rewriting as you go in order to thread a story together...}

Having a low price-elasticity of demand and representing a large share of expenditure means the impact of gasoline price fluctuations is severe on consumers' well-being. Reflecting that relevance, in the past two decades the pricing of petroleum and its products in Brazil has been the target of several important policy interventions. Section \ref{gas_policy_history} provides a brief history of these interventions.

\tdIL{perhaps also add that the price of oil can fluctuate a lot?}

In particular, in 2016, the Brazilian national petroleum company, Petrobras, implemented a new pricing policy, ending a long-term effective subsidy on the price of oil that had kept it up to 20\% lower for national distributors than the international average price \citep{Ramalho2021}. The \ac{IPP} policy\footnote{The Brazilian media uses the acronym ``PPI'' along with a variety of phrases such as ``International Parity Price'', ``International Parity Policy'' and ``International Prices Parity''. The Government webpage that tracks import prices of fossil fuels uses the name ``Import Parity Prices''. In the text, I use ``the IPP policy'' when referring to the policy implemented in 2016, and ``IPP'' when referring to prices.} made prices practiced within the country the same as the prices in the international market for oil, which resulted in more volatile prices of gasoline to consumers.

From the \tdFL{ENW: English needs work: from ``a''} methodological standpoint, \tr{I find} \tdFL{reword} that previous work on the impact on welfare of gas prices uses measures such as dead-weight loss, which precludes an evaluation of effects on population subgroups, or investigate \tdFL{ENW grammar} effects on specific regions rather than a nation-wide study.

\tdIL{We will need a few references to back this up}

There are also political aspects of interest in analysing the effect of gas price changes. \tdFL{As explained above: bring examples from other countries too?} Politicians often use gas price regulations as a popularity tool, especially near elections. \tdFL{refes needed} For environmental reasons, it is likely we will see an increase in gasoline consumption interventions in the near future, as countries strive to reduce their carbon footprints. Better understanding of demand \tde for gasoline and welfare effect of price changes can yield more effective policies. As for the 2016 \ac{IPP} policy, the benefits (more government revenue, more profit for stock owners) can be weighted against a detailed account of the costs in social welfare loss.

\todo[color=green]{THis makes it sound that the governmnet revenue and the profits are NOT somehow part of social welfare BUT they are: rethink and reword. The government is not a person, so you may want to measure those gains in goverment revenue in terms of the saved tax distortion in other markets but the stock oweners are indivudals with standing.}

		
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\chapter{Literature Review}\label{litreview}

\section{Gas prices interventions}\label{gas_policy_history}
In 2002, the anti-trust ...

In June of 2022, Brazilian president Jair Bolsonaro sanctioned a bill setting the ceiling for the consumption tax (\ac{GSFT}) on fuels, to a maximum of 18\%. This was part of a series of attempts to keep inflation under control.


\section{\ac{BIGS}'s Quality of Life Loss Index}
For comparison. IBGE uses its own deflators.

\section{Estimating Social Welfare from Aggregate Consumer Behaviour}
% Adler 2019, Jorgenson1990, JorgensonSlesnick1987, JorgensonSlesnick2014


 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\chapter{Methodology and Data}\label{methods}
We want to characterize the differences in the demand for gasoline across households of different compositions and attributes and use this characterization to estimate the welfare effects of a subsidy policy change.

To characterize the demand for gasoline, I use the transcendental logarithmic (translog) model of aggregate consumer behaviour. This model uses a translog specification of the \ac{PIGLOG} class of functions.

Following \cite{Jorgenson1990}, I assume that households behave as individuals when it comes to maximizing utility and that households with the same attributes have a utility function of the \textit{transcendental logarithm} form \citep{JorgensonChristensenLau1975}:

\begin{equation}
- \ln U = \alpha_0 + \sum \alpha_i \ln X_i + \frac{\sum{\sum{B_{ij} \ln X_i \ln X_j}}}{2}
\end{equation}

\tr{Where} \tdFL{lowercase, as this just follows from the equation, perhaps with a comma in front} $i$ and $j$ identify available goods and $X_i$ represents the quantities consumed. By maximizing this utility function and incorporating differences related to demographic characteristics of \tr{the} households, we \tdFL{Again, try to reword, it is not ``we''...use the passive voice perhaps.} obtain an indirect utility function \citep{JorgensonSlesnick1987}:

\begin{equation}
\ln V_k = \ln \left( \frac{p}{M_k} \right) \alpha_p + \frac{1}{2} \ln \left( \frac{p}{M_k} \right)B_{pp} \ln \left( \frac{p}{M_k} \right) + \ln \left( \frac{p}{M_k} \right)B_{pA}A_k
\end{equation}

Where \tdFL{again lowercase}
\begin{itemize}
	\item $k$ identifies a household,
	\item $A_k$ is the vector of attributes of household $k$,
	\item $\alpha_p$, $B_{pp}$ \tdFLY{Do you mean $B_{pp}$} characterize general preferences and
	\item $B_{pA}$ characterize preferences according to observed attributes.
\end{itemize}

Differences in preferences are captured by \textit{commodity-specific household equivalence scales}:

\begin{equation}
\ln m(A_k) = B_{pp}^{-1}B_{pA}A_k
\end{equation}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\section{Assumptions on consumer preferences}

\subsection{Separability}
Why aggregate goods into groups?
1. The number of goods consumed observed by the \ac{FBS} is very large relative to the number of observations in the 2017-2018 survey. Aggregating goods into groups improves the statistical power of the model.
2. It makes sense intuitively: instead of making purchase decisions with full information all the time, families may allocate income into groups like ``food'', ``housing'' and ``transportation'' and treat each as a separate optimization problem.

\tdIL{Is this, when separability is not really there, the ``mental account'' heuristic that behavioural economists talk about? In that case, you might wat to mention that, at least in a footnote.}

Grouping requires assuming \textit{separability}: a group is separable when the ordering of consumption of goods within the group is independent of consumption of goods outside the group. This implies effects of substitutability or complementarity between goods in different groups only happen through the substitutability or complementarity of the groups themselves \citep{DeatonMuellbauer1980}.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\section{Study Variables}\label{variablessection}
\subsection{Cohort Attributes} \label{ssec:cohort_attributes}
Following \cite{Slesnick2000}, \tr{I use} the following attributes to characterize cohorts:\tdFLY{not sure you need capitals for the items in this list}

\begin{enumerate}
	\item household size
	\item age of head of the household
	\item region of residence
	\item race of head of the household
	\item type of residence\footnote{\cite{Slesnick2000} uses ``farm or nonfarm'' for the type of residence, while \cite{Jorgenson1990} uses ``urban or rural''. The \ac{FBS} classifies households as ``urban or rural'', so I use this classification.}
	\item gender of head of the household
\end{enumerate}

See Table \ref{attribute_vars} for the variables from the dataset used to capture each of these attributes.


\tdILY{ENW, In table \ref{attribute_vars} use italics for the official regions and ``and'' in English}


\setlength{\extrarowheight}{3pt}
\begin{table}[]
\begin{tabular}{p{0.25\textwidth}p{0.75\textwidth}}
\toprule
\textbf{Attribute}                       & \textbf{Source}                                                                                                                                          \\ \midrule
Household Size                  & The dataset \verb|MORADOR| contains one row per household member, I count the rows in each household and use 7 or more as the upper limit.                               \\
Age of Head of the Household    & Variable \verb|V0403| in the \verb|MORADOR| dataset contains the age of each member. I grouped the ages into 5 buckets using frequencies (?).                            \\
Region of Residence             & Variable \verb|UF| in \verb|MORADOR| contains the state where the household is located. I mapped the states into their official regions of Brazil, namely \textit{Centro-Oeste}, \textit{Nordeste}, \textit{Norte}, \textit{Sudeste} and \textit{Sul}. \\
Race of Head of the Household   & Variable \verb|V0405| in \verb|MORADOR| classifies the head of the household as ``white'', ``black'', ``asian'', ``mixed'', ``indigenous'' or ``undeclared''. \\
Type of Residence               & Variable \verb|TIPO_SITUACAO_REG| in \verb|MORADOR| classifies households as ``urban'' or ``rural''.                                        \\
Gender of Head of the Household & Variable \verb|V0404| in \verb|MORADOR| classifies the head of the household as ``male'' or ``female''.                             \\

\bottomrule
\end{tabular}
\caption{Source variables of household attributes} \label{attribute_vars}
\end{table}


\subsection{Commodity Groups} \label{ssec:commodity_groups}
\cite{Jorgenson1990} and \cite{Slesnick2000} use the following commodity groups:
\begin{enumerate}
 \item Energy
 \item Food
 \item Consumer Goods
 \item Capital Services
 \item Consumer Services
\end{enumerate}


In order to isolate the effect of gasoline prices, I subdivide the ``energy'' group into ``gasoline'' and ``others'', and the ``consumer services'' group into ``public transportation'' and ``others''.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\section {Econometric Model}
The model for individual expenditure shares is given by:

\begin{equation}
- w_k = \omega_p - B_{pp}i \ln M_k + B_{pA}A_k + \mu_k
\end{equation}

, where
\begin{itemize}
	\item $w_k$ is the vector of expenditure shares for each commodity group for the $k$th \tdFL{FNW: fix subscript format} household;
	\item $M_k$ is the household income;\tdFL{ENW check use of ``the''}
	\item $A_k$ is the vector of household attributes described in Section \ref{ssec:cohort_attributes};
	\item $\mu_k$ is the stochastic component for the $k$th household;
	\item $\omega_p$, $B_{pp}i$ \tdFL{FNW check the formatting of subscripts} and $B_{pA}$ are the parameters we want to estimate.
\end{itemize}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\section {Data}\label{datasection}

\subsection {Data Source}

The \ac{FBS} provides detailed data on individual household expenditure on particular goods and services, as well as the cohort attributes mentioned in Section \ref{ssec:cohort_attributes}. For the cross-sectional estimation of the utility parameters I used the most recent survey, run between 2017 and 2018.

The \ac{ACPI} provides a price index of consumer goods and services with monthly variations. See Appendix \ref{ap:acpi_to_commodity_groups_map} for the correspondence used between the groups of goods and services of the \ac{ACPI} and the commodity groups mentioned in Section \ref{ssec:commodity_groups}.

The National Accounts provide the time-series aggregate data on quantities consumed.
(In the event this data turns out to not be enough, I can potentially aggregate the expenditures from earlier \acp{FBS} and use that as the time-series component, but this will probably mean low significance.)

\tdIL{I am a bit confused, you are going to use to runs of the survey, so that will NOT be a time-series approach correct?}

\tdIL{Rober SEPT 19: you do not name a variable "urban\_or\_rural" (also because the underscores tend to be a nuisance in \LaTeX), since that is not going to help: name it EITHER urban OR rural and lable the 0 and 1 values accordingly. Same with "gender" "marital status" etc. Use male (or female, or additional binary indicators) and "married", "single", "divorced", etc. }



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\tdILY{so can we start seeing tables of descriptives of whatever data you already have, you do have some data.}

\subsection{Population sample description}

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
label variable region "Region"
label define brazil_regions 1 "Norte" 2 "Nordeste" 3 "Sudeste" 4 "Sul" 5 "Centro-Oeste"
label values region brazil_regions

// Household identification is UPA + domicilio + unidade consumidora
// UPA = Unidade Primária de Amostragem = "Primary Sampling Unit"
// DOM = Domicílio = "House"
// UC = Unidade Consumidora = "Household"
// Total households surveyed are total unique combinations of these
egen hh_id = group(COD_UPA NUM_DOM NUM_UC), label
unique hh_id
texdoc local household_count = strofreal(r(unique), "%9.0gc")

// Type of residence
rename TIPO_SITUACAO_REG residence_type
label variable residence_type "Type of residence"
label define residence_types 1 "Urban" 2 "Rural"
label values residence_type residence_types

// Gender
rename V0404 gender
label variable gender "Gender"
label define genders 1 "Male" 2 "Female"
label values gender genders

// Race
rename V0405 race
label variable race "Race"
label define races 1 "White" 2 "Black" 3 "Asian" 4 "Mixed" 5 "Indigenous" 9 "Undeclared"
label values race races

// Age
rename V0403 age
label variable age "Age"

// Age groups (tentative)
recode age (0/25=0 "<= 25")  (26/40=1 "26-40") (41/55=2 "41-55") (56/70=3 "56-70") (71/85=4 "71-85") (86/max=5 ">= 86"), gen(age_group)
label variable age_group "Age group"

// Number of people in the household
gen child = 0
replace child = 1 if age < 16
egen n_children = total(child), by(hh_id)
bysort hh_id: gen n_people=_N
gen n_adults = n_people - n_children

// 7 is code for "7 or more"
gen cut_n_people = n_people
replace cut_n_people = 7 if cut_n_people >= 7
label variable cut_n_people "Number of people"
label define n_people_with_cutoff 7 ">= 7"
label values cut_n_people n_people_with_cutoff

// keep only person of reference in the household (aka "head")
keep if V0306 == 1


// Tentative summary table
// Can use some improvements on the margins still
collect: table residence_type gender race, ///
	stat(freq) stat(percent) /// show counts and % of each count
	nformat(%7.0fc freq) nformat(%3.2f percent) sformat("(%s%%)" percent) /// 1,234 (43,21%)
	nototals
collect style header result, level(hide)
collect style row stack, nodelimiter spacer
collect export demographic_summary_table.tex, tableonly replace

// Save some individual percentages for comments
estpost tab residence_type
matrix pct = e(pct)
texdoc local rural_hh_pct = strofreal(round(pct[1,"Rural"], .01), "%9.2f")

estpost tab gender
matrix pct = e(pct)
texdoc local female_head_hh_pct = strofreal(round(pct[1,"Female"], .01), "%9.2f")

estpost tab race
matrix pct = e(pct)
foreach r_i in "White" "Black" "Mixed" {
	texdoc local `r_i'_head_hh_pct = strofreal(round(pct[1, "`r_i'"], .01), "%9.2f")
}

// save for merging later
keep hh_id age_group cut_n_people gender n_children n_adults race region residence_type
save "Data\hh_head_size.dta", replace



/***************************************
 * how many households have a vehicle? *
 ***************************************/
/* item code		product
  1403001			4-wheel vehicle
  1403101			motorcycle
*/

use "Data\Dados_20210304\INVENTARIO.dta", clear

rename V9001 item_code
egen hh_id = group(COD_UPA NUM_DOM NUM_UC), label

gen vehicle = .
replace vehicle = 1 if inlist(item_code, 1403001, 143101)

keep hh_id vehicle
collapse (count) vehicle, by(hh_id)

// make it binary, although in this particular set all households have at most 1 vehicle
replace vehicle = 1 if vehicle >= 1

// count and % of households with vehicles
count
scalar hh_count = r(N)
count if vehicle == 1

// texdoc local only works by section, so we need to save this separately
scalar hh_vehicle_count = r(N)
scalar hh_vehicle_pct = r(N)*100/hh_count

// save for merging later
// note not all households have any items in the inventory
save "Data\hh_vehicle.dta", replace

texdoc stlog close

/*tex
The 2017-2018 \ac{FBS} surveyed $`household_count'$ households.\tdFLY{try to format the macro to show a comma for thousands, as in 58,039} Table \ref{demographic_frequencies} shows how observations are distributed by gender of household head, residence type \tdFL{consider using Oxford commas} and race. Overall, the majority of the sampled households are headed by men self-declared as ``mixed race'' and lives in urban areas.

\tdILY{It might help to have also the percentages in the table. }

\input{demographic_summary_table}

% Now we show the data is somewhat reliable

% Compare it with census data
% While we wait for the 2022 census results, which I believe should be available by the end of January, I'm using the 2010 census.
In the 2010 census data, 18\% of the households surveyed were in a rural area, while the percentage in the 2017-2018 \ac{FBS} is of $`rural_hh_pct'$\%. In 2010, 38.74\% of households were headed by a woman, versus $`female_head_hh_pct'$\% in 2017-2018. With respect to race, in 2010 49.4\% of the surveyed households were headed by a person self-declared ``white'', 40\% by a person self-declared ``mixed'' and 8.97\% by a person self-declared ``black''. In the 2017-2018 data, we have $`White_head_hh_pct'$\% self-declared ``white'', $`Mixed_head_hh_pct'$\% self-declared ``mixed'' and $`Black_head_hh_pct'$\% self-declared ``black''.
\tdILB{The \% for mixed and white seem to be "switched" between the 2010 census and the POF. Double check.}

% Explain the sampling process
\ac{BIGS} uses a master sample \tdFLY{capitals needed?} \tdFLY{IBGE's docs say "Amostra Mestra" with capitals, but I saw other docs in English using no capitals so I removed the capitals} framework to select households for surveys, including the \ac{FBS}. The master sample is a sample of the census sectors drawn using stratification and probability weighted by the number of households in the sector, and grouped into \acp{PSU} so that each \ac{PSU} has at least 60 households \citep{ibge2008}. The \ac{FBS} uses a subsample of the master sample in two stages: first drawing \acp{PSU} randomly from each strata, then drawing households randomly from each \ac{PSU}. See Appendix \ref{ap:sampling_fbs} for more details.

tex*/

texdoc stlog, nolog


/*******************
* expenditure data *
********************/

// open individual expenditure data
use "Data\Dados_20210304\DESPESA_INDIVIDUAL.dta", clear

// add collective expenditure data
append using "Data\Dados_20210304\DESPESA_COLETIVA.dta"

// add food & cleaning products expenditure data
append using "Data\Dados_20210304\CADERNETA_COLETIVA.dta"

// add rent data
append using "Data\Dados_20210304\ALUGUEL_ESTIMADO.dta"

// generate household id
egen hh_id = group(COD_UPA NUM_DOM NUM_UC), label

// rename variables of interest
// the meaning of "QUADRO" is not precise, so I'm leaving it as is
rename V9001 item_code
rename V8000_DEFLA amount_spent
rename RENDA_TOTAL hh_income

// count observed purchases
count
matrix ct = r(N)
texdoc local purchase_ct = strofreal(ct[1,1], "%12.0gc")

// 9999999.99 means "unknown"
// but someone appears to have used 99999 in the "ALUGUEL_ESTIMADO" dataset instead, so we'll also drop those two observations
count if amount_spent == 9999999.99 | (QUADRO==0 & amount_spent == 99999)
matrix ct = r(N)
texdoc local unknown_amt = strofreal(ct[1,1], "%12.0gc")
drop if amount_spent == 9999999.99 | (QUADRO==0 & amount_spent == 99999)

gen commodity_group = .
label define commodity_groups 1 "Gasoline" 2 "Transportation" 3 "Food" 4 "Energy (others)" 5 "Consumer Services" 6 "Consumer Goods" 7 "Capital Services"


//***********************************
// Gasoline and Transportation groups

/* All vehicle fuel codes in case they are needed later
2301401 -- gasoline
2301501 -- enhanced gasoline
2301502 -- special gasoline
2301601 -- ethanol
2301701 -- diesel
2301801 -- natural gas for vehicles*/

// QUADRO 23: expenditure on transportation
replace commodity_group = 2 if QUADRO == 23

// item codes for gasoline
// 23* are for vehicles, 700801 is for domestic use
replace commodity_group = 1 if inlist(item_code, 2301401, 2301501, 2301502, 700801)

unique hh_id if item_code == 700801
texdoc local domestic_use_count = strofreal(r(N), "%12.0gc")
texdoc local domestic_use_pct = strofreal(r(N)*100/hh_count, "%9.2f")

//***********
// Food group


replace commodity_group = 3 if QUADRO == 24

/*
quadro		purchase
---------|----------------------------------------------------------
	24		eating out

The "QUADRO" variable of the CADERNETA_COLETIVA dataset is not as useful as in the other datasets.
For ex, if we get the prefixes from the item codes with

gen code_prefix = int(V9001/100000)

we can see all (and only) "quadros" between 63 and 69 have items with other prefixes:

histogram QUADRO if code_prefix!=QUADRO, discrete

However, not all is lost. The code prefixes do seem organized, so I got the following code ranges by looking at the "Cadastro de Produtos" table:

code range				purchase
---------------------|----------------------------------------------
6300101 - 8600101		food items
8600101 - 8610401		cleaning products and some disposable stuff, like coffee filters and cleaning gloves
8700101 - 8702101		pet food and pet hygiene products
8800101 - 8800201		flowers
8900101					toilet paper
9000101 - 9000928		grouped food items, when unable to specify

*/

// item codes for food
replace commodity_group = 3 if ///
	QUADRO == 24 | ///
	inrange(item_code, 6300101, 8600101) | ///
	inrange(item_code, 9000101, 9000928)


//**********************
// Energy (others) group
/*
quadro		purchase
---------|----------------------------------------------------------
	06		power, water & sewage fees, piped natural gas, phone, internet, tv
	07		domestic fuels and water

Within quadro 06
code			purchase
600101			power
600301			piped natural gas
601801			aggregated costs of power, water and sewage
699901			some other aggregation of power, water, internet, etc

Within quadro 07, all codes are for domestic fuels (including 700801, included in the gasoline group), except for 700201 and 700202, which are for water
*/
replace commodity_group = 4 if ///
	inlist(item_code, 600101, 600301, 601801, 699901) | ///
	(QUADRO == 7 & ~inlist(item_code, 700201, 700202, 700801))


//************************
// Consumer services group
/*
quadro  	purchase
---------|----------------------------------------------------------
	09		repair, maintenance and rent of furniture and appliances
	19		domestic services (cleaning, cooking, gardening, etc)
	22		games, bets
	25		communication
	31		services like barber/salon, massage, tattoos
	40		lawyer, notary services
	41		travelling
	42		health care services
	42B		health care services NOT ACQUIRED
	45		parties and ceremonies
	50		vehicle-related fees for docs, insurance, etc

Items from quadros 07 and 06 that are not energy-related are included here.

Within group 9, there are item codes both for goods purchased to fix/maintain an appliance or piece of furniture and for the service fees of the repair. I'm treating everything as a "service", as these are likely not separable: each good needed for a repair will have a particular substitution relationship with the associated service.

*/

replace commodity_group = 5 if ///
	inlist(QUADRO, 9, 19, 22, 25, 31, 40, 41, 42, 45, 50) | ///
	(QUADRO == 6 & ~inlist(item_code, 600101, 600301, 601801, 699901)) | /// water, sewage, internet
	(QUADRO == 7 & inlist(item_code, 700201, 700202)) // water


//*********************
// Consumer goods group
/*
quadro  	purchase
---------|----------------------------------------------------------
	15		electric appliances
	16		non-electric appliances
	17		furniture
	18		decoration and insulation products
	21		smoking stuff
	27 		newspaper, magazines
	29		health products, including medication
	29B		health products NOT ACQUIRED
	30 		make up and hygiene stuff
	32		stationary
	34		purchase/renting male clothing
	35		purchase/renting female clothing
	36		purchase/renting children's clothing
	37		fabric, crafts, bed, bath and kitchen towels
	38		purchase/renting purses, shoes, accessories
	39		domestic utensils
	43		toys, games, hunting, fishing, sports, music materials
	44		cell phones and accessories
	46		jewelry and watch purchases


Includes items from the 63 to 69 quadros that are not food items.

*/

replace commodity_group = 6 if ///
	inlist(QUADRO, 15, 16, 17, 18, 21, 27, 29, 30, 32, 34, 35, 36, ///
		   37, 38, 39, 43, 44, 46) | ///
	inrange(item_code, 8600101, 8900101)


//***********************
// Capital services group
/*

quadro  	purchase
---------|----------------------------------------------------------
	08		small repair/maintenance of house or tomb
	10		rent, house taxes and other house fees
	11		building/renovating of house or tomb
	33		car maintenance and accessories

Item 000101 is "estimated rent". Homeowners provide this estimate.

Within quadro 8, we find the following ranges:
code range				purchase
--------------------|----------------------------------------------
800101 - 802301			products for repairs/maintenance
802401 - 802601			contractor fees for repairs/maintenance
802601 - 806701			other products for repairs/maintenance
899901					aggregated expenditure, when individual values not informed

*/

replace commodity_group = 7 if ///
	inlist(QUADRO, 8, 10, 11, 33) | ///
	item_code == 000101


// Quadros that still need to be mapped
// This is taking forever so I will leave it out for now and work on one category at a time
/*
quadro  	purchase
	12		other house items
	13		pets and pet care
	26		credit card/loan interest and fees
	28		tickets to museums, purchase of photography supplies, games
	47		real estate (not the one they live in)
	48		loans, securities
	49		courses, textbooks, other education goods
	51		vehicle purchase payments

*/

drop if inlist(QUADRO, 12, 13, 26, 28, 47, 48, 49, 51)

assert commodity_group != .


*********************************
* standardize reference periods *
*********************************
merge m:1 QUADRO using "Data\periodo_de_referencia_por_quadro.dta"
drop if _merge != 3
drop description _merge

// extrapolate/divide different period lengths into 30-day periods
replace amount_spent = amount_spent * 30/days


/**********************************
 * expenditure shares and summary *
 **********************************/
egen group_expenditure = total(amount_spent), by(hh_id commodity_group)

// make sure empty groups have expenditure zero
bysort hh_id commodity_group: keep if _n == 1
fillin hh_id commodity_group
replace group_expenditure = 0 if _fillin == 1
assert group_expenditure != .

egen total_expenditure = total(group_expenditure), by(hh_id)

// Summary info on expenditure and income
preserve
bysort hh_id: keep if _n == 1

label variable total_expenditure "Household expenditure"
label variable hh_income "Household income"
graph hbox total_expenditure hh_income, nooutsides showyvars legend(off)
graph export "graphs\boxplot_exp_inc.png", as(png) replace

// skewness
sum total_expenditure, detail
texdoc local total_exp_skew = strofreal(r(skewness), "%9.2f")
sum hh_income, detail
texdoc local total_inc_skew = strofreal(r(skewness), "%9.2f")

restore


/***********************************************
* Plot average expenditure shares by percentile
*/
preserve
gen group_expenditure_share = group_expenditure/total_expenditure

// save for future merging
keep hh_id commodity_group group_expenditure group_expenditure_share total_expenditure
save "Data\hh_exp_shares.dta", replace

use "Data\hh_exp_shares.dta", clear

drop if group_expenditure == 0

// tag each percentile
xtile exp_pct = total_expenditure, nq(100)

collapse (mean) group_expenditure_share, by(commodity_group exp_pct)

graph twoway scatter group_expenditure_share exp_pct if commodity_group == 1, ///
      xtitle("Percentile of total expenditure") ///
	  ytitle("Mean of gasoline expenditure share")

graph export "graphs\avg_exp_shares_by_percentile.png", as(png) replace

restore

/***************************************************
* Estimate a Working-Leser model for the Engel curve
*/
use "Data\hh_exp_shares.dta", clear
merge m:1 hh_id using "Data\hh_head_size.dta"
gen n_people = n_adults + n_children
gen pc_exp = total_expenditure / n_people
gen ln_pc_exp = log(pc_exp)

collect get: reg group_expenditure_share ln_pc_exp n_adults n_children
predict p_exp_share


collect: table residence_type gender race, ///
	stat(freq) stat(percent) /// show counts and % of each count
	nformat(%7.0fc freq) nformat(%3.2f percent) sformat("(%s%%)" percent) /// 1,234 (43,21%)
	nototals
collect style header result, level(hide)
collect style row stack, nodelimiter spacer
collect export demographic_summary_table.tex, tableonly replace


// create macros for texdoc
texdoc local hh_vehicle_count = strofreal(hh_vehicle_count, "%9.0gc")
texdoc local hh_vehicle_pct = strofreal(hh_vehicle_pct, "%9.2f")

texdoc stlog close

/*tex

% Data cleaning and expense mapping
Of the original $`purchase_ct'$ purchases recorded, $`unknown_amt'$ were excluded from the analysis as the amount spent was not informed.

Some expenses on services like renting of clothes or appliance repairs have been included in the ``Consumer Goods'' group, as they are likely not separable from the goods associated.

The periods of reference vary by purchase group, with food registry being done over a period of 7 days, income and health expenses done over the previous 30 days, durable goods over the last twelve months and other expenses over the previous 90 days. Total expenses reported were extrapolated or averaged into 30-days periods, as formal income is usually paid monthly.

The distribution of income and total expenditure is strongly right-skewed: figure \ref{fig:boxplot_exp_inc} shows the boxplots for monthly total income and total expenditure. The skewness score of total expenditure is $`total_exp_skew'$, and the skewness score of total income is $`total_inc_skew'$.

\begin{figure}
    \centering
    \includegraphics[width=0.9\textwidth]{graphs/boxplot_exp_inc.png}
    \caption{Boxplots for total income and expenditure}
    \label{fig:boxplot_exp_inc}
\end{figure}


% More useful info
$`hh_vehicle_count'$ of the households surveyed, or $`hh_vehicle_pct'$\% report owning one vehicle. A small number, $`domestic_use_count'$ or $`domestic_use_pct'$\% of households, report purchasing gasoline for domestic use.

Figure \ref{fig:avg_exp_shares_by_percentile} shows the average share of a household's total expenditure spent on gasoline, for households that consumed any gasoline during the period of the survey. The shape suggests an Engel curve linear on the logarithm of total expenditure, consistent with existing literature.

\begin{figure}
    \centering
    \includegraphics[width=0.9\textwidth]{graphs/avg_exp_shares_by_percentile.png}
    \caption{Mean of expenditure share of gasoline by percentile of total expenditure}
    \label{fig:avg_exp_shares_by_percentile}
\end{figure}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\chapter{Results}\label{resultssection}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\chapter{Conclusions}\label{conclusions}

It would be nice to have an annual survey of family expenditures in Brazil, so we could also track changes in time.

The \ac{FBS} product registry, albeit very detailed, could use improvements. There are 13,474 products identified in the registry, of which 8,708 are used in the ``Caderneta Coletiva'' questionnaire. The mapping of survey ``quadros'' can be used to categorize part of the items, but not the ``Caderneta Coletiva'' items. Instead, the goods numeric codes follow a scheme not described in the data documentation. Besides, since the data format does not have labels and the \verb|.xls| files do not have descriptions of the ``quadros'', one must jump from the \verb|.pdf| manual of the survey to the table to the dataset to interpret the codes, creating multiple opportunities for mistakes.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\appendix

\chapter{Sampling of the \ac{FBS}} \label{ap:sampling_fbs}

The \ac{FBS} uses \ac{BIGS}'s master Sample. The master sample is a set of households selected as follows. First, \ac{BIGS} divides the Brazilian territory into census sectors following three sets of criteria: the number of residences, the number of agricultural and livestock facilities, and the number of days needed to collect data in one sector. For urban areas, there is a subdivison between urbanized and non-urbanized areas, and the criterion for rural and non-urbanized areas includes a range of agricultural and livestock facilities. Table \ref{census_sectors_criteria} shows the minimum, average and maximum number of residences or facilities for each category, and the number of days allocated to the data collection.

\tdILY{Note how Rober changed slightly the size of the font in the table, so you really do not need to fiddle with the largin size. This would probably be a bit more elegant and keep more with the overall settings of the template. I left your original code there commented out. Also commeted out the changepage package in the preamble.}

\begin{table}[]
\caption{Sector size definition criteria \label{census_sectors_criteria}}
\begin{small}
\begin{center}
\begin{tabular}{@{}lccccccccc@{}}
\toprule
\multicolumn{2}{c}{\multirow{2}{*}{\textbf{Area type}}} &
  \multicolumn{3}{c}{\textbf{\begin{tabular}[c]{@{}c@{}}Number of\\ residences\end{tabular}}} &
  \multicolumn{3}{c}{\textbf{\begin{tabular}[c]{@{}c@{}}Number of\\ facilities\end{tabular}}} &
  \multicolumn{2}{c}{\textbf{Days for collection}} \\ \cmidrule(l){3-10}
\multicolumn{2}{c}{} &
  min &
  avg &
  max &
  min &
  avg &
  max &
  counting &
  \begin{tabular}[c]{@{}c@{}}large\\ agricultural\\ territories\end{tabular} \\ \midrule
\multicolumn{1}{l|}{\multirow{2}{*}{\textbf{Urban}}} &
  urbanized area &
  250 &
  300 &
  400 &
   &
   &
   &
  30 &
   \\
\multicolumn{1}{l|}{} &
  non-urbanized area &
  150 &
  200 &
  250 &
  100 &
  150 &
  200 &
  45 &
   \\
\multicolumn{2}{l}{\textbf{Rural}} &
  150 &
  200 &
  250 &
  100 &
  150 &
  200 &
  45 &
  60
   \\
\bottomrule
\end{tabular}
\end{center}
\end{small}
\end{table}

The sectors are then stratified for sampling as follows: first by federative unit,\footnote{A ``federative unit'' is a state or the Federal District of Brasil, where the capital Brasília is located.} then by municipality within the federative unit, then by the type of residence\footnote{Usually referred to in \ac{BIGS} documents as ``household situation''} and finally by income levels, determined within the stratum.
\ac{BIGS} groups the census sectors into \acp{PSU}, aiming to have at least 60 permanent residences in each \ac{PSU}, although some \acp{PSU} may not reach that number \citep{ibge2014}. The \acp{PSU} are then drawn from the strata into the master sample with weighted probabilities according to the size of the \ac{PSU}. The number of \acp{PSU} drawn is chosen so that the number of individuals 14 years of age or older who are not employed or students --- this is a relevant indicator of another survey, the \ac{HSNS} \tdFL{definition missing} --- can be estimated with a predefined precision level \citep{ibge2014}. When of the execution of the 2017-2018 \ac{FBS}, the number of \acp{PSU} in the master sample was 15,096 \citep{ibge2019}.

For the \ac{FBS}, the number of \acp{PSU} sampled from the master sample is chosen so that the total income of the head of the households can be estimated under a predetermined precision level. The coefficient of variance was determined for each federative unit, ranging from 6\% to 15\%. The final size of the sample was of 5,504 \ac{FBS}, containing 69,660 households \citep{ibge2019}.

The master sample excludes the following areas: military bases, camping sites, prisons, orphanages, hospitals, nunneries and elderly rest homes \citep{ibge2019}.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\chapter{Mapping of \ac{ACPI} groups to commodity groups} \label{ap:acpi_to_commodity_groups_map}

Table \ref{acpi_groups} shows the structure of groups, subgroups, items and subitems of goods and services used by the \ac{ACPI}, with the respective commodity group in the first stage of the model. Less aggregated levels of the structure have been omitted when the entire parent category was mapped into a single group, for example the \ac{ACPI} group ``Food and Beverages'' is entirely included in the ``Food'' commodity group, so it is represented by a single row in the table, whereas each subgroup of the ``Health Goods and Services'' was mapped to a different commodity group, occupying a separate row.



\begin{longtable}{>{\raggedright\arraybackslash}p{0.20\textwidth}>{\raggedright\arraybackslash}p{0.22\textwidth}>{\raggedright\arraybackslash}p{0.20\textwidth}>{\raggedright\arraybackslash}p{0.15\textwidth}>{\raggedright\arraybackslash}p{0.25\textwidth}}
\caption {First stage \ac{ACPI} group to commodity group mapping} \label{acpi_groups} \\ \toprule
\textbf{Group} &
  \textbf{Subgroup} &
  \textbf{Item} &
  \textbf{Subitem} &
  \textbf{First Stage Commodity Group} \\ \midrule
\endfirsthead
\caption* {Table \ref{acpi_groups} Continued:} \\ \toprule
\textbf{Group} &
  \textbf{Subgroup} &
  \textbf{Item} &
  \textbf{Subitem} &
  \textbf{First Stage Commodity Group} \\ \midrule
\endhead
Food and Beverages       &                                &                       &                   & Food              \\ \midrule
\multirow{4}{=}{Housing} &
  \multirow{3}{=}{Fees and Maintenance} &
  Rent and Fees &
   &
  Capital Services \\
                         &                                & Repairs               &                   & Capital Services  \\
                         &                                & Cleaning Products     &                   & Consumer Goods    \\ \cmidrule(l){2-5}
                         & Domestic fuels and electricity &                       &                   & Energy            \\ \midrule
Appliances and Furniture &                                &                       &                   & Capital Services  \\ \midrule
Clothing                 &                                &                       &                   & Consumer Goods    \\ \midrule
\multirow{3}{=}{Transportation} &
  \multirow{3}{=}{Transportation} &
  Public Transportation &
   &
  Consumer Services \\
                         &                                & Private Vehicle       &                   & Capital Services  \\
                         &                                & Vehicle Fuels         &                   & Energy            \\ \midrule
\multirow{3}{=}{Health Goods and Services} &
  Pharmaceutical and Optical Goods &
   &
   &
  Consumer Goods \\
                         & Health Services                &                       &                   & Consumer Services \\
                         & Personal Care                  &                       &                   & Consumer Goods    \\ \midrule
\multirow{9}{=}{Personal Expenses} &
  Personal Services &
   &
   &
  Consumer Services \\ \cmidrule(l){2-5}
 &
  \multirow{8}{=}{Recreation and Smoking} &
  \multirow{7}{=}{Recreation} &
  Musical Instrument &
  Consumer Goods \\
                         &                                &                       & Bicycle           & Consumer Goods    \\
                         &                                &                       & Toys              & Consumer Goods    \\
                         &                                &                       & Fishing Materials & Consumer Goods    \\
                         &                                &                       & Sports Materials  & Consumer Goods    \\
                         &                                &                       & Pet Food          & Consumer Goods    \\
                         &                                &                       & All Others *      & Consumer Services \\ \cmidrule(l){3-5}
                         &                                & Smoking               &                   & Consumer Goods    \\ \midrule
\multirow{4}{=}{Education} &
  \multirow{4}{=}{Courses, Reading and Stationary} &
  Regular Courses &
   &
  Consumer Services \\
                         &                                & Miscellaneous Courses &                   & Consumer Services \\
                         &                                & Reading Materials     &                   & Consumer Goods    \\
                         &                                & Stationary            &                   & Consumer Goods    \\ \midrule
Communication            &                                &                       &                   & Consumer Services \\ \bottomrule
\end{longtable}




Table \ref{acpi_groups_second_stage} shows the map of \ac{ACPI} groups, subgroups, items and subitems of goods and services and the respective commodity group in the second stage of the model.

\begin{table}[h!]
\caption{Second stage stage \ac{ACPI} group to commodity group mapping} \label{acpi_groups_second_stage}
\begin{tabular}{>{\raggedright\arraybackslash}p{0.20\textwidth}>{\raggedright\arraybackslash}p{0.22\textwidth}>{\raggedright\arraybackslash}p{0.20\textwidth}>{\raggedright\arraybackslash}p{0.15\textwidth}>{\raggedright\arraybackslash}p{0.25\textwidth}}
\toprule
\textbf{Group}           & \textbf{Subgroup}                               & \textbf{Item}  & \textbf{Subitem} & \textbf{Second Stage Commodity Group} \\ \midrule
\multirow{2}{=}{Housing} & \multirow{2}{=}{Domestic Fuels and Electricity} & Domestic Fuels &                  & Domestic Fuels                        \\
                         &                                                 & Electricity    &                  & Electricity                           \\ \midrule
\multirow{3}{=}{Transportation} & \multirow{3}{=}{Transportation} & \multirow{3}{=}{Vehicle Fuels} & Gasoline & Gasoline \\
                         &                                                 &                & Ethanol          & Ethanol                               \\
                         &                                                 &                & Diesel           & Diesel
\end{tabular}
\end{table}


\section{Price index transformation}
\ac{BIGS} provides monthly variation by groups, subgroups, items and subitems of the \ac{ACPI}, along with each level weight in the general price index. I used the indices from July 2006 to December 2019 available at \cite{ibgeIPCA2011} and \cite{ibgeIPCA2019}. The index for groups, subgroups and items is produced with the Laspeyres method.

Estimating the translog model requires price index numbers for each commodity group at each time period. First, the variation of each commodity group is obtained through the weighted average of variations of its components (groups, subgroups, items and subitems)  in the \ac{ACPI}. Then the variations are transformed into index numbers with January 2018 as the base date, with each commodity group price normalized to unity.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\tdIL{You will need to tweak those missing freign characetrs in your bib entries and secure the capitalizations too}

\bibliographystyle{chicago}
\bibliography{ClaraMAEssaybibfile}
\end{document}

tex*/



