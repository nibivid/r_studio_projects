library(openintro)
library(tidyverse)
library(dplyr)
library(openintro)
#importing the dataset 
yrbss_samp <- openintro:: yrbss_samp

colnames(yrbss_samp)
yrbss_samp |>
  mutate(
    strength_training_7d = case_when(
      strength_training_7d < 0 ~ "No traning",
      strength_training_7d <= 3 & strength_training_7d >1 ~ "low Income",
      strength_training_7d <= 5 &  strength_training_7d > 3~ "moderate_training",
      strength_training_7d > 5 ~ "high training")
  )


yrbss_samp$strength_training_7d
%>% 