decathlon_data <- read_rds("raw_data/decathlon.rds") %>% #read in data
  rownames_to_column("athlete_name") %>%  #change row names to variable called "athlete_name"
  rename_with(~ tolower(gsub(".", "_", .x, fixed = TRUE))) %>%  #rename all variables to lowercase and replace all "." with "_"in variable names
  pivot_longer(cols = "100m":"1500m", #pivot all competiotions to long format
               names_to = "sport", # put all competition names to variable "sport"
               values_to = "result")  %>% #put all competitions results to variable "result"
  mutate(athlete_name = toupper(athlete_name)) %>% # for consistency mutate all names to uppercase
  write_csv("clean_data/clean_decathlon_data.csv")

view(decathlon_data)
 




