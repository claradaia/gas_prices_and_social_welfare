This project is the research component for my Master of Arts in Economics degree at Memorial University of Newfoundland.

See the output document [here](ClaraMAEssay.pdf).

## Requirements

I used Stata 17.3. Earlier versions of Stata may work.

The POF data uses fixed-width columns and comes with an R script for conversion into .rds files. I include here an R script to convert the .rds files into .dta.

I used the `pdfathesis` package provided by the MUN Math department, see [MUN - Thesis Help](https://www.mun.ca/math/graduate-students/thesis-help/) for more information.

The following Stata packages are needed:
* the `aidsills` command by [Lecocq & Robin](https://journals.sagepub.com/doi/pdf/10.1177/1536867X1501500214);
* the `booktabs` command from [booktabs](https://github.com/daniel-alves-fernandes/booktabs) used to export the summary statistics tables;
* the `grc1leg` command by Vince Wiggins used to generate combined graphs with a single legend;
* the `sepscatter` command by [Kit Baum](https://www.statalist.org/forums/forum/general-stata-discussion/general/3803-sepscatter-available-from-ssc) used to generate graphs with one line for each value of a discrete variable.

Install them with
```
ssc install aidsills
net install booktabs, from("https://raw.githubusercontent.com/daniel-alves-fernandes/booktabs/main/")
net install grc1leg, from(http://www.stata.com/users/vwiggins/)
ssc install sepscatter
```

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
