# Data Processing

# Set the working directory - alterantively you can click on file folder and select the
# dir and than click on "More" label and select "Set As Working Directory"
setwd("C:/Wladimir/Machine Learning A-Z/Part 1 - Data Preprocessing")

# Importing the dataset
dataset = read.csv('Data.csv')
dataset$Age = ifelse(is.na(dataset$Age),
                     ave(dataset$Age, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Age)
dataset$Salary = ifelse(is.na(dataset$Salary),
                     ave(dataset$Salary, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$Salary)
# encoding categorical data
dataset$Country = factor(dataset$Country,
                         levels = c('France', 'Spain', 'Germany'),
                         labels = c(1, 2, 3))
dataset$Purchased = factor(dataset$Purchased,
                         levels = c('No', 'Yes'),
                         labels = c(0, 1))

# Splitting dataset into training and test set
# install.packages('caTools')
library(caTools)
set.seed(123)
# the vector Y will be the dependent variable Purchased
# SplitRatio will be the percented observation of dataset for training set (80%)
split = sample.split(dataset$Purchased, SplitRatio = 0.8)
# Will return TRUE or FALSE of each observation - TRUE for traing set and FALSE for test set
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

# Feature Scaling
training_set[,2:3] = scale(training_set[, 2:3])
test_set[,2:3] = scale(test_set[, 2:3])










