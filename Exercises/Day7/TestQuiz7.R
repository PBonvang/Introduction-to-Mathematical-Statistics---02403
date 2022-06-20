# Q2
alpha = 0.01
qchisq(p=c(1-alpha/2, alpha/2), df=19)

# Q5
P1 = 10
P2 = 14

P1_sd = 0.01
P2_sd = 0.02

sqrt(P1_sd^2*(-P2/P1^2)^2 + P2_sd^2*(1/P1)^2)

# Q6
alpha = 0.05
qchisq(p=c(1-alpha/2, alpha/2), df=13)
