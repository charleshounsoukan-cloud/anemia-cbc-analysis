# install.packages(c("ggplot2", "readr"))
library(ggplot2)
library(readr)

df <- read_csv("data/Anemia_CBC_DATASET_for_research.csv")
df$Anemia <- as.factor(df$Anemia)

ggplot(df, aes(x = Anemia, y = HGB, fill = Anemia)) +
  geom_violin(alpha = 0.6, trim = FALSE) +
  geom_boxplot(width = 0.12, fill = "white", outlier.size = 1.5) +
  scale_fill_manual(values = c("Anemic" = "#D85A30", "Normal" = "#1D9E75")) +
  labs(
    title    = "Distribution de l'hémoglobine (HGB) selon le diagnostic",
    subtitle = "Dataset CBC — 364 patients",
    x        = "Statut clinique",
    y        = "HGB (g/dL)",
    caption  = "Source : Anemia CBC Research Dataset"
  ) +
  theme_minimal(base_size = 13) +
  theme(legend.position = "none",
        plot.title = element_text(face = "bold"))

ggsave("01_violin_HGB_anemia.png", width = 8, height = 6, dpi = 300)