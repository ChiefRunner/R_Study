#20190523 _ 그래프 연습
#막대 그래프는 집단 간 차이를 표현할 때 주로 사용된다

library(dplyr)

#평균막대그래프 만들기
#평균그래프는 먼저 평균 데이터를 만든 후에 만들어야 한다.
#요약표는 geom_col()
df_mpg <- mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy))

df_mpg <- df_mpg %>% filter(!is.na(drv)) # 이상하게 결측치 나와서 일단 결측치 처리

df_mpg

ggplot(data = df_mpg, aes(x = drv, y = mean_hwy)) + geom_col()
ggplot(data = df_mpg, aes(x = reorder(drv, -mean_hwy), y = mean_hwy)) + geom_col()

#빈도막대그래프 만들기다
#별도로 평균 등의 값을 구하지 않고도 바로 만들 수 있다
#원자료는 geom_bar()
ggplot(data = mpg, aes(x = drv)) + geom_bar()
ggplot(data = mpg, aes(x = hwy)) + geom_bar()

##193페이지 혼자서 해보기##
library(dplyr)
library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)
mpg
another_mpg <- mpg %>% 
  filter(class == "suv") %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty)) %>% 
  head(5)
another_mpg

ggplot(data = another_mpg, aes(x = reorder(manufacturer, -mean_cty),
                               y = mean_cty)) + geom_col()
