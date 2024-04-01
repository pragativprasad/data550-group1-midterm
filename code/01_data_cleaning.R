here::i_am("code/01_data_cleaning.R")
absolute_path_to_data <- here::here("raw_data/covid_sub.csv")
data1 <- read.csv(absolute_path_to_data, header = TRUE)
library(tibble)
library(dplyr)
library(tidyverse)


#seperate the variablels that we want
desired_cols <- c("DIABETES", "COPD", "ASTHMA","INMSUPR", "CARDIOVASCULAR", "OBESITY","PATIENT_TYPE","DATE_DIED","TOBACCO")
data <- data1[, desired_cols]

### Check class/object type of data:
#class(data)
### Get names of variables:
#names(data)
### Get types of variables:
#str(data)
### Check # of rows/observations and  columns/variables:
#dim(data)

#check how many missing variables are there, turns out that patient_type do not has missing
#sum(is.na(data$DIABETES))
#sum(is.na(data$COPD))
#sum(is.na(data$ASTHMA))
#sum(is.na(data$INMSUPR))
#sum(is.na(data$CARDIOVASCULAR))
#sum(is.na(data$OBESITY))
#sum(is.na(data$PATIENT_TYPE))
#sum(is.na(data$TOBACCO))

#check if there is mistype input, the answer is no.
#length(unique(data[,"DIABETES"])) 
#length(unique(data[,"COPD"])) 
#length(unique(data[,"ASTHMA"])) 
#length(unique(data[,"INMSUPR"])) 
#length(unique(data[,"CARDIOVASCULAR"])) 
#length(unique(data[,"OBESITY"])) 
#length(unique(data[,"PATIENT_TYPE"])) 
#length(unique(data[,"TOBACCO"])) 

#create a cleaned data that without missing data's except DATE_DIED
data_cleaned <- filter(data, !is.na(DIABETES) & !is.na(ASTHMA) & !is.na(INMSUPR) & !is.na(CARDIOVASCULAR) & !is.na(OBESITY) & !is.na(TOBACCO)  )

#create a new variable for DIABETES, COPD, ASTHMA, INMSUPR, CARDIOVASCULAR, OBESITY, TOBACCO that changes Yes=1, No=0
data_cleaned$DIABETES_N <- ifelse(data_cleaned$DIABETES == "Yes", 1, 0)
data_cleaned$COPD_N <- ifelse(data_cleaned$COPD == "Yes", 1, 0)
data_cleaned$ASTHMA_N <- ifelse(data_cleaned$ASTHMA == "Yes", 1, 0)
data_cleaned$INMSUPR_N <- ifelse(data_cleaned$INMSUPR == "Yes", 1, 0)
data_cleaned$CARDIOVASCULAR_N <- ifelse(data_cleaned$CARDIOVASCULAR == "Yes", 1, 0)
data_cleaned$OBESITY_N <- ifelse(data_cleaned$OBESITY == "Yes", 1, 0)
data_cleaned$TOBACCO_N <- ifelse(data_cleaned$TOBACCO == "Yes", 1, 0)

#create a new variable for PATIENT_TYPE. hospitalization=1, returned home=0
data_cleaned$PATIENT_TYPE_N <- ifelse(data_cleaned$PATIENT_TYPE == "hospitalization", 1, 0)

#create a new variable for DATE_DIED. if there's any data then DATE_DIED_N=1, if there is non then DATE_DIED_N=0
data_cleaned$DATE_DIED_N <- ifelse(data_cleaned$DATE_DIED == "NA", 0, 1)
numeric_cols <- sapply(data_cleaned, is.numeric) 
data_cleaned[numeric_cols][is.na(data_cleaned[numeric_cols])] <- 0

saveRDS(
  data_cleaned, 
  file = here::here("output/data_cleaned.rds")
)



