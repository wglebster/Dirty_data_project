library(tidyverse) 
decathlon_data <- read_rds("data/decathlon.rds") %>% #read in data
  rownames_to_column("athlete_name") %>%  #change row names to variable called "athlete_name"
  rename_with(~ tolower(gsub(".", "_", .x, fixed = TRUE))) # rename all variables to lowercase and replace all "." with "_"in variable names
  
view(decathlon_data)

