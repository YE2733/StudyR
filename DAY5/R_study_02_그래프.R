## 그래프2
color.6 <- rep('#a8dadc',6) 
color.6[2] <- '#1d3557'
color.4 <-rep('#a8dadc', 4)
color.4[2] <- '#1d3557'
color.4[3] <- '#457b9d'
color.2 <- c('#a8dadc', '#1d3557')
color.2[2]

# 원그래프(pie chart)
favorite.season <- c('WINTER', 'SUMMER', 'SPRING', 'SUMMER', 'SUMMER', 'FALL', 'FALL', 'SUMMER', 'SPRING', 'SPRING', 'SUMMER', 'SUMMER')
favorite.season
ds <- table(favorite.season)
ds
pie(ds, main='선호계절', radius = 1)


# 원그래프2
install.packages('plotrix')
library(plotrix)
pie3D(ds, main= '선호계절',
      labels= names(ds), labelcex= 1.0, labelcol = 'blue',
      explode= 0.1, radius= 1.5, 
      col= c('white', 'lightgreen','skyblue','brown'))
      

# 선그래프
month = 1:12
late = c(5,8,7,9,4,6,12,13,8,6,6,4)
plot(month, late, main='지각생 통계', type='o', lty=1, lwd=2, xlab='월', ylab='지각생 수')

# 선그래프 2개 이상
month = 1:12
late1 = c(5,8,7,9,4,6,12,13,8,6,6,4)
late2 = c(4,6,5,8,7,8,10,11,6,5,7,3)
plot(month, late2, main='지각생 통계2', type='o', lty=1, lwd=2, xlab='월', ylab='지각생 수', col='red', ylim=c(0,15))
lines(month, late1, type='o', col='blue', lwd=2)

# LAB 원그래프와 선그래프로 데이터 정리
install.packages('DAAG')
library(DAAG)

ds <- table(science$like)
pie(ds, main='선호 점수별 비율', col = rainbow(length(ds)), radius = 1)

pie3D(ds, main='선호 점수별 비율', explode = 0.1, labels = names(ds), labelcex=1.0, radius=1.5, col= rainbow(length(ds)))

# 산점도(scatter plot)
mtcars
wt <- mtcars$wt
mpg <- mtcars$mpg
plot(wt, mpg, main='중량-연비 그래프', xlab = '중량', ylab = '연비(MPG)', las=1, col='red', 
     pch= 19)

# 아래의 세가지 산점도 다 동일
plot(mtcars$wt, mtcars$mpg)
plot(mtcars[,c('wt', 'mpg')])
plot(mpg~wt, data=mtcars)

vars <- c('mpg', 'disp', 'drat', 'wt')
target <- mtcars[,vars]
plot(target, main='다중 산점도')

# IRIS
iris.2 <- iris[,3:4]
levels(iris$Species)
group <- as.numeric(iris$Species)
group
color.3 <- c('red','green','blue')
plot(iris.2, main='붓꽃 꽃잎길이-넓이 산점도', pch=group, 
     col=color.3[group], xlab='꽃잎길이', ylab='꽃잎넓이', 
     las=1)
legend(x='bottomright', legend=levels(iris$Species), pch=c(1:3), col = color.3)

# 자동차 선팅 분석
library(DAAG)
str(tinting)
plot(tinting$it, tinting$csoa)

group <- as.numeric(tinting$tint)
group
color <- c('red','green','blue')
plot(tinting$it, tinting$csoa, col=color[group], pch=c(group))

# 실전분석. 호주의 사회복지서비스와 만족도
library(DAAG)
str(socsupport)
help("socsupport")

library(plotrix)
ds <- table(socsupport$age)
pie3D(ds, main='연령분포', labels=names(ds), labelcex=1.0, explode=0.1, radius=1.5, col=rainbow(length(ds)))

group <- as.numeric(socsupport$gender)
color <- c('blue', 'red')
plot(socsupport[,c('emotionalsat','tangiblesat','age')],
     pch=group, col=color[group])
