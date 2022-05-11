## 패키지 설치 및 로드
#문자열 ' " 다 사용가능
install.packages('ggplot2')
library(ggplot2)   #패키지 로드
library(g.data)

ggplot(data = iris, aes(x = Petal.Length, y = Petal.Width)) + geom_point()

install.packages('cowsay')
library(cowsay)
say('Hello world!', by='cat')
say('좋은 아침', by='snowman')
say('이게 뭐야', by='monkey')

# 시스템 함수
Sys.Date()
Sys.time()

## 실전분석. 생일맞추기
# 먼저 태어난 달에 4를 곱하고, 그 결과에 9를 더하고, 다시 그 결과에 25를 곱하고, 마지막으로 다시 그 결과에 태어난 날짜를 더한다. -> ((m*4)+9)*25+d = 100m+d+225 (m은 몫, d는 나머지)
# 계산결과가 다음과 같을 때 각자의 생일은?

# 소윤 주연 민철  석준  현석
# 931  754  1029  1139  1442

# 소윤이 생일
(931-225)%%100  # 날
((931-225)-((931-225)%%100))/100 # 달

val = 931
d <- (val-225)%%100
m <- ((val-225)-((val-225)%%100))/100
cat(m, '월', d, '일')





