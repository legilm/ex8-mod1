if (!require('ggplot2')) install.packages('ggplot2'); library('ggplot2')
if (!require('dplyr')) install.packages('ggplot2'); library('ggplot2')

# Load necessary libraries
library(ggplot2)
library(dplyr)

# Load the mtcars dataset
data("mtcars")

# Data manipulation: Add a factor column for cylinders
mtcars <- mtcars %>%
  mutate(cyl_factor = factor(cyl, levels = c(4, 6, 8), labels = c("4 Cyl", "6 Cyl", "8 Cyl")))

# Summarize the dataset: Calculate mean MPG by cylinder category
summary_table <- mtcars %>%
  group_by(cyl_factor) %>%
  summarise(mean_mpg = mean(mpg, na.rm = TRUE))

print(summary_table)

# Plot
ggplot(mtcars, aes(x = hp, y = mpg, color = cyl_factor)) +
  geom_point(size = 3, alpha = 0.7) +
  labs(title = "MPG vs. Horsepower",
       x = "Horsepower (HP)",
       y = "Miles Per Gallon (MPG)",
       color = "Cylinders") +
  theme_minimal()

install.packages("ggplot2")
install.packages("dplyr")
```