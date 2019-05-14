#20190514_데이터 프레임 연습2

install.packages("readxl")
library(readxl)

df_exam <- read_excel("excel_exam.xlsx")
#프로젝트 폴더가 아닌 다른 폴더에 있는 엑셀 파일 불러오려면 파일 경로 지정하면 된다
# ex) (c:/Rstudy/excel_exam.xlsx)
df_exam

mean(df_exam$english)
mean(df_exam$science)

#read_excel()은 기본적으로 엑셀 파일의 첫번째 행을 변수명으로 인식한다
#변수명 없이 첫번째 행부터 데이터가 시작되면 첫번째 행의 데이터가 변수명으로 지정되어
#유실되는 문제가 발생한다. 그래서 col_names = F 라는 파라미터를 이용한다!!

#잘못된 예
df_exam_novar <- read_excel("excel_exam_novar.xlsx")
df_exam_novar

#고쳐쓴 예
df_exam_novar <- read_excel("excel_exam_novar.xlsx", col_names = F)
df_exam_novar

#여러 개의 시트로 구성된 엑셀 파일을 불러올 때는 sheet 파라미터를 이용한다
df_exam_sheet <- read_excel("excel_exam_sheet.xlsx", sheet = 3)
df_exam_sheet


#csv 파일로 연습하기
#csv 파일 지원하는 프로그램이 더 많고, 엑셀보다 용량이 가벼워서 더 많이 쓰인다
#Comma Separated Values
#엑셀의 col_names = F와 같은 기능은 header = F

df_csv_exam <- read.csv("csv_exam.csv")
df_csv_exam

df_csv_exam <- read.csv("csv_exam.csv", stringsAsFactors = F) 
#문자가 들어있는 csv 파일일 때 stringsAsFactors = F 설정, 그래야 변수를 문자 타입으로 불러올 수 있고 에러 발생 방지


#csv로 데이터 프레임 만들어서 저장해보기
df_midterm <- data.frame(english = c(90,80,60,70),
                         math = c(50,60,100,20),
                         class = c(1,1,2,2))
df_midterm

write.csv(df_midterm, file = "df_midterm.csv")


#RData 파일로 데이터 저장하기
save(df_midterm, file = "df_midterm.rda")

#RData 파일 불러오기
rm(df_midterm) #우선 df_midterm 삭제하기

df_midterm #파일 제대로 없어졌나 확인하기

load("df_midterm.rda") #제대로 불러오기
df_midterm



#read.csv()나 read_excel()은 파일을 불러와 새 변수에 할당해야 활용할수 있다
#반면 load()로 rda 파일 불러오면 저장할 때 사용한 데이터 프레임이 자동으로 만들어지기 때문에 
#따로 새 변수에 할당하지 않는다.
#엑셀 파일 불러와 df_exam에 할당하기
df_exam <- read_excel("excel_exam.xlsx")

#csv 파일 불러와 df_csv_exam에 할당하기
df_csv_exam <- read.csv("csv_exam.csv")

#Rda 파일 불러오기
load("df_midterm.rda")

