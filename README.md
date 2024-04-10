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

  - run with `make data`
  - inputs raw data from `raw_data/` folder
    - `raw_data/covid_sub.csv`
  - Handle missing data
  - Set outcome variables to binary
  - Change dependent variables (chronic conditions) to either binary or categorical with reference groups 
  - outputs cleaned/final dataset to `output/` folder
    - `output/data_cleaned.rds`
    

`code/02_descriptive_stat.R`

  - run with `make descriptive`
  - inputs cleaned dataset from `output/` folder
    - `output/data_cleaned.rds`
  - Make table 1 describing population data
  - Histograms of dependent variables (chronic conditions)
  - Scatter plot to visualize distribution of dependent variables (chronic conditions) amongst the patient data
  - outputs all plots and tables to `output/` folder
    - `output/02_table_one.rds` 
    - `output/02_conditioncount.png` 
    - `output/02_table2.png` 
    - `output/02_heatmap.png`

`code/03_modeling.R`

  - run with `make regression`
  - inputs cleaned dataset from `output/` folder
    - `output/data_cleaned.rds`
  - runs logistic regression models to estimate the effect of chronic conditions on hospitalization and death of COVID-19 patients in Mexico
  - outputs regression models in `output` folder
    - `output/model_1.rds` 
    - `output/model_2.rds` 
    - `output/model_1_results.rds` 
    - `output/model_2_results.rds`

`code/04_visualization.R`

  - run with `make visualize`
  - inputs regression files from `output/` folder
    - `output/data_cleaned.rds` 
    - `output/model_1.rds` 
    - `output/model_2.rds`
  - Create regression model table
  - Diagnostic plots to evaluate model selection
    - Assess linearity assumption
  - outputs diagnostic plots to `output/` folder
    - `output/model_1_effects.rds` 
    - `output/model_2_effects.rds`

`report.Rmd`

  - run with `make report.html`
  - inputs all plots and tables
  - outputs formatted report file

  



