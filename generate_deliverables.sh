#!/bin/bash
DATE=`date +%d%b%Y`

rm deliverables/*
cp ClaraMAEssaydraft.do deliverables/ClaraMAEssaydraft$DATE.do 
cp aaaMUN/SUPERVISION/2022/Clara/ClaraMAEssaybibfile.bib deliverables/ClaraMAEssaybibfile$DATE.bib
cp aaaMUN/SUPERVISION/2022/Clara/ClaraMAEssaydraft.pdf deliverables/ClaraMAEssaydraft$DATE.pdf
