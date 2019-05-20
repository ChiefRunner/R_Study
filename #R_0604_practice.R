#20190520_데이터 전처리 - 순서대로 정렬하기
#arrange()를 이용하면 데이터를 원하는 순서대로 정렬할 수 있다
#() 안에 정렬 기준으로 삼을 변수명을 입력하면 된다

exam <- read.csv("csv_exam.csv")

exam %>% arrange(math)
#내림차순 정렬
exam %>% arrange(desc(math))

##141페이지 혼자 해보기##

library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)

audi <- mpg %>% filter(manufacturer == "audi") %>% select(hwy)
audi
audi_arrange <- audi %>% arrange(desc(hwy))
head(audi_arrange,5)

