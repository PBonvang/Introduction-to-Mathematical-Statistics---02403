---
date: 2022/06/07
course: 02403
courseWeek: 2
lecturer: Jan Kloppenborg Møller
---

Tags: [#Literature/Lecture, #Archived]
Subjects: [[Introduction to Mathematical Statistics - 02403]]

****

 <p align="center">
	<font size="9"><strong>Day 3 - Independence and simulation</strong></font>
</p>

****
# Agenda
- [[Continuous random variable]]
- [[Normal distribution]]
- [[Statistical simulation]]
- [[Variable independence]]
- [[Covariance]]
# Notes

$\mu$ will be called the hypotheses.

When the sample mean is the mean, it's called a *central estimator for $\mu$*.

![[Pasted image 20220607084503.png]]

## Example
![[Pasted image 20220607084638.png]]
$$T=X_{c}+X_{d}+X_{l,i}+I\cdot X_{la}$$
$$\P(I=1)=\frac{1}{30}$$

Simulation is used as we don't have rules for the sum of different types of distributions.
```R
k <- 10000
Xc <- rnorm(k,16,1)
Xd <- rexp(k,1/2)
Xl <- rexp(k,2)*4
Xla <- sample(c(rep(0,29),1),k,replace=TRUE) * rnorm(k,8,2)
Xs <- Xc + Xd + Xl + Xla

mean(Xs)

16 + 2 + 4 * 1/2 + 8/30

var(Xs)

sum(Xs>30)/k

# IQR
quantile(Xs,probs=c(0.25,0.75))

# Et andet interval
quantile(Xs,probs=c(0.025,0.975))

## Fordelingen
hist(Xs)
```

## 2D example
![[Pasted image 20220607091934.png]]

$$\mu=2+0$$
$$\op{var}(Z)=\op{var}(X)+2^{2}\op{var}(Y)=3+4=7$$
$$\begin{align*}
\op{Cov}(X,Z) &= \op{cov}(X,X)+2\cdot\op{cov}(X,Y)\\
&=\op{var}(X)=3
\end{align*}$$



# Thoughts

# Quotes

# References