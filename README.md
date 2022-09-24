This project is the research component for my Master of Arts in Economics degree at Memorial University of Newfoundland.

## Requirements

I used Stata 17.3. Earlier versions of Stata may work.

The POF data uses fixed-width columns and comes with an R script for conversion into .rds files. I include here an R script to convert the .rds files into .dta.

I used the `pdfathesis` package provided by the MUN Math department, see [MUN - Thesis Help](https://www.mun.ca/math/graduate-students/thesis-help/) for more information.

## Setting up the paths

Edit the `Dropbox.ado` file and replace the path with the repository path. Copy this file into the .ado source you use for Stata ("C:/Users/\<your user\>/ado/plus/" should work).

## Running

Run the `aaaMUN/SUPERVISION/2022/Clara/convert_datasets_to_dta.R` script. I used RStudio. This should generate .dta files inside the `aaaMUN/SUPERVISION/2022/Clara/Data/Dados_20210304` directory.

Type 
```
cd "path/to/do/file"
texdoc do "ClaraMAEssaydraft"
```
into the Stata console.

The output .tex files will be generated into "aaaMUN/SUPERVISION/2022/Clara". Run `pdflatex + Bibtex + Maketex` on `ClaraMAEssaydraft<DDMonYYYY>.tex`.
