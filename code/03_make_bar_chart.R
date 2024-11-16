here::i_am("code/03_make_bar_chart.R")

data <- readRDS(
  file = here::here("derived_data/data_clean.rds")
)

# Create new names for data visualization
new_names <- c("ADDEPEV3" = "mh status", "ACEDEPRS" = "depressed surrounded", "ACEDRINK" = "drink", "ACEDRUGS" = "drugs", "ACEPRISN" = "prison", "ACEDIVRC" = "divorce", "ACEPUNCH" = "punch", "ACEHURT1" = "physical violence", "ACESWEAR" = "swear", "ACETOUCH" = "sex touch", "ACETTHEM" = "force sex touch", "ACEHVSEX" = "sex", "EMPLOY1" = "employ", "INCOME2" = "income", "EDUCA" = "education", "MARITAL" = "marital")

# Visualizing Model Coefficients and Odds Ratios
# A value greater than 1 indicates that an increase in the predictor variable is associated with an increased odds of the outcome, while a value less than 1 indicates a decreased odds.
library(ggplot2)

model <- readRDS(
  file = here::here("output/logistic_regression.rds")
)

coef_df <- data.frame(
  variable = names(coef(model)),
  coefficient = coef(model),
  odds_ratio = exp(coef(model))
)

ggplot(coef_df, aes(x = variable, y = odds_ratio)) +
  geom_bar(stat = "identity") +
  labs(title = "Odds Ratios for the Mental Health Outcome",
       x = "Variables",
       y = "Odds Ratio") +
  theme_minimal() +
  scale_x_discrete(labels = new_names) + 
  theme(axis.text.x = element_text(size = 3))

ggsave(
  here::here("output/bar_chart.png"),
  device = "png"
)

