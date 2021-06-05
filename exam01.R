
# 주석
# 변수 : 데이터를 저장할 수 있는 임시적인 공간


# 실행: ctrl + Enter
# 변수 만들기:      변수이름 <- 자료      (변수 형식 대소문자 구분)


"안녕" # 그냥 문자만 출력

text <- "잘가"
num <- 50
isCheck <- T
isCheck <- F


## 데이터유형
# 백터: 동일한 유형, 1차원으로 구성   ex)  v1 <- c(1,2,3)

## 함수
# c: combine의 약자, function대신 사용


#문제
#첫번째 , 세번째, 다섯번째의 값을 출력하시오
#짬뽕, 볶음밥, 양장피

Vec<- c("짬뽕","울면","간짜장","탕수육","양장피")
c(vec[1], vec[3], vec[5])
vec[c(1,3,5)]

                                                          View(vec) #View 데이터창으로 보기


#1부터 50까지 랜덤의 숫자
x <- c(5, 30, 14, 242, 42, 1, 243, 11)
x[ x>= 20 ]
x[x < 10]

# 1부터 100까지 숫자를 백터로 넣기
y <- seq(1, 100)  #1부터 100까지
y

z <- 1:100
z



## 데이터프레임(DataFrame) : 다양한 데이터타입을 저장
No <- c(1,2,3,4)
Name <- c("Apple", "Peach", "Banana", "Grape")
Price <- c(500, 200, 100, 50)
Qty <- c(5,2,4,7)

sales <- data.frame(No, Name, Price, Qty)
sales
View(sales)

sales[2, 2]
sales[3, 2]
sales[1,  ]
sales[ , 2]
sales[]

#인덱스 말고 컬럼명으로 불러오기
sales$Price

                                                                        #R 자동완성은 ctrl + space
#백터와 DataFrame 차이 1, [1]
sales[c(1:2), ]   #1~2행 출력   or      sales[c(1,2), ]   
sales[ ,c(1:2)]   #1~2열 출력   or      sales[ ,c(1,2)]
sales

                                                                        #전체 (지금까지 한거) 출력: ctrl+shift+enter
                                                                        #주석처리 : ctrl + shift + c

#rbind : 행결합 

#csv: comma serperated vlaue 컴마로 분류된 파일

list.files()
kia <- read.csv("기아타이거즈연봉.csv")  #read.확장자명("파일이름")  읽어들이는 함수
View(kia)

#데이터를 파악할 때 사용하는 함수 Head(6개 기준) cf. tail(kia)
head(kia) 
tail(kia)

head(kia, 3)
tail(kia, 3)

#str: structure 구조파악      
str(kia)

                  #통계에선 colume을 변수라고 한다. : 다양한 값이 들어갈 수 있는 변수
                  #통곙선 행을 관측치(옵저베이션)이 라고 한다.
                  # 전체데이터의 크기 : 변수(컬럼) * 옵저베이션수(행)

#Factor: 범주형데이터 (객관적으로 수치화 할 수 없는 데이터)
#범주형데이터가 가질 수 있는 수준 (분류 가능한 형태)

#요약통계량 summary  (계산 값)  
    #평균의 오류: 
summary(kia)    

# 5 Number summary
# 하위0%    하위25%     하위50%(=중앙값)   하위75%      하위100%      
#       (1분위)   (2분위)             (3분위)   (4사분위)      


boxplot(kia)
boxplot(kia$연봉)   #4분위 수를 시각화



###############################워드클라우드###############################
install.packages("wordcloud")
library(wordcloud)
                  #워드클라우드 : 단어 빈도 수에 따라서 글자 크기가 달라진다
                  #e단어, 빈도수

word <- c("붕어싸만코","초밥","텐동","돈가스","모밀","치킨")
pre <- c(150, 70, 60, 65, 110, 200)
word

wordcloud(word, pre, random.order=F, colors = c("red","blue","green"))  #random.order=F: 무조건 빈도 높은 게 가운데로 #색상선택: c("red")




#연봉별 이름 출력
list.files()
kia <- read.csv("기아타이거즈연봉.csv")  #read.확장자명("파일이름")  읽어들이는 함수
View(kia)

##방법1
wordcloud(kia$선수명, kia$연봉, random.order = F)   # kia$연봉 : 연봉만 출력


##방법2
name <- kia[,2]
salary <- kia[, 10]

#방법2-2
NAMES <- kia$선수명


name          
salary
wordcloud(NAMES, salary, random.order = F, colors=c("red","yellow","blue"))




###############데이터 가공###############(dplyr)
install.packages("dplyr")
library(dplyr)

list.files()
exam <- read.csv("csv_exam.csv")
View(exam)

  #class가 1인 반만 출력
exam %>% filter(class == 1)  
    # %>%파이프퍼센트: ctrl+shift+M     #filter: true인 값만 출력 

  #1반이 아닌 값만 출력
exam %>%  filter(class != 1)

  exam %>% filter((class==1) | (class==3))
  exam %>% filter((class==1) & math >= 50)

install.packages("ggplot2")
library(dplyr)
library(ggplot2)

View(mpg)
str(mpg)

mpg <- as.data.frame(mpg)
str(mpg)

v1 <- c(492, 123, 444)
mean(v1)  #mean: 평균

mpg_a <- mpg %>% filter(displ<=4)
mpg_b <- mpg %>% filter(displ>5)

mean(mpg_a$hwy)
mean(mpg_b$hwy)


audi <- mpg %>% filter(mpg$manufacturer == "audi")
toyota <- mpg %>% filter(mpg$manufacturer=="toyota")
mean(audi$cyl)
mean(toyota$cyl)


exam %>% select(math)
exam %>% select(-math) #math컬럼만 제거하고 출력

exam %>% filter(class==1) %>% select(math)

install.packages("googleVis")
library(googleVis)
library(dplyr)

Fruits
Apples <- Fruits %>% filter(Fruit =="Apples")
Apples %>% filter(Sales == max(Apples$Sales)) %>% select(Date)  

exam %>% arrange(desc(math))  #정렬

          #mutate 파생변수 추가
exam <- exam %>% mutate(avg = (math + english + science)/3)
exam


class1<- exam %>% filter(class==1) %>% arrange(desc(avg)) %>% head(1)
class1


# exam %>% filter((class=1) && (avg == max(avg))) 안되는 이유: (avg == max(avg)) 하면 전체 행에서 max 데이터가 출력되므로

class2<- exam %>% filter(class=1) %>%  (avg == max(avg))
class1
