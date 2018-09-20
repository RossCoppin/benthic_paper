
library(vegan)
library(MASS)
library(tidyverse)
library(ggplot2)
library(reshape2)

### Data wrangling

flora <- read.csv(file = "data/flora.csv", sep = ";", check.names = TRUE)
fauna <- read.csv(file = "data/fauna.csv", sep = ";", check.names = TRUE)
cover <- read.csv(file = "data/cover.csv", sep = ";", check.names = TRUE)

### Community

flora_lng <- melt(flora, id.vars = c("site", "plot", "id"), variable.name = "species", value.name = "biomass")
fauna_lng <- melt(fauna, id.vars = c("site", "plot", "id"), variable.name = "species", value.name = "biomass")

# Boxplots of flora and fauna biomass data

flora_plot <- ggplot(data = flora_lng, aes(x= species, y= biomass)) + 
  geom_boxplot() + 
  facet_wrap(~site) + 
  coord_flip() + 
  xlab("") + 
  ylab("")

fauna_plot <- ggplot(data = fauna_lng, aes(x= species, y= biomass)) + 
  geom_boxplot() + 
  facet_wrap(~site) + 
  coord_flip() + 
  xlab("") + 
  ylab("")


### Diversity

### Temperature environment

### Wave environment

### Investigate driver





