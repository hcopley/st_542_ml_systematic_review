#data cleaning
library(here)
library(tidyverse)
library(janitor)



#gathering data for testing out text prep pipeline DO NOT DEDUPLICATE THIS WAY
df <- read.csv(here('04_output/','labeled_data.csv')) %>%
    # filter(!duplicated(doi) & !duplicated(doi, fromLast = TRUE)) %>%  # TODO: deduplication to be handled separately
    select(title, abstract, recd_screen) %>%
    distinct() %>%
    unite(col = 'text', title, abstract, sep = ' ') 

#write out to outputs folder
write.csv(df, here('04_output/', 'test_data.csv'))

