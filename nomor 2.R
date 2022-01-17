library(dplyr)
library(ggplot2)
library(lubridate)

dataset <- read.csv('dataset_superstore_simple.csv')

#merubah tahun
col <- ymd(dataset[,2])
year_sale <- year(col)
year_sale

#membuat kolom tahun
dataset$order_year <- year_sale

select(dataset, c(order_year, sales))

#membuat dataset khusus tahun 2015
dat_final <- filter(dataset, order_year == 2015)

dat_final$order_date <- as.Date(dat_final$order_date)

dat_final$order_month <- as.Date(cut(dat_final$order_date, breaks='month'))

monthly_sales <- dat_final %>% group_by(order_month) %>% 
  summarise(sales = sum(sales))

ggplot(monthly_sales, aes(x=order_month, y=sales)) + geom_line() + 
  geom_point(colour='red')