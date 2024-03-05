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

graph set window fontface "Palatino Linotype"


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
\usepackage{dsfont}
\usepackage{endnotes}
\usepackage{graphicx}
\usepackage{epsfig}
\usepackage{natbib}
\usepackage{hyperref}
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

\hypersetup{
    colorlinks=true,
    linkcolor=.,
    anchorcolor=.,
    citecolor=.,
    filecolor=.,
    menucolor=.,
    runcolor=.,
    urlcolor=cyan
}


\Title{Welfare changes from fuels pricing in Brazil} %% it shall not include LaTeX macros
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

Fossil fuels represent a large share of expenditure for Brazilian households. Demand is inelastic in the short-term, and pricing policies implemented by Petrobras. Frequent price changes affect families well-being, and do so heterogeneously. To understand these heterogeneous effects, we use a social welfare function framework. We analyse the effect of gasoline prices on social welfare in Brazil using the transcendental logarithm social welfare function, and use those estimates to evaluate the import parity price policy implemented by Petrobras. We find that the policy affected families of median and above income x times more than families under the median income, and that families living in rural areas were x times more affected than families in urban areas.

\todo[inline,color=yellow,size=\large]{This version is from \today}

\todo[inline]{Eventually, this abstract will need some further ``sell'' or motivation. Why are we interested in the effects of changes in the price of oil? Why would they keep changing or change more in the future? Why were the policies that changed the prices effected? Climate change? International Pressure? Sustainable Development Goals? The IMF requiring it? Will this happen again? That is, is there a policy situation to solve? A problem to deal with? Is it getting better? worse? }

\todo[inline]{Eventually, this abstract will need some policy conclusions. Now that ``thankfully for the World or at least Brazil, you completed this work, what can you say that will inform policy, make things better, help solve the original problem?'' }


\todo[inline, color=red]{NOV 18 2023: Where did the keywords go? You have them up there (two of them) but they do not show up in the compiled pdf anywhere. Please ensure that gets fixed}



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

The Informatics Department of UFPR Faculty. \todo[fancyline, color= red]{NOV 18 2023: spell acronym UFPR}

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

\begin{abbreviations}

\end{abbreviations}


\todo[inline]{Alphabetize the list of abbreviations in the end}


\begin{acronym}
\acro{AIDS}{Almost Ideal Demand System}
\acro{LA-AIDS}{Linear Approximate Almost Ideal Demand System}
\acro{QUAIDS}{Quadratic Almost Ideal Demand System}
\acro{DQUAIDS}{Demographically-Scaled Quadratic Almost Ideal Demand System}
\acro{NSHS}{National Sample Household Survey}
\acro{BIGS}{Brazilian Institute of Geography and Statistics}
\acro{IPP}{Import Parity Price}
\acro{FBS}{Family Budgets Survey}
\acro{PIGLOG}{Price-Independent Generalized Logarithmic}
\acro{PSU}{Primary Sampling Unit}
\acro{GSFT}{Goods and Services Flow Tax}
\acro{NSCPI}{National System of Consumer Price Indices}
\acro{ACPI}{Ample Consumer Price Index}
\acro{BRL}{Brazilian Real}
\acro{GHG}{Greenhouse effect Gases}
\acro{OECD}{Organisation for Economic Co-operation and Development}

\end{acronym}

\end{prefatory}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\listoftodos

\todo[inline]{Please do not delete these ``todo'' notes, we can disable them later but we need to use them to keep track of changes}
\todo[inline]{Make sure you rename ALL the relevant files in every version of the do file: do file. scml file, and tex file}
\todo[inline, color=pink!80]{I suggest that you agree to use notes of different colours to signify different things: orange for new comment? green for solved comment? red for important issue? or different authors have different colours? The todo package is very flexible }
\todo[inline, color=green!80]{Remember that all traces of notes can be made to disappear from the pdf produced by changing one line, so do not actually delete notes, keep them in the do file and tex file}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% A few shortcuts for todonotes and text colouring

\newcommand{\td}{\todo}
\newcommand{\tdFL}{\todo[fancyline]}
\newcommand{\tdFLY}{\todo[fancyline, color=yellow]}
\newcommand{\tdIL}{\todo[inline]}
\newcommand{\tdILR}{\todo[inline, color=red!80]}
\newcommand{\tdILY}{\todo[inline, color=yellow]}
\newcommand{\tdILB}{\todo[inline, color=cyan]}

\newcommand{\tdILG}{\todo[inline, color=green]}

\newcommand{\tr}{\textcolor{red}}
\renewcommand{\ty}{\textcolor{yellow}}
\renewcommand{\to}{\textcolor{orange}}
\newcommand{\tde}{\todo{ENW}}
\newcommand{\tdeFL}{\todo[fancyline]{ENW}}
\newcommand{\tdeIL}{\todo[inline]{ENW}}

\newcommand{\tdp}{\todo{PNW}}
\newcommand{\tdpFL}{\todo[fancyline]{PNW}}

\td{these are just macros and their checks to save Rober some typing, please ignore}


%checking:
\tr{checking red}
\to{checking orange}
\tde
\tdeFL
\tdIL{this in line}
\tdILR{this in line red}


\tdpFL

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\todo[inline,color=yellow,size=\huge]{This version: \today}

\pagebreak



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\tdILG{Rober: We want all floats to be almost fully self-explanatory, so you need more detail/context in the caption itself.}

\tdILG{2. The explanation of how I ``extracted'' price variability from the dataset, in the Data Source section.}
\tdILG{That is OK. It will have to go in some form to the ``limitations'' as well}

\tdIL{3. The model runs with demographic vars. I still need to figure out why there are so many missing values in the price index, 2/5 of the households are not being included because of it.}

