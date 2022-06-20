#### 7.1
passing_data <- c(82, 104)
n <- c(108, 143)

# a)
prop.test(x = passing_data, n = n, correct = F)
# 95 percent confidence interval:
# -0.0767781  0.1407512

# b)
qchisq(0.99, df = 1)
# [1] 6.634897

# c)
p <- 1 - 0.8
n <- 250
expect_not_pass <- p * n # 50
mu <- expect_not_pass # 50
sd_not_pass <- sqrt(p * (1 - p) * n)
sd_not_pass

#### 7.2
rm(list = ls())

n <- 250
data <- data.frame(t(matrix(c(
    7.2, 6.4,
    28, 34.8,
    8.8, 14.8
), ncol = 3)))
data <- data / 100 * n
data
# a)
col_totals <- colSums(data)
probs <- col_totals / n
p_dk <- probs[[1]]
p0 <- 0.5

zobs <- (p_dk - n * p0) / sqrt(n * p0 * (1 - p0))
zobs
# [1] -15.75573

qnorm(0.975)
# [1] 1.959964

# No as the |zobs| is bigger than the critical value.

# b)
qchisq(0.95, df = (3 - 1) * (2 - 1))
# [1] 5.991465

#### 7.3
rm(list = ls())

# a)
x <- 168
n <- 740
p0 <- 0.295

zobs <- (x - n * p0) / sqrt(n * p0 * (1 - p0))
zobs
# [1] -4.054586

qnorm(0.9995)
# [1] 3.290527

# As the |zobs| > z_1-alpha/2 the conclusion is
# that we must reject the hypothesis.

# b)
phat <- 0.227

phat + c(-1, 1) * qnorm(0.975) * sqrt(phat * (1 - phat) / n)
# [1] 0.1968189 0.2571811

# c)
e <- 0.01 / 2
p <- 0.3
crit <- qnorm(0.995)

p * (1 - p) * (crit / e)^2
# [1] 55733.13
# So 55734

#### 7.4
rm(list = ls())
# a)
a <- 6
b <- 12
n <- 50

pa <- a / n
pb <- b / n

p <- (a + b) / (2 * n)

zobs <- (pa - pb) / sqrt(p * (1 - p) * (2 / n))
zobs
# [1] -1.561738
pval <- 2 * (1 - pnorm(abs(zobs)))
pval
# [1] 0.1183498

prop.test(x = c(a, b), n = rep(n, 2), correct = F)
#
#         2-sample test for equality of proportions without continuity correction
#
# data:  c(a, b) out of rep(n, 2)
# X-squared = 2.439, df = 1, p-value = 0.1183
# alternative hypothesis: two.sided
# 95 percent confidence interval:
#  -0.26875081  0.02875081
# sample estimates:
# prop 1 prop 2
#   0.12   0.24

# As |zobs| < z_0.975 (1.96)
# the conclusion is yes it's fairly likely
# that the defect probabilities are the same.
# The same can be seen as the CI overlaps 0,
# or by looking at the p-value which is larger than alpha

# b)
n <- 200
x <- 36
p <- x / n

p + c(-1, 1) * qnorm(0.995) * sqrt(p * (1 - p) / n)
# [1] 0.1100246 0.2499754

# c)
p <- 0.2
n <- 1537
crit <- qnorm(0.975)

crit * sqrt(p * (1 - p) / n)
# [1] 0.01999729
# So i'm guessing a ME of 0.02 and therefore a width of 0.04

#### 7.5
rm(list = ls())

n <- 200
data <- data.frame(t(matrix(c(
    11, 27, 15,
    14, 40, 30,
    5, 23, 35
), ncol = 3)))
data

## a)
chi <- chisq.test(data, correct = F)
chi

chi$expected
#         X1    X2   X3
# [1,]  7.95 23.85 21.2
# [2,] 12.60 37.80 33.6
# [3,]  9.45 28.35 25.2

# Therefore: 25.2

col_total <- sum(data[, 3])
row_total <- sum(data[3, ])
e_33 <- col_total * row_total / n
e_33
# [1] 25.2

## b)
# A: As there's 3 rows and 3 columns 3*3=9 contributions
# B:
o_11 <- data[[1, 1]]
e_11 <- sum(data[, 1]) * sum(data[1, ]) / n

contribution_11 <- (o_11 - e_11)^2 / e_11
contribution_11
# [1] 1.170126

## c)
chiobs <- 10.985
1 - pchisq(chiobs, df = (3 - 1) * (3 - 1))
# [1] 0.02673311

# As the p-value < alpha the hypothesis is rejected.

#### Exercise quiz 10
rm(list=ls())

## 1
prop.test(x = c(4, 8), n = c(500, 700), correct = F)

## 2
n = 250
data = data.frame(t(matrix(c(
    7.2, 5.2, 1.2,
    28, 14, 20.8,
    8.8, 4.8, 10
), ncol = 3)))
data

data = 250*data/100
data

e_11 = sum(data[1, ])*sum(data[, 1])/n
e_11

## 3
qchisq(0.99, df = (3-1)*(3-1))
