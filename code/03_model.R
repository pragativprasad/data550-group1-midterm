# Set path
here::i_am("code/03_model.R")

# Load Library
library(dplyr)
library(gtsummary)

# Load clean data set
data_cleaned <- readRDS(file = here::here("output/data_cleaned.rds"))

# Logistic regression models to estimate the effect of chronic conditions on hospitalization and death of COVID-19 patients in Mexico
# Chronic conditions: diabetes, COPD, asthma, immune suppression, CVD, and obesity

# Model 1: Chronic conditions on hospitalization
model_1 <- glm(PATIENT_TYPE_N ~ DIABETES_N + COPD_N + ASTHMA_N + INMSUPR_N + CARDIOVASCULAR_N + OBESITY_N,
               data = data_cleaned, 
               family = "binomial") 
summary(model_1)

# Model 2: Chronic conditions on COVID-19 deaths
model_2 <- glm(DATE_DIED_N ~ DIABETES_N + COPD_N + ASTHMA_N + INMSUPR_N + CARDIOVASCULAR_N + OBESITY_N,
               data = data_cleaned, 
               family = "binomial") 
summary(model_2)

# Table Model 1 Results
model_1_results <- tbl_regression(model_1, exponentiate = TRUE,
                                  label = list(DIABETES_N ~ "Diabetes", COPD_N ~ "COPD", ASTHMA_N ~ "Asthme",
                                               INMSUPR_N ~ "Immune Supression", CARDIOVASCULAR_N ~ "CVD",
                                               OBESITY_N ~ "Obesity")) %>%
                  modify_caption("**Table 1. Association of Chronic Conditions on Patient Hospitalization**") %>%
                  as_gt() %>%
                  gt::tab_source_note(gt::md("*CVD = Cardiovascular Disease*"))
                    
model_1_results

# Table Model 2 Results
model_2_results <- tbl_regression(model_2, exponentiate = TRUE,
                                  label = list(DIABETES_N ~ "Diabetes", COPD_N ~ "COPD", ASTHMA_N ~ "Asthme",
                                               INMSUPR_N ~ "Immune Supression", CARDIOVASCULAR_N ~ "CVD",
                                               OBESITY_N ~ "Obesity")) %>%
                   modify_caption("**Table 2. Association of Chronic Conditions on Patient Deaths**") %>%
                   as_gt() %>%
                  gt::tab_source_note(gt::md("*CVD = Cardiovascular Disease*"))

model_2_results

# Save the table output
saveRDS(model_1_results, file = here::here("output/model_1_results.rds"))
saveRDS(model_2_results, file = here::here("output/model_2_results.rds"))