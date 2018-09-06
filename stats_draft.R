#library(tidyverse)
#library(RColorBrewer)
#library(gridExtra)
#library(lubridate)
#library(GGally)
#library(ggrepel)

#kelp_ar <- read.csv(file = "data/kelp_ar.csv", check.names = FALSE, sep = ";")
#kelp_lgth <- read.csv(file ="data/kelp_length.csv", check.names = FALSE, sep = ";")
#data("varespec")

## community
# setup

library(ggpubr)
library(vegan)
library(MASS)
library(tidyverse)

flora_df <- read.csv(file = "data/flora.csv", sep = ";", check.names = FALSE)
fauna_df <- read.csv(file = "data/fauna.csv", check.names = FALSE, sep = ";")
benthic <- merge(flora_df,fauna_df,by=c("site","plot", "id"))

ben_bord <- benthic %>% 
  filter(site == "Bordjies")
ben_oud <- benthic %>% 
  filter(site == "Oudekraal")
ben_bet <- benthic %>% 
  filter(site == "Betty's Bay")

# Subset site names
bord_site <- subset(benbord, select = c(1))

bord_mat <- subset(ben_bord, select = c(4:77))
bord_mat_std <- bord_mat %>%
  decostand(method = "standardize")

# standardise measurements
cover_mat <- subset(cover_df, select = c(4:9))
cover_v3 <- cover_v2 %>%
  decostand(method = "standardize")

# Force site names as column 0
ben_cov <- cbind(benthic_v3, cover_v3)

# run RDA
com_RDA <- rda(ben_cov ~ ., data = cover_v3)

# Plot scaling = 2
plot(com_RDA, scaling  = 2)

# Summary
summary(com_RDA)



