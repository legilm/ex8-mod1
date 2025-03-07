# Exercise: Handling Merge Conflicts in Git Using RStudio

## Context: Understanding & Resolving Merge Conflicts

### Scenario
#You and a teammate are collaborating on an R project analyzing the `mtcars` dataset in `conflict_test.R`. You make different changes to the same file, leading to a merge conflict when combining your work into `main`. This exercise guides you through creating and encountering the conflict using RStudio.

### Format
#**Pair or small group exercise (if possible)**
  
  ---
  ## Part 1: Set Up Repository and Branches
  
  ### Step 1: Set Up the Repository
  1. One student creates a GitHub repository named `exercice8` and adds the teammate as a collaborator.
2. Clone the repo to RStudio using the Version Control option.
3. Create `conflict_test.R` in the `main` branch with the following content:
  
  ```r
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
```

4. Install `ggplot2` and `dplyr` if needed, then commit and push to `main`.

### Step 2: Create Feature Branches

1. **Student 1** creates a branch named `feature-dev1`.
2. **Student 2** creates a branch named `feature-dev2`.
3. Switch to your respective branches and verify.

---
  ## Part 2: Create a Merge Conflict
  
  ### Step 1: Edit `conflict_test.R` in Both Branches
  
  **Student 1 (`feature-dev1`)**:
  Modify the summary table:
  
  ```r
# Summarize the dataset: Calculate mean MPG and HP by cylinder category
summary_table <- mtcars %>%
  group_by(cyl_factor) %>%
  summarise(avg_mpg = mean(mpg, na.rm = TRUE), avg_hp = mean(hp, na.rm = TRUE))

print(summary_table)
```

**Student 2 (`feature-dev2`)**:
  
  Update the plot:
  
  ```r
# Plot
ggplot(mtcars, aes(x = cyl_factor, y = mpg, fill = cyl_factor)) +
  geom_boxplot(alpha = 0.7) +
  labs(title = "MPG Distribution by Cylinder Count",
       x = "Cylinders",
       y = "Miles Per Gallon (MPG)") +
  theme_minimal()
```

4. Test your changes in RStudio.

### Step 2: Commit and Push Changes
- **Student 1**: Commit and push `feature-dev1` (e.g., message: “Dev1: Added HP summary”).
- **Student 2**: Commit and push `feature-dev2` (e.g., message: “Dev2: Replaced plot with boxplot”).
- Verify changes on GitHub.

---
  ## Part 3: Handle the Merge Conflict
  
  ### Step 1: Merge `feature-dev1` into `main`
  
  
  ### Step 2: Merge `feature-dev2` into `main` (Conflict Occurs)
  
  **Expected Outcome:** RStudio will indicate a merge conflict in `conflict_test.R`.

---
  ## Part 4 : Resolve the Conflict
  
  From the GitHub Interface, resolve the conflict by choosing the code you want to keep.
The exercise is complete when the conflict is resolved and the `main` branch is updated.


