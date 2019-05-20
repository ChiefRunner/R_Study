#20190520_데이터 전처리 - 데이터 합치기

test1 <- data.frame(id = c(1,2,3,4,5),
                    midterm = c(60,80,70,90,85))
test2 <- data.frame(id= c(1,2,3,4,5),
                    final = c(70,83,65,95,80))
test1
test2

#dplyr의 left_join()을 이용하면 데이터를 가로로 합칠 수 있다
#괄호 안에 데이터 프레임명을 쓰고 기준 변수명을 by로 지정해주면 된다
#ex)left_join(dataframe, by ="standard var")

total <- left_join(test1,test2, by ="id")
total

name <- data.frame(class = c(1,2,3,4,5),
                   teacher = c("kim","lee","park","choi","jung"))
name

exam_new <- left_join(exam, name, by ="class")
exam_new


group_a <- data.frame(id = c(1,2,3,4,5),
                      test = c(60,80,70,90,85))
group_b <- data.frame(id = c(6,7,8,9,10),
                      test = c(70,83,65,95,80))
group_a
group_b

#bind_rows()를 이용하면 데이터를 세로로 합칠 수 있다
#데이터를 세로로 합칠 때는 데이터의 변수명이 같아야 한다
#만약 데이터 변수명이 다르면 rename()을 이용해서 동일하게 맞춘 후 합치면 된다
group_all <- bind_rows(group_a,group_b)
group_all

##156페이지 혼자서 해보기##

fuel <- data.frame(fl = c("c","d","e","p","r"),
                   price_fl = c(2.35,2.38,2.11,2.76,2.22),
                   stringsAsFactors = F)
fuel
mpg <- as.data.frame(ggplot2::mpg)

mpg <- left_join(mpg, fuel, by = "fl")

mpg %>% 
  select(model, fl, price_fl) %>% 
  head(5)
