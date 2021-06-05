list.files()
library(dplyr)
exam <- read.csv("csv_exam.csv")
exam <- exam %>% mutate(avg = (math + english + science) / 3)
exam

exam <- exam %>% mutate(avg = (math + english + science)/3)
exam %>% filter(class == 1) %>% filter(avg == max(avg))
exam %>% filter(class == 2) %>% filter(avg == max(avg))
exam %>% filter(class == 3) %>% filter(avg == max(avg))
exam %>% filter(class == 4) %>% filter(avg == max(avg))
exam %>% filter(class == 1) %>% filter(avg == max(avg))

#반복문     #print() 사용필요
for (i in 1:10) {print(i)}

for(  i in min(exam$class) : max(exam$class)  )
{
  print( exam %>% filter(class == i) %>% filter(avg == max(avg))  )
}


##현재 설정된 워킹 디렉토리 확인하기 : getwd()
##새로운 워킹 디렉토리 지정하기: setwd()

#리드할 경로 바꾸고 싶을때
#setwd("c:/user/bigdata")    #역슬래시가 아니라 그냥 슬러시로 

#기본경로 바꾸고 싶을때  Tools -> Global option -> General -> Default working directory ... -> 경로변경




## 그룹별로 묶어주기 group by 
exam %>% group_by(class) %>% summarise(mean = mean(avg))


#group_by(사용)
list.files()
subway <- read.csv("1-4호선승하차승객수.csv")
subway %>% group_by(line_no) %>% summarise(total_in = sum(in.), total_out = sum(out))
subway %>% summarize(total_in = sum(in.), total_out = sum(out))


#sas에서 만든 파일 가져오기 

#외부 관련된 파일가져다 쓸수 있음: foreign
install.packages("foreign")     
install.packages("ggplot2")
install.packages("dplyr")

library(foreign)
library(ggplot2)
library(dplyr)

list.files()

korea <- read.spss("Koweps_hpda12_2017_beta1.sav", to.data.frame = T)
str(korea)
View(korea)


korea <- korea %>% rename(genger = h12_g3, birth = h12_g4, income = h12_pers_income1, code_job = h12_eco9) 
View(korea)

class(korea$genger)
#빈도수를 체크하는 함수

table(korea$genger)
#1:남성 #2:여성

korea$genger <- ifelse( korea$genger == 1, 'male', 'female' )
table(korea$genger)

#연봉  qplot: 빈도수를 시각화하는 그래프
qplot(korea$income)   # 사람 수 count 기준으로,   #1단위 : 10000( 5000 -> 5000만 원 )
                      #모든 데이터들은 정규분포를 따른다. 많은 수가 따로 있다.

summary(korea$income)
          #NA'S : 결측치(군데군데 비어있는 데이터)
                        #이유1. 데이터 유실, 실수, 일부러(민감해서)  => 통계불가능 => 결측치 제거 필요

          #성별에 따른 연봉의 평균

korea$income <- ifelse(korea$income == 0, NA, korea$income)

#r결측치가 있는지 없는지 확인하기 위해서
is.na(korea$income)
is.na(korea$genger) #결측치 있으면 TRUE / 결측치 없으면 FALSE

#

######결측치 없는 행만 추출 -> 성별별 평균 연봉표추출
korea1 <- korea %>% filter( !is.na(korea$income) )
korea1

gender_income <- korea1 %>% group_by(genger) %>% summarise(avg_sal = mean(income))  #평균갑: mean(컬럼이름)
View(gender_income)

ggplot(data = gender_income, aes( x=genger, y = avg_sal)) + geom_col()
#ggplot( data, asc(x축 설정, y축 설정) + 시각화 형식 )
######

list.files()
code_job <- read.csv("code_jop.csv")
View(code_job)


korea <-left_join(korea, code_job, id ="code_job") #left join

job_income <- korea %>% filter(!is.na(job) & !is.na(income)) %>% group_by(job) %>% summarise(mean_income = mean(income))
View(job_income)

Top10 <- job_income %>% arrange(desc(job_income$mean_income)) %>% head(10)    #head(10)이라고 할때 출력
ggplot(data = Top10, aes(x=reorder(job,mean_income), y=mean_income)) + geom_col() + coord_flip()
