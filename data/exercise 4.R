# access the MASS package
library(MASS)

# load the data
data("Boston")

# explore the dataset
str(Boston)
summary(Boston)

# plot matrix of the variables

pairs(Boston)