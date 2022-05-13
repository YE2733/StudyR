## 데이터 입출력
age <- c(28,17,35,46,23,67,30,50)
age
class(age)
str(age)

min(age)
max(age)

cat('가장 젊은 나이는', min(age), '세 이고', '가장 고령 나이는', max(age),'세  입니다')

## 화면에서 데이터 입력받기
install.packages('svDialogs')
library(svDialogs)
user.input <- dlgInput('수입을 입력하세요')$res
income <- as.numeric(user.input)
income
tax <- income * 0.05
tax
# 1e+4 부터 출력을 10000로 변경하는 옵션
options(scipen = 1)
cat('세금: ', tax )

x <- 1
print(x)
cat(x)
print(iris[1:6,])   #head(iris)
cat(iris[1:6,])  # Error print는 가능, cat으로는 2차원 자료 출력 X.

# LAB. 체질량 지수 계산1
# BMI가 25이상이면 과체중, 30이상이면 비만
height <- dlgInput('키를 입력하세요(cm)')$res
weight <- dlgInput('몸무게를 입력하세요(kg)')$res

height <- as.numeric(height)
weight <- as.numeric(weight)

height.res <- height/100
bmi <- weight/(height.res^2)

cat('키', height, 'cm', '몸무게', weight, 'kg\n')
cat('체질량지수', bmi, '입니다. \n(25이상 과체중, 30이상 비만)')

# 숫자 천단위 콤마
install.packages('formattable')
library(formattable)

num.data <- c(1250000, 22500, 123.456, 123.444, 1789.34)
num.data
comma(num.data)

## 파일입출력
getwd() # 현재 작업 폴더 알아내기
setwd('c:/Study/StudyR')
getwd()

# csv 파일읽기
air.quality <- read.csv('./Day3/airquality.csv', header = T)
air.quality
head(air.quality)
tail(air.quality)

setosa.iris <- subset(iris, Species=='setosa')
str(setosa.iris)
setosa.iris
# row.names = F  # 행번호가 같이 저장 안 됨.
write.csv(setosa.iris, './Day3/airquality.csv', row.names = F)

## 엑셀 읽고 쓰기
library(xlsx)
air.quality.xlsx <- read.('./Day3/airquality.xlsx', header = T, sheetIndex=1)

# LAB. 다이아몬드 정보
library(ggplot2)
diamonds
str(diamonds)

levels(diamonds$cut)
levels(diamonds$color)
levels(diamonds$clarity)

diamonds.new <- subset(diamonds, cut == 'Premium' & carat >= 2)
diamonds.new

write.csv(diamonds.new, './DAY3/shiny_diamonds.csv', row.names = F)

# color가 D나 H가 아닌 나머지
diamonds.new.without.DH <- subset(diamonds.new, color != 'D' & color != 'H')
diamonds.new.without.DH

write.csv(diamonds.new.without.DH, './DAY3/shiny_diamonds_wihout_DH.csv', row.names = F)

