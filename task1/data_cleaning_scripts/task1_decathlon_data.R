library(tidyverse) 
decathlon_data <- read_rds("raw_data/decathlon.rds") %>% #read in data
  rownames_to_column("athlete_name") %>%  #change row names to variable called "athlete_name"
  rename_with(~ tolower(gsub(".", "_", .x, fixed = TRUE))) %>%  #rename all variables to lowercase and replace all "." with "_"in variable names
  pivot_longer(cols = "100m":"1500m", #pivot all competiotions to long format
               names_to = "sport", # put all competition names to variable "sport"
               values_to = "result")  %>% #put all competitions results to variable "result"
  mutate(athlete_name = toupper(athlete_name)) # for consistency mutate all names to uppercase

view(decathlon_data)
 
#find longest long jump
long_jump <- decathlon_data %>%
 filter(sport == "long_jump") %>%
 arrange(desc(result)) %>%
 select(athlete_name, result) %>%
 head(1)

#find average time in 100m for each competition
avg_100m_both <- decathlon_data %>%
  filter(sport == "100m") %>%
  group_by(competition) %>%
  summarise(cometition = unique(competition), 
            average_result = mean(result)) %>%
  select(competition, average_result)

avg_100m_both

