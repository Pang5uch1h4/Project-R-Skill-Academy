install.packages("pwr")
library(pwr)

dataset <- read.csv('dataset_superstore_simple.csv')


#membuat dataset untuk consumer dan home office
#Variasi A
dat_phone <- filter(dataset, segment == "Home Office", sub_category == "Phones")
dat_home <- filter(dataset, segment=="Home Office")

phone_prof <- sum(dat_phone$profit)
tot_prof <- sum(dat_home$profit)

pk <- (phone_prof/tot_prof) * 100

#VariasiB
dat_phone2 <- filter(dataset, segment == "Consumer", 
                     sub_category == "Phones")
dat_cons <- filter(dataset, segment == "Consumer")

phone_prof2 <- sum(dat_phone2$profit)
tot_prof2 <- sum(dat_cons$profit)

pk2 <- (phone_prof2/tot_prof2) * 100

#Melakukan Uji hipotesis
prop.test(c(8912.396, 23837.11), c(58189.77, 128959.2))






