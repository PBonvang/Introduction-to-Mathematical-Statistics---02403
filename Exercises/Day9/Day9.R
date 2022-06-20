#### 6.1
# c)
t_val <- qt(0.975, 237)
# b0
-2.365 + c(-1, 1) * t_val * 0.223
# [-2.804315, -1.925685]

# b1
0.476 + c(-1, 1) * t_val * 0.062
# [0.3538585, 0.5981415]

# b2
0.083 + c(-1, 1) * t_val * 0.07
# [-0.05490168, 0.22090168]

# d)
# 1. b0 and b1
# 2. See the last column in summary's coefficient section.

#### 6.2
rm(list = ls())

D <- data.frame(
    x1 = c(
        0.58, 0.86, 0.29, 0.20, 0.56, 0.28, 0.08, 0.41,
        0.22, 0.35, 0.59, 0.22, 0.26, 0.12, 0.65, 0.70,
        0.30, 0.70, 0.39, 0.72, 0.45, 0.81, 0.04, 0.20, 0.95
    ),
    x2 = c(
        0.71, 0.13, 0.79, 0.20, 0.56, 0.92, 0.01, 0.60,
        0.70, 0.73, 0.13, 0.96, 0.27, 0.21, 0.88, 0.30,
        0.15, 0.09, 0.17, 0.25, 0.30, 0.32, 0.82, 0.98, 0.00
    ),
    y = c(
        1.45, 1.93, 0.81, 0.61, 1.55, 0.95, 0.45, 1.14,
        0.74, 0.98, 1.41, 0.81, 0.89, 0.68, 1.39, 1.53,
        0.91, 1.49, 1.38, 1.73, 1.11, 1.68, 0.66, 0.69, 1.98
    )
)
# a)
fit <- lm(y ~ x1 + x2, D)
summary(fit)
# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)
# (Intercept) 0.433547   0.065983   6.571 1.31e-06 ***
# x1          1.652993   0.095245  17.355 2.53e-14 ***
# x2          0.003945   0.074854   0.053    0.958
# Residual standard error: 0.1127

confint(fit)
#                  2.5 %    97.5 %
# (Intercept)  0.2967067 0.5703875
# x1           1.4554666 1.8505203
# x2          -0.1512924 0.1591822

# b)
# x2 is insignificant and will therefore be removed:
fit2 <- lm(y ~ x1, D)
summary(fit2)
# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)
# (Intercept)  0.43609    0.04399   9.913 9.02e-10 ***
# x1           1.65121    0.08707  18.963 1.54e-15 ***
# Residual standard error: 0.1102

# c)
par(mfrow = c(1, 2))

qqnorm(fit2$residuals, pch = 19, cex = 0.5)
qqline(fit2$residuals)

plot(fitted.values(fit2), residuals(fit2), pch = 19, cex = 0.7)
plot(D$x1, residuals(fit2), pch = 19, cex = 0.7)

# QQ shows that it's quite close to the normal distribution,
# The second plots show no systematic behaviour of the residuals.

# d)
par(mfrow = c(1, 1))

x1new <- seq(0, 1, by = 0.01)
PI <- predict(fit2,
    newdata = data.frame(x1 = x1new),
    interval = "pred"
)
CI <- predict(fit2,
    newdata = data.frame(x1 = x1new),
    interval = "conf"
)

plot(D$x1, D$y) # Actual data
lines(x1new, PI[, "fit"], col = "black") # Prediction line
lines(x1new, CI[, "lwr"], col = "green", lty = 2)
lines(x1new, CI[, "upr"], col = "green", lty = 2)
lines(x1new, PI[, "lwr"], col = "red", lty = 2)
lines(x1new, PI[, "upr"], col = "red", lty = 2)
legend("topleft", c("Prediction", "Confidence band", "Prediction band"),
    lty = c(1, 2, 2), col = c(1, 3, 2), cex = 0.7
)

#### 6.3
rm(list = ls())
D <- data.frame(
    y = c(9.29, 12.67, 12.42, 0.38, 20.77, 9.52, 2.38, 7.46),
    x1 = c(1.00, 2.00, 3.00, 4.00, 5.00, 6.00, 7.00, 8.00),
    x2 = c(4.00, 12.00, 16.00, 8.00, 32.00, 24.00, 20.00, 28.00)
)

# a)
plot(D$x1, D$y)
plot(D$x2, D$y)

