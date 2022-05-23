## 1. 아래를 확인하여 아래의 두문제를 푸세요.
# 함수를 사용하여 아래의 벡터를 만들어 보세요
v1 <- seq(1.0, 3.0, 0.2)
v1

# x <- 1:11 에서 아래의 결과가 나오게 만들어보세요. 단순 인덱스는 아님
x <- 1:11
x
x[rep(1:3,3)]

## 2. 아래를 확인하여 문제를 푸세요
# 월요일부터 일요일까지의 최고 기온데이터입니다. max.temp <- c(22,27,26,24,23,26,28)
#기본적인 막대 그래프를 그리면 다음과 같습니다. 
#이 그래프를 아래와 같이 그리는 크드를 작성하세요.
max.temp <- c(22,27,26,24,23,26,28)
barplot(max.temp, main = '주간 최대 기온',
        col = rainbow(7),
        xlab = '섭씨', ylab = '요일',
        horiz = T, las = 2,
        names = c('월', '화', '수', '목', '금', '토', '일'))

## 3. 아래를 확인하여 문제를 푸세요.
# trees 데이터셋을 사용해 아래와 같은 산점도가 나오도록 만드세요. girth-volume
trees
str(trees)
plot(trees$Girth, trees$Volume, 
     main = '나무 둘레-용적 산점도', 
     xlab = '둘레', ylab = '용적', 
     col = 'skyblue', pch = 18)

## 4. 아래를 확인하여 문제를 푸세요.
# airquality 데이터 셋으로 아래의 다중 히스토그램을 그리세요.
airquality

color.9 <-rep('#a8dadc', 9)
color.9[1] <- '#1d3557'
color.5 <-rep('#a8dadc', 5)
color.5[4] <- '#1d3557'
color.7 <-rep('#a8dadc', 7)
color.7[6] <- '#1d3557'
color.5.1 <-rep('#a8dadc', 5)
color.5.1[2] <- '#1d3557'

par(mfrow=c(2,2), mar=c(4,4,3,2)) 

hist(airquality$Ozone, main = '오존분포',
     col = color.9, xlab = '오존', ylab = 'Frequency')

hist(airquality$Temp, main = '기온분포',
     col = color.5, xlab = '기온', ylab = 'Frequency',
     breaks = 5)

hist(airquality$Solar.R, main = '자외선분포',
     col = color.7, xlab = '자외선', ylab = 'Frequency',
     breaks = 7)

hist(airquality$Wind, main = '풍량분포',
     col = color.5.1, xlab = '풍량', ylab = 'Frequency',
     breaks = 5)

par(mfrow=c(1,1))

## 5. 아래를 확인하여 문제를 푸세요.
# carData에는 TitanicSurvavial 이라는 데이터 셋이 존재한다.
# 타이타닉 생존자에 대한 데이터이며
# 나이의 결측값을 제거하면 총데이터는 1046개가 된다.
# 생존자와 사망자의 선실(1st, 2nd, 3rd) 별 차트를 그려라
library(carData)
View(TitanicSurvival)
str(TitanicSurvival)

Data2 <- TitanicSurvival
Data3 <- Data2[complete.cases(Data2),]
Data3

frame1 <- data.frame( Data3$survived, Data3$passengerClass)
frame1.table <- table(frame1)
str(frame1)

barplot(frame1.table, main = '타이타닉 클래스별 생존자',
        col = c('red', 'blue'), beside=F,
        names =  c('First', 'Second', 'Third'),
        legend.text = c('사망자', '생존자'),
        args.legend = list(x = 'topleft', inset = c(0.1,0)))
