#201910620_데이터 가공하기 - 데이터 전처리 연습
#분석에 적합하게 데이터를 가공하는 작업을 '데이터 전처리'라고 한다
#dplyr은 데이터 전처리 작업에 가장 많이 사용되는 패키지

#dplyr 패키지의 filter()는 원하는 행을 추출할 수 있다
install.packages("dplyr")
library(dplyr)

exam <- read.csv("csv_exam.csv")
exam

#dplyr 패키지는 %>% 기호를 이용해 함수들을 나열하는 방식으로 코드를 작성한다
# %>%는 파이프 연산자라고 읽는다. 단축키는 ctrl+shift+m
#함수의 파라미터 지정은 =, 같다라는 의미는 ==
exam %>% filter(class == 1)
exam %>% filter(class != 1)
exam %>% filter(math > 50)
exam %>% filter(english <= 80)
exam %>% filter(class == 1 & math >= 50)
exam %>% filter(math >= 90 | english >= 90)
exam %>% filter(class %in% c(1,3,5))
# %in% 기호는 매치 연산자로, 변수의 값이 지정한 조건 목록에 해당하는지 확인하는 기능을 한다

#추출한 행으로 데이터 만들기

class1 <- exam %>% filter(class == 1)
class2 <- exam %>% filter(class == 2 )
mean(class1$math)
mean(class2$math)


##133페이지 혼자 해보기##
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)

library(dplyr)
mpg_displ_under <- mpg %>% filter(displ <= 4)
mpg_displ_under
mean(mpg_displ_under$hwy)

mpg_displ_over <- mpg %>% filter(displ >= 5)
mpg_displ_over
mean(mpg_displ_over$hwy)


audi <- mpg %>% filter(manufacturer == "audi")
mean(audi$cty)

toyota <- mpg %>% filter(manufacturer == "toyota")
mean(toyota$cty)


cars <- mpg %>% filter(manufacturer %in% c("chevrolet","ford","honda"))
cars
mean(cars$hwy)
