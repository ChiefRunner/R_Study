#20190523_ 그래프 연습
#R은 우수한 그래프 기능을 가지고 있다
#ggplot2은 그래프를 만들 때 가장 많이 사용된다
#ggplot2 문법은 레이어 구조로 되어있다
#배경 -> 그래프 형태 -> 축 범위, 색 등 옵션 설정.

#산점도 만들기
#산점도란 데이터를 x축과 y축에 점으로 표현한 그래프
#연속 값으로 된 두 변수의 관계를 표현할 때 사용된다

library(ggplot2)
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()

#축 범위는 xlim()과 ylim()으로 조정할 수 있다
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + xlim(3,6)
ggplot(data = mpg, aes(x = displ, y = hwy)) +
  geom_point() +
  xlim(3,6) +
  ylim(10,30)

#플롯 창 메뉴의 export 버튼을 누르면 그래프를 이미지 파일로 저장할 수 있다
#copy to clipboard는 다른 프로그램에서 붙여넣기를 하게 해준다

##188페이지 혼자서 해보기##
ggplot(data = mpg, aes(x = cty, y = hwy)) + geom_point()
ggplot(data = midwest, aes(x = poptotal, y = popasian)) +
  geom_point() +
  xlim(0,500000) +
  ylim(0,10000)
#지수표기법 참고하기
