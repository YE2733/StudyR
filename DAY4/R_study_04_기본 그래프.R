##기본 그래프
favorite.season <- c('WINTER', 'SUMMER', 'SPRING', 'SUMMER', 'SUMMER', 'FALL', 'FALL', 'SUMMER', 'SPRING', 'SPRING', 'SUMMER', 'SUMMER')
favorite.season
f.season <- table(favorite.season)
str(f.season)
barplot(f.season, main='좋아하는 계절', col = rainbow(4),xlab = '계절', ylab = '빈도수', horiz = T, names = c('가을', '봄', '여름', '겨울'), las = 1)

## 중첩 막대그래프
age.1 <- c(13700,10974,7979,5000,4250)
age.2 <- c(17540,29701,36209,33947,24487)
age.3 <- c(991,2195,5366,12980,19007)

ds <- rbind(age.1, age.2, age.3)
colnames(ds) <- c('1970','1990','2010','2030','2050')
ds
par(mfrow=c(1,1), mar=c(3,3,3,3)) # plot 여백조정    # beside(그래프를 각각) # legend.text(범례)
barplot(ds, main = '인구 추정', col=rainbow(3), horiz = F, beside = F, 
        legend.text = c('0~14세', '15~64세', '65세 이상'), 
        args.legend = list(x='topright', bty='n', inset=c(-0.13,-0.1)))

## LAB. 사업부문별 매출액 그래프
ha <- c(54659,61028,53307,46161,54180)
he <- c(31215,29863,32098,39684,29707)
mc <- c(15104,16133,15222,13208,9986)
vs <- c(13470,14231,13401,13552,13193)
bs <- c(16513,14947,15112,14392,17091)

ds <- rbind(ha,he,mc,vs,bs)
colnames(ds) <- c('19.1Q','19.2Q','19.3Q','19.4Q','20.1Q')
ds
par(mfrow=c(1,1), mar=c(3,4,3,3)) # Plot 여백조정

barplot(ds, main ='사업부문별 매출액(분기)',
        col = c('#003f5c','#58508d','#bc5090','#ff6361','#ffa600'),horiz=T, las=1, xlab = '억 원', beside = T,
        legend.text = c('H&A','HE','MC','VS','BS'),
        args.legend=list(x='topright',bty='n'), inset=c(-0.25,0)) # inset안됨



## 히스토그램
par(mfrow=c(1,1), mar=c(5,4,4,4)) # Plot 여백조정
dist <- cars[,2]
str(dist)
hist(dist, main='제동거리',
     xlab='제동거리', ylab = '빈도수',
     border='blue', col = 'skyblue', las=1, breaks = 10)


## LAB. 다이아몬드 시세 
library(Stat2Data)
data("Diamonds")
ds <- Diamonds$PricePerCt
color <- rep('#a8dadc',9)
color[3] <- '#1d3557'
hist(ds,main ='캐럿당 가격 분포', breaks = 9,
     xlab = '캐럿당 가격($)', ylab = '빈도수', las=1, col = color, border = '#457b9d')
