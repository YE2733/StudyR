## 데이터 입출력
setwd('C:/Study/StudyR/DAY4')  # working 디렉토리 지정
print('Hello R!')

# 실행결과물 저장  append= F 는 파일 새로 생성(다지움)
sink('result.txt', append= T)  # append -> 이전 문서 다음 뒤, 계속 붙이기
a <- 10
b <- 20
cat('a+b=', a+b, '\n')
sink()

sink('result.txt', append= T)  
iris
tail(iris) 
sink()    # 연파일을 닫아주기 (반드시!!

## txt 파일 읽기/ 구분자는 공백 또는 탭
air.txt <- read.table('airquality.txt', header = T, sep = ' ')
air.txt
# csv파일도 read.table로 로드 가능 (sep=',))
air.csv <- read.table('../DAY3/airquality.csv', header = T, sep=',')
air.csv

## LAB. 체질량 지수 계산2
library(svDialogs)
# 마지막에 Ctrl + Enter로 실행
height <- dlgInput('키 입력(cm)')$res
weight <- dlgInput('몸무게 입력(kg')$res
height <- as.numeric(height)
weight <- as.numeric(weight)
height <- height / 100
bmi <- weight/(height^2)

sink('bmi.txt', append = T)
cat('height', 'weight', 'bmi\n')
cat(height*100, weight, bmi)
cat('\n')
sink()

result <- read.table('C:/Study/StudyR/DAY4/bmi.txt', header = T, sep = ' ')
result

names(result) <- c('키', '몸무게', '체질량지수')
result
write.table(result, 'bmi_new.txt', row.names = T)




## 엑셀 패키지
install.packages('readxl') #엑셀 읽기용 패키지
library(readxl)

air.xlsx <- read_excel('C:/Study/StudyR/DAY3/airquality.xlsx')
air.xlsx

install.packages('openxlsx') #엑셀 쓰기용 패키지
library(openxlsx)

write.xlsx(result, 'bmi_result.xlsx', rowNames = F)

## 실전분석. 자동차 정보 조회
library(svDialogs)
library(readxl)
library(openxlsx)

carprice.new <- read.csv('C:/Study/StudyR/DAY4/carprice.csv', header = T)         
carprice.new
str(carprice.new)
write.csv(carprice.new,'./carprice.new.csv', row.names = F)

levels(carprice.new[,1])

levels(carprice.new[,1])

input.type <- dlgInput('차량타입 입력(Compact, Small, Midsize, Large, Sporty, Van')$res
input.city <- dlgInput('최소 시내연비 입력')$res
Input.city <- as.numeric(input.city)

result <- subset(carprice.new, Type == input.type & MPG.city >= input.city)

write.xlsx(result, './van_result.xlsx', rowNames = T)

getwd()

## Oracle 연동
install.packages('rJava')
install.packages('RJDBC')
library(rJava)
library(RJDBC)

# DB연결 설정
jdbcDriver <- JDBC(driverClass = 'orcle.jdbc.OracleDriver', classPath = './DAY4/ojdbc6.jar')  #충돌일어남


# PASS