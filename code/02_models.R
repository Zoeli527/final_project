here::i_am("code/02_models.R")

data <- readRDS(
  file = here::here("derived_data/data_clean.rds")
)

library(tidyr)
model <- glm(ADDEPEV3 ~ ACEDEPRS + ACEDRINK + ACEDRUGS + ACEPRISN + ACEDIVRC + ACEPUNCH + ACEHURT1 + ACESWEAR + 
               ACETOUCH + ACETTHEM + ACEHVSEX + MARITAL + EDUCA + EMPLOY1 + INCOME2, 
             data = data, family = binomial())

summary(model)

saveRDS(
  model,
  file = here::here("output/logistic_regression.rds")
)
