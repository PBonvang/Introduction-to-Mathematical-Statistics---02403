#### 5.2
x <- c(10, 20, 30, 40, 50, 60, 70, 80, 90)
y <- c(420, 365, 285, 220, 176, 117, 69, 34, 5)

# a)
fit <- lm(y ~ x)
confint(fit, level = 0.95)

# The 95% CI for the slope \beta_1 is [-5.918161, -4.708505]

# b)
summary(fit)
# As the CI isn't centered around 0, we can say
# that there's some correlation between the two.
# And as the p-value is lower than the significance level (0.05)
# and much lower, theres strong evidence against the null hypothesis.

#### 5.3
x <- c(0, 25, 50, 75, 100)
y <- c(14, 38, 54, 76, 95)

# a)
fit <- lm(y ~ x)
summary(fit)

# As the p-value is much lower than the significance level,
# yes we can assume a significant relation between yield and temp.

# b)
predict(fit,
    newdata = data.frame(x = 80), interval = "conf",
    level = 0.95
)

# c)
pred_y <- predict(fit,
    newdata = data.frame(x = x)
)
res <- y - pred_y
quantile(res, 0.75)
# 0.6

#### 5.4
rm(list = ls())

x <- c(15, 25, 35, 40)
y <- c(42.1, 36.0, 31.8, 28.7)

# a)
fit <- lm(y ~ x)

confint(fit, level = 0.95)
# [-0.6460407, -0.3966711]

# b)
summary(fit)
# Yes as the confidence interval doesn't overlap 0,
# and because the p-value is lower than the significance level

# c)
qt(0.975, df = length(x) - 2)

# [-4.3, 4,3]

#### 5.5
rm(list = ls())

x <- c(2, 4, 6, 8, 10)
y <- c(11.5, 10.2, 10.3, 9.68, 9.32)

# a)
fit <- lm(y ~ x)
summary(fit)
# 1. 11.66400
# 2. -0.24400
# 3. 0.348

# b)
summary(fit)
# 0.8676

# c)
predict(fit, newdata = data.frame(x = 7), interval = "conf", level = 0.95)
# [9.430636, 10.48136]

#### 5.6
D <- data.frame(
    pressure = c(1.02, 2.08, 2.89, 4.01, 5.32, 5.83, 7.26, 7.96, 9.11, 9.99),
    flux = c(1.15, 0.85, 1.56, 1.72, 4.32, 5.07, 5.00, 5.31, 6.17, 7.04)
)


# a)
cor(D)
# 0.9638184, which means that they are highly
# positively correlated. When pressure increases
# flux increases.

# b)
fit <- lm(flux ~ pressure, D)
confint(fit, level = 0.9)
# [0.5911094, 0.8538426]

# c)
1 - cor(D$flux, D$pressure)^2
# 0.07105402

# d)
summary(fit)
# No as the p-value for beta_0 (intercept) is 0.681,
# which is larger than the significance level 0.05

# e)
new_x <- c(3.5, 5, 9.5)
pred_conf <- predict(fit, newdata = data.frame(pressure = new_x), interval = "conf")
pred_conf
lwr <- pred_conf[, 2]
upr <- pred_conf[, 3]
difs <- upr - lwr
errors <- difs / 2
errors
# b: 0.4784333
# a: 0.5763328
# c: 0.7972785

#### 5.7
rm(list = ls())

D <- data.frame(
    pressure = c(1.02, 2.08, 2.89, 4.01, 5.32, 5.83, 7.26, 7.96, 9.11, 9.99),
    flux = c(1.15, 0.85, 1.56, 1.72, 4.32, 5.07, 5.00, 5.31, 6.17, 7.04)
)

# a)
summary(lm(flux ~pressure, D))
#              Estimate Std. Error t value Pr(>|t|)
# (Intercept) -0.18857    0.44171  -0.427    0.681
# pressure     0.72248    0.07064  10.227 7.18e-06 ***

# b)
X <- cbind(1, D$pressure)
y <- D$flux
n <- length(y)

beta <- solve(t(X) %*% X) %*% t(X) %*% y
e <- y - X %*% beta
s <- sqrt(sum(e^2) / (n - 2))
Vbeta <- s^2 * solve(t(X) %*% X)
sbeta <- sqrt(diag(Vbeta))
T.stat <- beta / sbeta
p.value <- 2 * (1 - pt(abs(T.stat), df = n - 2))

coef.mat <- cbind(beta, sbeta, T.stat, p.value)
colnames(coef.mat) <- c("Estimates", "Std.Error", "t.value", "p.value")
rownames(coef.mat) <- c("beta0", "beta1")
coef.mat
s
#        Estimates Std.Error   t.value   p.value
# beta0  8.722425  9.759430 0.8937433 0.3975484
# beta1  1.384200  1.560856 0.8868212 0.4010480
# [1] 14.2423