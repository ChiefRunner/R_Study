#20190520_ 데이터 전처리 - 파생변수 추가하기
#mutate()를 사용하면 기존 데이터에 파생변수를 만들어 추가할수 있다

exam <- read.csv("csv_exam.csv")

exam %>% 
  mutate(total = math + english + science) %>% #총합변수 추가
  head

exam %>% 
  mutate(total = math + english + science,    #총합변수 추가        
         mean = (math+english+science)/3) %>% #총평균 변수 추가
  head

exam %>% 
  mutate(test = ifelse(science >= 60, "pass", "fail")) %>% 
  head

exam %>% 
  mutate( total = math + english + science) %>% 
  arrange(total) %>% 
  head


##144페이지 혼자 해보기##

library(ggplot2)
mpg <- as.data.frame(ggplot2::mpg)

mpg_copy <- mpg
mpg_copy <- mpg_copy %>% mutate(total = cty + hwy)
mpg_copy <- mpg_copy %>% mutate(mean = total/2)
mpg_copy %>% 
  arrange(desc(mean)) %>% 
  head(3)

mpg %>% 
  mutate(total= cty + hwy,
         mean = total/2) %>% 
  arrange(desc(mean)) %>% 
  head(3)
