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

benthic_RDA <- rda(cover_mat_std ~ ., data = species_mat_std)
# Plot scaling = 2
plot(benthic_RDA, scaling  = 2)

# Summary
summary(benthic_RDA)


