# install.packages(c("ggridges", "ggplot2", "readr", "dplyr"))
library(ggridges)
library(ggplot2)
library(readr)
library(dplyr)

df <- read_csv("data/Anemia_CBC_DATASET_for_research.csv")
df$Groupe <- paste(df$Sex, df$Anemia, sep = " — ")

ggplot(df, aes(x = Age, y = Groupe, fill = Anemia)) +
  geom_density_ridges(alpha = 0.7, scale = 1.2, bandwidth = 5) +
  scale_fill_manual(values = c("Anemic" = "#D85A30", "Normal" = "#1D9E75")) +
  labs(
    title    = "Distribution de l'âge selon le sexe et le diagnostic",
    subtitle = "Analyse épidémiologique — 364 patients",
    x        = "Âge (ans)",
    y        = NULL,
    fill     = "Diagnostic"
  ) +
  theme_minimal(base_size = 13) +
  theme(legend.position = "top",
        plot.title = element_text(face = "bold"))

ggsave("04_ridgeplot_age_sexe.png", width = 9, height = 6, dpi = 300)