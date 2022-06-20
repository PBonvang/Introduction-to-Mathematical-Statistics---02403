## 1
prop.test(x = 55, n = 200, correct = F)

## 2
n <- 200
x1 <- 8
n1 <- 50
x2 <- 13 + 15 + 19
n2 <- 150

p1 <- x1 / n1
p2 <- x2 / n2
p <- (x1 + x2) / n

z <- (p1 - p2) / sqrt(p * (1 - p) * (1 / n1 + 1 / n2))
z

pval <- 2 * (1 - pnorm(abs(z)))
pval
prop.test(x = c(x1, x2), n = c(n1, n2), correct = F)

## 3
rm(list = ls())

n <- 100
p1 <- 0.51
p2 <- 0.68

p <- (p1 * n + p2 * n) / (2 * n)

z <- (p1 - p2) / sqrt(p * (1 - p) * (2 / 100))
z

pval <- 2 * (1 - pnorm(abs(z)))
pval
# As this is a onesided hypothesis only one side of the distribution is considered:
pval / 2
# As zobs < 0 p1 < p2, meaning it is effective.

## 4
n1 <- p1 * n
n2 <- p2 * n
m1 <- 5.97
m2 <- 8.25
s1 <- sqrt(23)
s2 <- sqrt(21)

tobs <- (m1 - m2) / (s1^2 / n1 + s2^2 / n2)
ms <- c(m1, m2)
vs <- c(s1^2, s2^2)
ns <- c(n1, n2)
v <- (vs[1] / ns[1] + vs[2] / ns[2])^2 / ((vs[1] / ns[1])^2 / (ns[1] - 1) + (vs[2] / ns[2])^2 / (ns[2] - 1))
v
pval <- 2 * (1 - pt(abs(tobs), df = v))
pval

## 5
rm(list=ls())
0.949^2
