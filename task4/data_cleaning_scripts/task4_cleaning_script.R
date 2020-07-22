library(readxl)
library(tidyverse)
#Based on questions I am keeping the following data: 
#year, age, trick or treat, all cany bars columns, keep STARBURST, gender.
#I need to specify following countries: US, Canada, UK, Other. 

candy_data_2015_clean <- read_excel("raw_data/boing-boing-candy-2015.xlsx") %>%
  select(1:96) %>%
  rename_with(~ gsub("?", "", .x, fixed = TRUE)) %>%
  rename_with(~ gsub("/", "", .x, fixed = TRUE)) %>%
  rename_with(~ gsub("’", "_", .x, fixed = TRUE)) %>%
  rename_with(~ gsub("'", "_", .x, fixed = TRUE)) %>%
  rename_with(~ gsub("-", "_", .x, fixed = TRUE)) %>%
  rename_with(~ gsub("(", "", .x, fixed = TRUE)) %>%
  rename_with(~ gsub(")", "", .x, fixed = TRUE)) %>%
  rename_with(~ gsub(",", "", .x, fixed = TRUE)) %>%
  rename_with(~ gsub("’s", "", .x, fixed = TRUE)) %>%
  rename_with(~ gsub("]", "", .x, fixed = TRUE)) %>%
  rename_with(~ gsub("[", "", .x, fixed = TRUE)) %>%
  rename_with(~ tolower(gsub(" ", "_", .x, fixed = TRUE))) %>%
  rename_with(~ gsub("__", "_", .x, fixed = TRUE)) %>%
  rename(year = timestamp, 
         age = how_old_are_you,
         trick_or_treating = are_you_going_actually_going_trick_or_treating_yourself)

names(candy_data_2015_clean)
view(candy_data_2015_clean)


 candy_data_2016 <- read_excel("raw_data/boing-boing-candy-2016.xlsx")

names()
view(candy_data_2016)
# 
# candy_data_2017 <- read_excel("raw_data/boing-boing-candy-2017.xlsx")
# view(candy_data_2017)
