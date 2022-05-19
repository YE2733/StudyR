## 고급 그래프
# treemap
install.packages('treemap')
library(treemap)
data(GNI2014)
head(GNI2014)
treemap(GNI2014,
        index = c('continent', 'iso3'),
        vSize = 'population', 
        vColor = 'GNI',
        title = '대륙간 인구수 당 GNI',
        type = 'value')
        
        # bg.labels = 'yellow' 사용불가

# LAB. 미국 주요 도시 통계 데이터 분석
library(carData)
head(Ericksen)
str(Ericksen)

ds <- subset(Ericksen, city=='state')
ds$stname <- rownames(ds)
treemap(ds,
        index = c('stname'),
        vSize = 'poverty',
        type = 'value',
        vColor = 'crime',
        title = 'USA states poverty and crime')

## 레이더차트
install.packages('fmsb')
library(fmsb)

score <- c(80,60,95,85,40,50)
max.score <- rep(100,5)
min.score <- rep(0, 5)
ds <- rbind(max.score,min.score,score)
ds 
class(ds)
ds<- data.frame(ds)
ds
colnames(ds) <- c('국어','영어','수학','물리','음악', '체육')
ds

radarchart(ds)

# 매개변수(옵션)
# R에서는 RCG(RR,GG,BB,AA0)
radarchart(ds,
           pcol = 'blue',
           pfcol = rgb(0,0.4,0.8,0.5),
           plwd = 2,
           cglcol = 'blue',
           cglty = 1,
           cglwd = 0.8,
           axistype = 1,
           seg = 4,
           axislabcol = 'blue',
           caxislabels = seq(0,100,25))

# LAB. 종교 유무 조사데이터
library(carData)           
head(WVS)

pop <- table(WVS$country)
tmp <- subset(WVS, religion=='yes')
rel <- table(tmp$country)
stat <- rel/pop
stat

max.score <- rep(1,4)
min.score <- rep(0,4)
ds <- rbind(max.score,min.score,stat)
ds
ds <- data.frame(ds)
ds

radarchart(ds,
           pcol = 'darkgreen',
           pfcol = rgb(0,0.8,0.2,0.4),
           plwd = 2,
           cglcol = 'yellowgreen',
           cglty = 1,
           cglwd = 2,
           axistype = 1,
           seg = 3,
           axislabcol = 'yellowgreen',
           caxislabels = seq(0,1,0.3),
           title = '국가적 종교인 비율')

## ggplot2
library(ggplot2)

month <- c(1:6)
rain <- c(55,50,45,50,60,70)
df <- data.frame(month,rain)
df

ggplot(df, aes(x=month, y=rain))+
  geom_bar(stat = 'identity',
           width  = 0.7,
           fill = 'skyblue')

## 막대그래프 가로
ggplot(df, aes(x=month, y=rain))+
  geom_bar(stat = 'identity',
           width  = 0.7,
           fill = 'skyblue') +
  ggtitle('월별 강수량 (1월~6월)') + 
  theme(plot.title = element_text(size = 20, face = 'italic',
                                  colour = 'darkblue',
                                  hjust = 0.5))+  #hjust 가운데정렬
  labs(x='월', y='강수량') +
  coord_flip()

## 히스토그램
ggplot(data = iris, aes(x=Petal.Length)) +
  geom_histogram(binwidth = 0.5)


ggplot(data = iris, aes(x=Sepal.Width, 
                          fill=Species)) +
  geom_histogram()+
  #geom_histogram(position = 'dodge')+
  ggtitle('붓꽃 품종별 꽃받침 넓이 히스토그램')+
  theme(legend.position = 'bottom', 
        plot.title = element_text(size = 15, face = 'bold'))

## 산점도
ggplot(data = iris, aes(x=Petal.Length, y=Petal.Width, color=Species)) +
  geom_point(size = 3)+
  ggtitle('붓꽃 품종별 꽃잎 산점도')+
  theme(plot.title = element_text(size = 16, face = 'bold',
                                 colour = 'darkblue',
                                 hjust = 0.5))
  
## 선그래프
year <- 1937:1960
cnt <- as.vector(airmiles)
df <- data.frame(year,cnt)
df

ggplot(data = df, aes(x=year, y=cnt))+
  geom_line(col='red', stat = 'identity')

# LAB. 기후 변화 그래프
# 막대그래프
df <- aggregate(airquality[,'Temp'],
                by = list(month=airquality$Month), FUN=mean)
df
colnames(df) <- c('month', 'temp')

ggplot(data = df, aes(x=month, y=temp))+
  geom_bar(stat = 'identity',
           width = 0.9, fill = 'darkgreen')+
  ggtitle('5개월 평균기온(화씨)')

# 산점도
df <- airquality[complete.cases(airquality),]
df
ggplot(data = df, aes(x=Temp, y=Ozone, color='orange'))+
  geom_point(size=2)
cor(df$Temp,df$Ozone)



# 선그래프
df.7 <- subset(df, Month==7)
df.7

ggplot(data=df.7, aes(x=Day, y=Ozone))+
  geom_line(col='red', linetype='dashed')+
  geom_point(col='orange', size=3)+ 
  ggtitle('일별 오존지수')+
  theme(plot.title = element_text(size = 16, 
                                  face = 'bold',
                                  color = 'darkred',
                                  hjust = 0.5))+
  labs(x = '일', y = '오존지수')

# 실전분석. 세계 각국의 다양한 지표 분석
data(UN98)
head(UN98)

df <- UN98[, c('region', 'tfr')]
df <- df[complete.cases(df),]
df <- aggregate(df[,'tfr'], by = list(region=df$region),
                FUN=mean)
ggplot(df, aes(x=region, y=x))+
  geom_bar(stat='identity',
           width=0.8, col = '#333333',
           fill=rainbow(5))+
  ggtitle('대륙별 평균 여성출산률')+
  labs(x='대륙', y='평균출산률')

# treemap
df.tm <- UN98[,c('region', "lifeFemale", 'illiteracyFemale')]
df.tm
df.tm <- df.tm[complete.cases(df.tm),]  #결측값 제거
df.tm$contry <- rownames(df.tm)

treemap(df.tm,
        index = c('region', 'contry'),
        vSize = 'lifeFemale',
        vColor = 'illiteracyFemale',
        type = 'value',
        title = "world's women")
# 산점도
df.edu <- UN98[, c('region', 'educationMale', 'educationFemale')]
df.edu <- df.edu[complete.cases(df.edu),]

ggplot(data=df.edu, aes(x=educationMale, 
                        y=educationFemale, 
                        color=region))+
  geom_point(size=2)+
  ggtitle('대륙별 남녀 교육수준')+
  theme(plot.title = element_text(size = 16, 
                                  face = 'bold',
                                  colour = 'steelblue',
                                  hjust = 0.5))+
  labs(x = '교육수준(남)', y = '교육수준(여)')

cor(df.edu$educationMale,df.edu$educationFemale)
