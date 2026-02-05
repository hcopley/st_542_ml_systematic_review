library(readr)
library(readxl)
library(skimr)
library(arsenal)
library(tidyverse)
library(janitor)


# Folder path
input <- '00_data_input/'

# Training data
train <- read_csv(paste0(input, "pdr006_nodups.csv")) %>%
    distinct() %>%
    clean_names()

# Records that were selected for full text screening
screened <- read_excel(paste0(input, "Copy of full-text screening 20190909.xlsx")) %>%
    distinct() %>%
    clean_names() 

#get summary information for the screened data
sum_screened <- skim(screened)
sum_train <- skim(train)

colnames(train)
colnames(screened)

#check which columns are in screened but not in train
setdiff(colnames(screened), colnames(train))

#compare the 2 datasets
comparison <- comparedf(train, screened, by = c('index' = 'x1'))
comparison$vars.summary


#Join screened data onto training data add a flag for the screened items
train_labeled <- train %>%
    left_join(screened %>% 
                  select(x1, title) %>%
                  distinct() %>%
                  mutate(recd_screen = 1), by = c('index' = 'x1')) %>%
    mutate(recd_screen = replace_na(recd_screen, 0))
    
#after matching on the index column and the first column in the screened data
#there is only 1 row with non-matching titles and this was simply a truncation 
#in the screened file
test_matches <-train_labeled %>%
    select(title.x, title.y) %>%
    filter(!is.na(title.y) & title.x != title.y)


#take a look at the resulting data profile:
labeled_sum <-skim(train_labeled)






