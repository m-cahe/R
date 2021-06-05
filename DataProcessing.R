#데이터 가공(dplyr)

install.packages("dplyr")
library(dplyr)

list.files()
exam <- read.csv("csv_exam.csv")
View(exam)

install.packages("ggplot2")   #ggplot2: 무료로 라이브러리 제공    ex)mpg데이터 제공
library(dplyr)
library(ggplot2)


##mpg이용##

View(mpg)
str(mpg)
mpg <- as.data.frame(mpg)   #dat.frame으로 변환
str(mpg)                    #mpg구조


    #평균 :   mean()    /  avg = (a+b+c)/3
v1 <- c(1,2,3)
mean(v1)

mpg_a = mpg %>% filter(displ <= 4)
mpg_b = mpg %>% filter(displ > 5)

mean(mpg_a$hwy)
mean(mpg_b$hwy)



##Fruits이용##
install.packages("googleVis")
library(googleVis)
library(dplyr)

Fruits
str(Fruits)
summary(Fruits)

Apples <- Fruits %>% filter(Fruit =="Apples")
Apples %>% filter(Sales == max(Apples$Sales)) %>% select(Date)


Apples %>% arrange(desc(Apples$Sales))



##exam이용##    %>%:ctrl+shift+m
exam %>% select(math)
exam %>% select(-math)

exam %>% filter(class==1) %>%  select(c(class, math))

exam
exam <- exam %>% mutate( avg = (math + science + english)/3)
exam
exam1 <- exam %>% filter(class == 1) %>% filter(avg == max(avg))
exam1

