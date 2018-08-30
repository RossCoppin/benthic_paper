library(tidyverse)
library(RColorBrewer)
library(gridExtra)
library(lubridate)
library(GGally)
library(ggpubr)
library(ggrepel)

kelp_ar <- read.csv(file = "data/kelp_ar.csv", check.names = FALSE, sep = ";")
kelp_lgth <- read.csv(file ="data/kelp_length.csv", check.names = FALSE, sep = ";")
data("varespec")

## community

library(vegan)
library(MASS)
library(reshape2)


flora_df <- read.csv(file = "data/flora.csv", sep = ";", check.names = FALSE)
fauna_df <- read.csv(file = "data/fauna.csv", check.names = FALSE, sep = ";")
benthic <- merge(flora_df,fauna_df,by=c("site","plot", "id"))
cover_df <- read.csv(file = "data/cover.csv", check.names = FALSE, sep = ";")
benthic_pa <- vegdist(benthic_v2, binary = TRUE)

summary(flora_df)
summary(fauna_df)

benthic_v2 <- subset(benthic, select = c(4:77))
benthic.dis <- vegdist(benthic_v2)  
benthic.mds0 <- isoMDS(benthic.dis)
stressplot(benthic.dis,benthic.mds0)
benthic.mds <- metaMDS(benthic_v2, trace = FALSE)
benthic.mds
plot(benthic.mds, type = "t")

#RDA

# standardise wave measurements

benthic_v2 <- subset(benthic, select = c(4:77))
benthic_v3 <- benthic_v2 %>%
  decostand(method = "standardize")

# standardise measurements
cover_v2 <- subset(cover_df, select = c(4:9))
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



