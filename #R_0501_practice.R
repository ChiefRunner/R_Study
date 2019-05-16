#20190516_데이터 분석 기초 연습
#데이터 파악의 기본 6개 함수
#head() 데이터 앞부분 출력 - 디폴트 출력이 6줄
#tail() 데이터 뒷부분 출력 -  same
#View() 뷰어 창에서 데이터 확인
#dim() 데이터 차원 출력
#str() 데이터 속성 출력
#summary() 요약 통계량 출력

exam <- read.csv("csv_exam.csv")
head(exam)
head(exam,10) #앞에서부터 10줄까지 출력

tail(exam)
tail(exam, 10)

View(exam) #V는 항상 대문자일것

dim(exam) #데이터 프레임이 몇 행, 몇 열로 되어 있는지 사용 # 행, 열 출력

str(exam) #데이터에 들어있는 변수들의 속성 보여줌

summary(exam) #요약 통계량 출력. 변수의 특성을 파악하는데 도움이 된다
#Min 최솟값, 1st Qu 1사분위수(하위 25% 지점) 
#Median 중앙값, Mean 평균
#3rd Qu 3사분위수(상위 25%), Max 최댓값

##106페이지 직접 해보기

install.packages("ggplot2")
library(ggplot2)

mpg <- as.data.frame(ggplot2::mpg)
#as.data.frame은 데이터 속성을 데이터 프레임 형태로 바꾸는 함수
#::는 특정 패키지에 들어있는 함수나 데이터 지정

head(mpg)
tail(mpg)
View(mpg)
dim(mpg)
str(mpg)
summary(mpg)
