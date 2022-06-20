Patient 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15
before <- c(9.1, 8.0, 7.7, 10.0, 9.6, 7.9, 9.0, 7.1, 8.3, 9.6, 8.2, 9.2, 7.3, 8.5, 9.5)
after <- c(8.2, 6.4, 6.6, 8.5, 8.0, 5.8, 7.8, 7.2, 6.7, 9.8, 7.1, 7.7, 6.0, 6.6, 8.4)

#### a) Median

# Before
median(before) # 8.5
# After
median(after) # 7.2

#### b) Standard deviation
sd(before) # 0.902
sd(after) # 1.09

#### c) Covariance
cov(before, after) # 0.796

#### d) Correlation
cov(before, after)/(sd(before)*sd(after)) # 0.8
cor(before, after)

#### e) Differences
d <- before - after
summary(d)
boxplot(d,main="Col")

#### f) Analysis