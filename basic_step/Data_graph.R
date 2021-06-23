#for
list.files()
exam <- read.csv("csv_exam.csv")
exam <- exam %>% mutate(avg = (math + english + science)/3)
exam

for ( i in min(exam$class):max(exam$class) )
    {
    print(exam %>% filter(class ==i) %>% filter(avg==max(avg)))
    #전체 반에서 1등인 사람들 출력   #for문은 출력시 print() 필수
    }

#group_by
exam %>% group_by(class) %>% summarise(mean = mean(avg))

list.files()
subway <- read.csv("1-4호선승하차승객수.csv")
View(subway)

#라인별 승하차 수 구하기
subway %>% group_by(line_no) %>% summarise(total_in = sum(in.), total_out = sum(out))


# install.packages("foreign") -> 다른 형식 파일 가져오기 가능 ex) sas
install.packages("foreign")
install.packages("ggplot2")
install.packages("dplyr")

library(foreign)
library(ggplot2)
library(dplyr)

list.files()

korean <- read.spss("Koweps_hpda12_2017_beta1.sav", to.data.frame = T)  #to.data.frame : spss -> data.fram형태로 변경
View(korean)
korean <- korean %>% rename(gender = h12_g3, birth = h12_g4, income = h12_pers_income1, code_job = h12_eco9)
      #변수(컬럼)이름 변경: rename( 이름 = "" )

      #형식 체크: class(korea$gender)
      #빈도수 체크: table(korean$gender)
class(korean$gender)
table(korean$gender)  #남: 1, 여: 2

korean$gender <- ifelse( korean$gender == 1 ,'male', 'female')
table(korean$gender)


# qplot : 빈도를 시각화 하는 그래프(정규분포도)
# +a : 모든 데이터들은 정규분포를 따른다. 많이 몰려 있는 수는 따로 있다

qplot(korea$income)   #x축: 연봉, y축:사람수
summary(korean$income)
      #NA'S출력: 군데군데 비어(NULL)있는 데이터
      #NA 이유1. 데이터 유실, 실수, 일부러(민감해서)  => 통계불가능 => 결측치 제거 필요
      #결측치는 FALSE 일 때, 데이터가 있는 상태


korean$income <- ifelse(korea$income == 0, NA, korean$income)   #income에서 0 제거
korean$income

    #is.na: 결측치면 TRUE, 결측치 아니면 FALSE
is.na(korean$income)
is.na(korean$gender)

# 연봉 결측치 없는 행만 출력 => 성별별 연봉 출력
korean <- korean %>% filter( !is.na(korean$income) )
korean

gen_income <- korean %>% group_by(gender) %>% summarise(mean_income = mean(income))
View(gen_income)



#ggplot이용해 시각화 : ggplot(data, asc(x축 = ?, y축 =?) + 시각화 형식)
ggplot(data = gen_income, aes(x=gender, y=mean_income)) + geom_col()





#left_join 이용해 직업별 연봉 출력
code_job<- read("code_job.csv")
View(code_job)
    

korea <- left_join(korea, code_job) #left join

job_income <- korea %>% filter(!is.na(job) & !is.na(income)) %>% group_by(job) %>% summarise(mean_income = mean(income))
View(job_income)

Top10 <- job_income %>% arrange(desc(job_income$mean_income)) %>% head(10)    #head(10)이라고 할때 출력

ggplot(data = Top10, aes(x=reorder(job,mean_income), y=mean_income)) + geom_col() + coord_flip()

