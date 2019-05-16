# 20190516_ 데이터 분석 기초 - 변수명 바꾸기 연습
# 데이터의 전반적인 특징을 파악하고 나면 본격적으로 분석하기 전에
# 변수명을 수정해야 한다. 변수명을 이해하기 쉬운 단어로 바꾸면 
# 데이터를 수월하게 다룰 수 있다.
# 참고로 주석 처리 단축키는 ctrl + shift + c


#데이터 프레임 만들기
df_raw <- data.frame(var1 = c(1,2,1),
                     var2 = c(2,3,2))
df_raw

#rename() 함수를 이용하기 위해 dplyr 패키지 설치
#dplyr은 데이터를 원하는 형태로 가공할 때 사용함
install.packages("dplyr")
library(dplyr)

#데이터 프레임 복사본 만들기
df_new <- df_raw
df_new
# 데이터를 변형하는 작업을 할 때는 원본을 직접 사용하기 보다
# 복사본을 만들어 사용하는 습관을 들여야 한다.
# 그래야 작업 중에 오류가 발생해도 원 상태로 돌릴 수 있고
# 데이터를 비교하면서 변형되는 과정을 검토할 수 있다.

#변수명 바꾸기
df_new <- rename(df_new, v2 = var2)
df_new

## 112페이지 혼자서 해보기 예제

install.packages("ggplot2")
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
mpg
mpg_copy <- mpg
mpg_copy

install.packages("dplyr")
library(dplyr)
mpg_copy <- rename(mpg_copy, city = cty, highway = hwy)
mpg_copy #전체를 다 출력하는 것도 좋지만 깔끔하게 보려면 head() 쓰는 게 낫다


