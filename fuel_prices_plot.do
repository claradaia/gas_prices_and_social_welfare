// plot time series of fuel prices

Dropbox

// Where the output and data files are
cd "aaaMUN\SUPERVISION\2022\Clara"

// source: https://www.gov.br/anp/pt-br/assuntos/precos-e-defesa-da-concorrencia/precos/precos-revenda-e-de-distribuicao-combustiveis/serie-historica-do-levantamento-de-precos
import excel "Data\fuel_prices\mensal-brasil-desde-jan2013.xlsx", sheet("BRASIL - DESDE JANEIRO DE 2013") cellrange(A17:R772) firstrow clear

rename PREÇOMÉDIOREVENDA mean_retail_price

save "Data\fuel_prices\fuel_prices_2013.dta", replace

import excel "Data\fuel_prices\mensal-brasil-2001-a-2012.xlsx", sheet("BRASIL") cellrange(A13:O704) firstrow clear

rename PRECOMÉDIOREVENDA mean_retail_price

append using "Data\fuel_prices\fuel_prices_2013.dta", force

rename DESVIOPADRÃOREVENDA std_dev_retail_price


// fix some differences between datasets
replace PRODUTO = "ÓLEO DIESEL" if PRODUTO == "OLEO DIESEL"
replace PRODUTO = "ÓLEO DIESEL S10" if PRODUTO == "OLEO DIESEL S10"

// GLP & GNV are not sold by litre, they mess up the scales
drop if inlist(PRODUTO, "GLP", "GNV")

// special gasoline and special diesel follow the price of their regular counterparts and there is some missing data, don't need them in the plot
drop if inlist(PRODUTO, "ÓLEO DIESEL S10", "GASOLINA ADITIVADA")


replace PRODUTO = "Gasoline" if PRODUTO == "GASOLINA COMUM"
replace PRODUTO = "Ethanol" if PRODUTO == "ETANOL HIDRATADO"
replace PRODUTO = "Diesel" if PRODUTO == "ÓLEO DIESEL"

label variable mean_retail_price "Mean retail price (BRL)"
label variable MÊS "Month"

gen upper = mean_retail_price + std_dev_retail_price
gen lower = mean_retail_price - std_dev_retail_price

twoway (rarea lower upper MÊS, fcolor(gs14) lwidth(none)  legend(label(1 "standard deviation range"))) (line mean_retail_price MÊS), by(PRODUTO, cols(1) note("")) tlabel(01jan2005 01jan2010 01jan2015 01jan2020 01oct2016, format(%tdMon/YY)) tline(01oct2016)