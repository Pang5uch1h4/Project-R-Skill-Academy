library(dplyr)
library(ggplot2)

install.packages("fdth")

library(fdth)

#memasukkan data superstore kedalam variabel dataset
dataset <- read.csv('dataset_superstore_simple.csv')

#menghitung mean, median, standard deviation of sales
mean_sales <- mean(dataset$sales)
mean_sales

med_sales <- median(dataset$sales)
med_sales

sd_sales <- sd(dataset$sales)
sd_sales

#menghitung mean, median, standard deviation of profit
mean_prof <- mean(dataset$profit)
mean_prof

med_prof <- median(dataset$profit)
med_prof

sd_prof <- sd(dataset$profit)
sd_prof
