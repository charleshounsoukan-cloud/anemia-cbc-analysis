library(fmsb)
library(readr)
library(dplyr)

df <- read_csv("data/Anemia_CBC_DATASET_for_research.csv")

vars <- c("RBC", "PCV", "MCV", "MCH", "MCHC", "RDW", "HGB")

normalize <- function(x) (x - min(x)) / (max(x) - min(x))
df_norm <- df %>% mutate(across(all_of(vars), normalize))

anemic_mean <- df_norm %>% filter(Anemia == "Anemic") %>%
  summarise(across(all_of(vars), mean)) %>% as.numeric()

normal_mean <- df_norm %>% filter(Anemia == "Normal") %>%
  summarise(across(all_of(vars), mean)) %>% as.numeric()

# Construction propre du dataframe pour fmsb
radar_df <- as.data.frame(rbind(
  rep(1, length(vars)),   # ligne max
  rep(0, length(vars)),   # ligne min
  anemic_mean,
  normal_mean
))
colnames(radar_df)  <- vars
rownames(radar_df)  <- c("Max", "Min", "Anémique", "Normal")

png("05_radar_profil_CBC.png", width = 800, height = 700, res = 150)
radarchart(radar_df,
           axistype   = 1,
           pcol       = c("#D85A30", "#1D9E75"),
           pfcol      = c(rgb(0.85, 0.35, 0.19, 0.35), rgb(0.11, 0.62, 0.46, 0.35)),
           plwd       = 2.5,
           cglcol     = "grey80",
           cglty      = 1,
           axislabcol = "grey50",
           vlcex      = 0.85,
           title      = "Profil CBC moyen : Anémique vs Normal (valeurs normalisées)")
legend("bottomright",
       legend = c("Anémique", "Normal"),
       col    = c("#D85A30", "#1D9E75"),
       lwd    = 2.5, bty = "n", cex = 0.9)
dev.off()
