library(readxl)
library(tidyverse)
#Based on questions I am keeping the following data: 
#year, age, gender, trick or treat, all cany bars columns. 
#I need to specify following countries: US, Canada, UK, Other. I have also specified UNKNOWN for
#countries which were NA.

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
         gender = your_gender,
         country = which_country_do_you_live_in)

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
  rename_with(~ gsub("/", "_", .x, fixed = TRUE)) %>%
  rename_with(~ tolower(gsub("going out", "trick_or_treating", .x, fixed = TRUE))) %>%
  rename_with(~ tolower(gsub(" state province county etc", "country", .x, fixed = TRUE))) %>%
  rename_with(~ tolower(gsub(" ", "_", .x, fixed = TRUE)))

#create_location classification vectors: 
location_canada <- c("Canada", "québec", "canada", "canada", "canada", "Quebec", "Alberta",
                    "yukon", "ontario", "Ontario", "va", "vancouver, bc", "British Columbia",
                    "Newfoundland", "newfoundland", "ON", "Saskatchewan", "Manitoba",
                    "Ontario,  Canada", "QC", "Albeqrrta", "Toronto, Ontario", "Victoria",
                    "On", "nova scotia", "ont", "british columbia", "Quenec", "NS", "Nova Scotia",
                    "ONTARIO", "British Columbia, Canada", "Emerald City, Petrolia", "alberta",
                    "Newfoundland and Labrador", "Oshawa, Ontario, Canada", "Québec", "Ont")
location_uk <- c("england", "uk", "United Kingdom", "England", "Londom", "england",
                 "uk", "United Kingdom", "United Kindom", "aberdeenshire", "Scotland", "London",
                 "OXFORDSHIRE", "Oxfordshire", "South Holland", "Derbyshire", "Greater London",
                 "AB", "Sussex", "Greater Manchester", "Fife, Scotland", "Bristol", "Edinburgh",
                 "Strathclyde", "Lancasire", "Surrey", "Northern ireland", "Midlothian", "Glasgow",
                 "Devonshire", "kent", "West Yorkshire")
location_other <- c("Japan", "france", "A tropical island south of the equator", 
                    "Switzerland", "Neverland", "this one", "Korea", "51.0", "belgium", 
                    "croatia", "Portugal", "47.0", "españa", 
                    "there isn't one for old men", "Panama", "one of the best ones",
                    "France", "Australia", "hungary", "Austria", "Somewhere", "New Zealand",
                    "54.0", "Germany", "Mexico", "44.0", "Brasil", "god's country",
                    "South Korea", "Philippines", "EUA", "45.0", "sweden", "The Netherlands", 
                    "Finland", "China", "germany", "See above", "kenya", "30.0", "Netherlands",
                    "Not the USA or Canada", "netherlands", "Denial", "Abu Dhabi", "CDMX", "Nope", 
                    "Baja California", "sk", "hesse", "Sub Earth", "48", "Sydney", 
                    "oblivion if things keep going this way", "Noord-Holland", "qld", "Kildare",
                    "Tokyo", "KwaZulu-Natal", "Ørbæk", "Zuid Holland", "Osaka", "Idf", "pr", 
                    "Vaud", "see question 2", "Seoul", "Kanagawa", "Jakarta", 
                    "Mannheim, Baden-Württemberg", "Rotterdam", "N-Brabant", "Greifswald", "Hessen",
                    "NOYB", "NSW", "Singapore", "Shanghai, Chang Ning district", "Hong Kong",
                    "Dublin", "madrid", "Hesse", "Noord-Brabant", "Skane", "Zürich", "NL", "Munster",
                    "Stockholm", "Berlin", "1", "ur mom", "Psychotic")

#stack all tables together

candy_data_combined <- bind_rows(candy_data_2015_clean, 
                                candy_data_2016_clean, 
                                candy_data_2017_clean) %>%
  select(1,2,3,97,98,4:142) %>%
  select( -40, -43, -99, -101, -116, -138, -142) %>%
  mutate(year = substr(year,1,4), 
         age = as.integer(age)) %>% 
  mutate(country = case_when( # classify countries using above vectors, any country that is not
  #in any of the vectors and is not NA, is classified as US. NA countries classified as UNKNOWN.
    country %in% location_canada ~ "CANADA",
    country %in% location_other ~ "OTHER",
    country %in% location_uk ~ "UK",
    is.na(country) ~ "UNKNOWN", 
    TRUE ~ "US"
  )) %>%
write_csv("clean_data/candy_data_combined.csv")
