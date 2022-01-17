library(dplyr)
library(ggplot2)
library(lubridate)

dataset <- read.csv('dataset_superstore_simple.csv')

#merubah tahun
col1 <- ymd(dataset[,2])
year_sale1 <- year(col1)

#membuat kolom tahun
dataset$order_year <- year_sale1
select(dataset, c(order_year, sales))

#membuat dataset khusus tahun 2015 dan 2016
dat_final2 <- filter(dataset, order_year == c(2015,2016))

dat_final2$order_date <- as.Date(dat_final2$order_date)
dat_final2$order_month <- as.Date(cut(dat_final2$order_date, breaks='month'))

ggplot(dat_final2, aes(x=sales, y=profit)) + 
  geom_point(aes(color=category), size = 5, shape=17) +
  geom_smooth(method='lm', color = '#e8c723', linetype = 'dotdash', size =1) +
  labs(title='Hubungan Sales vs Profit pada tahun 2015 dan 2016',
       subtitle='Berdasarkan datas Dataset Superstore',
       caption = 'R Language Tutorial'
  )+
  xlab("Order Sales") + ylab("Order Profit") +
  xlim(c(0,7500)) + ylim(c(-2500,2500)) +
  theme(
    plot.title = element_text(color = 'blue', size = 15, face= 'bold'),
    plot.subtitle = element_text(size = 13, face = 'italic'),
  ) +
  theme(
    legend.position = c(0.8,0.2),
    legend.title=element_text(color = 'blue', size = 12, face = 'bold'),
    legend.text = element_text(color = 'red')
  )

ggsave('Soal nomor 3.png')




