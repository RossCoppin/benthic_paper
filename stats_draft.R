#library(tidyverse)
#library(RColorBrewer)
#library(gridExtra)
#library(lubridate)
#library(GGally)
#library(ggrepel)

#kelp_ar <- read.csv(file = "data/kelp_ar.csv", check.names = FALSE, sep = ";")
#kelp_lgth <- read.csv(file ="data/kelp_length.csv", check.names = FALSE, sep = ";")
#data("varespec")
#ben_bord <- benthic %>% 
#  filter(site == "Bordjies")
#ben_oud <- benthic %>% 
#  filter(site == "Oudekraal")
#ben_bet <- benthic %>% 
#  filter(site == "Betty's Bay")
## community
# setup

library(ggpubr)
library(vegan)
library(MASS)
library(tidyverse)

#flora_df <- read.csv(file = "data/flora.csv", sep = ";", check.names = FALSE)
#fauna_df <- read.csv(file = "data/fauna.csv",  sep = ";", check.names = FALSE)
#species_df <- read.csv(file = "data/species.csv", sep = ";", check.names = FALSE)
#cover_df <- read.csv(file = "data/cover.csv", sep = ";", check.names = FALSE)


##RDA

benthic_df <- read.csv(file = "data/test.csv", sep = ";", check.names = FALSE)

# Rename data set
benthic_site0 <- benthic_df

# Subset site names
benthic_site <- subset(benthic_site0, select = c(1))

# Subset out species data
species_mat <- subset(benthic_site0, select = c(10:81))

# Subset out cover data
cover_mat <- subset(benthic_site0, select = c(4:8))

# Standardise cover data
cover_mat_std <- cover_mat %>%
  decostand(method = "standardize")

# Standardise species data
species_mat_std <- species_mat %>%
  decostand(method = "standardize")

# Force site names as column 0
species <- cbind(benthic_site, species_mat_std)

species <- species %>%
  column_to_rownames(var = "site")


eck_wave_RDA <- rda(cover_mat_std ~ ., data = species_mat_std)
# Plot scaling = 2
plot(eck_wave_RDA, scaling  = 2)

# Summary
summary(eck_wave_RDA)


