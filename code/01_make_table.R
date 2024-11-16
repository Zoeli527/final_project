here::i_am("code/01_make_table.R")

data <- readRDS(
  file = here::here("derived_data/data_clean.rds")
)

library(dplyr)
library(tidyr)

summary_table <- data %>%
  select(MARITAL, EDUCA, EMPLOY1, INCOME2) %>%
  gather(variable, value) %>%
  group_by(variable, value) %>%
  summarize(count = n()) %>%
  mutate(proportion = count / sum(count))

print(summary_table)

saveRDS(
  summary_table,
  file = here::here("output/table_one.rds")
)
