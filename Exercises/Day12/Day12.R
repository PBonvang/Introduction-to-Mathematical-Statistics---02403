#### 8.5
rm(list = ls())
## a)
# A F-distribution with l-1 = 4-1 = 3 and (k-1)(l-1)=(2-1)(4-1)=3
# degrees of freedom.

#### 8.6
rm(list = ls())

SSE <- 49.5
MSE <- 8.25
MSBl <- 825
SSTr <- 84.5
l <- 4
k <- 3
## a)
# A:
k - 1
# 2

# B:
(MSTr <- SSTr / (k - 1))
# [1] 42.25

# C:
(FTr <- MSTr / MSE)
# [1] 5.121212

## b)
# The joining methods doesn't have a significant difference in effect,
# but the material has.

## c)
Strength <- c(242, 214, 254, 248, 248, 214, 248, 247, 236, 211, 245, 243)
Joiningmethod <- factor(c("A", "A", "A", "A", "B", "B", "B", "B", "C", "C", "C", "C"))
Material <- factor(c(1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4))
fit = lm(Strength ~ Joiningmethod + Material)
anova(fit)

(join_means <- tapply(Strength, Joiningmethod, mean))
#      A      B      C
# 239.50 239.25 233.75

(mat_means <- tapply(Strength, Material, mean))
#   1   2   3   4
# 242 213 249 246

# Join methods:
(aBonf <- 0.05 / (k * (k - 1) / 2))
# [1] 0.01666667

m <- l
(LSDBonf <- qt(1 - aBonf / 2, (k - 1) * (l - 1)) * sqrt(2 * MSE / m))
# [1] 6.676853

max(join_means) - min(join_means)
# [1] 5.75
# As the lowest and biggest means of the join methods
# doesn't deviate more than LSD, none of them deviate significantly

# Material
(aBonf <- 0.05 / (l * (l - 1) / 2))
# [1] 0.008333333

m <- k
(LSDBonf <- qt(1 - aBonf / 2, (k - 1) * (l - 1)) * sqrt(2 * MSE / m))
# [1] 9.059516

library(glue)
for (i in names(mat_means)) {
    for (j in names(mat_means)) {
        if (i == j) next

        print(glue("{i}-{j}: {mat_means[i]} - {mat_means[j]} = {mat_means[i] - mat_means[j]}"))
    }
}

# 1-2: 242 - 213 = 29
# 1-3: 242 - 249 = -7
# 1-4: 242 - 246 = -4
# 2-3: 213 - 249 = -36
# 2-4: 213 - 246 = -33
# 3-4: 249 - 246 = 3

# 2 is significantly different to all others
plot(Strength ~ Material)
text(1:4, c(242, 213, 249, 246), c("a", "b", "a", "a"), cex=2, col=2)

## d)
qqnorm(fit$residuals)
qqline(fit$residuals)
# Looks fairly normally distributed

par(mfrow=c(1,2))
plot(Material, fit$residuals)
plot(Joiningmethod, fit$residuals)
# The variance is quite different in the material types,
# however this is expected with such a small sample size.

#### 8.7
rm(list=ls())

MSE = 0.10556
MSBi = 1.84556
MSTr = 0.16333
SSBi = 5.5367
SSTr = 0.3267
k = 3
l = 4

## a)
# A:
k-1
# 2

# B:
l-1
# 3

# C:
(l-1)*(k-1)
# 6

## b)
# D: 
(SSE = MSE * (k-1)*(l-1))
# 0.63336

# E:
(FTr = MSTr/MSE)
# [1] 1.547272

# F:
(FBi = MSBi/MSE)
# [1] 17.48352

## c)
# That the type of pickles doesn't have a big effect,
# but the type of dressing does.

#### 8.8
rm(list=ls())

k = 3
l = 3
SSE = 0.23333
MSE = 0.05833
SSBi = 1.44667
FTr = 4.2857

## a)
# A: 
(MSTr = FTr*MSE)
(SSTr = MSTr*(k-1))
# [1] 0.4999698

# B:
MSTr
# [1] 0.2499849

# C:
(MSBi = SSBi/(l-1))
# [1] 0.723335

# D:
(FBi = MSBi/MSE)
# [1] 12.40074

## b)
# The firm doesn't have a significant influence on the transport,
# but the size of the item does. 

#### Exercise quiz 12
rm(list=ls())

## Q1
l = 5
k = 4
qf(1-0.05,l-1, (k-1)*(l-1))


#### June 2020

## 22
k = 7
l = 5
29/7

m = k