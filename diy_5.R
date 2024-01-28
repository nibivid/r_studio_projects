# Importing the necessary packages
library(dplyr)
library(openintro)
library(ggplot2)

# Importing the data
dataframe <- openintro::yrbss

# Check column names
colnames(dataframe)

# Plotting with ggplot2
ggplot(dataframe) +
  geom_jitter(aes(x = height, y = weight, shape = gender))


"""Convert the strength_training_variable into categories, 
with values between 0 as ‘no training’, 1-3 as ‘low training’, 3-5 as 
‘moderate training’ and more than 5 as ‘high training’
Make a bar plot of the mean weight of people in these categories
Reorder the bars in descending order and reduce their width
Now, flip the axis of the previous plot
Format the graph properly, with proper labels, captions, data source and colours"""

dataframe_mutated <- mutate(dataframe,
                            strength_training_variable = case_when(
                              strength_training_7d == 0 ~ "moderate_training", 
                              strength_training_7d < 3 & strength_training_7d >= 1 ~ "low_training",
                              strength_training_7d < 5 & strength_training_7d >= 3 ~ "moderate_training",
                              strength_training_7d > 5 ~ "high_training"
                            )
)

# Creating a bar plot on the data
dataframe %>%
  mutate(strength_training_variable = case_when(
    strength_training_7d == 0 ~ "moderate_training", 
    strength_training_7d < 3 & strength_training_7d >= 1 ~ "low_training",
    strength_training_7d < 5 & strength_training_7d >= 3 ~ "moderate_training",
    strength_training_7d > 5 ~ "high_training"
  )) %>%
  group_by(strength_training_variable) %>%
  summarise(count = n()) %>%
  ggplot(aes(x = strength_training_variable, y = count, fill = strength_training_variable)) +
  geom_bar(stat = "identity") +
  labs(title = "Bar Plot of Strength Training Variable",
       x = "Strength Training Variable",
       y = "Count") +
  theme_minimal()

