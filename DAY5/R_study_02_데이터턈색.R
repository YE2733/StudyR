## 데이터탐색 
# 단일범주 데이터
library(carData)
tData <- Titanic
tData2 <- TitanicSurvival
str(tData2)

room.class <- TitanicSurvival$passengerClass
room.class

tbl <- table(room.class)
tbl
sum(tbl)

barplot(tbl, main = '선실별 탑승객', xlab = '선실 등급', ylab = ' 탑승객 수', col = c('blue', 'green', 'yellow'))

tbl/sum(tbl)

pie3D(tbl, main='선실별 탑승객 비율', radius = 1.5,
      labels=c('1등실','2등실','3등실'),
      col=c('blue','green','yellow'),
      labelcex=1.0, labelcol='white', explode=0.1)

# 생사여부, 성별 모두 위와 동일.

# 단일변수 수치형
grad <- state.x77[, 'HS Grad']
grad
summary(grad)
min(grad)
median(grad)
var(grad)  # 분산
sd(grad)   # 표준편차

hist(grad, main='주별 졸업률', xlab = '졸업률', ylab = '주의 개수', col = 'orange')

boxplot(grad, main='주별 졸업률', col = 'purple')

# 졸업률이 가장 낮은 수
idx <- which(grad==min(grad))
grad[idx]

# 졸업류이 가장 높은 수
idx <- which(grad==max(grad))
grad[idx]

# 졸업률이 평균 이하인 주
idx <- which(grad<mean(grad))
grad[idx]

## 74~79 영국 폐질환 사망자 데이터
getwd()
ds <- read.csv('./DAY5/fdeaths.csv', header=T, row.names = 'year')
ds
par(mfrow = c(1,1), mar=c(5,4,4,2)+.1)
my.color <- c('black', 'blue', 'red', 'green', 'purple', 'darkgray') 
my.lty <- 1:6
plot(1:12,                           # x축 데이터
     ds[1,],                         # y축 데이터(1974)
     main = '월별 사망자 추이',      # 그래프 제목
     type='b',                       # 포인트 타입
     lty=my.lty[1],                  # 라인 종류
     xlab = '월',                    # x축 라벨
     ylab = '사망자수',              # y축 라벨
     ylim=c(300,1200),               # y축 범위
     col=my.color[5],                # 선색 
     lwd=3,                          # 라인 두께
     las=1                           # y축 가로쓰기
     )

for (i in 2:6){
  lines(1:12,
        ds[i,],
        type='b',
        lty=my.lty[i],
        lwd = 2,
        col=my.color[i]
        )
}

legend(x='topright',
       legend=rownames(ds),
       lty = my.lty,
       col=my.color,
       lwd = 2,
       inset = c(0,0),
       bty='n')

# LAB. 자동차 가격 및 성능 데이터 분석
library(DAAG)
str(carprice)

carprice$Price
range(carprice$Price)  # 값의 범위
summary(carprice$Price)

hist(carprice$Price, 
     main = '자동차 가격 분포',
     xlab = '가격대(1,000$)',
     ylab = '빈도수',
     col=rainbow(8))

barplot(carprice$Price)

tbl <- table(carprice$Type)
barplot(tbl, main = '자동차 빈도수',
        xlab = '차종',
        ylab = '빈도수',
        col = rainbow(length(tbl)))

idx <- which(carprice$Price==max(carprice$Price))
carprice[idx, c('Type', 'Price')]

## 다중변수 탐색(분석)
str(pressure)

plot(pressure$temperature,
     pressure$pressure,
     main = '온도와 기압',
     xlab = '온도(화씨)',
     ylab = '기압')
