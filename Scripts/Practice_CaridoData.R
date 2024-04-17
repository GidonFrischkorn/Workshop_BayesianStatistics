# Load packages
pacman::p_load(here, brms, tidyverse)

# Load data
data <- read.table(here("data","cardio-data.txt"), header = T)

# create subset of 5000 random subjects if models run to long
sampleID <- sample(data$id, size = 5000)
reduced_data <- data %>% 
  filter(id %in% sampleID)


# create a simple plot showing the relationship between some variables
ggplot(data = reduced_data,
       aes(x = weight, y = blood_high)) +
  geom_point() +
  geom_smooth(method = "lm") +
  theme_bw() +
  theme(panel.grid.minor.x = element_blank(),
        panel.grid.major.x = element_blank())

ggplot(data = reduced_data,
       aes(x = age, y = blood_high)) +
  geom_point() +
  geom_smooth(method = "lm") +
  theme_bw() +
  theme(panel.grid.minor.x = element_blank(),
        panel.grid.major.x = element_blank())

ggplot(data = reduced_data,
       aes(x = height, y = blood_high)) +
  geom_point() +
  geom_smooth(method = "lm") +
  theme_bw() +
  theme(panel.grid.minor.x = element_blank(),
        panel.grid.major.x = element_blank())
