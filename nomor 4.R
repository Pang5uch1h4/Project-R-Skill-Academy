library(dplyr)
library(ggplot2)
library(lubridate)

dataset <- read.csv('dataset_superstore_simple.csv')

profitx <- dataset$profit
salesx <- dataset$sales
quantity <- dataset$quantity
date <- dataset$order_date
  
  
#Bivariate Analysis
scatter.smooth(x=profitx, y=salesx)

result <- cor(salesx, profitx)
result

result2 <- cor(profitx, quantity)
result2


#Multivariate analysis
linearmod <- lm(profitx~salesx + quantity)
linearmod

summary(linearmod)
