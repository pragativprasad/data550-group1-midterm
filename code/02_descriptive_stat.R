here::i_am("code/02_descriptive_stat.R")
data_clean<- readRDS("output/data_cleaned.rds")
library(magrittr)
library(tidyverse)
library(ggplot2)
library(table1)

table1(data_clean)
# label data
label(data_clean$DIABETES)       <- "Diabetes"
label(data_clean$COPD)       <- "COPD"
label(data_clean$ASTHMA)     <- "Asthmatic"
label(data_clean$INMSUPR) <- "Immunosuppressed"
label(data_clean$CARDIOVASCULAR) <- "CVD"
label(data_clean$OBESITY) <- "Obese"
label(data_clean$TOBACCO) <- "Tobacco User"

#create table 1

table_one <-table1( ~ DIABETES + COPD + ASTHMA + INMSUPR + CARDIOVASCULAR + OBESITY + TOBACCO,
                    data = data_clean)
table_one
saveRDS(file = "output/02_table_one.rds")

# establish chronic condition columns
chronic_condition <-data_clean %>%
  select(DIABETES, COPD, ASTHMA, INMSUPR, CARDIOVASCULAR, OBESITY) %>%
  mutate(across(.cols=everything(), 
                ~case_when(. == "Yes" ~ 1,
                           . == "No" ~ 0)))
# number of chronic conditions each patient has
chronic_condition$num_chronic_conditions <- rowSums(chronic_condition)

# organize data
condition_counts <- chronic_condition %>%
  group_by(num_chronic_conditions) %>%
  summarise(count = n()) %>%
  mutate(percentage = (count / sum(count)) * 100)

# Plot a bar plot
figure1 <- ggplot(data = condition_counts,
       aes(x = factor(num_chronic_conditions),y = percentage, fill = factor(num_chronic_conditions))) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(title = "Percentage of Patients by Number of Chronic Conditions",
       x = "Number of Chronic Conditions",
       y = "Percentage of Patients") +
  scale_fill_discrete(name = "Number of Chronic Conditions") +
  theme_minimal()

ggsave(filename = "output/02_conditioncount.png", 
       plot = figure1, 
       device = "png")

# mutate to group for comorbidities
chronic_condition_comorbid <-chronic_condition %>%
  mutate(comorbid = if_else(num_chronic_conditions < 2, "Less than 2 Chronic Conditions", 
                            "More than 2 Chronic Conditions")) %>%
  group_by(comorbid) 

# create table of comorbidities
table2 <-  tbl_summary(chronic_condition_comorbid,
                       include = everything(),
                       by = comorbid
                       )%>%
  add_p() %>% 
  modify_header(label = "Comorbid Chronic Condition by Condition") %>% 
  bold_labels()

ggsave(filename = "output/02_table2.png", 
       plot = table2, 
       device = "png")

#prep correlation for heat map
correlation <- cor(chronic_condition, use = "pairwise.complete.obs")

# Plot heatmap
heatmap <- heatmap(correlation,
        col = colorRampPalette(c("blue", "white", "red"))(100),
        symm = TRUE,
        margins = c(5, 10),
        main = "Correlation Heatmap of Chronic Conditions")

ggsave(filename = "output/02_heatmap.png", 
       plot = heatmap, 
       device = "png")