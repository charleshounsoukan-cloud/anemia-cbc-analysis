# Anemia CBC Analysis | Analyse CBC de l'Anémie

![R](https://img.shields.io/badge/Language-R-276DC3?style=flat&logo=r)
![Status](https://img.shields.io/badge/Status-Complete-1D9E75)
![Dataset](https://img.shields.io/badge/Dataset-364%20patients-D85A30)

## 🇬🇧 English

### Overview
Comprehensive biomedical data analysis of anemia using Complete Blood Count (CBC) 
parameters from 364 patients (208 anemic, 156 normal).

This project demonstrates how data science tools can support clinical 
decision-making in hematology.

### Key Results
- **Random Forest model accuracy: 94.2%** (OOB Error: 5.8%)
- **HGB** is the strongest predictor of anemia, followed by PCV and RBC
- Clear clinical separation between anemic and normal patients confirmed 
  across multiple visualizations

### Visualizations produced
| # | Chart | Clinical insight |
|---|-------|-----------------|
| 01 | Violin plot — HGB distribution | HGB separates groups at ~11 g/dL |
| 02 | Correlation heatmap (CBC) | RBC-PCV (r=0.79), RBC-HGB (r=0.75) |
| 03 | Scatter MCV vs MCH | Microcytic vs normocytic classification |
| 04 | Ridge plot — Age by sex & diagnosis | Anemia peaks in women aged 20–40 |
| 05 | Radar chart — CBC profile | Full parameter comparison, normalized |
| 06 | Random Forest feature importance | HGB dominates, TLC least predictive |

### Tech stack
- **R 4.3.2** — ggplot2, randomForest, ggcorrplot, ggridges, fmsb, dplyr, readr
- **Dataset** — Anemia CBC Research Dataset (364 obs, 13 variables)

### Repository structure

---

## 🇫🇷 Français

### Vue d'ensemble
Analyse biomédicale complète de l'anémie à partir des paramètres de la 
Numération Formule Sanguine (NFS) sur 364 patients (208 anémiques, 156 normaux).

Ce projet illustre comment les outils de data science peuvent soutenir 
la prise de décision clinique en hématologie.

### Résultats clés
- **Précision du modèle Random Forest : 94,2%** (OOB Error : 5,8%)
- **L'HGB** est le paramètre le plus prédictif, suivi du PCV et du RBC
- Séparation clinique nette entre patients anémiques et normaux confirmée
  sur l'ensemble des visualisations

### Visualisations produites
| # | Graphique | Insight clinique |
|---|-----------|-----------------|
| 01 | Violin plot — Distribution HGB | L'HGB sépare les groupes autour de 11 g/dL |
| 02 | Heatmap de corrélation (CBC) | RBC-PCV (r=0,79), RBC-HGB (r=0,75) |
| 03 | Scatter MCV vs MCH | Classification microcytaire/normocytaire |
| 04 | Ridge plot — Âge par sexe et diagnostic | Pic d'anémie chez les femmes 20–40 ans |
| 05 | Radar chart — Profil CBC | Comparaison complète, valeurs normalisées |
| 06 | Importance des variables (RF) | HGB domine, TLC le moins prédictif |

### Stack technique
- **R 4.3.2** — ggplot2, randomForest, ggcorrplot, ggridges, fmsb, dplyr, readr
- **Dataset** — Anemia CBC Research Dataset (364 obs, 13 variables)

---

## Author | Auteur

**Charles Arnaud Jesutin HOUNSOU-KAN**  
Medical Biotechnologist | Biomedical Data Analyst  
📍 Cotonou, Bénin | 🌍 Open to remote consulting  
🔗 [LinkedIn](https://www.linkedin.com/in/charles-hounsou-kan/)
