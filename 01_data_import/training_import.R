library(readr)
library(readxl)
library(dplyr)
library(skimr)
library(arsenal)

# Folder path
input <- '00_input/'

# Training data
train <- read_csv(paste0(input, "pdr006_nodups.csv")) %>%
    distinct()
# Records that were selected for full text screening
screened <- read_excel(paste0(input, "Copy of full-text screening 20190909.xlsx")) %>%
    distinct()

#get summary information for the screened data
sum_screened <- skimr(screened)

colnames(train)
colnames(screened)

#check which columns are in screened but not in train
setdiff(colnames(screened), colnames(train))

#compare the 2 datasets
comparison <- comparedf(train, screened, by = 'id')

#


#Join screened data onto training data add a flag for the screened items
train_labeled <- train %>%
    left_join(screened %>% 
                  select(id) %>%
                  distinct() %>%
                  mutate(recd_screen = 1), by = "id")
    

# Basic structure checks
dim(train_labeled)
colnames(train_labeled)


