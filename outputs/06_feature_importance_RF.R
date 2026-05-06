# install.packages(c("randomForest", "ggplot2", "readr", "dplyr"))
library(randomForest)
library(ggplot2)
library(readr)
library(dplyr)

df <- read_csv("data/Anemia_CBC_DATASET_for_research.csv")
df$Anemia <- as.factor(df$Anemia)
df <- df %>% select(-`S. No.`)

set.seed(42)
rf_model <- randomForest(
  Anemia ~ RBC + PCV + MCV + MCH + MCHC + RDW + TLC + HGB + Age,
  data       = df,
  ntree      = 500,
  importance = TRUE
)

importance_df <- data.frame(
  Variable   = rownames(importance(rf_model)),
  Importance = importance(rf_model)[, "MeanDecreaseGini"]
) %>% arrange(Importance)

importance_df$Variable <- factor(importance_df$Variable, levels = importance_df$Variable)

ggplot(importance_df, aes(x = Importance, y = Variable, fill = Importance)) +
  geom_col(show.legend = FALSE) +
  scale_fill_gradient(low = "#9FE1CB", high = "#085041") +
  labs(
    title    = "Importance des variables pour la prédiction de l'anémie",
    subtitle = "Random Forest — 500 arbres — MeanDecreaseGini",
    x        = "Importance (MeanDecreaseGini)",
    y        = NULL,
    caption  = "Plus la valeur est élevée, plus le paramètre est discriminant"
  ) +
  theme_minimal(base_size = 13) +
  theme(plot.title = element_text(face = "bold"))

ggsave("06_feature_importance_RF.png", width = 9, height = 6, dpi = 300)

# Afficher la précision du modèle
cat("\nPrécision du modèle :\n")
print(rf_model$confusion)
cat(sprintf("OOB Error rate : %.1f%%\n", rf_model$err.rate[500, "OOB"] * 100)) 