getwd()
setwd('C:/MOON/Rstudy/use_dart/tp/reitre_period_schoolevel')
getwd()  #경로 재설정

list.files()
status <- read.csv("사립학교교직원연금공단_재직기간별 학교급별 교직원 퇴직 현황_20200916.csv")
status

#학교 클래스별 근무기간이 짦은지 알고 싶다

#dataframe으로 변경
df = data.frame(status)
df

install.packages('googleVis')
install.packages('dplyr') 
library(googleVis)
library(dplyr)

df %>% filter('재직기간'==1)

# %>% : chain operation (%>%), pipe operation   //ctrl + shift + M
# 오류 could not find function "%>%"  에 대한 대안 -> packages('dplyr')설치&libray(dplyr) 
