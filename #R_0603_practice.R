#20190520_데이터 전처리 - 필요한 변수만 추출하기
#select()는 일부 변수만 추출해 활용하고자 할 때 사용한다


exam <- read.csv("csv_exam.csv")
exam

exam %>% select(math)
exam %>% select(english)
exam %>% select(class,math, english)
exam %>% select(-math) #일부 변수 제외하기

library(dplyr)
#filter와 select 조합하기
exam %>% filter(class == 1) %>% select(english)
#가독성 있게 코드짜기
exam %>% 
  filter(class == 1) %>% 
  select(english)
#head() 이용해서 일부만 출력하기
exam %>% 
  select(id, math) %>% 
  head
exam %>% 
  select(id, math) %>% 
  head(10)

##138페이지 혼자 해보기##

library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)

mpg_new <- mpg %>% select(class, cty)
head(mpg_new)

class_suv <- mpg_new %>% filter(class == "suv")
mean(class_suv$cty)

class_compact <- mpg_new %>%filter(class == "compact")
mean(class_compact$cty)