\tdILG{NOV 18 2023: Clara wrote ``Counted the groups present in the expense records for each family and found that the missing price indices are due to families not having any consumption for some commodity groups. I don't think this can be overcome, maybe I can show what demographics they belong to so the reader knows those estimates may be wrong?}

\tdILR{March 1 2014 This has now solved to a great extent correct?}


\chapter{Introduction}\label{intro}

\tdILG{Check spelling in bib entries, remember the accents in \TeX: Estatística will yield a missing vowel, use Estat\'{i}stica. }

\tdILY{Also consider using the acronyms in the author field of your bib file, so it looks more tidy. That is, use ``{I}nstituto {B}rasileiro de {G}eografia e {E}statística'' in a ``note'' but only IBGE in the ``author'' field }

\tdIL{You could have somewhere in the intro something about how many/most countries subsidize oil for consumers and how much political unrest trying to eliminate those inefficient subsidies can cause.}



\tdILR{Eventually, this introduction will need much more of further ``sell'' or motivation. Why are we interested in the effects of changes in the price of oil? Why would they keep changing or change more in the future? Why were the policies that changed the prices effected? Climate change? International Pressure? Sustainable Development Goals? The IMF requiring it? Will this happen again? That is, is there a policy situation to solve? A problem to deal with? Is it getting better? worse? }


According to the 2017-2018 \ac{FBS} run by the \ac{BIGS} \citep{ibgePOF}, transportation was on average the second largest group of expenses for Brazilian families, corresponding to 18,1\% of their monthly budget \citep{ibge2019}. Aggregate demand for gasoline in Brazil is generally estimated to be price-inelastic \citep{Cardoso2019}, especially in the short run \citep{Bastos2016}.

\tdIL{Obviously, all these paragraphs will need a lot of rewriting as you go in order to thread a story together...}

Having a low price-elasticity of demand and representing a large share of expenditure means the impact of gasoline price fluctuations is severe on consumers' well-being. Reflecting that relevance, in the past two decades the pricing of petroleum and its products in Brazil has been the target of several important policy interventions. Section \ref{gas_policy_history} provides a brief history of these interventions. \tdFL{March 1st 2024 See is you can fix the hyphenation of at least common words like ``Section''}

In particular, in 2016, the Brazilian national petroleum company, Petrobras, implemented a new pricing policy, ending a long-term implicit subsidy on the price of oil that had kept it up to 20\% lower for national distributors than the international average price \citep{Ramalho2021}. The \ac{IPP} policy\footnote{The Brazilian media uses the acronym ``PPI'' along with a variety of phrases such as ``International Parity Price'', ``International Parity Policy'' and ``International Prices Parity''. The Government webpage that tracks import prices of fossil fuels uses the name ``Import Parity Prices''. In the text, I use ``the IPP policy'' when referring to the policy implemented in 2016, and ``IPP'' when referring to prices.} made prices charged within the country the same as the prices in the international market for oil. In 2023, the change was reversed and price controls were put back in place.

From \tr{the} \tdFL{ENW: English needs work: from ``a''} methodological standpoint, \tr{I find} \tdFL{reword} that previous work on the impact on welfare of gas prices uses measures such as dead-weight loss, which precludes an evaluation of effects on population subgroups, or \tr{investigate} \tdFL{ENW grammar} effects on specific regions rather than a nation-wide study.

\tdILR{We will need a few references to back this up}

There are also political aspects of interest in analysing the effect of gas price changes. \tdFL{As explained above: bring examples from other countries too?} Politicians often use gas price regulations as a popularity tool, especially near elections. \tdFL{refes needed} For environmental reasons, it is likely we will see an increase in gasoline consumption interventions in the near future, as countries strive to reduce their carbon footprints. \tr{Better understanding of demand \tde for gasoline and welfare effect of price} changes can yield more effective policies. As for the 2016 \ac{IPP} policy, the benefits (more government revenue, more profit for stock owners) can be weighted against a detailed account of the costs in social welfare loss.

By properly identifying ``winners'' and ``losers'' from a policy change, and the magnitude of their outcomes, the government can decide whether the change should happen and, if so, whether further action must be taken to counteract negative effects on protected groups. In this essay, I will investigate how fuel prices affect different population groups to support future decisions.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\chapter{Background}\label{chap:background}
\tdILR{Eventually, this Section \ref{chap:background} will need much more of further detailing of the motivation you would have inserted in the Introduction. Only in Section \ref{chap:background} you can be more detailed, use numbers, use tables and graphs (you have some already), comparisons with the situation in other countries, etc.}

% Why are we interested in the effects of changes in the price of oil?
The majority of economic activity depends on electricity or thermal energy sources. Despite initiatives toward decarbonization, renewables and sustainability in general, petroleum derivates still dominate the energy market in most countries.
* Oil prices are not stable in the international market

% Why were the policies that changed the prices effected?
The Brazilian petroleum company Petrobras is partially nationalized -- 51\% of its stock is owned by the Brazilian federal government and is responsible for over 65\% of the petroleum market in the country. It is subject to a lot of political influence, as the company's president is appointed by the government, \tr{and political parties usually  From corruption scandals to debates regarding its profitability, political parties} \tdFL{NOV 18 2023 Rober: must be fully written up}

In 2016, the \ac{IPP} was implemented under the argument that it would increase the profits of Petrobras. This meant higher government revenue that could be used to lower taxes on other areas. Fuel prices increased, as well as the revenue.

In 2023, the price control returned with the purpose of ``nationalizing'' prices. The argument is that the abundance of oil and gas in Brazilian territory should mean easier access to fuels to citizens and national industries regardless of international trends in the oil market.



\tdILR{NOV 18 2023 Rober: must be fully written up and references added when possible:}
% Why would they keep changing or change more in the future? Climate change? International Pressure? Sustainable Development Goals? The IMF requiring it?
* Sale of refining facilities may further change the market share of Petrobras and decrease its market power
* The same forces that led to the IPP policy in 2016 are likely to start putting pressure again after the change in policy in 2023
* Hopefully more people will start taking climate change seriously in Brazil --- which could come with a carbon tax. (Does not seem to be happening, though. We're looking at extracting oil from the Amazon and expanding vehicle production.)

% Will this happen again? That is, is there a policy situation to solve? A problem to deal with? Is it getting better? worse?
\tdILR{NOV 18 2023 Rober: add references below when possible:}
One argument against the price control policy is that it is regressive, because it benefits people with higher incomes, who are more likely to own vehicles, more than people with lower incomes. This argument is muddied by the fact that fuels impact consumers of all levels of income indirectly, as inputs of production and transportation of other goods. For policymakers that promote progressive values, it is important to know whether the price control aligns with those values, and if so, to what degree.

Figure \ref{fig:fuel_prices_over_time} shows average monthly retail prices of gasoline, ethanol \tdFL{PNW, use Oxford commas} and diesel in Brazil, as well as the OPEC \tdFL{tag ALL acronyms} crude oil monthly prices between 2003 and 2023, all in \ac{BRL} and normalized to 1 in the first time period. \tr{The graph} Figure \ref{fig:fuel_prices_over_time} \tdFL{NOV 18 2023: Or reword some other way but using the cross-reference} shows that Petrobras' price policy before 2016 cushioned fuel prices against international market price variations, and that since the policy change prices have followed crude oil price trends, increasing over time and becoming more volatile.

tex*/

texdoc stlog, nolog

// generate fuel prices graph
do "..\..\..\..\fuel_prices_plot.do"

texdoc stlog close

/*tex


\begin{figure}
    \centering
    \includegraphics[width=\textwidth]{graphs/fuel_prices_over_time.png}
    \caption{Fuel and crude oil prices over time \tr{in Brazil}}
    \label{fig:fuel_prices_over_time}
\end{figure}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\section{Fuel price interventions}\label{gas_policy_history}
\tdFLY{NOV 18 2023: write it up}
% petrobras
The Brazilian national petroleum extraction and refining company Petrobras was founded in 1953, establishing a state monopoly of the petroleum market. In 1967, Brazil reached self-sufficiency in almost all fuels used in the country. During the military regime installed in 1964, fuel prices were under state control and were set low as a way to reduce inflation.

% deregulation + ethanol
After the end of the military regime, the fuels market was progressively deregulated in the country. In 1995, a constitutional amendment enabled the state to hire private companies for oil extration. The Law of Petroleum, proposed in 1997 and installed in December 31st of 2001, mandated the state to outsource extraction and refining operations. Petrobras still controlled oil prices, and used this control to stimulate the ethanol industry. \cite states between and gasoline prices were 9\% higher than expected market price, as a way to make ethanol more competitive.

% IPP
The \ac{IPP} policy was implemented in 2016 to increase the profits of Petrobras. This meant higher government revenue that could be used to lower taxes on other areas. Fuel prices increased, as well as the revenue.

% very recent interventions
In 2021, a surge in soy prices led the government to temporarily change the mandated amount of of biodiesel in retail diesel from 13\% to 10\%, to prevent ``an excess increase'' in the price of diesel to consumers. https://agenciabrasil.ebc.com.br/economia/noticia/2021-09/publicada-resolucao-que-reduz-percentual-de-biodiesel-no-oleo-diesel. As part of a series of attempts to reduce inflation, in June of 2022, Brazilian president Jair Messias Bolsonaro sanctioned a bill setting the ceiling for the consumption tax (\ac{GSFT}) on fuels, to a maximum of 18\%.

% end of IPP
In May 2023, Petrobras announced the end of the \ac{IPP} policy, in alignment with Brazilian president Luiz Inácio Lula \tr{da Silva's \tdFLY{missing genitive here} (elected in 2022) campaign} suggestions \citep{SantanaRamalho2023}.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\section{Expected changes}
% development x climate change
\tdILR{NOV 18 2023: write it up and make sure you have the references, even if they are to newspaper articles or new websites}
Fuels are inputs for most economic activity, either directly in production, or indirectly in distribution and for thermal power plants. Fossil fuels in particular are also responsible for a large fraction of pollution and associated climate issues. Therefore, governments face tradeoffs between economic development and environmental goals. Recent events and prospects in the supply of fossil fuels, as well as growing concern with climate change, continue to exert influence onto policymaking.

In 2013, crude oil reservoirs were found in the Amazon region. Since then, Petrobras has studied the risks and environmental impact of extraction, contacted neighbouring countries that might be affected by oil spills. Extraction is expected to begin in 2024. With the end of the \ac{IPP} policy, Petrobras may use the increase in its supply of crude oil to justify a reduction in prices.

In June 2023, the government announced temporary measures to stimulate vehicle production and lower vehicle prices.\footnote{This echoes similar policies implemented during the first presidential mandates of Partido dos Trabalhadores (Worker's Party), which resulted in significant growth in private vehicle ownership and usage.} A combined growth in the vehicle fleet and potential reduction in fossil fuel prices would increase demand. https://www.gov.br/planalto/pt-br/acompanhe-o-planalto/noticias/2023/06/alckmin-detalha-incentivo-a-industria-automotiva-e-reducao-de-preco-de-carros-caminhoes-e-onibus

In contrast, concern with climate change grows and Brazil slowly follows the trend of large economies in attempting to reduce GHG emissions. In May 2022, the Ministry of the Environment and Climate Change (then called ``Ministry of the Environment'') announced a decree to regulate a voluntary market of carbon dioxide and methane credits in Brazil. https://www.gov.br/mma/pt-br/assuntos/noticias/mma-anuncia-decreto-que-regulamenta-mercado-de-carbono-no-brasil In December 2023, congress approved a new bill to regulate a mandatory market for GHG credits. https://g1.globo.com/meio-ambiente/noticia/2023/12/24/entenda-o-projeto-que-quer-regulamentar-o-mercado-de-carbono-no-pais.ghtml

Another, if lukewarm, initiative to reduce GHG emissions was announced in 2023: law proposal 4.516/2023 determines an increase in the mandatory fraction of ethanol added to gasoline from 22\% to 27\%, and that the fraction of biodiesel added to diesel (currently at a 15\%) must reach 20\% by 2030. https://noticias.uol.com.br/ultimas-noticias/agencia-estado/2024/02/27/pl-preve-regulacao-de-mistura-de-25-do-biodiesel-e-27-de-etanol-a-gasolina.htm

Additionally, with respect to electrical vehicles, in February 2024 the government announced increased taxes on imported electrical vehicles. The measure aleggedly aims to encourage development of national technology in electrical vehicles, but in the meantime discourages consumers from replacing vehicles powered by fuel.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\section{The role of ethanol}
\tdILY{This section will need a better title}
% long history
Sugarcane is a major agricultural commodity in Brazil since the XVI century, and its alcohol derivates have been used as fuel for vehicles as early .

% oil crises, proalcool
Following the 1973 oil crisis, president Ernesto Geisel (formerly president of Petrobras) created the Proálcool program, with the aim of reducing reliance on fossil fuels by replacing them with ethanol. The program started in 1975 and fostered this substitution through technology development on ethanol production plants, and on the motors to be powered by it. Cortez2016 p29 While the Proálcool program was officially closed with the end of the military regime in 1985, the term ``Proálcool'' continued to be used to refer to the set of private, governmental and academic initiatives to develop and promote the use of ethanol as fuel Cortez2016 p63.

There was a period of decline with the decrease of oil prices in the 1990s and a shortage of ethanol influenced by a rise in international sugar prices. However, the deregulation of the ethanol market in the following years and the introduction of \textit{flex-fuel} vehicles in 2003 marked the beginning of a period of increased use of ethanol.

% ethanol prices vary per region
As a rule of thumb, ethanol is considered to yield 70\% of the mileage of the same volume of gasoline, so popular sources recommend that drivers buy ethanol when its price is 70\% of the price of gasoline or less. \cite{CardosoBittencourtLittIrwin2019} show, from data ranging between 2001 and 2014, that ethanol prices are more often favourable (i.e. lower than 70\% of the price of gasoline) in the southern region, near locations that produce the majority of the fuel. \cite{Iootty2009} estimates that demand for gasoline has a cross-price elasticity of 1.5 with respect to ethanol, while the demand for ethanol has a cross-price elasticity of 8.09 relative to gasoline.

% current state
Ethanol remains relevant in the Brazilian fuel market: in 2022, Brazilians consumed 15.5 billion litres of ethanol and 43 billion litres of gasoline \citep{anp2022}. The majority of vehicles sold in the country are \textit{flex-fuel}, i.e. can run on any combination of gasoline or ethanol, making ethanol and gasoline close short-run substitutes. In 2021, for example, of the 2,104,461 new vehicles licensed, 1,633,245 or 77.6\% were \textit{flex-fuel}. The share is even larger, 83.3\%, if considering only light vehicles \citep{anfavea2023}. Moreover, recent legislation to increase the percentage of ethanol in the gasoline sold within the country will likely affect relative prices between ethanol and gasoline.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\section{Protected groups/fairness}
% Why we want to look at differences between groups
% In decision making algorithms, predictive parity says error rates should be the same for protected categories. what is the name of the analogous principle for preference modelling?


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\chapter{Literature Review}\label{litreview}


\todo[color=green, inline]{To start with, there should be a whole bit about what is welfare in terms of economics, why it is measured, what are the original ways to measure it, etc. We would have said a thing or two about this in CBA class ; ) Then look at the welfare effects of price changes and then criticize those more conventional ways to look at the welfare effects of price changes and motivate the new strategies. Bu Rober misses the terms consumer surplus, equivalent variation, etc. Remember not only how but why the seminal contributors to welfare economics conceived of the effects of a policy (a regulation, a project, a price change, etc. ) and the assumptions they made. For example they would originally treat a household as a unit, they would assume that the marginal utility of income was the same for everyone… We need an explanation about why the analysis of a change in price brought about by a policy is not straightforward and a few paragraphs of description of the evolution of this type of analysis. You do not need to use the latest state-of-the-art analysis but you must who us that you have a good understanding of why new techniques have been developed through the decades. }
\tdILR{NOV 18 2023: What you have for now must be further developed and references must be carefully inserted. You have a few missing bib tags (a tachnical issue to fix) but you must further acknowledge that the ideas about welfare economics in this first paragraphs are not yours. Other authors came up with them.}

% Welfare intro
Assuming that governments, especially representative ones, must work to improve or maintain the well-being of their citizens, policy development requires some measure of that well-being \cite{AdlerPosner1999}. \tdFL{March 1st 2024 missing ref in bib file} In the decision making \tdFL{March 1st 2024 decision-making} process, the consequences of \tdFL{March 1st 2024 the different} different policies on the well-being are compared and, ideally, the option that produces the highest level of well-being is implemented.

% Utility, revealed preference
Pn the second half of the XIX century, the concept of utility was introduced by  individual well-being is usually explicitly modeled as \textit{utility}, a measure of the degree to which individuals satisfy their preferences through consumption. Welfare analysis typically measures changes in utility as a result of policies or other shocks in markets. Being that consumption is limited by budget and supply, the choices that consumers make within these constraints can reveal a structure for their preferences, so revealed preference methods characterize demand by inferring utility functions from observed consumption.

\tdILR{March 1st 2024 You may want to reword, to avoid suggesting that nowadays utility is ``measured''}


% Pareto, ordinalism
Individual preferences can be inferred from individual behaviour, such that state $A$ of the world can be said to be preferred by an individual to state $B$. However, if we introduce a second individual that prefers state $B$ to state $A$, it is not immediately clear which state should be preferred from a decision maker \tdFL{March 1st 2024 hyphen} point of view. Provided the decision maker \tdFL{March 1st 2024 hyphen} is able to adequately measure the individual changes in utility for all afected \tdFL{March 1st 2024 affected} parties, an unambiguous decision process still requires aggregating these measures into an index that allows them to fully rank the possible states of the world.

The Pareto principle provides a starting point: if between states $A$ and $B$ of the world one individual prefers state $A$ to state $B$ and the others are indifferent between them, it is fairly straightforward to presume state $A$ is preferred to state $B$. However, economic policy rarely produces pure Pareto improvements, which makes this principle insufficient as a guide for policymaking. Within the ordinalist framework, \cite introduces the Hicks and Kaldor criterion, that allows for ``winners'' and ``losers'' of a change, as long as the winners could potentially compensate the losers and still be better off.

\tdILR{March 1st 2024, we need more references throughout these paragraphs}

To evaluate the hypothetical compensation for the losers and whether the winners would be better off after the compensation transaction, one needs a comparable, cardinal, measure of gains and losses. As utility is not directly measurable and To that end, Hicks 1939 introduces two money-metric measures of welfare, based on indifference curves: compensating variation and equivalent variation.

\tdILR{March 1st 2024, we to enlarge and enhance these paragraphs, also references}

% Compensated demand, EV & CV, substitution
Consider a price change situation such as the fuel price policy change by Petrobras. Compensating variation is the change in income that would restore the utility of an individual to the level it was before the change (hence ``compensating'' the individual for the change). It can be described as the amount of money the individual would pay to effect the change, in the case of a change that increases their utility, or the amount the individual would require to accept the change, in the case of a change that decreases their utility.

Define $e(p, u)$ as the minimum expenditure needed to achieve utility $u$ under prices $p$.\footnote{Also referred to as the ``cost function'', as in ``the cost of achieving $u$''.} In Equation \ref{eq:CV}, the compensating variation ($CV$) is the difference in expenditure that would allow the individual to afford $u_0$ under the new prices $p_1$.

\tdILR{March 1st 2024, check throughout Equation x, Table Y, Section Z, etc. in capitals}

\begin{equation} \label{eq:CV}
CV = e(p_0, u_0) - e(p_1, u_0)
\end{equation}

Equivalent variation is the monetary value that would be ``equivalent'', in terms of utility change to the individual, as the price change. It can be described as the amount of money the individual would accept to forgo the change, in the case of a change that increases their utility, or the amount the individual would be willing to pay to avoid the change, in the case of a change that decreases their utility. In Equation \ref{eq:EV}, the equivalent variation ($EV$) is the difference in expenditure that would allow the individual to afford $u_1$ under the original prices $p_0$.

\begin{equation} \label{eq:EV}
EV = e(p_1, u_1) - e(p_0, u_1)
\end{equation}

% Marshallian demand, first-order approximation
\cite{Willig1976} \tdFL{March 1st 2024 missing ref in bib file} showed that for small enough variations in income elasticities of demand and price changes, $EV$ and $CV$ can be closely approximated by the difference in compensated demand following the price change. Social surplus measured that way is often used as a measure of welfare, and Section \ref{sec:dwl} covers research on this.

% Substitution effects and other stuff
The change in utility following a price change of a certain good or service depends also on the consumer's willigness or ability to substitute for other goods and services.

Consumer surplus is not always great. Blundell et al have shown this can be an issue.\tdFL{March 1st 2024 missing ref in bib file and you need to write this up further}

% Inequality concerns
Welfare changes may vary systematically over population groups. Because of diminishing marginal utility of income, price changes will not affect poorer families the same way as richer families. Policies can be analysed under this framework as regressive or progressive. Section \ref{sec:regressivity} covers that. \tdFL{March 1st 2024: but where is it???}

% Equivalence scales
Other household characteristics affect demand. Children of different ages, working-age adults, retired adults and the elderly have different needs. Family composition also affects economies of scale in consumption, and policymakers may have targets for groups based on other protected characteristics, such as gender or race identities. Section \ref{sec:equivalence_scales} describes the concept of \textit{equivalence scales} to improve welfare comparisons between households.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\section{Demand elasticities, efficiency and consumer surplus}\label{sec:dwl}

Price distortions in otherwise competitive markets lead to dead-weight loss. By maintaining domestic prices artificially low, Petrobras subsidizes consumption implicitly through forgone revenue and directly when it needs to import fuel to satisfy the domestic demand.\tdFL{This paragraph is more background than literature review}

With Petrobras being partly nationalized, the loss incurred by consumers from increased prices can be counteracted by a reduction in the tax burden accounting for the government increased revenue. \tdFL{First sentence is background still} \cite{Moreira2017} uses a static open economy macroeconomic model of Brazil to estimate the impact of removing fuel subsidies on output, aggregate consumption and labour demand for the years 2011-2014. \cite{Moreira2017} finds that if accompanied by an equivalent reduction on major taxes, the removal of the subsidy increases output, consumption and employment.

\tr{Demand models used to estimate dead-weight loss} \tdFLY{needs rewording} typically use a representative consumer approach: the preferences of the entire population are ``averaged out'' into the demand function. \cite{FernandesPeixoto2017} use such a model to estimate dead-weight loss from collusion among retailers in the state of Minas Gerais. estimate average losses of 11.73% of total yearly revenue from gasoline sales in the state of Minas Gerais between 2008 and 2010.

 The welfare loss measured by this method reflects only efficiency losses, which the author considers to be insufficient for policy analysis because needs, access and ability to pay vary a lot between families.\tdFLY{``between'' two people but ``among'' more than two people}

\citet{LinPrince2013} find that high price volatility yields lower aggregate demand for gasoline.\tdFL{This should be fleshed out and moved to the literature review}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\section{Income, Engel curves, and regressivity analysis} \label{sec:regressivity}
One way to incorporate income differences into the analysis is to use regressivity measures. If fuels comprise a larger share of the expenditure of families with lower income, a tax on them is considered regressive as it disproportionately affects those families. Similarly, a subsidy will be progressive.

Engel's work on food expenditure showed that the fraction of income spent on food decreased with total income. This evolved into the the classification of goods as luxuries or necessities according to the income elasticity of demand. A luxury good has income elasticity of demand larger than one. In Brazil, income elasticity of demand for gasoline are typically smaller than one. It's worth noting, however, that these estimates are for aggregated demand.

\cite{Carvalho2014} analyses expenditure patterns by \textit{per capita} income on public transportation, and on private vehicles and fuels, for families in urban areas in Brazil. Using the 2008-2009 \ac{FBS}, \cite{Carvalho2014} estimated the income-elasticity of expenditure on public transportation to be positive for lower income families and negative for higher income families; on the other hand, expenditure on vehicles and fuels increase with income at all levels, and have elasticity larger than one.

% consumption != expenditure != income
While income is often used as the explanatory variable for demand, and income distribution is used to produce inequality measures, it is worth noting that consumption need not be equivalent to income, and the difference tends to be higher the shorter the period under analysis is. Goods purchased in one period may be consumed over many subsequent periods, income received in one period may be saved for future use, and credit lines may allow consumption in one period to be paid for in the future. In this context, \cite{Poterba1991} suggests that using income leads to overestimating the regressivity of a gasoline tax. \cite{Poterba1991} considers that consumption is affected by expected lifetime earnings, life-cycle patterns and general backward- or forward-looking behaviours, and also that poverty is often temporary; which means income at any point in time is an imperfect, noisy measure of living standards. Expenditures during periods of lower income may reflect either existing assets and savings, or the expectation of a higher income in the near future; in particular, this results in gasoline purchases representing a larger share of income for households in the lower income deciles, than of total expenditure for households in the lower expenditure deciles. Moreover, because income may be indexed by price indices (e.g. transfers to low income families or social security recipients), the tax burden for lower income households tends to be partly offset by higher income. Taking indexing into account, \cite{Poterba1991} finds that households in the lowest three deciles of total expenditure bear a lower tax burden than the higher expenditure deciles. \tdFLY{NOV 18 2023 must finish sentence}

\citet[p.~88]{WorldBank2022} estimates ``transient poverty''\footnote{Transient poverty is the condition of households that have a low income but do not fall into ``poverty traps'' due to lack of education or infrastructure, making them more likely to be poor only temporarily.} reached 10\% of the Brazilian population in 2019, while \cite{OECD2018} shows income mobility is higher in Brazil relative to OECD countries, which is likely to produce the type of bias described by \cite{Poterba1991}.

\cite{TeixidoVerde2017} show that wealth has the opposite effect. Between two similar families with the same level of income but different levels of wealth, the demand of the more wealthy family is likely to be less elastic to prices due to wealth providing a ``safety net'' in the event of income losses. By omitting this factor, the price-elasticity of demand of the wealthier family will be biased upwards, thus overstating their welfare losses in the case of a price increase. \cite{TeixidoVerde2017} \tdFL{March 1st 2024:  fix capitals in bib entry} thus include wealth as a measure of ability to pay and find that taxes are more regressive than estimated by \cite{Poterba1991}.

\cite{Sterner2012} \tdFL{Fix bib entry} argues that whether a tax is regressive will vary among countries and in particular that cars in developing countries are luxury goods. The findings in \cite{Carvalho2014} support that argument; however, it must be taken into consideration that fuels have also a large impact on industry costs and output. For example, in Brazil, the transportation of consumer goods is largely made by trucks powered by diesel, so a tax on diesel can increase the prices of all goods. In this case, even if vehicles and fuels are luxuries, the tax may be regressive if the price of goods consumed by low-income families is more sensitive to transportation costs than the price of goods consumed by high-income families.

\tdILR{Could you expand this using similar examples, getting additional references? There might be references within \cite{Sterner2012}. The story below from \cite{FreitasRibeiroSouzaHewings2016} is one good example.}

\cite{FreitasRibeiroSouzaHewings2016} analyse the distributional effects of taxing \ac{GHG} in Brazil using an input-output model of the production chains and find that food and transportation bear the largest changes in output. Because low-income households also spend the greatest shares in these goods, a fuel tax is found to be regressive.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\section{Demand systems, other sources of heterogeneity and welfare computation}\label{sec:demand_sys}

The regressivity evaluation in \cite{Poterba1991} is done over a partial equilibrium analysis, and comes with the caveat that gasoline (as other fuels) is \tdFLY{NOV 18 2023:  is} also used as an input in the production and transportation of many other consumer goods. A more complete evaluation, as suggested in \cite{Poterba1991}, would use I/O tables and a general equilibrium model to compute the effects of a change in gasoline prices on all production sectors. \cite{FreitasRibeiroSouzaHewings2016} analysis does just that, but using ``representative households'' of per capita income decile.

\cite{JorgensonSlesnick1987b} combines both sides of this approach into an evaluation of the welfare effect of price controls on natural gas in the United States. \cite{JorgensonSlesnick1987b} uses a complete demand system from disaggregated data on household expenditures together with a general equilibrium model of the impact of a change in natural gas prices . Households money-metric welfare changes are then aggregated by means of a social welfare function that accounts for efficiency and distribution effects. \cite{JorgensonSlesnick1987b} conclude that decontrol of natural gas prices would increase efficiency and decrease equity. \tdILY{DEC 2023 there is no JorgensonSlesnick1987b in your bib file only JorgensonSlesnick1987b}

\tdIL{Look at Section 4.1 in \citet{NikodinoskaSchroder2016}. They have a short paragraph there about the history of demand systems and then their own methods paragraph about why they themselves use. They had to squeeze all that in only two paragraphs in the published version of their paper. You do have more space for full-fledged sections.}

\cite{BanksBlundellLewbel1996} analyse the bias present in first-order approximations of welfare effects from a price change. The bias increases in magnitude the larger the price change in question, Figure \ref{fig:fuel_prices_over_time} suggests this may be the case of the \ac{IPP} policy in Brazil. The bias also varies with own-price elasticity of demand, which may vary across demographic groups, and it varies systematically over the logarithm of income; Both of these factors raise distribution concerns.

\tdILY{This may be still just a draft, so OK. In its final version, it would need better writing. For example (1) and (2) need qualifiers like ``Concerns (2) and (3)'' or something. Or just ditch the numbering and use full words (``the former'', ``the latter'', ``the first issue'', etc.) }

In order to produce second-order \tdFL{You must explain/clarify what you mean by first-order and second-order estimates, at least in a footnote.} estimates of welfare effects that address the biases found by \cite{BanksBlundellLewbel1996}, substitution effects must be taken into account. These can be modelled with demand systems that estimate simultaneously the demand for all goods (or groups of goods) that families consume.

{\cite{DeatonMuellbauer1980} \tdFL{Page numbers needed for books} defined the \ac{AIDS} to approximate any general demand function of income and preferences. \ac{AIDS} models the share of a household's total expenditure devoted to each good (or group of goods) as a function of the household's total expenditure on all goods and the prices of all goods (or groups of goods). In Equation \ref{eq:AIDS}, $w_i$ is the expenditure share on good $i$, $p_n$ is the price of good $n$ and $x$ is total expenditure on all goods.


\begin{equation} \label{eq:AIDS}
w_i = \alpha_i + \sum_{j=1}^{n}\gamma_{ij} \ln p_j + \beta_i \ln \left [ \frac{x}{a(p)} \right ] + \frac{\lambda_i}{b(p)}
\end{equation}


\cite{DeatonMuellbauer1980} also propose a linear approximation of the \ac{AIDS} model: the \ac{LA-AIDS} model is used by \cite{AlmeidaJustoOliveiraSilva2016} with monthly aggregate consumption of gasoline, diesel and ethanol over the state of Pernambuco in Brazil, and they find that demand for gasoline and diesel is price-inelastic \tdpFL while demand for ethanol is price-elastic. This approach, however, precludes differentiating demographic groups, as consumption is aggregated over consumers, and regressivity analysis, as demand is modelled as a function of expenditure only on fuels, which is itself affected but not fully determined by income.\tdFL{explain/clarify further}

The \ac{AIDS} model was expanded by \cite{BanksBlundellLewbel1997} to include a quadratic term that allows for goods to be luxuries at low levels of income and necessities at higher levels of income, or vice-versa.

\begin{equation} \label{eq:QUAIDS}
w_i = \alpha_i + \sum_{j=1}^{n}\gamma_{ij} \ln p_j + \beta_i \ln \left [ \frac{x}{a(p)} \right ] + \frac{\lambda_i}{b(p)} \left [ \ln \frac{x}{a(p)} \right ]^2
\end{equation}

\cite{BanksBlundellLewbel1997} show that in data from family budget surveys from the United Kingdom between 1970 and 1986, expenditure on alcohol and clothing exhibit non-linear relationships to the logarithm of expenditure, whereas fuel and food exhibit linear decreasing relationships. On the other hand, \cite{WaleedMirza2020} \tdFL{DEC 2023 refe missing} finds that for Pakistani families, while the coefficient of the linear log income term is negative for fuels, consistent with goods that are necessities, the coefficient of the quadratic log income term is significant and positive. The authors suggest this is due to families with higher income increasing expenditure on fuels to power luxuries such as air conditioning and heating. For Brazil, \cite{Carvalho2014} findings show vehicle expenditure to increase with income with elasticity larger than 1, whereas public transportation characterizes as a normal good for lower income families and as an inferior good for higher income families.


Besides income, other household attributes affect demand. In particular, the age of a household member often translates into different needs and preferences. For example, children in general do not consume alcohol and tobacco, and may require specific goods such as disposable diapers and baby formula. Models of ``the cost of the child'' incorporate the number and age of children in a household into the demand estimation. \cite{Ray1983} \tdFL{NOV 18 2023: something is missing here, apart from the citation} demographic characteristics as scaling factors into the model. Equation \ref{eq:DQUAIDS} shows the \ac{DQUAIDS} model of expenditure shares where $\omega$ is an array of demographic characteristics.

\begin{equation} \label{eq:DQUAIDS}
w_i = \alpha_i + \sum_{j=1}^{n}\gamma_{ij} \ln p_j + \beta_i \ln \left [ \frac{x}{a(p)} \right ] + \frac{\lambda_i}{b(p)} \left [ \ln \frac{x}{a(p)} \right ]^2
\end{equation}

Besides scaling, \cite{PollakWales1981} describe three other methods of including demographic information into demand systems: translating, the Gorman specification (which applies scaling then translation) and its reverse (translating first, then scaling), and the Modified Prais-Houthakker procedure, which defines demographic scales for each good (or group of goods) in the system.

\tdILG{So I assume that you will be adding further references to studies in which the authors took into account demographic characteristics. You should try and tell us in each case what this most sophisticated approach helped them uncover, what advantages it brought, what biases it corrected, etc.}

\cite{NikodinoskaSchroder2016} use the \ac{DQUAIDS} to study the welfare effects of fuel taxes in Germany, including the number of adults and children below 15 years of age in a household as scaling factors.

\cite{WaleedMirza2020} use two-stage budgeting with Probit and QUAIDS to analyse the demand for a variety of fuels in Pakistan.

\cite{SpillerStephensChen2017} consider that households in rural areas do not have access to public transportation, reducing their ability to substitute driving.\tdFL{and what was the result? what changed?}

\cite{JorgensonSlesnick1987a} use a transcendental logarithm demand system and incorporate demographic attributes (number of people. age, gender, race and whether the family lives in a rural area) into commodity-specific household equivalence scales.


% Adler 2019, Jorgenson1990, JorgensonSlesnick2014

% \cite{DahlSterner1991} note that seasonal (monthly or quarterly) data yield elasticities far too different from annual data, and conclude that seasonal data should not be used to estimate long-run elasticities.

\tdILR{All these last paragraphs above must be polished, written more fully, etc.}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\section{Equivalence scales}\label{sec:equivalence_scales}
When using models of disaggregated demand, either within a regressivity framework or a demand system, the issue of comparability between \tde households arises. For example, \tdp total income, if used as a measure of welfare, will underestimate the well-being of a family of two adults relative to that same family with a child at the same level of income, as satisfying the needs of the child will reduce the consumption of the parents.

A common correction to this issue is to use the income \textit{per capita} instead. In fact, the \ac{FBS} provides in all its expense datasets a column with the per capita income of the household, and this is the chosen explanatory variable in the income-elasticity models of \cite{Carvalho2014}. However, per capita income disregards that members may have different needs and that there are economies of scale in consumption. Children, for example, consume less food than adults in general. Demand for goods such as lighting and water does not increase proportionally to the number of people in a household. Family members will usually share appliances and vehicles, and can purchase larger quantities of goods at a discount.

\tdIL{See if you can add references to support all this. For example, there are studies of water demand that document carefully this economies of scale. That is just one example. Indeed some of the literature on economics of the family will point out that those economics of scale and the non-rivalness and of goods and services in a household are one of the advantages of getting married. You can mention that but, in any event, you want tor backup your statements with references.}

If we determine how children's consumption must be relative to an adult so that they achieve the same level of well-being, it becomes possible to compare households based on the number of \textit{adult equivalents} \cite[p.~242]{Deaton1997}. Incorporating a measure of economies of scale so that additional members require less consumption to reach the same level of well-being yields the number of \textit{effective adult equivalents}. This number can be used as a deflation factor that equivalizes \tdFL{NOV 18 2023: is that a real word???} family incomes or wealth \citep{DeatonMuellbauer1980}.\tdFL{pages missing?}

Formally, assume that utility as a measure of well-being is comparable between households, so that it is possible to say that two households at utility level $u$ experience the same level of well-being. Assume also that households with the same characteristics $d$ require the same expenditure to reach any level $u$ of utility, so that the expenditure function of all households differs only with respect to $d$. Then the equivalence scale between two households is the ratio $$\frac{e(p, \bar{u}, d_1)}{e(p, \bar{u}, d_2)}$$. By choosing an array $d_0$ of characteristics as the base (e.g. an array of ones for binary variables), the equivalence scale for any household $k$ will be $$\frac{e(p, \bar{u}, d_k)}{e(p, \bar{u}, d_0)}$$ \cite{Lewbel1989}.


\subsection{\tr{Types of equivalence scales}}

\cite{Mancero2001} classifies equivalence scales into four categories according to the method of construction: behavioural scales, parametric scales, expert scales and subjective scales. \cite{Hagenaars1990} produces a similar list, but refers to both parametric and expert scales as ``normative'' scales, to ``behavioural scales'' as ``based on consumption'', and to ``subjective scales'' as ``based on direct welfare measurement''. See below a summary of each approach.

\subsubsection{Expert scales}

Expert scales are developed for particular purposes by ``experts'' of a field. The main example provided by \cite{Mancero2001} is based on how dietary needs vary between individuals according to age and gender. \tdFL{Any examples of use of this type?} \to{Fuels are not physiological needs, so it is unlikely an ``expert'' could provide such a scale based on anything but observed behaviour, so we'll skip that.} \tdFL{reword but keep this stuff in \to{orange}}

\subsubsection{Subjective scales}

Subjective scales are constructed by surveying families and asking what they would consider the minimum expenditure they would require to satisfy the needs of all members. \tdFL{Any examples of use of this type?} \to{We'll also skip this as ``needs'' are socially defined and families' estimates of how much income they would require as a minimum tends to increase as their actual income increases.}\tdFL{reword but keep this stuff in \to{orange}}

\tdILR{Little thing: but in the end, we will be using none of these bold fonts etc. for subheadings. If needed used subsections and subsubsections, so \LaTeX will do the formatting in a consistent way that will probably also look better}
\tdILR{Ok but I need a way to return to the scope of the section to conclude "considering this and that I'll be using the X scale", and subsections don't allow that. Any other options?}

\subsubsection{Parametric scales}

\tr{These scales} start from a functional form that incorporates economies of scale and differences in members needs according to their attributes as parameters. Such scales are useful as standards of comparison between studies in different countries, for example. \cite{NikodinoskaSchroder2016} uses the \ac{OECD} modified equivalence scale that weights the number of adults and children with fixed numbers. \tdFL{Any more examples of use of this type? Could you quote the numbers used by \cite{NikodinoskaSchroder2016}, so we get a better idea of how this scale works?}

\subsubsection{Behavioural scales}

These are based on observed consumption patterns of families.

Engel's work on food expenditures in England showed that richer families tend to spend lower fractions of their income on food than poorer families. This suggests the fraction of income spent on food can be used as an approximation of welfare; Hamilton 2014 used food shares to estimate CPI bias.
The Rothbarth method considers ``adult goods'': goods such as alcohol are not purchased by children, so when a family has a child, the ``cost of the child'' can be estimated as the additional income necessary to restore the consumption of said ``adult goods'' to their initial levels.


Prais and Houthakker generalized the Engel method to allow for different scales for each good. Demand systems like the AIDS or the translog demand system \citep{JorgensonSlesnick1987a} may be used to estimate commodity-specific household equivalence scales.
\cite{VazVaz2007} use the Prais and Houthakker method to estimate equivalence scales for Brazil from the 2002-2003 FBS. The estimates are in general non-significant but \cite{VazVaz2007} find that children are ``cheaper'' than adults. \cite{Mancero2011} estimates behavioural equivalence scales for Latin American countries using a similar method, and finds high variability in the marginal cost of a child, ultimately recommending the use of parametric equivalence scales instead.

\cite{PollakWales1979} point out that equivalence scales obtained from demand system estimates are not appropriate for welfare comparisons. These scales assume demographic parameters are fixed, which may be true for attributes such as gender and race but not so for others like the number of children or the location of the household. Consumption patterns do not reveal the ``direct'' utility contribution of children or location and are instead conditional on the demographic parameters being fixed, whereas equivalence scales used for welfare comparisons should be unconditional. \cite{PollakWales1979} mention that their estimates of equivalence scales from observed consumption in the UK would suggest that larger families require less money than smaller families to reach the same level of utility, as an example of how the use of conditional equivalence scales may lead to spurious results.

\subsection{Criticism of equivalence scales}
% preferences are constructed, not innate
\cite{Fisher1987} raises an important issue regarding behavioural equivalence scales: systematic differences between the tastes of black and white people may reflect past differences in income and education. \tdFL{ NOV 18 2023  Please expand and clarify this  bit further}

% gendered differences
Another challenge arises if we consider studies that show women tend to spend more on children than men \tdFL{add refs}. This means a sample of households headed by women will overestimate \tdFL{maybe some other word that does not suggest ``wrongness''?}) the cost of a child relative to a sample of households headed by men.

\tdIL{It is not the households headed by women that will overestimate things, it is the use of those households in a sample. In any case, you can reword that to avoid any impression of wrongness. You should be able to add references to the literature on economics of the family, health, labour, gender economics...especially in developing countries, women tend to spend more on things for the children (education health, perhaps clothes and toys?...)}

\tdIL{There may be issues related to race, ethnicity, country of origin , for immigrants, etc. The same household with the same age composition might have a systematically different pattern of expenses than another family if the families have different cultural backgrounds. For example, in the case of use of bottled water, US households behave very different depending on whether they are recent immigrants/second generation Americans versus households with a longer history of immigration to the US. Latinos and African Americans also purchase more bottled water. Could there be similar issues in your case? At least, when it comes to the lit review, it might make a difference to mention/discuss this. Even if you do not have the time/data to investigate this yourself. And if you find someone doing it and you cannot, that goes in to the limitations and suggestions for further research. Ideally, you would be able to also comment on what you suspect you might be missing (or being misled about) for non doing something that others did…}

Finally, it may not be socially acceptable to attribute a lower ``weight'' to children in welfare analysis. \tdFL{Any references to back this up?}


\subsection{Parametric Equivalence Scales}
\tdILR{OK so these parametric scales are going to be what you  focus on, right? OK: so I suggest that you leave a brief paragraph (even it is a bit longer than what you now have) here, but as the last type of scale and then flesh out a full new subsection of lit review dealing more in depth with this type of scale: more examples, more developments, more criticisms. }

Parametric equivalence scales use predefined parameters to adjust a family's income according to its composition or other factors.

* OECD or Oxford scale: $1 \times$ First adult + $0.7 \times$ additional adults + $0.5 \times$ children
Following experimental results that suggest the Oxford scale overstates the cost of additional members, \cite{Hagenaars1994} introduces the modified OECD scale: $1 \times$ First adult + $0.5 \times$ additional adults + $0.3 \times$ children.
* Square root: $\sqrt(household members)$



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\chapter{Methodology and Data}\label{methods}

\tdILR{NOV 18 2023 OK, so where in your Section \ref{methods} do you explain to the reader that you are using the QUAIDS of DQUAIDS models?}

In this essay, consumer demand for six commodity groups is characterized across households of different compositions and attributes, and the results are used to estimate the welfare effects of a subsidy policy change. The commodity groups and household characteristics selected are described in Section~\ref{sec:variables}. Section~\ref{sec:welfare} explains the procedure to obtain welfare measures.

Demand is modelled with \ref{eq:QUAIDS} and estimated using data from the 2017-2018 \ac{FBS} and the \ac{ACPI}. Section~\ref{sec:model} shows the model and the estimation method, with Section~\ref{sec:assumptions} containing the assumptions involved and restrictions imposed on the model. Section~\ref{sec:data} provides details on the \ac{FBS} data, cleaning procedures and summary statistics.

\tdILR{NOV 18 2023: OK so this section needs completing and polishing. ALso make sure you fix the missing references}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\section {Econometric Model} \label{sec:model}
Assume that households behave as individuals when it comes to maximizing utility and that households with the same attributes have an indirect utility function of the form shown in Equation~\ref{eq:quaids_indirect_utility}.

\begin{equation} \label{eq:quaids_indirect_utility}
\ln v(x, p) = 
\end{equation}

Assume also that the families allocate their budget into separable commodity groups. Then, applying Roy's identity onto Equation~\ref{eq:quaids_indirect_utility} yields a system of budget share equations. The expenditure share of each commodity group $i$ is given by Equation~\ref{eq:shares}

\begin{equation} \label{eq:quaids_shares}
w_i = \alpha_i + \sum_{j=1}^{n}\gamma_{ij} \ln p_j + \beta_i \ln \left [ \frac{x}{a(p)} \right ] + \frac{\lambda_i}{b(p)} \left [ \ln \frac{x}{a(p)} \right ]^2
\end{equation}

\begin{equation}\label{eq:shares}
w_i = \alpha_i + \sum_{j=1}^{n} \gamma_{ij} \ln p_j + \beta_i (\ln x - \ln a(p)) + \lambda_i \frac{ (\ln x - \ln a(p))^2 }{b(p)} + e_{ih}
\end{equation}

, where $\ln x$ is the natural logarithm of total expenditure, and $\ln a(p)$ and $b(p)$ are price aggregators given by Equations \ref{eq:a_p} and \ref{eq:b_p}.

\begin{equation}\label{eq:a_p}
\ln a(p) = \alpha_0 + \sum_{i=1}^{n} \alpha_i \ln p_i + \frac{1}{2} \sum_{i=1}^{n} \sum_{j=1}^{n} \gamma_{ij} \ln p_i \ln p_j
\end{equation}

\begin{equation}\label{eq:b_p}
\ln b(p) = \prod_{i=1}^n p_i^{\beta_i}
\end{equation}

Let $d_h$ be the vector of demographic variables for household $h$. Translation of demographic variables is done through $\alpha_i$, which is modelled as a linear function of demographic attributes as shown in Equation~\ref{eq:demographic_translation}. Each commodity group has a vector $A_i$ of parameters estimated.

\begin{equation} \label{eq:demographic_translation}
\alpha_{ih} = \alpha_{i0} + A_i \cdot d_h
\end{equation}

Following \cite{BanksBlundellLewbel1997} \tdFLY{missing reference, perhaps \citet{BanksBlundellLewbel1997}???}  the total expenditure of households is instrumented by their reported income. This, as well as ignoring certain categories of purchases, such as vehicles, mitigates the impact of unusually large expenses. \tdFL{expand, clarify further}

\tdILR{Nov 18 2023: When Rober first read this about instrumenting, he thought you had actually meant ``proxying''. You do need to explain carefully why you would be needing instruments. You can start motivating this by saying why \citet{BanksBlundellLewbel1997} used instruments themselves.}

\tdILY{Nov 18 2023: Clara wrote Changed quaids to aidsills which does QUAIDS but allows instrumenting the variables, instrumented total expenditure with income as per Banks et al. }
\tdILR{That is OK but remember that all the details of the method do need to be in Section \ref{methods} and that you havet ocitethe Stata JOurnal paper wherethe aidsill commmad is described to acknowledge its development as a Stata add-on commad}

Estimation is done using the \textbf{aidsills} package.

Following \cite{Poi2012, DeatonMuellbauer1980, BanksBlundellLewbel1997}, \tdFL{Poi ref is missing and use chronological order} $\alpha_0$ is predefined as the lowest total expenditure in the dataset.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\section{Assumptions and restrictions}\label{sec:assumptions}
Demand theory and regularity imply a few restrictions on the parameters of Equation \ref{eq:shares}.

\subsection{Separability}

% Why aggregate goods into groups
Instead of making each purchase decision with full information all the time, families may allocate income into groups like ``food'', ``housing'' and ``transportation'' and treat each as a separate optimization problem. \tdIL{Is this, when separability is not really there, the ``mental account'' heuristic that behavioural economists talk about? In that case, you might want to mention that, at least in a footnote, with references.}

Aggregating goods into groups has the additional advantages of improving the statistical power of the model and avoiding censoring issues. Because the number of goods consumed observed by the \ac{FBS} is very large relative to the number of observations in the 2017-2018 survey, families will have zero expenditure on the majority of individual available goods, but are unlikely to have zero expenditure on major frequent expense categories such as food and transportation.

Grouping requires assuming \textit{separability}: a group is separable when the ordering of consumption of goods within the group is independent of consumption of goods outside the group. This implies effects of substitutability or complementarity between goods in different groups only happen through the substitutability or complementarity of the groups themselves \citep[p124]{DeatonMuellbauer1980}. \tdFLY{pages for books}

\subsection{Consistency with the theory of demand}
Demand theory yields \textit{negativity} and \textit{symmetry} restrictions that are best explained in light of the Slutsky matrix definition. The Slutsky matrix is formatted as follows:

$$S(p, w) =
\begin{pmatrix}
S_{11} & S_{12} & \cdots & S_{1n} \\
S_{21} & S_{22} & \cdots & S_{2n} \\
\vdots  & \vdots  & \ddots & \vdots  \\
S_{n1} & S_{n2} & \cdots & S_{nn} \\
\end{pmatrix}
$$

Each element in the matrix is a sum $S_{ij} = \frac{\partial x_i}{\partial p_j} + \frac{\partial x_i}{\partial x} x_j(p, x)$ that represents the substitution effect of a price change if the consumer was compensated just enough to afford their initial bundle.


\tdIL{March 1 Rober omits the fancy dsfonted R below}

If demand satisfies Walras' law and the weak axiom of revealed preferences, the Slutsky matrix will be \textit{negative semidefinite}, which implies that $\forall v \in $R$, v \cdot S(p, x) v \leq 0$ \cite[p.~34]{MWG1995}.

\citet[p.~70]{MWG1995} show that the Slutsky substitution matrix is equivalent to the matrix of derivatives of the Hicksian compensated demand, which in turn is equivalent to the second-derivative matrix of the total expenditure function. This implies that the Slutsky matrix should be \textit{symmetrical}, a property necessary for the recovery of the expenditure function  (\citealp[p.~50]{DeatonMuellbauer1980}; \citealp[p.~80]{MWG1995}), which will be used to estimate welfare effects.

\tdILR{Rober fixed the last citation format but you sjhould check tha what you mean to produce in terms of format indeed formats the correct way}

\subsection{Regularity}
Demand is subject to a budget constraint, which in the model of Equation \ref{eq:shares} becomes the \textit{additivity} constraint: the expenditure shares of all goods for any given family must add up to 1. This will be true if \tr{conditions \ref{eq:additivity} are} \tde satisfied, and is enforced on estimation of the \ac{AIDS} and its extensions by dropping one of the share equations and computing its parameters such that they satisfy these conditions.

\begin{equation}\label{eq:additivity}
\sum_{i=1}^n \alpha_i = 1 \hspace{2em} \sum_{i=1}^n \gamma_{ij} = 0 \hspace{2em} \sum_{i=1}^n \beta_{i} = 0
\end{equation}

Additionally, families are expected to not have money illusion, which translates into the property of \textit{homogeneity}: changing prices and total expenditure by the same rate should not change quantities demanded. This will be true of the system if \tr{c}ondition \ref{eq:homogeneity} is satisfied.

\tdILR{Still needs references, and check object capitals for ``Condition'' too}

\begin{equation}\label{eq:homogeneity}
\sum_{j} \gamma_{ij} = 0
\end{equation}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\section{Study Variables}\label{sec:variables}
\subsection{Cohort Attributes} \label{ssec:cohort_attributes}
Taking into consideration the demographic attributes used by \cite{Slesnick2000,NikodinoskaSchroder2016,SpillerStephensChen2017}, I use the following for translation of demand in the \ac{QUAIDS} model: the number of adults and the number of children in the household\footnote{for the purposes of demand modelling, ``children'' are members under 16 years of age, and adults are members over 16 years of age.}, the sex of the head of the household, and the type of residence\footnote{\cite{Slesnick2000} uses ``farm or nonfarm'' for the type of residence, while \cite{Jorgenson1990} uses ``urban or rural''. The \ac{FBS} classifies households as ``urban or rural'', so I use this classification.}

\tdFLY{NOV 18 2023  You mention the DQUAIDS here but I am not sure you mention it before in your Section \ref{methods}.}

\tdILY{Again, I do not think I would use the enumerate environment here to list these variables: just list them within a sentence. if you are going to expand much what you say about each, however, consider a paragraph for each but just try to avoid ``bullet points''.}

See Appendix \ref{ap:demographic_attribute_variables} for the variables used to capture each of these attributes.


\subsection{Commodity Groups} \label{ssec:commodity_groups}
In the literature, the choice of groups of goods and services vary. Food is present in all the reviewed articles that aim to estimate demand systems for all or most of households' spending; housing and clothing are often present; and ``adult goods'' such as tobacco and alcohol sometimes appear as their own groups. Vehicle fuels may be present in "fuel", "energy" or "transportation" groups.

\tdILR{March 1st 2024: fix the quotation marks throughout}

For the present analysis, the following groups compose the first stage of the budget: fuels, housing and maintenance services, adult goods, services, and other goods. Auto and real estate purchases are excluded to avoid ``spurious volatility'' \cite{Poterba1991} \tdFL{NOV 18 2023  expand/explain a bit more}. ``Adult goods'' such as alcohol and cigarettes are its own group, following from the observations \tdFL{NOV 18 2023'' use a different term (suggestions? recommendations? since observations are also ``cases'' in a sample}  of \cite{BanksBlundellLewbel1997} and the observations of Rothbarth \cite{Ray1983}.

Some authors separate groceries from restaurant expenses, which is likely not applicable for the Brazilian population. The Brazilian government subsidises food programs for workers that often consist in meal vouchers for exclusive use in restaurants.

\tdILR{NOV 18 2023: Write up full paragraph below: }
\cite{Jorgenson1990} and \cite{Slesnick2000} commodity groups: Energy, Food, Consumer Goods, Capital Services, Consumer Services
\cite{BanksBlundellLewbel1997}: food, clothing, fuel, alcohol, other goods
\cite{MenezesAzzoniSilveira2008}: food, housing, clothing, transportation, health and personal care, personal expenditure, education, tobacco

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\section{Welfare measurement} \label{sec:welfare}
The welfare effects of the \ac{IPP} policy are measured as the equivalent variation of the change in the price of the ``Transportation'' group for the households. Equivalent variation is the change in total expenditure that would place the household at the same utility level as the price change, better understood with Equation~\ref{eq:EV}. After the price change, the household faces prices $p_1$ and is at utility level $u_1$, and the difference between the cost of achieving $u_1$ under the old prices $p_0$ and the new prices $p_1$ is the equivalent variation, in money terms.

\begin{equation}\label{eq:EV}
EV = c_k(u_1, p_0) - c_k(u_1, p_1)
\end{equation}

Rearranging the (logarithm) indirect utility function $\ln v(x, p)$ of QUAIDS \citep{BanksBlundellLewbel1997} shown in Equation~\ref{eq:indirect_utility_quaids} yields the (logarithm) cost function $\ln c(u, p)$ in Equation~\ref{eq:cost_quaids} \cite{ChangSerletis2012}.

\begin{equation}\label{eq:indirect_utility_quaids}
\ln v(x, p) = \left ( \left [ \frac{\ln x - \ln a(p)}{b(p)} \right ]^{-1} + \lambda(p) \right )^{-1}
\end{equation}

\begin{equation}\label{eq:cost_quaids}
\ln c(u, p) = \ln a(p) + \frac{b(p) \ln v(x, p)}{1 - \lambda(p) \ln v(x, p)}
\end{equation}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


tex*/

texdoc stlog, nolog

***Rober SEPT 19 This would go to the data subfolder and unzips the big compressed file:
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
scalar hh_count = r(unique)

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
scalar rural_hh_pct = pct[1,"Rural"]

estpost tab gender
matrix pct = e(pct)
scalar female_head_hh_pct = pct[1,"Female"]

estpost tab race
matrix pct = e(pct)
foreach r_i in "White" "Black" "Mixed" {
	texdoc local `r_i'_head_hh_pct = strofreal(round(pct[1, "`r_i'"], .01), "%9.2f")
}

gen disposable_income = PC_RENDA_DISP * n_people

// save for merging later
keep hh_id age_group cut_n_people gender n_children n_adults race region residence_type disposable_income
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
count if vehicle == 1

// texdoc local only works by section, so we need to save this separately
scalar hh_vehicle_count = r(N)
scalar hh_vehicle_pct = r(N)*100/hh_count

// save for merging later
// note not all households have any items in the inventory
save "Data\hh_vehicle.dta", replace


/*******************
* expenditure data *
********************/
frames reset
frame create expenditures
frame change expenditures

local Food 1
local FuelsTransportation 2
local OtherGoods 3
local Services 4
local Housing 5
local AdultGoods 6


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
rename V8000 amount_spent_raw
rename RENDA_TOTAL hh_income

// count observed purchases
count
matrix ct = r(N)
texdoc local purchase_ct = strofreal(ct[1,1], "%12.0gc")

// 9999999.99 means "unknown" in the V8000 variable
// oddly, some observations with 9999999.99 in V8000 have a much different (and reasonable) amount in the V8000_DEFLA variable, which then ends up not being removed if we don't check the V8000 variable
// also someone appears to have used 99999 in the "ALUGUEL_ESTIMADO" dataset instead, so we'll also drop those two observations
count if amount_spent_raw == 9999999.99 | (QUADRO==0 & amount_spent_raw == 99999)
matrix ct = r(N)
texdoc local unknown_amt = strofreal(ct[1,1], "%12.0gc")
drop if amount_spent_raw == 9999999.99 | (QUADRO==0 & amount_spent_raw == 99999)

// stage 1 groups
gen commodity_group = .
// stage 2 groups
gen stage2_commodity_group = ""


//*************
// Fuels & Transportation group

/*
quadro		purchase
---------|----------------------------------------------------------
	06		power, water & sewage fees, piped natural gas, phone, internet, tv
	07		domestic fuels and water
	23		transportation

Within quadro 06
code			purchase
600101			power
600301			piped natural gas
601801			aggregated costs of power, water and sewage
699901			some other aggregation of power, water, internet, etc

Within quadro 07, all codes are for domestic fuels (including 700801, included in the gasoline group), except for 700201 and 700202, which are for water

Vehicle fuel codes, within quadro 23
code			purchase
2301401			gasoline
2301501			enhanced gasoline
2301502			special gasoline
2301601			ethanol
2301701			diesel
2301801			natural gas for vehicles
*/

replace commodity_group = `FuelsTransportation' if ///
	inlist(item_code, 600101, 600301, 601801, 699901, 700801) | ///
	QUADRO == 23 | ///
	(QUADRO == 7 & ~inlist(item_code, 700201, 700202, 700801))

unique hh_id if item_code == 700801
texdoc local domestic_use_count = strofreal(r(N), "%12.0gc")
texdoc local domestic_use_pct = strofreal(r(N)*100/hh_count, "%9.2f")


//***********
// Food group

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
replace commodity_group = `Food' if ///
	QUADRO == 24 | ///
	inrange(item_code, 6300101, 8600101) | ///
	inrange(item_code, 9000101, 9000928)


//******************
// Adult goods group
/*

quadro		purchase
---------|----------------------------------------------------------
	21		tobacco and other recreational drugs
	24		eating out

code range				purchase
---------------------|----------------------------------------------
2402601 - 2402902		wine, beer and cachaça
2403501 - 2403801		other liquor and cocktails
2405805					beer with food
2405813					beer with food
2407001					light beer
2407401 - 2407501		organic alcoholic beverages
2410101					unspecified alcoholic beverage
2411101 - 2411301		champagne and other alcoholic beverages
2411601					catuaba
2411801					rum
6601716					açai wine
6602302					buriti wine
6602604					pataua wine
8218401					alcoholic beverage "ice"
8300101 - 8305201		alcoholic beverages (not purchased at restaurants)
9000921					beer and meat (??????)

*/

// item codes for adult goods
replace commodity_group = `AdultGoods' if ///
	QUADRO == 21 | ///
	inrange(item_code, 2402601, 2402902) | ///
	inrange(item_code, 2403501, 2403801) | ///
	inrange(item_code, 2407401, 2407501) | ///
	inrange(item_code, 2411101, 2411301) | ///
	inrange(item_code, 8300101, 8305201) | ///
	inlist(item_code, 2405805, 2405813, 2407001, 2410101, 2411601, 2411801, 2411801, 6601716, 6602302, 6602604, 8218401)


//***************
// Services group
/*
quadro  	purchase
---------|----------------------------------------------------------
	19		domestic services (cleaning, cooking, gardening, etc)
	22		games, bets
	25		communication
	31		services like barber/salon, massage, tattoos
	40		lawyer, notary services
	41		travelling
	42		health care services
	45		parties and ceremonies

Items from quadros 07 and 06 that are not energy-related are included here.

Within group 9, there are item codes both for goods purchased to fix/maintain an appliance or piece of furniture and for the service fees of the repair. I'm treating everything as a "service", as these are likely not separable: each good needed for a repair will have a particular substitution relationship with the associated service.

*/

replace commodity_group = `Services' if ///
	inlist(QUADRO, 19, 22, 25, 31, 40, 41, 42, 45) | ///
	(QUADRO == 6 & ~inlist(item_code, 600101, 600301, 601801, 699901)) | /// water, sewage, internet
	(QUADRO == 7 & inlist(item_code, 700201, 700202)) // water


//******************
// Other goods group
/*
quadro  	purchase
---------|----------------------------------------------------------
	12		other house items
	13		pets and pet care
	15		electric appliances
	16		non-electric appliances
	17		furniture
	18		decoration and insulation products
	21		smoking stuff
	27 		newspaper, magazines
	29		health products, including medication
	28		tickets to museums, purchase of photography supplies, games
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
	49		courses, textbooks, other education goods


Includes items from the 63 to 69 quadros that are not food items.

*/

replace commodity_group = `OtherGoods' if ///
	inlist(QUADRO, 12, 13, 15, 16, 17, 18, 27, 28, 29, 30, 32, 34, 35, 36, ///
		   37, 38, 39, 43, 44, 46, 49) | ///
	inrange(item_code, 8600101, 8900101)


//******************************
// Housing and maintenance group
/*

quadro  	purchase
---------|----------------------------------------------------------
	08		small repair/maintenance of house or tomb
	09		repair, maintenance and rent of furniture and appliances
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

replace commodity_group = `Housing' if ///
	inlist(QUADRO, 8, 9, 10, 11, 33) | ///
	item_code == 000101


// Ignored Quadros
/*
quadro  	purchase
	26		credit card/loan interest and fees
	29B		health products NOT ACQUIRED
	42B		health care services NOT ACQUIRED
	47		real estate (not the one they live in)
	48		loans, securities
	50		vehicle-related fees for docs, insurance, etc
	51		vehicle purchase payments
*/

drop if inlist(QUADRO, 26, 47, 48, 50, 51)

assert ~missing(commodity_group)


*********************************
* standardize reference periods *
*********************************
merge m:1 QUADRO using "Data\periodo_de_referencia_por_quadro.dta"
drop if _merge != 3
drop description _merge

// extrapolate/divide different period lengths into 30-day periods
replace amount_spent = amount_spent * 30/days


*****************
* price indices *
*****************
/* create a price index from the available deflators */

frame change expenditures

/**********************************************************************
* identify groups based on common deflator values for a particular item

e.g. if families A, B, C have a deflator value of 0.95 for rice, they are assumed to have been surveyed at the same period, so their deflators are all pooled to create the commodity group price indices
*/

// drop frame if it exists from previous runs
capture frame drop price_groups

frame put * , into(price_groups)
frame change price_groups

// find most common item
// note the level of sorcery we are forced to resort to just to get a single value from the dataset as a scalar
preserve
unique hh_id, by(item_code) gen(households_by_item_code)
egen max_hhs = max(households_by_item_code)
keep if households_by_item_code == max_hhs
scalar max_hhs_item_code = item_code[1]
restore

// this gives us 600101 as the item code that "covers" the most households
// in future iterations, we can try to "cover" other households by choosing other items and attempting to match their deflators to existing groups
gen price_group = DEFLATOR if item_code == max_hhs_item_code

// count price groups
unique price_group
scalar price_group_count = r(unique)

// count households with rent deflator values
keep hh_id price_group
drop if missing(price_group)
unique hh_id
scalar hh_rent = r(unique)
scalar pct_rent = hh_rent*100/hh_count

duplicates drop

// save for joins
save "Data\hh_price_groups.dta", replace


/****************************************************
* calculate the price index for each group identified
*/

frame change expenditures

// drop frame if it exists from previous runs
capture frame drop price_indices

frame put * , into(price_indices)
frame change price_indices

// merge household price groups
frlink m:1 hh_id, frame(price_groups)
frget price_group, from(price_groups)
drop if (missing(price_group) | missing(DEFLATOR))

// for each commodity group and each price group, calculate a price index as an average of the deflators weighted by the aggregate expenditure on each item
bysort commodity_group price_group: egen agg_group_expenditure = total(amount_spent)
gen weighted_deflator = DEFLATOR*amount_spent
bysort commodity_group price_group: egen deflator_sum = total(weighted_deflator)
gen price_index = deflator_sum/agg_group_expenditure
egen max_DEFLATOR = max(DEFLATOR)
egen min_DEFLATOR = min(DEFLATOR)
assert (price_index >= min_DEFLATOR & price_index <= max_DEFLATOR)

// each price group gets a price index for each commodity group
collapse (first) price_index, by(price_group commodity_group)

// show that of a total of 4,904 price groups, 3,249 have indices for all commodity groups
preserve
reshape wide price_index, i(price_group) j(commodity_group)
egen missing_indices = rowmiss(price_index*)
tab missing_indices
keep price_group missing_indices
save "Data\missing_price_indices_by_price_group.dta", replace
restore

// join with household ids
joinby price_group using "Data\hh_price_groups.dta"
egen price_indices_count = count(price_index), by(hh_id price_group)
unique hh_id if price_indices_count == 6 // should yield 46,085
scalar hhs_complete = r(unique)
drop if price_indices_count < 6
drop price_group price_indices_count
save "Data\hh_price_indices.dta", replace

// check how many families the 3,249 groups cover
capture frame drop second_check
frame copy price_groups second_check
frame change second_check
joinby price_group using "Data\missing_price_indices_by_price_group.dta"
count if missing_indices == 0 // yields 46,085
scalar hhs_complete2 = r(N)
assert hhs_complete == hhs_complete2


/*************************************************
* count households with expenditures in all groups
* does not produce any output, just useful for
* verification
*/


frame change expenditures

// drop frame if it exists from previous runs
capture frame drop present_groups
frame put hh_id commodity_group, into(present_groups)
frame change present_groups

duplicates drop // keep only one row for each hh_id commodity_group pair
gen commodity_groups_count = 1
collapse (count) commodity_groups_count, by (hh_id) // count rows by household, yields commodity group count


**********************
* expenditure shares *
**********************

************************************
* expenditure share on vehicle fuels

// use a separate frame as we'll be doing some destructive stuff
frame change expenditures

// drop frame if it exists from previous runs
capture frame drop fuel_expenditure_shares

frame put hh_id amount_spent item_code QUADRO, into(fuel_expenditure_shares)
frame change fuel_expenditure_shares

gen commodity_group_s2 = ""

// 23* are for vehicles, 700801 is for domestic use
replace commodity_group_s2 = "Gasoline" if inlist(item_code, 2301401, 2301501, 2301502, 700801)

replace commodity_group_s2 = "Ethanol" if item_code == 2301601
replace commodity_group_s2 = "Diesel" if item_code == 2301701
replace commodity_group_s2 = "Public" if inlist(item_code, 2300101, 2300201, 2300301, 2300401, 2300402, 2300403, 2300404, 2300405,  2300406, 2300407, 2300408, 2300409, 2300501, 2300502, 2300601, 2300602, 2300701, 2300801, 2301101, 2301201, 2301301, 2303201)
replace commodity_group_s2 = "Others" if inlist(item_code, 2301801, 600101, 600301, 601801, 699901) | QUADRO == 7 & ~inlist(item_code, 700201, 700202)

// make sure empty groups have expenditure zero
fillin hh_id commodity_group_s2
replace amount_spent = 0 if _fillin == 1

egen total_expenditure = total(amount_spent) if amount_spent != ., by(hh_id)
assert total_expenditure != .

drop if missing(commodity_group_s2)
egen group_expenditure_s2 = total(amount_spent), by(hh_id commodity_group_s2)
assert ~missing(group_expenditure_s2)

// keep only one observation per household and energy group
bysort hh_id commodity_group_s2: keep if _n == 1

// save fuel expenditures for another plot
// drop frame if it exists from previous runs
capture frame drop concentration_curve
frame put hh_id commodity_group_s2 total_expenditure group_expenditure_s2, into(concentration_curve)

gen group_expenditure_share_s2 = group_expenditure_s2/total_expenditure

// drop top 2.5% gasoline expenditure values for better visuals
_pctile group_expenditure_share_s2 if commodity_group_s2 == "Gasoline" & group_expenditure_s2 > 0, p(97.5)
local share_cutoff = r(r1)
drop if group_expenditure_share_s2 > `share_cutoff'

// also drop top 2.5% total expenditure values for better visuals
_pctile total_expenditure if commodity_group_s2 == "Gasoline" & group_expenditure_s2 > 0, p(97.5)
local exp_cutoff = r(r1)
drop if total_expenditure > `exp_cutoff'

graph twoway scatter group_expenditure_share_s2 total_expenditure if commodity_group_s2 == "Gasoline", ///
      xtitle("Total monthly expenditure") ///
	  ytitle("Gasoline expenditure share") ///
	  graphregion(color(white) margin(zero)) bgcolor(white) msize(vtiny)

graph export "graphs\exp_shares_gasoline.png", as(png) replace



*********************************************************************
* concentration curves of fuels and public transportation expenditure
frame change concentration_curve

capture frame drop concentration_curve_throwaway
frame copy concentration_curve concentration_curve_throwaway
frame change concentration_curve_throwaway

rename group_expenditure_s2 exp
reshape wide exp, i(hh_id) j(commodity_group_s2) string
sort total_expenditure
gen cum_total_exp = sum(total_expenditure)
egen total_total_exp = total(total_expenditure)
gen total_exp_prop = cum_total_exp / total_total_exp

// mixing up snake case and camel case. not proud of it.
foreach fuel in "Gasoline" "Ethanol" "Diesel" "Public" {
// 	sort exp`fuel'
	gen cum_`fuel'_exp = sum(exp`fuel')
	egen total_`fuel'_exp = total(exp`fuel')
	gen `fuel'_exp_conc = cum_`fuel'_exp / total_`fuel'_exp
}

graph twoway (line Gasoline_exp_conc total_exp_prop) ///
      (line Diesel_exp_conc total_exp_prop) ///
      (line Ethanol_exp_conc total_exp_prop) ///
      (line Public_exp_conc total_exp_prop) ///
      (function y=x, lpattern(dot) color(black) lwidth(thin)), ///
      xtitle("Proportion of total expenditure") ///
      ytitle("Proportion of expenditure on fuels") ///
      graphregion(color(white) margin(zero)) bgcolor(white) ///
      legend(label(1 "Gasoline") label(2 "Diesel") label(3 "Ethanol") label(4 "Public Transportation") label(5 "45°"))


graph export "graphs\fuel_exp_by_cumulative_income.png", as(png) replace



****************************************
* expenditure and income distributions *
****************************************
frame change expenditures

// drop frame if it exists from previous runs
capture frame drop expenditure_income
frame put hh_id hh_income amount_spent commodity_group, into(expenditure_income)
frame change expenditure_income

egen total_expenditure = total(amount_spent) if amount_spent != ., by(hh_id)
assert total_expenditure != .

// Summary info on expenditure and income
// keep only one observation per household
bysort hh_id: keep if _n == 1

label variable total_expenditure "Household expenditure"
label variable hh_income "Household income"
graph hbox total_expenditure hh_income, nooutsides showyvars legend(off) graphregion(color(white) margin(zero)) bgcolor(white)
graph export "graphs\boxplot_exp_inc.png", as(png) replace

// skewness
sum total_expenditure, detail
texdoc local total_exp_skew = strofreal(r(skewness), "%9.2f")
sum hh_income, detail
texdoc local total_inc_skew = strofreal(r(skewness), "%9.2f")



/***************************************************
* Estimate a Working-Leser model for the Engel curve
*/
frame change expenditures

// drop frame if it exists from previous runs
capture frame drop working_leser
frame put hh_id amount_spent commodity_group, into(working_leser)
frame change working_leser

egen group_expenditure = total(amount_spent), by(hh_id commodity_group)
assert group_expenditure != .

// keep only one observation per household and commodity group
bysort hh_id commodity_group: keep if _n == 1

// make sure empty groups have expenditure zero
fillin hh_id commodity_group
replace group_expenditure = 0 if _fillin == 1
assert group_expenditure != .

egen total_expenditure = total(group_expenditure), by(hh_id)
assert total_expenditure != .

gen group_expenditure_share = group_expenditure/total_expenditure

// save for the main model
keep hh_id commodity_group group_expenditure group_expenditure_share total_expenditure

// drop frame if it exists from previous runs
capture frame drop expenditure_shares
frame put hh_id commodity_group group_expenditure group_expenditure_share total_expenditure, into(expenditure_shares)

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
texdoc local hh_count = strofreal(hh_count, "%9.0gc")
texdoc local rural_hh_pct = strofreal(round(rural_hh_pct, .01), "%9.2f")
texdoc local female_head_hh_pct = strofreal(round(female_head_hh_pct, .01), "%9.2f")
texdoc local hh_rent = strofreal(hh_rent, "%12.0gc")
texdoc local pct_rent = strofreal(round(pct_rent, .01), "%9.2f")
texdoc local price_group_count = strofreal(price_group_count, "%12.0gc")

texdoc stlog close

/*tex
\section {Data}\label{sec:data}

\tdILR{NOV18 2023: Rober thinks that the DATA SECTION should be a ``chapter'' itself, separate from the Methodology}

\subsection {Data Source} \label{sec:data_source}

The \ac{FBS} provides detailed data on individual household expenditure on particular goods and services, as well as the cohort attributes mentioned in Section \ref{ssec:cohort_attributes}. The most recent survey was run between 2017 and 2018 and contains both the levels of expenditure as recorded at the time of the survey and the expenditure values deflated to the baseline date of January 23\textsuperscript{rd} 2018.

\tdILG{NOV 18 2023  The footnote numbers go after the punctuation mark: check throughout }

The \ac{FBS} is meant to be used as cross-sectional data and does not contain the dates each household was surveyed,\footnote{\cite{WaleedMirza2020}, for example, match their family budget survey data to the weekly Pakistan Bureau of Statistics price index using the date of collection.} while other surveys run in Brazil that follow population and economic trends more frequently do not include family expenses in the level of detail required by the model. However, estimating a demand system requires price variation. To obtain some price variation information, I exploit the fact that the \ac{FBS} data was collected over a period of 12 months and that the dataset includes the deflation factors used for each recorded expense.

\tdILR{NOV 18 2023  I bet your macros do not work because of the mistranslation of underscores between Stata and \LaTeX}

\tdILY{there are a lot of ``I's' in this section: use the passive voice more: NOV 18 2023  still must fix this. The passive voice goes ``The type of expense was identified...''}

The grouping was done as follows. First, the type of expense that was present more frequently among the households surveyed was identified: in the case of the 2017-2018 \ac{FBS} this was rent or estimated rent, from the $`hh_count'$ surveyed, $`hh_rent'$ or $`pct_rent'$\% \tdFL{these macros will work in the end right?} of households recorded a value. The second step is done under the assumption that two households that paid rent on the same date and location, or were interviewed on the same date and location, would have the same deflator value. Under this assumption, households that have the same deflator value for rent were grouped and treated as facing the same prices. Third, a Stone price index was produced from all expenses reported by all households in each group.

This exploitation made it possible to obtain estimates but, given that the procedure by which the deflators are generated and mapped onto observations is not transparent and I did not have the dates of collection, the results are not reliable. The reader should take the estimates, their discussion and conclusions as an example of the use of the method to address the question rather than an actual answer.

If the deflator values had been solely determined by the date of the payment or the survey, we would expect to find at most 395 different values (365 for each day of the survey plus 30 for the days prior to the first day of the survey). Instead, $`price_group_count'$ values were found, and the \ac{FBS} documentation informs us that location and time period are both used to produce the deflator values. This means the groups do not reflect only a time dimension. Additionally, \tr{even though inflation records for housing grew every month} \tdFL{reword/clarify, more records? higher prices? more inflation?} in the period of the survey, the absence of definitive information on the deflator source leaves open the possibility that households surveyed at different periods and locations would have the same deflator value.


\tdILY{Rober SEPT 19: you do not name a variable "urban\_or\_rural" (also because the underscores tend to be a nuisance in \LaTeX), since that is not going to help: name it EITHER urban OR rural and label the 0 and 1 values accordingly. Same with "gender" "marital status" etc. Use male (or female, or additional binary indicators) and "married", "single", "divorced", etc. }
\tdILY{Clara: ok, I changed it. I used the categories as variable names and let Stata interpret them with i.var\_name when possible, but the quaids command does not support it. Also snake\_case is \href{https://www.cs.kent.edu/~jmaletic/papers/ICPC2010-CamelCaseUnderScoreClouds.pdf}{the superior naming convention} so I will keep it unless there is no way to fix the \LaTeX\ output}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\tdILY{so can we start seeing tables of descriptives of whatever data you already have, you do have some data.}

\subsection{Population sample description}

The 2017-2018 \ac{FBS} surveyed $`hh_count'$ households. Table \ref{tab:demographic_frequencies} \tdFL{is this table mislabelled? there is no caption in the table!!!} shows how observations are distributed by gender of household head, residence type \tdFL{consider using Oxford commas} and race. Overall, the majority of the sampled households are headed by men self-declared as ``mixed race'' and lives in urban areas.

\input{demographic_summary_table}

% Now we show the data is somewhat reliable

% Compare it with census data
% While we wait for the 2022 census results, which I believe should be available by the end of January, I'm using the 2010 census.
In the 2010 census data, 18\% of the households surveyed were in a rural area, while the percentage in the 2017-2018 \ac{FBS} is of $`rural_hh_pct'$\%. In 2010, 38.74\% of households were headed by a woman, versus $`female_head_hh_pct'$\% in 2017-2018.

% Explain the sampling process
\ac{BIGS} uses a master sample framework to select households for surveys, including the \ac{FBS}. The master sample is a sample of the census sectors drawn using stratification and probability weighted by the number of households in the sector, and grouped into \acp{PSU} so that each \ac{PSU} has at least 60 households \citep{ibge2008}. The \ac{FBS} uses a subsample of the master sample in two stages: first drawing \acp{PSU} randomly from each strata, then drawing households randomly from each \ac{PSU}. See Appendix \ref{ap:sampling_fbs} for more details.

% Data cleaning and expense mapping
Of the original $`purchase_ct'$ purchases recorded, $`unknown_amt'$ were excluded from the analysis as the amount spent was not informed.

Some expenses on services like renting of clothes or appliance repairs have been included in the ``Other Goods'' group, as they are likely not separable from the goods associated.

The periods of reference vary by purchase group, with food registry being done over a period of seven days, income and health expenses done over the previous 30 days, durable goods over the last twelve months and other expenses over the previous 90 days. Total expenses reported were extrapolated or averaged into 30-day periods, as formal income is usually paid monthly.

The distribution of income and total expenditure is strongly right-skewed: Figure~\ref{fig:boxplot_exp_inc} \tdFL{Use this trick for all your cross-references} shows the boxplots for monthly total income and total expenditure. The skewness score of total expenditure is $`total_exp_skew'$, and the skewness score of total income is $`total_inc_skew'$.

\begin{figure}
    \centering
    \includegraphics[width=0.9\textwidth]{graphs/boxplot_exp_inc.png}
    \caption{Boxplots of monthly total income and expenditure by Brazilian households from the 2017-2018 \ac{FBS}}
    \label{fig:boxplot_exp_inc}
\end{figure}


% More useful info
$`hh_vehicle_count'$ of the households surveyed, or $`hh_vehicle_pct'$\%, report owning one vehicle. A small number, $`domestic_use_count'$, or $`domestic_use_pct'$\%, of households, report purchasing gasoline for domestic use.

\subsection{Expenditure patterns on fuel and transportation}

Figure \ref{fig:exp_shares_gasoline} shows the shares of a households \tdeFL total expenditure spent on gasoline. For households that consumed any gasoline during the period of the survey, the clusters' shapes suggest Engel curves linear on the logarithm of total expenditure, which is expected of goods that are not luxuries.

\tdILG{All figures' captions should be short, yes, but explicit enough for us to be able to just look at the graph itself and get a pretty good idea of what the figure shoes, so generic labels like "expenditure and income" will not help us. We need something like "Evolution of expenditure by all Brazilian households between 2000 and 2023. Source: 2023 Brazilian Census (or appropriate citation)."}

\begin{figure}
    \centering
    \includegraphics[width=0.9\textwidth]{graphs/exp_shares_gasoline.png}
    \caption{Expenditure share on gasoline of Brazilian households by total expenditure from the 2017-2018 \ac{FBS}}
    \label{fig:exp_shares_gasoline}
\end{figure}


\tdILY{Rober: OK but as you explain what the reader can see in Figure \ref{fig:fuel_exp_by_cumulative_income} you should also refer to the actual graph. For example, that story about the poor people spending a large share on public transit makes sense and can be seen if one looks at the yellow line, so do mention that yellow line when you explain that result in the paragraph. This is like later when you talk about tables of results: you will talk about this on that shown in the x column of Table Y.}

Figure \ref{fig:fuel_exp_by_cumulative_income} \tdFL{Ensure there is a period at the end of all your captions} shows concentration curves of expenditure on fuels and public transportation in Brazil based on the 2017-2018 \ac{FBS}. The horizontal axis is the cumulative proportion of total expenditure on fuels and public transportation by each household in the sample, sorted by their total expenditure, and the vertical axis is the cumulative proportion of the total expenditure by all households in the sample. Families with higher expenditure, presumably wealthier, are responsible for a larger proportion of the total expenditure on all three main vehicle fuels (gasoline in blue, ethanol in green and diesel in purple), while families with lower expenditure are responsible for a larger proportion of expenditure on public transportation (in orange).

If price elasticity of demand for fuels does not vary significantly across expenditure \tdFLY{or income??? check !} levels, Figure \ref{fig:fuel_exp_by_cumulative_income} suggests a subsidy is regressive. On the other hand, the price of public transportation depends heavily on fuel prices and subsidies to public transportation are uncommon in Brazil \cite{Carvalho2016}. Until the COVID-19 pandemic only the city of São Paulo significantly subsidised urban public transportation in Brazil \cite{Carvalho2016, FerrazJorgeScheller2022}. From that perspective, a subsidy on fuels, in particular diesel, indirectly subsidises public transportation.

\begin{figure}
    \centering   \includegraphics[width=0.9\textwidth]{graphs/fuel_exp_by_cumulative_income.png}
    \caption{Cumulative proportion of expenditure on fuels and public transportation of Brazilian households by cumulative proportion of total expenditure from the 2017-2018 \ac{FBS}}
    \label{fig:fuel_exp_by_cumulative_income}
\end{figure}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\chapter{Results}\label{resultssection}

tex*/

texdoc stlog, nolog

// make a throwaway copy
capture frame drop model_data
frame copy expenditure_shares model_data
frame change model_data

joinby hh_id commodity_group using "Data\hh_price_indices.dta"

reshape wide group_expenditure_share group_expenditure price_index, i(hh_id total_expenditure) j(commodity_group)
merge m:1 hh_id using "Data\hh_head_size.dta"
keep if _merge==3

// ensure that the sum of expenditure shares is close enough to 1...
gen sum_of_exp_shares = group_expenditure_share`Food' + group_expenditure_share`FuelsTransportation' + group_expenditure_share`AdultGoods' + group_expenditure_share`Services' + group_expenditure_share`OtherGoods' + group_expenditure_share`Housing'
assert inrange(sum_of_exp_shares, 0.999999, 1.000001)
drop sum_of_exp_shares

// ...but replace the 5th one with the complement of the others, as quaids does not accept the small difference
replace group_expenditure_share`Food' = 1 - (group_expenditure_share`FuelsTransportation' + group_expenditure_share`AdultGoods' + group_expenditure_share`Services' + group_expenditure_share`OtherGoods' + group_expenditure_share`Housing')

// unpack categorical variables because aidsills can't handle i.var_name :)
gen male = gender
replace male = 0 if gender == 2
tab region, g(region_)

// a_0 is the minimum total expenditure
capture drop min_exp
egen min_exp = min(total_expenditure)
scalar _min_exp = min_exp

gen ln_disposable_income = log(disposable_income)

// collect tests for the quadratic coefficients
collect create quad_tests, replace

// now we should have all the expenditure shares, total expenditures and price indices, so we can run the main model!
aidsills group_expenditure_share`Food' group_expenditure_share`FuelsTransportation' group_expenditure_share`Services' group_expenditure_share`OtherGoods' group_expenditure_share`Housing'  group_expenditure_share`AdultGoods', ///
	expenditure(total_expenditure) ///
	ivexpenditure(ln_disposable_income) ///
	prices(price_index`Food' price_index`FuelsTransportation' price_index`Services' price_index`OtherGoods' price_index`Housing' price_index`AdultGoods') ///
	intercept(n_adults n_children male) ///
	alpha_0(`=_min_exp') ///
	quadratic

estimates store quaids

// test quadratic coefficients
collect, name(quad_tests) tag(model["Unconstrained"]): test lambda_lnx2

// run the non-quadratic version
aidsills group_expenditure_share`Food' group_expenditure_share`FuelsTransportation' group_expenditure_share`Services' group_expenditure_share`OtherGoods' group_expenditure_share`Housing' group_expenditure_share`AdultGoods', ///
	expenditure(total_expenditure) ///
	ivexpenditure(ln_disposable_income) ///
	prices(price_index`Food' price_index`FuelsTransportation' price_index`Services' price_index`OtherGoods' price_index`Housing' price_index`AdultGoods') ///
	intercept(n_adults n_children male) ///
	alpha_0(`=_min_exp')

estimates store aids

// enforce homogeneity, test for symmetry
aidsills group_expenditure_share`Food' group_expenditure_share`FuelsTransportation' group_expenditure_share`Services' group_expenditure_share`OtherGoods' group_expenditure_share`Housing' group_expenditure_share`AdultGoods', ///
	expenditure(total_expenditure) ///
	ivexpenditure(ln_disposable_income) ///
	prices(price_index`Food' price_index`FuelsTransportation' price_index`Services' price_index`OtherGoods' price_index`Housing' price_index`AdultGoods') ///
	intercept(n_adults n_children male) ///
	alpha_0(`=_min_exp') ///
	quadratic homogeneity

estimates store homo

// test quadratic coefficients
collect, name(quad_tests) tag(model["Enforced Homogeneity"]): test lambda_lnx2

// enforce symmetry and homogeneity
aidsills group_expenditure_share`Food' group_expenditure_share`FuelsTransportation' group_expenditure_share`Services' group_expenditure_share`OtherGoods' group_expenditure_share`Housing' group_expenditure_share`AdultGoods', ///
	expenditure(total_expenditure) ///
	ivexpenditure(ln_disposable_income) ///
	prices(price_index`Food' price_index`FuelsTransportation' price_index`Services' price_index`OtherGoods' price_index`Housing' price_index`AdultGoods') ///
	intercept(n_adults n_children male) ///
	alpha_0(`=_min_exp') ///
	quadratic symmetry

estimates store symm

// test quadratic coefficients
collect, name(quad_tests) tag(model["Enforced Homogeneity and Symmetry"]): test lambda_lnx2


// format and export regression results
etable, estimates(quaids aids homo symm) mstat(N) column(estimates) ///
	showstars showstarsnote cstat(_r_b) ///
	title("Demand system estimates for the Brazilian population \label{tb:regresults}") ///
	showeq ///
	cstat(_r_ci, nformat(%6.3f) cidelimiter(","))

collect label levels coleq ///
	group_expenditure_share1 "w_{Food}" ///
	group_expenditure_share2 "w_{FuelsTransportation}" ///
	group_expenditure_share3 "w_{Services}" ///
	group_expenditure_share4 "w_{Goods}" ///
	group_expenditure_share5 "w_{Housing}" ///
	group_expenditure_share6 "w_{AdultGoods}", ///
	name(ETable) modify

collect label levels colname ///
	gamma_lnprice_index1 "gamma_{Food}" ///
	gamma_lnprice_index2 "gamma_{FuelsTransportation}" ///
	gamma_lnprice_index3 "gamma_{Services}" ///
	gamma_lnprice_index4 "gamma_{Goods}" ///
	gamma_lnprice_index5 "gamma_{Housing}" ///
	gamma_lnprice_index6 "gamma_{AdultGoods}", ///
	name(ETable) modify

collect export "reg_results_table.tex", name(ETable) as(tex) tableonly replace

// format and export joint test of quadratic coefficients
collect title "Joint test statistics and p-values of quadratic terms in demand system specifications \label{tb:quad_tests}"
collect label levels result ///
	chi2 "chi2", ///
	name(quad_tests) modify

collect layout (model) (result[chi2 p]), name(quad_tests)
collect export "quad_test_results_table.tex", name(quad_tests) as(tex) tableonly replace


/******************************************************************
* count and plot households missing expenditure on commodity groups
*/
frame change expenditure_shares

// make a throwaway copy
capture frame drop missing_groups
frame put hh_id total_expenditure, into(missing_groups)
frame change missing_groups

keep hh_id total_expenditure
duplicates drop

// get price_group
joinby hh_id using "Data\hh_price_groups.dta", unmatched(master)

// get count of commodity groups present
frlink 1:1 hh_id, frame(present_groups)
frget commodity_groups_count, from(present_groups)

// get commodity groups not present
gen missing_commodity_groups = 6 - commodity_groups_count

// tag deciles
egen x_decile = cut(total_expenditure), group(10) //label

replace x_decile = x_decile + 1 // graph bar ignores zeroes :)

// plot mean count of missing commodity groups by decile
graph bar (mean) missing_commodity_groups, ///
	over(x_decile, relabel (1 "1st" 2 "2nd" 3 "3rd" 4 "4th" 5 "5th" 6 "6th" 7 "7th" 8 "8th" 9 "9th" 10 "10th")) ///
	  ytitle("Mean count of commodity groups with zero expenditure") ///
	  graphregion(color(white) margin(zero)) bgcolor(white)

graph export "graphs\missing_commodity_groups.png", as(png) replace

// join with price indices

frlink 1:1 hh_id, frame(model_data)
frget price_index*, from(model_data)

// count % households without a price group or with an incomplete price index set
// the price indices table only has indices for complete sets, so we don't need to check all the indices
gen omitted = 0
replace omitted = 1 if missing(price_group) | missing(price_index1)

collapse (count) hh_id, by (omitted x_decile)
bys x_decile: egen total_households = total(hh_id)
gen pct_omitted = 100*hh_id/total_households

// plot pct of households missing one group by decile
graph bar pct_omitted if omitted == 1, ///
	over(x_decile, relabel (1 "1st" 2 "2nd" 3 "3rd" 4 "4th" 5 "5th" 6 "6th" 7 "7th" 8 "8th" 9 "9th" 10 "10th")) ///
	  ytitle("Percentage of households omitted") ///
	  graphregion(color(white) margin(zero)) bgcolor(white)

graph export "graphs\missing_one_or_more_commodity_groups.png", as(png) replace

texdoc stlog close


/*tex

\input{reg_results_table}

\input{quad_test_results_table}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\section{Welfare effects estimation}

\tdILR{March 1 2024 Obviously this now requires an ``intro'' or something to bring back the context. At least you should cross-reference the notation you mention here to the earlier sections. Otherwise, the reader will not know what, say, $u_1$ and $p_1$  mean}

Choosing $u_1$ and $p_1$ as the prices and utility level of households at the base period for the 2017-2018 \ac{FBS}, the cost of achieving $u_1$ is equal to the total expenditure of household $k$ at the base period, so that Equation~\ref{eq:EV} can be computed as $EV = c_k(u_1, p_0) - x$.

\tdIL{display this last equation}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\section{Limitations}
Having zero expenditure in one or more commodity groups does not ordinarily require that a household not be included in the estimation. However, due to the procedure described in Section~\ref{sec:data_source}, if within a household's price group there was no aggregate expenditure on the commodity group in question, there will also be no price index for said commodity group. The absence of price index information does mean the household data will be discarded.

Figure~\ref{fig:missing_commodity_groups} shows that the mean count of commodity groups with zero expenditure is higher for lower income households. This is likely due to ``corner solutions'' at low levels of income, and potentially to sparse purchases that fall outside of the survey period.\footnote{For example, the survey registers food purchases for seven days. If the household typically buys groceries in bulk once a month, their (adjusted) monthly expenditure would be incorrectly represented as zero.} It also means lower income families are more likely to be ommited from the sample, as shown in Figure~\ref{fig:missing_one_or_more_commodity_groups}.

\begin{figure}
    \centering   \includegraphics[width=0.9\textwidth]{graphs/missing_commodity_groups.png}
    \caption{Mean count of commodity groups with zero expenditure by total expenditure decile}
    \label{fig:missing_commodity_groups}
\end{figure}


\begin{figure}
    \centering   \includegraphics[width=0.9\textwidth]{graphs/missing_one_or_more_commodity_groups.png}
    \caption{Percentage of households omitted from the estimation by total expenditure decile}
    \label{fig:missing_one_or_more_commodity_groups}
\end{figure}


tex*/
texdoc stlog, nolog

// get the average price of gasoline before and after october 2016 but before 2020 to avoid pandemic effects


/************************************
* Get EV for each population subgroup
*/

// get u_1 from the indirect utility function
// u_1 = 1/(b_p / (ln x - ln a_p) + lambda_p)
// ln x is given
// lambda_p = sum lambda_i ln p_i, lambda_i is estimated and p_i is given
// ln a_p = alpha_0 + sum alpha_i ln p_i + 1/2 * sum of sum gamma_ij ln p_i ln p_j, alpha_0 is predetermined and gamma_ij is estimated
// alpha_i = alpha_male * male + alpha_this * this ...
// b_p = prod p_i ^ beta_i, beta_i are estimated

scalar alpha_0 = `=_min_exp'

// make a throwaway copy
frame change model_data
capture frame drop ev
frame copy model_data ev
frame change ev

drop if missing(price_index1) | missing(price_index2) | missing(price_index3) | missing(price_index4) | missing(price_index5)

// use the model with enforced symmetry
estimates restore symm

// a_p aux
gen gamma_ij_times_ln_prices = 0
gen alpha_group_times_ln_prices = 0

// b_p
gen b_p = 1

// lambda_p
gen lambda_p = 0

foreach group in "1" "2" "3" "4" "5" "6"{
	// sum alpha_i ln p_i
	replace alpha_group_times_ln_prices = alpha_group_times_ln_prices + ///
		(e(alpha)["_cons", "group_expenditure_share`group'"] + ///
		e(alpha)["male", "group_expenditure_share`group'"] * male + ///
		e(alpha)["n_adults", "group_expenditure_share`group'"] * n_adults + ///
		e(alpha)["n_children", "group_expenditure_share`group'"] * n_children) * ///
		log(price_index`group')

	// sum of sum gamma_ij ln p_i ln p_j
	foreach group2 in "1" "2" "3" "4" "5" "6"{
		replace gamma_ij_times_ln_prices =  gamma_ij_times_ln_prices + ///
			e(gamma)[`group', `group2'] * log(price_index`group') * log(price_index`group2')
	}

	// prod of p_i ^ beta_i
	replace b_p = b_p * price_index`group'^(e(beta)["lnx", "group_expenditure_share`group'"])

	// lambda_p
	replace lambda_p = lambda_p + e(lambda)["lnx2", "group_expenditure_share`group'"] * log(price_index`group')
}

gen ln_a_p = `=alpha_0' + alpha_group_times_ln_prices + gamma_ij_times_ln_prices

gen ln_u_1 = 1/(b_p / (log(total_expenditure) - ln_a_p) + lambda_p)


/*****************************************
* Calculate cost of u_1 at previous prices
*/
// replace transportation price
replace price_index2 = price_index2 * 0.8

// recalculate a_p, b_p and lambda_p
// a_p aux
replace gamma_ij_times_ln_prices = 0
replace alpha_group_times_ln_prices = 0

// b_p
replace b_p = 1

// lambda_p
replace lambda_p = 0

foreach group in "1" "2" "3" "4" "5" "6" {
	// sum alpha_i ln p_i
	replace alpha_group_times_ln_prices = alpha_group_times_ln_prices + ///
		(e(alpha)["_cons", "group_expenditure_share`group'"] + ///
		e(alpha)["male", "group_expenditure_share`group'"] * male + ///
		e(alpha)["n_adults", "group_expenditure_share`group'"] * n_adults + ///
		e(alpha)["n_children", "group_expenditure_share`group'"] * n_children) * ///
		log(price_index`group')

	// sum of sum gamma_ij ln p_i ln p_j
	foreach group2 in "1" "2" "3" "4" "5" "6"{
		replace gamma_ij_times_ln_prices =  gamma_ij_times_ln_prices + ///
			e(gamma)[`group', `group2'] * log(price_index`group') * log(price_index`group2')
	}

	// prod of p_i ^ beta_i
	replace b_p = b_p * price_index`group'^(e(beta)["lnx", "group_expenditure_share`group'"])

	// lambda_p
	replace lambda_p = lambda_p + e(lambda)["lnx2", "group_expenditure_share`group'"] * log(price_index`group')
}

replace ln_a_p = `=alpha_0' + alpha_group_times_ln_prices + (gamma_ij_times_ln_prices/2)

gen ln_c_p_0 = ln_a_p + b_p * ln_u_1/(1 - lambda_p * ln_u_1)

// EV!
gen ev = exp(ln_c_p_0) - total_expenditure

texdoc stlog close


/*tex
% multiply the CV for each subgroup by the population share to get the total losses

\tdILR{March 1st 2024 The table of results will eventallly need to be made smaller, the model names will need correct capitalization, the Greek symbols will need to be Greek etc.  You might need to span the table over several pages by using the supertabular environment}

\tdILR{March 1st 2024 We need careful commentary of the results}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\chapter{Conclusions}\label{conclusions}

It would be nice to have an annual survey of family expenditures in Brazil, so we could also track changes in time.


\tdILR{THe stuff below is too detailed to go into Section \ref{conclusions} as limitations. It is too detailed but you can but it in details in the data section etc. and then mention it again without the details here }

The \ac{FBS} product registry, albeit very detailed, could use improvements. There are 13,474 products identified in the registry, of which 8,708 are used in the ``Caderneta Coletiva'' questionnaire. The mapping of survey ``quadros'' can be used to categorize part of the items, but not the ``Caderneta Coletiva'' items. Instead, the goods' numeric codes follow a scheme not described in the data documentation. Besides, since the data format does not have labels and the \verb|.xls| files do not have descriptions of the ``quadros'', one must jump from the \verb|.pdf| manual of the survey to the table to the dataset to interpret the codes, creating multiple opportunities for mistakes.


\tdILR{Eventually, you should of course have some conclusions and some description of the limitations of your study, together with some policy recommendations. But bear in mind that the limitations are about YOUR own work, not the shortcomings of the dataset, etc. If you can somehow phrase your issues about faulty/incomplete datasets as policy recommendations, then those would be OK here}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\tdILY{You will need to tweak those missing foreign characters in your bib entries and secure the capitalizations too}

\tdIL{could you try to generate the ugly URL codes as embedded in hyperlinks, using the relevant tex tag (I think it is $\backslash$href or something). That would still work as a URL hyperlink without the massive ugliness of having to show verbatim the whole URL}


\tdILY{NOV 18 2023  Something strange is going on with \citet{AlmeidaJustoOliveiraSilva2016}'s bib entry. Fix capitals in \citet{TeixidoVerde2017}, \citet{NikodinoskaSchroder2016}, for example: check them all. }

\tdILY{NOV 18 2023  delete the ``month'' field from your bib entries}

\tdILY{NOV 18 2023: Your references list should go ahead of your appendices}



\bibliographystyle{chicago}
\bibliography{ClaraMAEssaybibfile}



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



\appendix

\chapter{Sampling of the \ac{FBS}} \label{ap:sampling_fbs}

\tdILR{Ensure that all your footnotes have a period at the end.}


The \ac{FBS} uses \ac{BIGS}'s master Sample. The master sample is a set of households selected as follows. First, \ac{BIGS} divides the Brazilian territory into census sectors following three sets of criteria: the number of residences, the number of agricultural and livestock facilities, and the number of days needed to collect data in one sector. For urban areas, there is a subdivision between urbanized and non-urbanized areas, and the criterion for rural and non-urbanized areas includes a range of agricultural and livestock facilities. Table \ref{census_sectors_criteria} shows the minimum, average and maximum number of residences or facilities for each category, and the number of days allocated to the data collection.

\tdILY{Note how Rober changed slightly the size of the font in the table, so you really do not need to fiddle with the margin size. This would probably be a bit more elegant and keep more with the overall settings of the template. I left your original code there commented out. Also commented out the changepage package in the preamble.}

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

The sectors are then stratified for sampling as follows: first by federative unit,\footnote{A ``federative unit'' is a state or the Federal District of Brazil, where the capital Brasília is located.} then by municipality within the federative unit, then by the type of residence\footnote{Usually referred to in \ac{BIGS} documents as ``household situation''.} and finally by income levels, determined within the stratum.
\ac{BIGS} groups the census sectors into \acp{PSU}, aiming to have at least 60 permanent residences in each \ac{PSU}, although some \acp{PSU} may not reach that number \citep{ibge2014}. The \acp{PSU} are then drawn from the strata into the master sample with weighted probabilities according to the size of the \ac{PSU}. The number of \acp{PSU} drawn is chosen so that the number of individuals 14 years of age or older who are not employed or students --- this is a relevant indicator of another survey, the \ac{NSHS} --- can be estimated with a predefined precision level \citep{ibge2014}. When of the execution of the 2017-2018 \ac{FBS}, the number of \acp{PSU} in the master sample was 15,096 \citep{ibge2019}.

For the \ac{FBS}, the number of \acp{PSU} sampled from the master sample is chosen so that the total income of the head of the households can be estimated under a predetermined precision level. The coefficient of variance was determined for each federative unit, ranging from 6\% to 15\%. The final size of the sample was of 5,504 \ac{FBS}, containing 69,660 households \citep{ibge2019}.

The master sample excludes the following areas: military bases, camping sites, prisons, orphanages, hospitals, nunneries and elderly rest homes \citep{ibge2019}.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\chapter{Demographic attribute variables in the \ac{FBS}} \label{ap:demographic_attribute_variables}

Table \ref{tab:attribute_vars} shows the variable in the \ac{FBS} datasets for each attribute used to scale demand in the \ac{DQUAIDS}.

\tdILG{ENW, In Table \ref{tab:attribute_vars} use italics for the official regions and ``and'' in English}


\tdILG{Rober assumes that the verbatim text in Table \ref{attribute_vars}  to denote the datasets and the original variable names will eventually be eliminated and substituted by more conventional (easier to recognise) names and regular font (in italics for the variable names). This is all OK for now for our preliminary private purposes but in the end all the variables described should have ``obvious'' names after recoding. For example, V0404 will have to be recoded into an indicator called either \textit{male} or \textit{female}. If you think it were necessary to use them in this ``raw'' format, they would go into an appendix. But it looks for now that there are only a very small number of them to consider, so just follow convention and recode, rename, and retype to make them al look good in the end.}
\tdILG{Clara: I moved it into the appendix. I did rename all the variables, but I thought of this table as a description of how I got info from the raw datasets, for a hypothetical reader that wanted to replicate it from the raw datasets but save a trip through the docs, hence the original names.}
\tdILR{OK that is fine but then in the table caption, add a little note to express that the original names are left in that special fontface}


\setlength{\extrarowheight}{3pt}
\begin{table}[]
\begin{tabular}{p{0.25\textwidth}p{0.75\textwidth}}
\toprule
\textbf{Attribute}                       & \textbf{Source}                                                                                                                                          \\ \midrule
Household Size                  & The dataset \verb|MORADOR| contains one row per household member, I count the rows in each household and use 7 or more as the upper limit.                               \\
Age of Head of the Household    & Variable \verb|V0403| in the \verb|MORADOR| dataset contains the age of each member. I grouped the ages into 5 buckets using frequencies (?).                            \\
Region of Residence             & Variable \verb|UF| in \verb|MORADOR| contains the state where the household is located. I mapped the states into their official regions of Brazil, namely \textit{Centro-Oeste}, \textit{Nordeste}, \textit{Norte}, \textit{Sudeste} and \textit{Sul}. \\
Type of Residence               & Variable \verb|TIPO_SITUACAO_REG| in \verb|MORADOR| classifies households as ``urban'' or ``rural''.                                        \\
Gender of Head of the Household & Variable \verb|V0404| in \verb|MORADOR| classifies the head of the household as ``male'' or ``female''.                             \\

\bottomrule
\end{tabular}
\caption{Source variables of household attributes in the 2017-2018 \ac{FBS}} \label{tab:attribute_vars}
\end{table}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\chapter{Mapping of \ac{ACPI} groups to commodity groups} \label{ap:acpi_to_commodity_groups_map}

\tdILR{Use single spacing for Table \ref{acpi_groups}}

Table \ref{acpi_groups} shows the structure of groups, subgroups, items and subitems of goods and services used by the \ac{ACPI} \citep{ibge2020}, with the respective commodity group. Less aggregated levels of the structure have been omitted when the entire parent category was mapped into a single group, for example the \ac{ACPI} group ``Food and Beverages'' is entirely included in the ``Food'' commodity group, so it is represented by a single row in the table, whereas each subgroup of the ``Health Goods and Services'' was mapped to a different commodity group, occupying a separate row.



\begin{longtable}{>{\raggedright\arraybackslash}p{0.20\textwidth}>{\raggedright\arraybackslash}p{0.22\textwidth}>{\raggedright\arraybackslash}p{0.20\textwidth}>{\raggedright\arraybackslash}p{0.15\textwidth}>{\raggedright\arraybackslash}p{0.25\textwidth}}
\caption {\ac{ACPI} group to commodity group mapping} \label{acpi_groups} \\ \toprule
\textbf{Group} &
  \textbf{Subgroup} &
  \textbf{Item} &
  \textbf{Subitem} &
  \textbf{Commodity Group} \\ \midrule
\endfirsthead
\caption* {Table \ref{acpi_groups} Continued:} \\ \toprule
\textbf{Group} &
  \textbf{Subgroup} &
  \textbf{Item} &
  \textbf{Subitem} &
  \textbf{Commodity Group} \\ \midrule
\endhead
Food and Beverages       &                                &                       &                   & Food              \\ \midrule
\multirow{4}{=}{Housing} &
  \multirow{3}{=}{Fees and Maintenance} &
  Rent and Fees &
   &
  Capital Services \\
                         &                                & Repairs               &                   & Capital Services  \\
                         &                                & Cleaning Products     &                   & Other Goods    \\ \cmidrule(l){2-5}
                         & Domestic fuels and electricity &                       &                   & Energy            \\ \midrule
Appliances and Furniture &                                &                       &                   & Capital Services  \\ \midrule
Clothing                 &                                &                       &                   & Other Goods    \\ \midrule
\multirow{3}{=}{Transportation} &
  \multirow{3}{=}{Transportation} &
  Public Transportation &
   &
  Services \\
                         &                                & Private Vehicle       &                   & Capital Services  \\
                         &                                & Vehicle Fuels         &                   & Energy            \\ \midrule
\multirow{3}{=}{Health Goods and Services} &
  Pharmaceutical and Optical Goods &
   &
   &
  Other Goods \\
                         & Health Services                &                       &                   & Services \\
                         & Personal Care                  &                       &                   & Other Goods    \\ \midrule
\multirow{9}{=}{Personal Expenses} &
  Personal Services &
   &
   &
  Services \\ \cmidrule(l){2-5}
 &
  \multirow{8}{=}{Recreation and Smoking} &
  \multirow{7}{=}{Recreation} &
  Musical Instrument &
  Other Goods \\
                         &                                &                       & Bicycle           & Other Goods    \\
                         &                                &                       & Toys              & Other Goods    \\
                         &                                &                       & Fishing Materials & Other Goods    \\
                         &                                &                       & Sports Materials  & Other Goods    \\
                         &                                &                       & Pet Food          & Other Goods    \\
                         &                                &                       & All Others *      & Services \\ \cmidrule(l){3-5}
                         &                                & Smoking               &                   & Other Goods    \\ \midrule
\multirow{4}{=}{Education} &
  \multirow{4}{=}{Courses, Reading and Stationary} &
  Regular Courses &
   &
  Services \\
                         &                                & Miscellaneous Courses &                   & Services \\
                         &                                & Reading Materials     &                   & Other Goods    \\
                         &                                & Stationary            &                   & Other Goods    \\ \midrule
Communication            &                                &                       &                   & Services \\ \bottomrule
\end{longtable}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\section{Price index transformation}
\ac{BIGS} provides monthly variation by groups, subgroups, items and subitems of the \ac{ACPI}, along with each level weight in the general price index. I used the indices from July 2006 to December 2019 available at \cite{ibgeIPCA2011} and \cite{ibgeIPCA2019}. The index for groups, subgroups and items is produced with the Laspeyres method.

Estimating demand systems requires price index numbers for each commodity group at each time period. First, the variation of each commodity group is obtained through the weighted average of variations of its components (groups, subgroups, items and subitems)  in the \ac{ACPI}. Then the variations are transformed into index numbers with January 2018 as the base date, with each commodity group price normalized to unity.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\end{document}

tex*/