# No, the points are randomly scattered.
fit1 <- lm(y ~ x1, D)
summary(fit1)
# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)
# (Intercept)  12.1775     5.1984   2.343   0.0576 .
# x1           -0.6258     1.0294  -0.608   0.5655
# ---
# Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#
# Residual standard error: 6.672 on 6 degrees of freedom

confint(fit1)
#                  2.5 %    97.5 %
# (Intercept) -0.5426374 24.897637
# x1          -3.1447959  1.893129

# As the significance level is higher than the P-values
# for both parameters, and they overlap with 0,
# they are both insignificant

fit2 <- lm(y ~ x2, D)
summary(fit2)
# Coefficients:
#             Estimate Std. Error t value Pr(>|t|)
# (Intercept)   4.2039     4.8069   0.875    0.415
# x2            0.2865     0.2380   1.204    0.274
#
# Residual standard error: 6.169 on 6 degrees of freedom
confint(fit2)
#                  2.5 %     97.5 %
# (Intercept) -7.5580921 15.9659492
# x2          -0.2957889  0.8688246

# Same as for fit1.

# c)
model <- lm(y ~ x1 + x2, D)

qqnorm(residuals(model)) # Normal assumption
qqline(residuals(model))
# It's hard to say with so few observations, but sure
# the residuals are normally distributed.

plot(fitted.values(model), residuals(model)) # Checking for structures
plot(D$x1, residuals(model)) # Identify structures
plot(D$x2, residuals(model)) # Identify structures

# x1 Seems to have a quadratic dependence so we update the model
D$x1sq <- (D$x1 - mean(D$x1))^2
model <- lm(y ~ x1 + x2 + x1sq, D)

qqnorm(residuals(model)) # Normal assumption
qqline(residuals(model))
# Definitely normal now

plot(fitted.values(model), residuals(model)) # Checking for structures
plot(D$x1, residuals(model)) # Identify structures
plot(D$x2, residuals(model)) # Identify structures
plot(D$x1sq, residuals(model)) # Identify structures
# And they all seem random now.

summary(model)

# Call:
# lm(formula = y ~ x1 + x2 + x1sq, data = D)
#
# Residuals:
#        1        2        3        4        5        6        7        8
#  0.04167 -0.02335 -0.01072 -0.07540 -0.02520  0.11036  0.05849 -0.07585
#
# Coefficients:
#              Estimate Std. Error t value Pr(>|t|)
# (Intercept)  7.114998   0.083371   85.34 1.13e-07 ***
# x1          -3.675380   0.021216 -173.24 6.66e-09 ***
# x2           1.000632   0.005403  185.21 5.10e-09 ***
# x1sq         0.147443   0.006999   21.07 3.00e-05 ***
# ---
# Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
#
# Residual standard error: 0.0867 on 4 degrees of freedom
# Multiple R-squared:  0.9999,    Adjusted R-squared:  0.9998
# F-statistic: 1.257e+04 on 3 and 4 DF,  p-value: 2.109e-08

confint(model)
#                  2.5 %     97.5 %
# (Intercept)  6.8835240  7.3464723
# x1          -3.7342838 -3.6164756
# x2           0.9856317  1.0156330
# x1sq         0.1280118  0.1668748

# Non of the parameters overlap with 0,
# and their p-values are much lower than the significance level
# so that's great, we can continue the model.

# d)
x1new <- c(min(D$x1), mean(D$x1), min(D$x1))
x2new <- c(min(D$x2), mean(D$x2), min(D$x2))
x1sqnew <- (x1new - mean(D$x1))^2
newData = data.frame(
    x1 = x1new,
    x2 = x2new,
    x1sq = x1sqnew
)

predict(model, newData, se = T)
# $fit
#        1        2        3       
# 9.248328 8.587173 9.248328       
# 
# $se.fit
#          1          2          3 
# 0.07305955 0.04785102 0.07305955 
# 
# $df
# [1] 4
# 
# $residual.scale
# [1] 0.08670212

# Standard error: 0.08670212
predict(model, newData, interval = "conf")
#        fit      lwr      upr
# 1 9.248328 9.045483 9.451174
# 2 8.587173 8.454317 8.720028
# 3 9.248328 9.045483 9.451174

predict(model, newData, interval = "pred")
#        fit      lwr      upr
# 1 9.248328 8.933536 9.563121
# 2 8.587173 8.312221 8.862125
# 3 9.248328 8.933536 9.563121

# e)
plot(D$x1, D$y, pch=19, col=2, xlab="x1", ylab="y")
points(D$x1, fit3$fitted.values, pch="+", cex=2)
legend("topright", c("y1","fitted.values"), pch=c(19,3), col=c(2,1))
