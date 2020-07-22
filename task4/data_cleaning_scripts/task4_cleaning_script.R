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
         trick_or_treating = are_you_going_actually_going_trick_or_treating_yourself) %>%
  write_csv("clean_data/candy_data_2015_clean.csv")

names(candy_data_2015_clean)
view(candy_data_2015_clean)

#cleaning 2016 data
candy_data_2016_clean <- read_excel("raw_data/boing-boing-candy-2016.xlsx") %>%
  select(1:106) %>%
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
  rename_with(~ gsub(".", "", .x, fixed = TRUE)) %>%
  rename_with(~ gsub(":", "", .x, fixed = TRUE)) %>%
  rename_with(~ tolower(gsub(" ", "_", .x, fixed = TRUE))) %>%
  rename_with(~ gsub("__", "_", .x, fixed = TRUE)) %>%
  rename(year = timestamp,
         age = how_old_are_you,
         trick_or_treating = are_you_going_actually_going_trick_or_treating_yourself,
         genger = your_gender,
         country = which_country_do_you_live_in) %>%
   write_csv("clean_data/candy_data_2016_clean.csv")

names(candy_data_2016_clean)
view(candy_data_2016_clean)


# cleaning 2017 data
candy_data_2017_clean <- read_excel("raw_data/boing-boing-candy-2017.xlsx") %>%
  select(2:109, -1, -5) %>%
  rename_with(~ gsub(" | ", "", .x, fixed = TRUE)) %>%
  rename_with(~ gsub("Q1: ", "", .x, fixed = TRUE)) %>%
  rename_with(~ gsub("Q2: ", "", .x, fixed = TRUE)) %>%
  rename_with(~ gsub("Q3: ", "", .x, fixed = TRUE)) %>%
  rename_with(~ gsub("Q4: ", "", .x, fixed = TRUE)) %>%
  rename_with(~ gsub("Q5:", "", .x, fixed = TRUE)) %>%
  rename_with(~ gsub("Q6", "", .x, fixed = TRUE)) %>%
  rename_with(~ gsub("-", "_", .x, fixed = TRUE)) %>%
  rename_with(~ gsub(".", "", .x, fixed = TRUE)) %>%
  rename_with(~ gsub(",", "", .x, fixed = TRUE)) %>%
  rename_with(~ gsub("?", "", .x, fixed = TRUE)) %>%
  rename_with(~ gsub("(", "", .x, fixed = TRUE)) %>%
  rename_with(~ gsub(")", "", .x, fixed = TRUE)) %>%
  rename_with(~ gsub("'", "", .x, fixed = TRUE)) %>%
  rename_with(~ gsub("’", "", .x, fixed = TRUE)) %>%
  rename_with(~ gsub("/", "_", .x, fixed = TRUE)) %>%
  rename_with(~ tolower(gsub(" ", "_", .x, fixed = TRUE))) %>%
  rename(trick_or_treating = going_out) %>%
  write_csv("clean_data/candy_data_2017_clean.csv")

names(candy_data_2017_clean)
view(candy_data_2017_clean)
