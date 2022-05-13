## 기본그래프
# 막대그래프 = Bar chart
favorite.season <- c('WINTER', 'SUMMER', 'SPRING', 'SUMMER', 'SUMMER', 'FALL', 'FALL', 'SUMMER', 'SPRING', 'SPRING')
favorite.season
table(favorite.season)  # 도수분포

ds <- table(favorite.season)
ds
barplot((ds), main='좋아하는 계절')

barplot((ds), main='좋아하는 계절', col='#c8d7ff')   # 색 이름 or 색상코드

colors()

barplot((ds), main='좋아하는 계절', col=c('rosybrown', 'plum', 'steelblue', 'aliceblue'))

barplot((ds), main='좋아하는 계절', col= rainbow(3))
barplot((ds), main='좋아하는 계절', col= heat.colors(4))
barplot((ds), main='좋아하는 계절', col= terrain.colors(4))
barplot((ds), main='좋아하는 계절', col= topo.colors(4))
barplot((ds), main='좋아하는 계절', col= cm.colors(4))        
        
barplot((ds), main='좋아하는 계절', col= rainbow(4), xlab = '계절', ylab = '빈도수')

barplot((ds), main='좋아하는 계절', col= rainbow(4), xlab = '계절', ylab = '빈도수', horiz = T)

barplot(ds, main='favorite season', col = rainbow(4), names=c('가을', '봄', '여름', '겨울'),las=2) # las(그룹이름 수직으로)
                                                                                                   # 2는 x축 3은 y축도 수직변경




