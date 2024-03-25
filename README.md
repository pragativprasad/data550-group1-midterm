# data-550-group1-midterm

Group 1's Midterm Project for DATA 550 

------------------------------------------------------------------------

## Objective

In this project, we will estimate the effect of chronic conditions (specifically: diabetes, COPD, asthma, immune suppression, CVD, and obesity) on hospitalization and death of COVID-19 patients in Mexico. 

Source: https://datos.gob.mx/busca/dataset/informacion-referente-a-casos-covid-19-en-mexico

------------------------------------------------------------------------

## Team Members

 - Pragati Prasad
 - Jess Chan
 - Kanak Belgaum
 - Ariana Parquette
 - Sim Fan

------------------------------------------------------------------------

## Code Description

`code/01_data_cleaning.R`

  - inputs raw data from `raw_data/` folder
  - Handle missing data
  - Set outcome variables to binary
  - Change dependent variables (chronic conditions) to either binary or categorical with reference groups 
  - outputs cleaned/final dataset to `output/` folder

`code/02_descriptive_stat.R`

  - inputs cleaned dataset from `output/` folder
  - Make table 1 describing population data
  - Histograms of dependent variables (chronic conditions)
  - Scatter plot to visualize distribution of dependent variables (chronic conditions) amongst the patient data
  - outputs all plots and tables to `output/` folder

`code/03_modeling.R`

  - inputs cleaned dataset from `output/` folder
  - runs logistic regression models to estimate the effect of chronic conditions on hospitalization and death of COVID-19 patients in Mexico
  - outputs regression model as `output/regression.rds` file

`code/04_visualization.R`

  - inputs `output/regression.rds` file
  - Create regression model table
  - Diagnostic plots to evaluate model selection
    - Assess linearity assumption
  - outputs diagnostic plots to `output/` folder

`report.Rmd`

  - inputs all plots and tables
  - outputs formatted report file

  



