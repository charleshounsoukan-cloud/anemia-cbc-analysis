# install.packages(c("ggcorrplot", "readr"))
library(ggcorrplot)
library(readr)

df <- read_csv("data/Anemia_CBC_DATASET_for_research.csv")

# Sélection des variables numériques biologiques
cbc_vars <- df[, c("RBC", "PCV", "MCV", "MCH", "MCHC", "RDW", "TLC", "HGB")]
corr_matrix <- round(cor(cbc_vars, use = "complete.obs"), 2)

ggcorrplot(corr_matrix,
           method   = "circle",
           type     = "lower",
           lab      = TRUE,
           lab_size = 3.5,
           colors   = c("#D85A30", "white", "#1D9E75"),
           title    = "Corrélations entre paramètres CBC",
           ggtheme  = theme_minimal(base_size = 12))

ggsave("02_heatmap_correlation_CBC.png", width = 8, height = 7, dpi = 300)