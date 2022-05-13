## 매트릭스(계속)

z <- matrix(1:20, nrow = 4, ncol = 5, byrow = T)
z

x <- c(20,25,30,35)
x

m1 <- cbind(z,x)    # 열기준 결합
m1

y <- 36:41
y

m2 <- rbind(m1,y)   # 행기준 결합
m2

# 값 추출
m2[1,3]
m2[1,6]
m2[1,7]

z[1,5]
z[4,5]

z[2,1:3]
z[2,c(1,2,4)]
z[1:2,]
z[,c(1,4)]

# 매트릭스 이름 붙이기
score <- matrix(c(90,85,69,78,85,96,49,95,90,80,70,60), nrow=4)
score
rownames(score) <- c('John', 'Tom', 'Mark', 'Jane')
colnames(score) <- c('English', 'Math', 'Science')
score

score['John', 'Math']
score['Math', 'Tom'] # Error

score['Tom',]
score[,'Science']
rownames(score)
colnames(score)
colnames(score)[2]

## LAB. 햄버거 영양 성분 정보 
burger <- matrix(c(514,917,11,533,853,13,566,888,10), nrow = 3, byrow= T)
burger

rownames(burger) <- c('Macdonald', 'Lotteria', 'BurgerKing')
colnames(burger) <- c('kcal', 'Na', 'fat')

burger['Macdonald', 'Na']
burger['Macdonald',]
burger[, 'kcal']

# 데이터프레임
physicals <- matrix(c(168.4, 169.5, 62.4,65.5, 'M', 'F'), nrow = 2)
physicals   # 숫자와 문자를 같이 쓰면 모든게 문자형으로 바뀜

city <- c("Seoul", "Tokyo", "Washinton")
rank <- c(1,3,2)
city.info <- data.frame(city, rank)
city.info

iris  # 150그루의 붓꽃에 대해 4개 분야의 측정데이터와 품종정보 결합한 데이터
head(iris)
tail(iris)
str(iris)  # 정보
str(z)
str(burger)
str(x)
str(c('John','Tom','Mark','Jane'))

iris[140,]
iris[,5]
iris[,c(1:2)]
iris[,c(1,3,5)]
iris[,c('Sepal.Length', 'Petal.Length', 'Species')]
iris[1:5,]
iris[1:5, c(1,3)]

val1 <- head(iris[,c('Sepal.Length', 'Petal.Length', 'Species')])[1,]
val1

head(iris[,c('Sepal.Length', 'Petal.Length', 'Species')])


# LAB2. 햄버거 영양 성분 정보 추가
kcal <- c(514,533,566)
Na <-c(917,853,888)
fat <- c(11,13,10)
menu <- c('새우','불고기','치킨')

burger.2 <- data.frame(kcal, Na, fat, menu)
burger.2

row.names(burger.2) <- c('맥도날드', '롯데리아', '버거킹')
burger.2

burger.sum <- burger.2[, 'Na']*burger.2[,'fat']
burger.sum

burger.2['맥도날드',]

dim(iris)  #행과 열의 개수
dim(burger)
dim(burger.2)
nrow(iris)
ncol(iris)
colnames(iris)
colnames(burger.2)
rownames((burger.2))
rownames(iris)

head(iris, n = 2)
tail(iris, n = 5)
head(x = iris, n = 10)
str(iris)

iris$Sepal.Length
levels(iris$Species)  
levels(iris[,'Species'])

# 행별, 열별 합계, 평균 산술계산
colSums(iris[,-5])
colsums(iris[,-'Species'])  #Error

colSums(iris[,c(1,2)])  #최소 2개 이상의 열이 선택되어야 함
colMeans(iris[,-5])
head(iris)
rowSums(iris[,-5])
rowMeans(iris[,-5])

z <- matrix(1:20, nrow=4)
z
t(z)
burger.2
t(burger.2)

iris.subset.1 <-subset(iris, Species=='setosa')
iris.subset.1

iris.subset.2<- subset(iris, Sepal.Length>=5.0 & Sepal.Width>3.0)
iris.subset.2
str(iris.subset.2)

iris.subset.2$Sepal.Length

iris.subset.2[,c(1,2,5)]

a <- matrix(1:20, 4, 5)
b <- matrix(21:40, 4, 5)
a
b

a.2 <- a*2
a
a.2

iris

class(iris)  # 타입만
str(iris)    # 타입 + 데이터
class(z)
str(z)
is.matrix(iris)    # 데이터셋이 매트릭스인지 확인하는 함수
is.matrix(z)
is.data.frame((iris))  #데이터셋이 데이터프레임인지 확인하는 함수

## LAB. 벚나무 판매
# 1. 직경(Girth)은 화원에서 보유한 벚나무의 평균보다 커야한다.
# 2. 높이(Height)는 80보다 커야 한다.
# 3. 부피(Volume)는 50보다 커야 한다.

class(trees)
str(trees)

# 화원 나무 직경 평균
girth.mean <- mean(trees$Girth)
girth.mean

candicate <- subset(trees, Girth >= girth.mean & Height > 80 & Volume > 50)
candicate
nrow(candicate)

## 실전분석. 종업원의 팁 계산
install.packages('reshape2')
library(reshape2)
tips

is.matrix(tips)
is.array(tips)
is.data.frame(tips)
class(tips)
str(tips)
levels(tips$day)
head(tips)
tail(tips)
table(tips$day)
class(table(tips$day))

dinner <- subset(tips, time=='Dinner')
dinner
lunch <- subset(tips, time=='Lunch')
lunch
table(dinner$day)
table(lunch$day)

dinner
dinner.data <- dinner[c('total_bill', 'tip', 'size')]
lunch.data <- lunch[c('total_bill', 'tip', 'size')]
str(dinner.data)
str(lunch.data)

colSums(dinner.data)
colMeans(dinner.data)
colSums(lunch.data)
colMeans(lunch.data)

tips.rate <- tips$tip/tips$total_bill
tips.rate
mean(tips.rate)
