#### 4.3
x <- c(
    38.43, 38.43, 38.39, 38.83, 38.45,
    38.35, 38.43, 38.31, 38.32, 38.48, 38.50
)


k <- 10000

# a)
sim_x <- replicate(k, sample(x, replace = T))
sim_means <- apply(sim_x, 2, mean)

quantile(sim_means, c(0.025, 0.975))

# b)
n <- length(x)
sim_x <- replicate(k, rnorm(n, mean = mean(x), sd = sd(x)))
sim_means <- apply(sim_x, 2, mean)

quantile(sim_means, c(0.025, 0.975))

t.test(x)

# c)
x_log <- log(x)
sim_x_log <- replicate(k, rlnorm(n, mean = mean(x_log), sd = sd(x_log)))
sim_means_log <- apply(sim_x_log, 2, mean)

quantile(sim_means_log, c(0.025, 0.975))

# d)
Q1 <- function(x) {
    quantile(x, 0.25)
}

sim_quar1 <- apply(sim_x, 2, Q1)

quantile(sim_quar1, c(0.025, 0.975))

# e)
sim_x <- replicate(k, sample(x, replace = T))
sim_Q1 <- apply(sim_x, 2, Q1)

quantile(sim_Q1, c(0.025, 0.975))

#### 4.4
rm(list = ls())

n <- 10
x <- c(1, 2, 1, 3, 2, 1, 2, 3, 1, 1)
y <- c(3, 4, 2, 4, 2, 3, 2, 4, 3, 2)

# a)
k <- 10000
sim_x <- replicate(k, sample(x, replace = T))
sim_y <- replicate(k, sample(y, replace = T))

sim_x_means <- apply(sim_x, 2, mean)
sim_y_means <- apply(sim_y, 2, mean)

probs <- c(0.025, 0.975)
quantile(sim_x_means, probs)
quantile(sim_y_means, probs)

sim_mean_diffs <- sim_x_means - sim_y_means
quantile(sim_mean_diffs, probs)

# The hypothesis is that the screens are equally good,
# and the alternative that one is better than the other.
# As the confidence doesn't overlap and screen 2 has the highest CI,
# screen 2 seems to be better. Which is also seen in the diff CI.

# b)
t.test(x, y)

# The welch two sample t-test like wise shows that screen 2 is better.

# c)
sim_x <- replicate(k, rnorm(n, mean = mean(x), sd = sd(x)))
sim_y <- replicate(k, rnorm(n, mean = mean(y), sd = sd(y)))

sim_x_means <- apply(sim_x, 2, mean)
sim_y_means <- apply(sim_y, 2, mean)

sim_mean_diffs <- sim_x_means - sim_y_means
quantile(sim_mean_diffs, probs)
hist(sim_mean_diffs)

#### 4.5
rm(list = ls())

# a)
P <- 240.48
V <- 9.987
P_sd <- 0.03
V_sd <- 0.002

T <- P * V / 8.31

T_sd <- sqrt((V / 8.31)^2 * (P_sd^2) + (P / 8.31)^2 * (V_sd^2))

# b)
T <- 289.12
T_sd <- 0.02

V <- 8.31 * T / P

V_var <- (-8.31 * T / P^2)^2 * P_sd^2 + (8.31 / P)^2 * T_sd^2
V_sd <- sqrt(V_var)

# c)
K <- 8.31
V <- 9.987
T <- 289.12

V_sd <- 0.002
T_sd <- 0.02

P <- K * T / V
P

P_var <- (-K * T / V^2)^2 * V_sd^2 + (K / V)^2 * T_sd^2
P_sd <- sqrt(P_var)
P_sd

# d)
k <- 10000
V_sim <- replicate(k, rnorm(100, mean = V, sd = V_sd))
T_sim <- replicate(k, rnorm(100, mean = T, sd = T_sd))

P_sim <- K * T_sim / V_sim
P_sim_means = apply(P_sim, 2, mean)
quantile(P_sim_means, c(0.025, 0.975))

P_sim_sd = apply(P_sim, 2, sd)
quantile(P_sim_sd, c(0.025, 0.975))
