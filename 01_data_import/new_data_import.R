library(tidyverse)
#library(revtools)
library(synthesisr)
library(skimr)

# Folder path
input <- '00_data_input/'
output <- '04_output/'

#read in a single .ris file to test  
df <- read_ref(
    paste0(input, '20190401_20200131.ris')
)

#get the names of all of the new data files (ending with .ris)
new_data_files <- list.files(path = input, pattern = '.ris', full.names = TRUE)

#read in all of the new data files and combine into a single data frame
#keep the file name as a column for reference
new_data <- new_data_files %>%
    set_names(basename(.)) %>%
    map(read_ref) %>%
    enframe(name = 'file') %>%
    unnest(cols = c(value))


#get the summary information for the new data
data_sum <- skim(new_data)

write.csv(new_data, 
          paste0(output, 
                 'combined_new_data.csv'), 
          row.names = FALSE)

