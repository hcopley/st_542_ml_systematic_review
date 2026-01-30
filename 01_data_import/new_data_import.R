library(tidyverse)
library(revtools)
library(skimr)

# Folder path
input <- '00_input/'

#read in the new data for prediction
df <- read_bibliography(
    paste0(input, '20190401_20200131.ris')
)

data_sum <- skim(df)


pct_missing_abstracts <- mean(is.na(df$abstract) | df$abstract == "")

df <- df %>%
    mutate(abstract_len = str_length(coalesce(abstract, "")))

cat("Records:", n_records, "\n")
cat("% missing abstracts:", scales::percent(pct_missing_abstracts), "\n")
summary(df$abstract_len)

df$abstract[2]
