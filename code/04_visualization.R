# set path and packages
here::i_am('code/04_visualization.R')
install.packages('ggfortify')
library('ggfortify')

# loading data & regression files
data_cleaned <- readRDS(here::here(
  'output/data_cleaned.rds')
)

model_1 <- readRDS(here::here(
  'output/model_1.rds')
)

model_2 <- readRDS(here::here(
  'output/model_2.rds')
)

#Plot of predicted probabilities vs observed
predicted_probs <- predict(model_1, newdata=data_cleaned, type='response')

observed_response <- data_cleaned$PATIENT_TYPE_N

df_predicted_observed <- data.frame(Observed=observed_response,
                                    Predicted=predicted_probs)
ggplot(df_predicted_observed, aes(x=Observed, y=Predicted))+
  geom_point()+
  geom_abline(slope=1, intercept=0, color='blue')+
  labs(x='Observed', y='Predicted', title='Observed vs. Predicted Values')

#plot marginal effects
install.packages('effects')
library(effects)

model_1_effects <- plot(allEffects(model_1))
saveRDS(model_1_effects, here::here(
  'output/model_1_effects.rds')
)

model_2_effects <- plot(allEffects(model_2))
saveRDS(model_2_effects, here::here(
  'output/model_2_effects.rds')
)

