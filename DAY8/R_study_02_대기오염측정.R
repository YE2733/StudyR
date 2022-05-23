## 대기오염
# 데이터 준비
setwd('C:/Study/StudyR/DAY8')
files <- c('ds.2015.csv','ds.2016.csv', 'ds.2017.csv', 'ds.2018.csv', 'ds.2019.csv')
ds <- NULL
for (f in files) {
  tmp <- read.csv(f, header=T)
  ds <- rbind(ds,tmp)  # rbind : 행결합, cbind : 열결합
  print(f)
}

str(ds)
unique(ds$loc)  # 관측장소
range(ds$mdate) # 측정기간

#결측값 확인
for(i in 3:8){
  cat(names(ds)[i],
      sum(is.na(ds[,i])),
      sum(is.na(ds[,i]))/nrow(ds),
      '\n')
}

ds <- ds[,-8]  # PM25열 제거(너무 많은 결측값 확인-미리 제거 후 진행)
ds <- ds[complete.cases(ds),] # 결측값 제거

str(ds)

mdate <- as.character(ds$mdate) #m date를 문자열로 변환
head(mdate)

ds$year <- as.numeric(substr(mdate, 1,4))  # 년도
ds$month <- as.numeric(substr(mdate, 5,6)) # 월
ds$hour <- as.numeric(substr(mdate, 9,10)) # 시간

ds$locname <- NA  # locname 열 추가
ds$locname[ds$loc==111123] <- '서울'
ds$locname[ds$loc==336111] <- '목포'
ds$locname[ds$loc==632132] <- '강릉'

head(ds)
unique(ds$locname) # 명칭이 잘 들어갔는지 확인

boxplot(PM10~locname, data=ds,
        main='미세먼지 농도 분포',
        ylim=c(1,100))

# 연도별
library(ggplot2)
tmp.year <- aggregate(ds[,7],
                      by=list(year=ds$year, loc=ds$locname), FUN='mean')

tmp.year$loc = as.factor(tmp.year$loc)
head(tmp.year)

ggplot(tmp.year, aes(x=year, y=x, colour=loc, group=loc))+
  geom_line()+
  geom_point(size=6, shape=19, alpha=0.5)+
  ggtitle('연도별 PM10 농도 변화')+
  ylab('농도')

# 월별
tmp.month <- aggregate(ds[,7],
                      by=list(month=ds$month, loc=ds$locname), FUN='mean')

tmp.month$loc = as.factor(tmp.month$loc)
head(tmp.month)

ggplot(tmp.month, aes(x=month, y=x, colour=loc, group=loc))+
  geom_line()+
  geom_point(size=6, shape=19, alpha=0.5)+
  ggtitle('월별 PM10 농도 변화')+
  ylab('농도')

# 시간별
tmp.hour <- aggregate(ds[,7],
                       by=list(hour=ds$hour, loc=ds$locname), FUN='mean')

tmp.hour$loc = as.factor(tmp.hour$loc)
head(tmp.hour)

ggplot(tmp.hour, aes(x=hour, y=x, colour=loc, group=loc))+
  geom_line()+
  geom_point(size=6, shape=19, alpha=0.5)+
  ggtitle('월별 PM10 농도 변화')+
  ylab('농도')

# 오염물질 농도 간의 상관관계 - 서로 상관이 없음을 확인
set.seed(1234)
plot(ds[sample(nrow(ds),5000),3:7], lower.panel=NULL)
write.csv(ds, 'C:/Study/StudyR/DAY8/ds.csv') #ds 파일 csv로 저장

# 미세머지 최고점과 최저점 확인
tmp.yml <- aggregate(ds[,7],
                     by=list(year=ds$year,
                             month=ds$month,
                             loc=ds$locname), FUN='mean')
tmp.yml
idx <- which(tmp.yml$x==max(tmp.yml$x))
tmp.yml[idx,]

# 가장 미세먼지가 적었던 날
idx <- which(tmp.yml$x==min(tmp.yml$x))
tmp.yml[idx,]







