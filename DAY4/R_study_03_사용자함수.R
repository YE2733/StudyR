## 외부 파일 함수 실행
getwd()
setwd('./DAY4')
getwd()
# 함수파일 호출
source('myfunc.R')

result <- mydiv(109, 6)
result

## 자격증 합격여부
sub1 <- c(14, 16, 12, 20, 8, 6, 12, 18, 16, 10)
sub2 <- c(18, 14, 14, 16, 10, 12, 10, 20, 14, 14)
sub3 <- c(44, 38, 30, 48, 42, 50, 36, 52, 54, 32)
score <- data.frame(sub1,sub2, sub3)
score


result <- determine(score)
source('determine.R')
result <- determine(score)
result

## 조건에 맞는 데이터 위치 리턴 함수
score2 <- c(76,84,69,50,95,60,82,71,88,84)
which(score2==69)
which(score2==76)
which(score2==84)
which(score2>=80)
max(score2)
which.max(score2)
min(score2)
which.min(score2)

idx <- which(score2<=60)
idx
score2[idx] <- 61  # 값보정
score2

idx <-  which(score2>=80)
idx
score2[c(2,5,7,9,10)]
score.high <- score2[idx]
score.high

## iris 꽃잎길이가 5.0 이상인것
idx <- which(iris$Petal.Length>5.0)
idx
iris.big <- iris[idx,]
iris.big
# 위에 which 와 밑의 subset 같다.
iris.big.2 <- subset(iris, iris$Petal.Length>5.0)

## LAB, 언어 발달 상황 진단 프로그램 
install.packages('Stat2Data')
library(Stat2Data)
data(ChildSpeaks)
ChildSpeaks
str(ChildSpeaks)
## 말문이 트인 시기를 등급으로 환산
idx <- which(ChildSpeaks$Age < 9 )
idx
ChildSpeaks[idx,]
ChildSpeaks[idx, 'm1'] <- 5
idx <- which(ChildSpeaks$Age >= 9 &ChildSpeaks$Age < 15)
idx
ChildSpeaks[idx, 'm1'] <- 4
idx <- which(ChildSpeaks$Age >= 15 &ChildSpeaks$Age < 21)
ChildSpeaks[idx, 'm1'] <- 3
idx <- which(ChildSpeaks$Age >= 21 &ChildSpeaks$Age < 27)
ChildSpeaks[idx, 'm1'] <- 2
idx <- which(ChildSpeaks$Age >= 27)
ChildSpeaks[idx, 'm1'] <- 1
## 언어이해력 점수 (Gesell) 등급 환산
idx <- which(ChildSpeaks$Gesell < 70)
idx
ChildSpeaks[idx, 'm2'] <-1
idx <- which(ChildSpeaks$Gesell >= 70 & ChildSpeaks$Gesell < 90)
ChildSpeaks[idx, 'm2'] <- 2
idx <- which(ChildSpeaks$Gesell >= 90 & ChildSpeaks$Gesell < 110)
ChildSpeaks[idx, 'm2'] <- 3
idx <- which(ChildSpeaks$Gesell >= 110 & ChildSpeaks$Gesell < 130)
ChildSpeaks[idx, 'm2'] <- 4
idx <- which(ChildSpeaks$Gesell >= 130)
ChildSpeaks[idx, 'm2'] <- 5

ChildSpeaks$total <- ChildSpeaks$m1 + ChildSpeaks$m2
idx <- which(ChildSpeaks$total < 3)
ChildSpeaks[idx, 'result'] <- '매우 늦음'
idx <- which(ChildSpeaks$total >= 3 & ChildSpeaks$total < 5)
ChildSpeaks[idx, 'result'] <- '늦음'
idx <- which(ChildSpeaks$total >= 5 & ChildSpeaks$total < 7)
ChildSpeaks[idx, 'result'] <- '보통'
idx <- which(ChildSpeaks$total >= 7 & ChildSpeaks$total < 9)
ChildSpeaks[idx, 'result'] <- '빠름'
idx <- which(ChildSpeaks$total >= 9)
ChildSpeaks[idx, 'result'] <- '매우 빠름'
ChildSpeaks
ChildSpeaks[which.min(ChildSpeaks$total),]

## 실전분석. 종업원의 팁 분석하기
library(reshape2)
str(tips)
data(tips)
# 성별에 따라
unique(tips$sex)
idx <- which(tips[,'sex'] == 'Female')
avg.female <- mean(tips[idx, 'tip'])

idx <- which(tips[,'sex'] == 'Male')
avg.male <- mean(tips[idx, 'tip'])

avg.female
avg.male
# 흡연 유무에 따라
unique(tips$smoker)
idx <- which(tips$smoker == 'Yes')
avg.smoker <- mean(tips[idx, 'tip'])

idx <- which(tips$smoker == 'No')
avg.nonsmoker <- mean(tips[idx, 'tip'])

avg.smoker
avg.nonsmoker

meanbycol.tip <- function(tips, colname){
  value <- unique(tips[, colname])
  result <- list()
  for(i in 1:length(value)){
    idx <- which(tips[,colname] == value[1])
    result[1] <- mean(tips[idx, 'tip'])
  }
}  
  names(result) <- value
  return(result)
#오류
  
