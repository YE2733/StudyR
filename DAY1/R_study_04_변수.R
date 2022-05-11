## 변수
total <- 5050           # 5050을 변수 total에 저장
total                   # 방법 1
print(total)            # 방법 2
cat('합계 :', total)    # 방법 3

변수 <-100
변수          # Values에는 들어갔지만 출력되지 않는다.
print(변수)   # 출력됨 (되도록 한글 변수명 사용X)

a <- 10
b <- 20
c <- a + b
print(a)
print(b)  
print(c)
cat(a,'+', b, '=', c)

# 변수명
avg
.total <- 20202  #.으로 시작가능
.total

# 변수명에서 대소문자 별개 문자 취급
A <- 11
a
var_A <- 100
var_a <- 50

# R에서 변수 특이점은 . 허용
abc <- 80
abs <- 80
mid <- 10
mid.sum <- mid*abs
mid.sum

10/0  #Inf    
-10/0 #-Int
sqrt(-2) #NaN
val <- NULL
val

# 숫자형과 문자형
age.1 <- 20
age.2 <- 25
print(age.1 + age.2)
name.1 <- 'John'
print(name.1)

grade.1 <- '3'
print(age.1 + grade.1)  # Error in age.1 + grade.1 :  

# 논리형 대문자자 T, F 많이 사용
5 > 3
2 > 7
a <- TRUE    # 산술연산에서 TRUE는 1
a
b <- F
a
b
a + b

a <- NA
b <- 'NA'
a
b

## 소금물의 농도 구하기
## 변수 salt 소금양
## 변수 water 물의 양
## 변수 result 농도
## 결과를 "소금 = * mg, 물 = * ml: 농도 = **%"

# 소금 50g과 물 100g을 섞었을 때 소금무르이 농도(%)
salt <- 50
water <- 100
result <- salt / (salt + water)*100
cat("소금 =", salt, ", 물 =", water, " : 농도=", result, "%")


