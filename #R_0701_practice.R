#20190521_데이터 정제 - 결측치 정제하기
#결측치(missing value)는 누락된 값, 비어있는 값을 의미한다
#결측치는 NA로 표기된다. <NA>로 나타나며, "NA"는 그냥 영문자인 것이다

#결측치를 포함한 데이터 프레임 만들기
df <- data.frame(sex = c("M","F",NA,"M","F"),
                 score = c(5,4,3,4,NA))
df

#결측치 확인은 is.na()
#결측치가 있으면 TRUE로 나온다
is.na(df)
table(is.na(df)) #테이블로 나오게 하면 전체 빈도를 알 수 있다
table(is.na(df$sex))
table(is.na(df$score))

#참고로 결측치가 포함된 데이터를 함수에 적용하면
#NA가 출력된다.
mean(df$score)

#is.na()를 filter()에 적용하면 결측치가 있는 행을 제거할 수 있다
library(dplyr)
df %>% filter(is.na(score))

#!is.na()와 filter()를 적용하면 결측치를 제거하고 행 추출함
df %>% filter(!is.na(score))

df_nomiss <- df %>% filter(!is.na(score)) #score 결측치 제거
mean(df_nomiss$score)
sum(df_nomiss$score)

#여러 변수에 대해 결측치 제거 추출하기
df_nomiss <- df %>% filter(!is.na(score) & !is.na(sex))
df_nomiss


#filter()는 일일이 변수를 지정해서 결측치를 제거했다.
#na.omit()을 이용해서 결측치가 있는 모든 행을 한번에 제거해보자.
df_nomiss2 <- na.omit(df)
df_nomiss2
#na.omit()은 간편하긴 하지만 분석에 필요한 행까지 손실된다는 단점이 있다.
#그러므로 귀찮더라도 filter()를 쓰는 걸 권장한다.

#mean()과 같은 수치 연산 함수들은 결측치를 제외하고 연산할 수 있도록
#na.rm 파라미터를 지원한다. na.rm = TRUE 로 설정하면 바로 분석 가능
#하지만 모든 함수들이 지원하는 건 아니기 때문에 filter()를 써야 한다

mean(df$score, na.rm = TRUE) #결측치 제외하고 평균 산출
sum(df$score, na.rm = T) #결측치 제외하고 합계 산출

#summarise()를 이용해서 na.rm 사용해보기
 
exam <- read.csv("csv_exam.csv")
exam[c(3,8,15), "math"] <- NA #3,8,15행의 math 에 결측치 생성
exam

exam %>% summarise(mean_math = mean(math))
#na.rm 파라미터 써서 평균 구해보기
exam %>%  summarise(mean_math = mean(math, na.rm = T)) 

exam %>% summarise(mean_math = mean(math, na.rm = T),
                   sum_math = sum(math, na.rm = T),
                   median_math = median(math, na.rm = T))

#데이터가 크고 결측치가 얼마 없으면 결측치를 제거하고 분석해도 무방하나
#데이터가 작고 결측치가 많으면 분석의 왜곡이 심해진다
#그럴 땐 결측치 제거 대신 다른 값을 채우는 방법을 쓴다.
#이를 '결측치 대체법(Imputation)'이라고 한다.
#보통 평균이나 최빈값같은 대표값으로 대체한다.

#평균으로 결측치 대체하기
mean(exam$math, na.rm = T)
#math가 NA면 55로 대체
exam$math <- ifelse(is.na(exam$math),55,exam$math) 
table(is.na(exam$math)) #결측치 빈도표 생성
exam

mean(exam$math)



##170페이지 혼자서 해보기##

mpg<- as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212), "hwy"] <- NA
head(mpg)

table(is.na(mpg$drv))
table(is.na(mpg$hwy))

mpg %>% 
  filter(!is.na(hwy)) %>%        #결측치 제거
  group_by(drv) %>%              #drv 별 분리
  summarise(mean_hwy = mean(hwy))#hwy 평균 구하기


                                 