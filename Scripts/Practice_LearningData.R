# Load packages
pacman::p_load(here, brms, tidyverse)

# Load data
data <- read.table(here("data","learning-data.txt"), header = T)

# Descriptive plot of the data
ggplot(data = data,
       aes(x = repetition, y = p_correct)) +
  stat_summary() + 
  labs(x = "Number of repetitions", y = "Proportion Correct") +
  theme_bw() +
  theme(panel.grid.minor.x = element_blank(),
        panel.grid.major.x = element_blank())
