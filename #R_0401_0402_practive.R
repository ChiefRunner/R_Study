#20190514_데이터 프레임 연습
#세로로 나열되는 열은 속성을 나타낸다 -> 컬럼, 또는 변수라고 부름
#가로로 나열되는 행은 전체 속성에 대한 일련의 정보 -> 로(row), 케이스(case)라고 부름
#좋은 데이터는 열이 많은 게 중요하다. 100개의 행이나 10만개의 행은 별 차이가 없다
#열(속성)이 많으면 변수의 조합, 분석 방법이 다양해진다. 열이 많다는 건 데이터의 다양성을 나타낸다


#학생들 성적 데이터 프레임 만들기
english <- c(90,80,60,70)
english

math <- c(50,60,100,20)
math

df_midterm <- data.frame(english, math)  #데이터 프레임 만들 때는 data.frame()
df_midterm

class <- c(1,1,2,2)
class

df_midterm <- data.frame(english, math, class)
df_midterm

mean(df_midterm$english)
mean(df_midterm$math)

#데이터 프레임 한번에 만들어버리기
df_midterm <- data.frame(english = c(90,80,60,70),
                         math = c(50,60,100,20),
                         class = c(1,1,2,2))
df_midterm

#88페이지 예제

price <- c(1800,1500,3000)
price

quantity <- c(24,38,13)
quantity

product <- c("사과","딸기","수박")
product

df_fruit <- data.frame(product, price, quantity)
df_fruit

df_fruit <- data.frame(product = c("사과","딸기","수박"),
                       price = c(1800,1500,3000),
                       quantity = c(24, 38,13)
                       )
df_fruit

mean(price)
mean(quantity)
