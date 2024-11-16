here::i_am("code/00_clean_data.R")
absolute_path_to_data <- here::here("raw_data", "brfss2020.csv")
brfss <- read.csv(absolute_path_to_data, header = TRUE)

# Create a new dataset with only the variables I need, and remove rows containing NA values.
library(dplyr)
select <- select(brfss, 52, 58, 59, 65, 67, 188:198)

clean <- na.omit(select)

# Recategorize variables as 1 (Yes), 0 (Others)
model_variables <- clean %>%
  mutate(
    ACEDEPRS = ifelse(ACEDEPRS == "1", 1, 0),
    ACEDRINK = ifelse(ACEDRINK == "1", 1, 0),
    ACEDRUGS = ifelse(ACEDRUGS == "1", 1, 0),
    ACEPRISN = ifelse(ACEPRISN == "1", 1, 0),
    ACEDIVRC = ifelse(ACEDIVRC == "1", 1, 0),
    ACEPUNCH = ifelse(ACEPUNCH %in% c("2", "3"), 1, 0),
    ACEHURT1 = ifelse(ACEHURT1 %in% c("2", "3"), 1, 0),
    ACESWEAR = ifelse(ACESWEAR %in% c("2", "3"), 1, 0),
    ACETOUCH = ifelse(ACETOUCH%in% c("2", "3"), 1, 0),
    ACETTHEM = ifelse(ACETTHEM%in% c("2", "3"), 1, 0),
    ACEHVSEX = ifelse(ACEHVSEX%in% c("2", "3"), 1, 0),
    MARITAL = ifelse(MARITAL%in% c("2", "5", "6", "9"), 1, 0),
    EDUCA = ifelse(EDUCA%in% c("1", "2", "3", "4", "9"), 1, 0),
    EMPLOY1 = ifelse(EMPLOY1%in% c("3", "4", "5", "6", "8", "9"), 1, 0),
    INCOME2 = ifelse(INCOME2%in% c("4", "3", "2", "1", "77", "99"), 1, 0),
    ADDEPEV3 = ifelse(ADDEPEV3 == "1", 1, 0),
  )

saveRDS(
  model_variables, 
  file = here::here("derived_data/data_clean.rds")
)
