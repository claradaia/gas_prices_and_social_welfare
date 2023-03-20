/***********************************************************
 *  Clara Daia Hilgenberg Daru                             *
 *  March 2023                                             *
 *                                                         *
 *  Clean, merge and transform price indices               *
 ***********************************************************/

Dropbox

// Where the output and data files are
cd "aaaMUN\SUPERVISION\2022\Clara"

// 2006 to 2011
import delimited "Data\IPCA\tabela2938.csv", delimiter(";") varnames(4) rowrange(5:2512) parselocale(pt) clear
save "Data\IPCA\IPCA_2006_2011.dta", replace

// 2012 to 2019
import delimited "Data\IPCA\tabela1419.csv", delimiter(";") varnames(4) rowrange(5:3556) parselocale(pt) clear

append using "Data\IPCA\IPCA_2006_2011.dta"


rename ipcavariaçãomensal variation
rename ipcapesomensal weight

split mês, destring
rename mês2 year

gen month = 1 if mês1 == "janeiro"
replace month = 2 if mês1 == "fevereiro"
replace month = 3 if mês1 == "março"
replace month = 4 if mês1 == "abril"
replace month = 5 if mês1 == "maio"
replace month = 6 if mês1 == "junho"
replace month = 7 if mês1 == "julho"
replace month = 8 if mês1 == "agosto"
replace month = 9 if mês1 == "setembro"
replace month = 10 if mês1 == "outubro"
replace month = 11 if mês1 == "novembro"
replace month = 12 if mês1 == "dezembro"
drop mês1

split geralgruposubgrupoitemesubitem, generate(level) parse(.)
rename level1 level_code
rename level2 level_name
replace level_name = "Índice Geral" if level_code == "Índice Geral" | level_code == "Índice geral"
replace weight = . if level_name == "Índice Geral"
destring level_code, replace force
replace level_code = . if level_name == "Índice Geral"
drop geralgruposubgrupoitemesubitem

// save general index for check later
gen _general_monthly_variation = .
replace _general_monthly_variation = variation if level_name == "Índice Geral"
egen general_monthly_variation = total(_general_monthly_variation), by(month year)
drop _general_monthly_variation
drop if level_name == "Índice Geral"

// encode commodity groups
gen commodity_group = ""

// Food group
// "Alimentos e Bebidas"
replace commodity_group = "food" if level_code == 1

// Energy group
// "Combustíveis (Veículos)"
// "Combustíveis e Energia"
replace commodity_group = "energy" if inlist(level_code, 5104, 22)

// Capital group
// "Reparos"
// "Aluguel e Taxas"
// "Artigos de Residência"
// "Veículo Próprio"
replace commodity_group = "capital" if inlist(level_code, 2103, 2101, 3, 5102)

// Consumer goods group
// "Artigos de Limpeza"
// "Vestuário"
// "Produtos Farmacêuticos e Óticos"
// "Cuidados Pessoais"
// "Disco laser"
// "Instrumento Musical"
// "Bicicleta"
// "Brinquedos"
// "Material Esportivo"
// "Compra e Tratamento de Animais"
// "Alimento para Animais"
// "Fotografia e filmagem"
// "Fumo"
// "Leitura"
// "Papelaria"
replace commodity_group = "goods" if inlist(level_code, 2104, 4, 61, 63, 7201008, 7201010, 7201019, 7201023, 7201083, 7201018, 7201020, 7203, 7202, 8102, 8103)

// Consumer services group
// "Transporte Público"
// "Serviços de Saúde"
// "Serviços Pessoais"
// "Cinema"
// "Ingresso para Jogo"
// "Clube"
// "Aluguel de DVD e Fita de Videocassete"
// "Boite, Danceteria e Discoteca"
// "Jogos de Azar"
// "Motel"
// "Hotel"
// "Excursão"
// "Cursos"
// "Cursos Diversos"
// "Comunicação"
// all subitems within the 72 subgroup not yet tagged are recreation services
replace commodity_group = "services" if inlist(level_code, 5101, 62, 71, 8101, 8104, 9) | ( floor(level_code / 100000) == 72 & commodity_group == "" )

assert commodity_group != ""

// check that we included all categories, either the parent or all its children
// the sum of all weights in a month should equal 100
// I allow a bit more or less due to roundings
egen double month_total_weight = total(weight), by(month year)
assert inrange(month_total_weight, 99.9, 100.1)


// transform weights
egen double group_weight = total(weight), by(commodity_group month year)
gen double ingroup_weight = weight / group_weight

// get group variation

// weight the variation of each item
gen double weighted_variation = variation * ingroup_weight
// sum for each group
collapse (sum) weighted_variation (first) group_weight (first) general_monthly_variation, by(commodity_group month year)
rename weighted_variation group_variation

// check that the sum of the weighted variation of all groups is the same as the national variation
gen double group_weighted_variation = group_weight * group_variation
egen double general_mo_var_from_new_groups = total(group_weighted_variation), by(month year)
// allow small difference due to rounding
// the national variation only has 2 decimal digits
gen uplimit = general_monthly_variation*100 + 1
gen lowlimit = general_monthly_variation*100 - 1
assert inrange(general_mo_var_from_new_groups, lowlimit, uplimit)

keep month year commodity_group group_variation

// transform variation into inversed ratio
// e.g. variation in february was 25%
// formula below will give 1/1.25 = 0.8
// 0.8 = january index number / february index number
// the index starts from "the future", so we'd get the january index number by multiplying the february index number by 0.8
gen double inverse_group_ratio = 100/(100 + group_variation)
assert inverse_group_ratio > 0

// gen index number
// starting in january 2018, base year of the POF
gen double group_price_index = .
replace group_price_index = 1 if month == 1 & year == 2018

local groups capital energy food goods services
foreach g of local groups {
	sum inverse_group_ratio if month == 1 & year == 2018 & commodity_group == "`g'"
	scalar next_`g'_index=r(mean)
	display next_`g'_index
}

// for values before the base month, multiply by the inverse_group_ratio
forvalues y = 2017(-1)2006 {
	display "`y'"
	forvalues m = 12 (-1) 1 {
		foreach g of local groups {
			replace group_price_index = next_`g'_index if month == `m' & year == `y' & commodity_group == "`g'"
			quietly sum inverse_group_ratio if month == `m' & year == `y' & commodity_group == "`g'"
			scalar next_`g'_index = next_`g'_index * r(mean)
			
		}
	}
}


// for values after the base month, apply the original variation
foreach g of local groups {
	scalar last_`g'_index=1
}

// skip jan 2018
forvalues m = 12 (-1) 2 {
	foreach g of local groups {
		replace group_price_index = last_`g'_index * (100 + group_variation)/100 if month == `m' & year == 2018 & commodity_group == "`g'"
		scalar last_`g'_index = last_`g'_index * (100 + group_variation)/100
	}
}

forvalues m = 12 (-1) 1 {
	foreach g of local groups {
		replace group_price_index = last_`g'_index * (100 + group_variation)/100 if month == `m' & year == 2019 & commodity_group == "`g'"
		scalar last_`g'_index = last_`g'_index * (100 + group_variation)/100
	}
}

sort year month

save "Data\IPCA\transformed_price_index.dta", replace

