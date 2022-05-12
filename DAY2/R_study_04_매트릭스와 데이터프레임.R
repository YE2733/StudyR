# 매트릭스
z <- matrix(1:20, nrow=4, ncol=5)
z

z2 <- matrix(1:20, nrow=4, ncol=5, byrow = T)   # 기본값은 F 
z2

z[1,3]
z[3,4]
z[4,5]


x <- 1:4
y <- 5:8
z3 <- matrix(1:20, nrow = 4, ncol = 5, byrow = T)

m1 <- cbind(x, y)   # 열(column)방향으로 결합
m1

m2 <- rbind(x, y)   # 행(row)방향으로로   
m2

m3 <- rbind(m2, x)
m3

m4 <- cbind(z, x)
m4
