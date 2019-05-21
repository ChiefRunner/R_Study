#20190521_데이터 정제 - 이상치 정제하기
#정상범주에서 크게 벗어난 값을 '이상치(outlier)'라고 한다.
#이상치가 포함되어 있으면 분석 결과가 왜곡되기 때문에 미리 제거해야 한다.

#존재할 수 없는 이상치 제거하기
outlier <- data.frame(sex = c(1,2,1,3,2,1),
                      score = c(5,4,3,4,2,6))
outlier

table(outlier$sex)
table(outlier$score)

#이상치를 결측치로 변환하기
outlier$sex <- ifelse(outlier$sex == 3, NA, outlier$sex)
outlier
outlier$score <- ifelse(outlier$score > 5, NA, outlier$score)
outlier

#filter()이용해서 결측치 삭제하고 성별에 따른 score 평균 구하
outlier %>% 
  filter(!is.na(sex) & !is.na(score)) %>% #결측치 제거
  group_by(sex) %>%                       #sex 별로 분류 
  summarise(mean_score = mean(score))     #각 평균 구하기


#극단적인 이상치 제거하기
#현실에 존재할 수 있는 데이터지만
#굉장히 드문 케이스이기 때문에 분석 결과에 영향을 줄 수 있으므로
#삭제해야 한다
#극단치를 정하기 위해서는 우선 정상 범위를 정해야 한다

#상자그림으로 극단치 기준 정하기
boxplot(mpg$hwy)
boxplot(mpg$hwy)$stats
#이상치 정제하기
mpg$hwy <- ifelse(mpg$hwy < 12 | mpg$hwy > 37, NA, mpg$hwy)
table(is.na(mpg$hwy))

mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy = mean(hwy, na.rm = T))


##178페이지 혼자서 해보기##

#우선 문제 셋업 
mpg <- as.data.frame(ggplot2::mpg) 
mpg[c(0,14,58,93), "drv"] <- "K"    #drv에 이상치 할당
mpg[c(2,43,129,203), "cty"] <- c(3,4,39,42) #cty에 이상치 할당

table(mpg$drv)

mpg$drv <- ifelse(mpg$drv %in% c("4","f","r"),mpg$drv,NA)
table(mpg$drv)

boxplot(mpg$cty)
boxplot(mpg$cty)$stats

mpg$cty <- ifelse(mpg$cty > 26 | mpg$cty < 9 , NA, mpg$cty)
boxplot(mpg$cty)

mpg %>% 
  filter(!is.na(drv) & !is.na(cty)) %>% 
  group_by(drv) %>% 
  summarise(mean_cty = mean(cty))
