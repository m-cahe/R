#wordcloucd(정렬할단어, 정렬기준, 기타타)

install.packages("wordcloud")
library(wordcloud)


word <- c("불닭","삼양","신","사리곰탕")
score <- c(100, 93, 22, 70, 55)
wordcloud(word, score)


#연봉별 이름 출력
list.files()
kia <- read.csv("기아타이거즈연봉.csv")
wordcloud(kia$선수명, kia$연봉, random.order = F) 

name <- kia$선수명
sal <- kia$연봉
wordcloud(name, sal, random.order = F, random.colors = c("red","yello","blue"))
                      #주요 단어가 가운데 오도록

