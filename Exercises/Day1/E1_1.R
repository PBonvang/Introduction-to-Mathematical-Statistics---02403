female_x <- c(2474, 2547, 2830, 3219, 3429, 3448, 3677, 3872, 4001, 4116)
male_y <- c(2844, 2863, 2963, 3239, 3379, 3449, 3582, 3926, 4151, 4356)

#### a) Female sample mean, variance and standard deviation ####
# Mean
mu_f <- sum(female_x)/length(female_x)
mu_f
mean(female_x)
# Variance
var_f <- sum((female_x - mu_f)^2)/(length(female_x)-1)
var_f
var(female_x)
# Standard deviation
sd_f <- sqrt(var_f)
sd_f
sd(female_x)

#> Interpretation:
#> As the standard deviation is quite big the differens between female infant birth size
#> differs quite a bit.

#### b) Male
# Mean
mu_m <- sum(male_y)/length(male_y)
mu_m
mean(male_y)
# Variance
var_m <- sum((male_y - mu_m)^2) / (length(male_y) - 1)
var_m
var(male_y)
# Standard deviation
sd_m <- sqrt(var_m)
sd_m
sd(male_y)

#> It seems that the samples are very similar between male and female.
#> However the male average is slightly higher.

#### c) Quartiles
## Female
n_f <- length(female_x)
sort(female_x)
Q_F0 <- sort(female_x)[1] # Minimum
Q_F25 <- sort(female_x)[ceiling(n_f*0.25)] # Lower
Q_F50 <- sort(female_x)[ceiling(n_f*0.5)] # Median
Q_F75 <- sort(female_x)[ceiling(n_f*0.75)] # Upper
Q_F100 <- sort(female_x)[n_f] # Maximum

## Male
n_m <- length(male_y)
sort(male_y)
Q_M0 <- sort(male_y)[1] # Minimum
Q_M25 <- sort(male_y)[ceiling(n_m*0.25)] # Lower
Q_M50 <- sort(male_y)[ceiling(n_m*0.5)] # Median
Q_M75 <- sort(male_y)[ceiling(n_m*0.75)] # Upper
Q_M100 <- sort(male_y)[n_m] # Maximum

par(mfrow=c(1,2),cex.main=2,cex.lab=2,cex.axis=1.5)
boxplot(female_x,main="Female")
boxplot(male_y,main="Male")

#### e) Coefficients
# Female
var_f / mu_f * 100
# Male
var_m / mu_m * 100
