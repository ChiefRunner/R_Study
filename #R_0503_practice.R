#20190516_데이터 분석 기초 - 파생변수 만들기 연습
# 변수를 조합하거나 함수를 적용해서 새 변수를 만들어 분석할 수도 있다
# 이처럼 기존의 변수를 변형해 만든 변수를 '파생변수'라고 한다.

#데이터 프레임 만들기
df <- data.frame(var1 = c(4,3,8),
                 var2 = c(2,6,1))
df

#var_sum 파생변수 만들기
df$var_sum <- df$var1 + df$var2
df

#var_meam 파생변수 만들기
df$var_mean <- (df$var1 + df$var2)/2
df

#mpg 이용하여 통합 연비 변수 만들기
mpg$total <- (mpg$cty + mpg$hwy)/2
head(mpg)

mean(mpg$total)

##이번엔 조건문을 이용해서 파생변수를 만들어보자

#기준값 정하기
summary(mpg$total)
hist(mpg$total) #히스토그램 생성

#대충 서머리랑 히스토그램을 봤을 때 연비가 20 넘는 자동차를 고연비 합격 판정으로 내리면 되겠다
#조건문 함수는 ifelse(조건, 조건에 맞을 때 부여값, 조건에 맞지 않을 때 부여값)
mpg$test <- ifelse(mpg$total >= 20 , "pass", "fail")
head(mpg,20) 

#빈도표로 합격 판정 자동차 수 살펴보기
table(mpg$test)

#막대그래프로 빈도 표현
library(ggplot2)
qplot(mpg$test)

#중첩 조건문 활용하기
#이럴 땐 ifelse() 안에 또 ifelse()를 넣어야 한다
mpg$grade <- ifelse(mpg$total >= 30, "A",
                    ifelse(mpg$total >= 20, "B","C"))
head(mpg, 20)

table(mpg$grade)

qplot(mpg$grade)

#중첩 조건문 심화 
mpg$grade2 <- ifelse(mpg$total >= 30 , "A",
                     ifelse(mpg$total >= 25, "B",
                            ifelse(mpg$total >= 20, "C","D")))
table(mpg$grade2)
qplot(mpg$grade2)




### 123페이지 분석 도전! ###


#ggplot2의 midwest데이터를 데이터 프레임으로 불러오기
midwest <- as.data.frame(ggplot2::midwest)
head(midwest)

#일단 카피하기
midwest_copy <- midwest
head(midwest_copy)

#카피한 데이터 새로 rename()
library(dplyr)
midwest_copy <- rename(midwest_copy, total= poptotal, asian = popasian)
head(midwest_copy)

#전체 인구 대비 아시아 인구 백분율 
#Asian Population Percentage of Total Population

midwest_copy$APPoTP <- (midwest_copy$asian/midwest_copy$total) * 100 
head(midwest_copy)

#히스토그램
hist(midwest_copy$APPoTP)

#아시안 평균
asian_mean <- mean(midwest_copy$APPoTP)
asian_mean

#아시안 인구 수대로 그룹 나누기
midwest_copy$asian_mean_grade <- ifelse(midwest_copy$APPoTP > asian_mean, "large","small" )
head(midwest_copy)

#테이블 확인
table(midwest_copy$asian_mean_grade)
#빈도그래프로 확인하기
qplot(midwest_copy$asian_mean_grade)

