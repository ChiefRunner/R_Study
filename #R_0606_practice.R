#20190520_데이터 전처리- 집단별로 요약하기
#group_by()와 summarise() 이용해서 집단 요약한 값 구하기

exam <- read.csv("csv_exam.csv")

exam %>%  summarise(mean_math = mean(math)) #math 평균 산
#summarise는 group_by를 조합해 집단별 요약표를 만들 때 사용합니다

exam %>% 
  group_by(class) %>%                #class 별로 분리
  summarise(mean_math = mean(math))  #math 평균 산출

exam %>% 
  group_by(class) %>% 
  summarise(mean_math = mean(math),
            sum_math = sum(math),
            median_math = median(math),
            n = n()) #데이터가 몇 행으로 되어 있는지 빈도를 나타냄 # 행 개수를 세는 것임

mpg %>% 
  group_by(manufacturer, drv) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  head(10)


###dplyr 패키지로 진가를 발휘해보기

mpg %>%
  group_by(manufacturer) %>%      #회사별로 분리
  filter(class == "suv") %>%      #suv 추출
  mutate(tot = (cty+hwy)/2) %>%   #통합 연비 변수 생성
  summarise(mean_tot = mean(tot)) %>% #통합 연비 평균 산출
  arrange(desc(mean_tot)) %>%         #내림차순 정렬
  head(5)                             #1위부터 5위까지 출력
            

##150페이지 혼자서 해보기##

mpg <- as.data.frame(ggplot2::mpg)

mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty))

mpg %>% 
  group_by(class) %>% 
  summarise(mean_cty = mean(cty)) %>% 
  arrange(desc(mean_cty))

mpg %>% 
  group_by(manufacturer) %>% 
  summarise(mean_hwy = mean(hwy)) %>% 
  arrange(desc(mean_hwy)) %>% 
  head(3)

mpg %>% 
  filter(class == "compact") %>% 
  group_by (manufacturer) %>% 
  summarise(count = n()) %>% 
  arrange(desc(count))

