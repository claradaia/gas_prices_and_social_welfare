# Save rds datasets as .dta
library(foreign)
library(stringr)

setwd(dirname(rstudioapi::getSourceEditorContext()$path))
files <- list.files(
  path="./Data/Dados_20210304",
  pattern="*.rds",
  full.names=TRUE,
  recursive=FALSE
)

for (i in 1:length(files)) {
  cat("reading", files[i], "\n")
  df <- readRDS(files[i])
  cat("writing", str_replace(files[i], ".rds", ".dta"), "\n")
  write.dta(df, str_replace(files[i], ".rds", ".dta"))
}
