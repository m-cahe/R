
#백터: 같은형식
vec <- c("짬뽕","짜장","볶음밥","짬짜면","해물볶음밥")
vec[2]
vec[c(1,4,5)] 
c(vec[1], vec[4], vec[5])

x <- c(5, 20, 39, 37, 3, 21)
x[x >= 20]
x[x < 10]

y <- seq(1:100)
y

z <- 1:100
z


#데이터프레임(DF): 다양한 데이터타입 저장

Num <- c(1,2,3,4)
Name <- c("Apple", "Peach", "Banana", "Grape")
Price <- c(400, 499, 200, 100)
Qtz <- c(5, 2, 4, 6)

sales <- data.frame(Num, Name, Price, Qtz)  #DF형태로 변환
sales

sales[ ,3]   #1행부터 시작
sales[3, ]
sales[]

sales$Name    #변수명으로 불러오기

# 백터로 출력 : 앞에 [1]
# DF로 출력 : 앞에 1

sales[c(1:2), ]
sales[ ,c(1:2)]

list.files()      #같은 디렉토리에 있는 파일 출력
kia <- read.csv("기아타이거즈연봉.csv")   #파일읽어와서 read
kia

View(kia)


head(kia, 3)
tail(kia, 3)

str(kia)  #형태확인
summary(kia)  # 5 Number summary

boxplot(kia)
boxplot(kia$연봉)


#파일 불러오기
list.files()  #현재 디렉토리 안의 파일 확인
getwd()       #현재 설정된 워킹 디렉토리

#setwd"c:/user/bigdata")      #디렉토리 변경(역슬러시가 아니라 슬러시로)
#참고: 기본경로 바꾸고 싶을 때는 Tools -> Global option -> General -> Default working directory ... -> 경로변경
