# install.packages(c("ggplot2", "readr"))
library(ggplot2)
library(readr)

df <- read_csv(" data/Anemia_CBC_DATASET_for_research.csv")
df$Anemia <- as.factor(df$Anemia)

ggplot(df, aes(x = MCV, y = MCH, color = Anemia)) +
  geom_point(alpha = 0.65, size = 2.2) +
  stat_ellipse(level = 0.90, linewidth = 0.8) +
  scale_color_manual(values = c("Anemic" = "#D85A30", "Normal" = "#1D9E75")) +
  geom_vline(xintercept = 80, linetype = "dashed", color = "#888780", linewidth = 0.6) +
  geom_hline(yintercept = 27, linetype = "dashed", color = "#888780", linewidth = 0.6) +
  annotate("text", x = 60, y = 40, label = "Microcytaire", size = 3.5, color = "#5F5E5A") +
  annotate("text", x = 105, y = 40, label = "Normocytaire", size = 3.5, color = "#5F5E5A") +
  labs(
    title    = "Classification des anémies : MCV vs MCH",
    subtitle = "Les ellipses représentent 90% des patients de chaque groupe",
    x        = "MCV (fL) — Volume corpusculaire moyen",
    y        = "MCH (pg) — Hémoglobine corpusculaire moyenne",
    color    = "Diagnostic",
    caption  = "Seuils cliniques : MCV < 80 fL = microcytaire"
  ) +
  theme_minimal(base_size = 13) +
  theme(plot.title = element_text(face = "bold"))

ggsave("03_scatter_MCV_MCH.png", width = 9, height = 6, dpi = 300)