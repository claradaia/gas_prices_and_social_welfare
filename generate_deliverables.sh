#!/bin/bash
DATE=`date +%d%b%Y`

rm deliverables/*
cp ClaraMAEssaydraft.do deliverables/ClaraMAEssaydraft$DATE.do
cp fuel_prices_plot.do deliverables/fuel_prices_plot$DATE.do
cp aaaMUN/SUPERVISION/2022/Clara/ClaraMAEssaybibfile.bib deliverables/ClaraMAEssaybibfile.bib
cp aaaMUN/SUPERVISION/2022/Clara/ClaraMAEssaydraft.pdf deliverables/ClaraMAEssaydraft$DATE.pdf
cp aaaMUN/SUPERVISION/2022/Clara/ClaraMAEssaydraft.tex deliverables/ClaraMAEssaydraft$DATE.tex
cp aaaMUN/SUPERVISION/2022/Clara/scheme-clara.scheme deliverables/scheme-clara.scheme

