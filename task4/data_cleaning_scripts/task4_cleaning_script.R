library(readxl)
library(tidyverse)

candy_data_2015 <- read_excel("raw_data/boing-boing-candy-2015.xlsx")
view(candy_data_2015)

candy_data_2016 <- read_excel("raw_data/boing-boing-candy-2016.xlsx")
view(candy_data_2016)

candy_data_2017 <- read_excel("raw_data/boing-boing-candy-2017.xlsx")
view(candy_data_2017)
