#### 8.1
SST <- 11.4944
SSE <- 4.106
n <- 6 * 3
k <- 3
## a)
# A: Degrees of freedom
k - 1
# 2

# B: SSTr
SSTr <- SST - SSE
SSTr
# 7.3884

# C: MS(TR)
MSTr <- SSTr / (k - 1)
MSTr
# 0.49256

# D: residual degrees of freedom
n - k
# 15

# F: MSE
MSE <- SSE / (n - k)
MSE
# 0.2737333

# U: F statistic
F <- MSTr / MSE
F
# 13.49562

# V: P value
1 - pf(F, k - 1, n - k)
# 0.0004436033

## b)
critVal <- qf(0.95, k - 1, n - k)
critVal
# 3.68232

## c)
# As F statistic is much larger than the critical
# value, we can conclude that the means are significantly
# different.

## d)
m_98 <- 5.5517
m_11 <- 4.0483

m_98 - m_11 + c(-1, 1) * qt(0.05, n - k) * sqrt(MSE * (2 / (n / k)))
# 2.0329386 0.9738614

#### 8.2
D <- data.frame(
    nitrogen = c(
        5.01, 5.59, 3.02,
        6.23, 5.13, 4.76,
        5.98, 5.33, 3.46,
        5.31, 4.65, 4.12,
        5.13, 5.52, 4.51,
        5.65, 4.92, 4.42
    ),
    year = factor(rep(c("1998", "2003", "2011"), 6))
)

means <- c(5.5517, 5.19, 4.0483)
vars <- c(0.2365767, 0.1313200, 0.4532967)

## a)
n_i <- 6
gen_mu <- mean(means)

SSE <- sum((n_i - 1) * vars)
SSE
# 4.105967

SSTr <- sum(n_i * (means - gen_mu)^2)
SSTr
# 7.389035

SST <- SSE + SSTr
SST
# 11.495

## b)
(n - 1) * var(D$nitrogen)
# 11.4944

## c)
anova(lm(nitrogen ~ year, data = D))
# Analysis of Variance Table
#
# Response: nitrogen
#           Df Sum Sq Mean Sq F value    Pr(>F)
# year       2 7.3884  3.6942  13.496 0.0004436 ***
# Residuals 15 4.1060  0.2737
# ---
# Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

## d)
M <- k * (k - 1) / 2
a_bon <- 0.05 / M
crit <- qt(1 - a_bon / 2, n - k)

means[1] - means[2] + c(-1, 1) * crit * sqrt(MSE * (2 / n_i))
# [1] -0.4519896  1.1753896
means[1] - means[3] + c(-1, 1) * crit * sqrt(MSE * (2 / n_i))
# [1] 0.6897104 2.3170896
means[2] - means[3] + c(-1, 1) * crit * sqrt(MSE * (2 / n_i))
# [1] 0.3280104 1.9553896

# Thus 2011 is significantly different from the others.

## e)
plot(D$year, D$nitrogen)
# The variance seem ok alike
residuals <- lm(nitrogen ~ year, data = D)$residuals
qqnorm(residuals)
qqline(residuals)
# No clear deviation from normality so great.

#### 8.3
rm(list = ls())

## a)
n_i <- 20
k <- 5
n <- n_i * k

SSTr <- 62
SSE <- 362.71

F <- (SSTr / (k - 1)) / (SSE / (n - k))
F
# [1] 4.059717

qf(0.95, k - 1, n - k)
# [1] 2.467494

# As the F statistic is larger than the crit value
# there's a significant difference

## b)
means <- c(
    31.4,
    30.6,
    30.5,
    31.3,
    29.2
)

vars <- c(
    1.9,
    1.6,
    2.2,
    1.8,
    2.2
)

MSE <- SSE / (n - k)

means[1] - means[4] + c(-1, 1) * qt(0.975, n - k) * sqrt(MSE * (2 / n_i))
# [1] -1.126686  1.326686

#### 8.4
rm(list = ls())
## a)
n_i <- 5
k <- 6
n <- n_i * 6

# A:
k - 1
# 5

# B:
n - k
# 24

# C: SSE
MSE <- 23.983
SSE <- 23.983 * (n - k)
SSE
# [1] 575.592

## c)
brass1 = c(82.5, 82.7, 92.2, 96.5, 88.9, 75.6)
brass2 = c(83.7, 81.9, 106.8, 93.8, 89.2, 78.1)

m1 = mean(brass1)
m1

m2 = mean(brass2)

m1-m2 + c(-1,1)*qt(0.975, n-k)*sqrt(MSE*(2/n_i))
# [1] -8.909157  3.875824

#### 2.17
rm(list=ls())

printProbs = function(n) {
    print(pf(1, n - 1, n - 1))
    p2 = pf(2, n - 1, n - 1)
    print(1 - p2)
    p1_2 = pf(1/2, n - 1, n - 1) 
    print(p1_2)
    print(p2 - p1_2)
}
# n = 2
ns = c(2,4,8,16,32)

for (n in ns) {
    str(n)
    printProbs(n)
}

## b)

#### Exercise quiz 11
## Q1
rm(list=ls())

n_i = 9
k = 4
n = n_i*k

# A:
k-1
# 3

# C:
114.89/(k-1)
# 38.29667

#### Juni 2021
## 19
sqrt( 16008.4)
# 126.5243