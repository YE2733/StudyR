mpg <- as.data.frame(ggplot2::mpg)

library(dplyr)

mpg_diff <- mpg %>% 
  select(class, cty) %>% 
  filter(class %in% c('compact','suv'))

unique(mpg_diff$class)
head(mpg_diff)
table(mpg_diff$class)

t.test(data = mpg_diff, cty ~ class, var.equal = T)

# 일반 휘발유와 고급 휘발유의 가설 검정

mpg_diff2 <- mpg %>% 
  select(fl,cty) %>% 
  filter(fl %in% c('r','p'))

table(mpg_diff2$fl)

t.test(data = mpg_diff2, cty ~ fl, var.equal = T)


# 실업자 수와 개인 소비 지출의 상관관계
economics <- as.data.frame(ggplot2::economics)
cor.test(economics$unemploy, economics$pce)

# 히트맵 그리기
head(mtcars)

car_cor <- cor(mtcars) # 상관행렬 생성
round(car_cor, 2)



install.packages("corrplot")
library(corrplot)
# 히트맵 그리기
corrplot(car_cor)
# 숫자로 표기
corrplot(car_cor, method = "number")
# 
