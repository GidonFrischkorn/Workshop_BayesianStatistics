pacman::p_load(here, brms, tidyverse)

data <- read.table(here("data","cardio-data.txt"), header = T)

sampleID <- sample(data$id, size = 5000)

reduced_data <- data %>% 
  filter(id %in% sampleID)

