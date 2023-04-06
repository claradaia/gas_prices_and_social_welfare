// plot time series of fuel prices

Dropbox

// Where the output and data files are
cd "aaaMUN\SUPERVISION\2022\Clara"

/* OPEC crude oil prices, in USD, for comparison of price fluctuations
**********************************************************************/
// source: https://www.opec.org/opec_web/en/data_graphs/40.htm but download the data directly with https://www.opec.org/basket/basketDayArchives.xml

// convert xml to csv with python
python:
import xml.etree.ElementTree as ET
import csv

# Open the XML file
tree = ET.parse('Data/fuel_prices/basketDayArchives.xml')
root = tree.getroot()

# Find all 'data' and 'val' fields
data_fields = []
val_fields = []
for child in root:
    data_fields.append(child.attrib['data'])
    val_fields.append(child.attrib['val'])

# Save to csv file
with open('Data/fuel_prices/basketDayArchives.csv', 'w') as csvfile:
    fieldnames = ['data', 'val']
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

    writer.writeheader()
    for i in range(len(data_fields)):
        writer.writerow({'data': data_fields[i], 'val':val_fields[i]})

end

import delimited "Data\fuel_prices\basketDayArchives.csv", delimiter(comma) varnames(1) clear

rename val crude_oil_price
gen date = date(data, "YMD")
gen month = mofd(date(data, "YMD"))
collapse (mean) crude_oil_price, by(month)
label variable crude_oil_price "Mean crude oil price (USD)"
save "Data\fuel_prices\crude_oil_prices.dta", replace


/* Exchange rate USD - BRL
**************************/
// source: https://www.bcb.gov.br/estabilidadefinanceira/historicocotacoes, but download the full data directly with https://ptax.bcb.gov.br/ptax_internet/consultaBoletim.do?method=gerarCSVFechamentoMoedaNoPeriodo&ChkMoeda=61&DATAINI=01/01/2003&DATAFIM=31/12/2023

import delimited "Data\fuel_prices\CotacoesMoedasPeriodo.csv", parselocale(pt) stringcols(1) clear

gen month = mofd(date(v1, "DMY"))
format %tm month
rename v5 usd_price
keep month usd_price
collapse (mean) usd_price, by(month)
save "Data\fuel_prices\usd_prices.dta", replace


/* Fuel retail prices in Brazil
*******************************/
// source: https://www.gov.br/anp/pt-br/assuntos/precos-e-defesa-da-concorrencia/precos/precos-revenda-e-de-distribuicao-combustiveis/serie-historica-do-levantamento-de-precos
import excel "Data\fuel_prices\mensal-brasil-desde-jan2013.xlsx", sheet("BRASIL - DESDE JANEIRO DE 2013") cellrange(A17:R772) firstrow clear
rename PREÇOMÉDIOREVENDA mean_retail_price
save "Data\fuel_prices\fuel_prices_2013.dta", replace

import excel "Data\fuel_prices\mensal-brasil-2001-a-2012.xlsx", sheet("BRASIL") cellrange(A13:O704) firstrow clear
rename PRECOMÉDIOREVENDA mean_retail_price

append using "Data\fuel_prices\fuel_prices_2013.dta", force


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

label variable mean_retail_price "Mean fuel retail price (BRL)"
rename MÊS month
label variable month "Month"
replace month = mofd(month)
format month %tm


/* Merge everything and plot
****************************/
// merge crude oil prices
merge m:1 month using "Data\fuel_prices\crude_oil_prices.dta"
drop if _merge != 3
drop _merge

// merge monthly exchange rates
merge m:1 month using "Data\fuel_prices\usd_prices.dta"
drop if _merge != 3

// Convert crude oil prices to BRL
replace crude_oil_price = crude_oil_price/usd_price

// normalize prices to 1 at t=1
gen norm_crude_oil_price = crude_oil_price / crude_oil_price[1]
sort PRODUTO month
by PRODUTO: gen norm_retail_price = mean_retail_price / mean_retail_price[1]

sort month
twoway (line norm_retail_price month if PRODUTO=="Ethanol") (line norm_retail_price month if PRODUTO=="Gasoline") (line norm_retail_price month if PRODUTO=="Diesel") (line norm_crude_oil_price month), tlabel(2005m1 2010m1 2015m1 2020m1 2016m10, format(%tmMon/YY)) tline(2016m10)
