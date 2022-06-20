---
aliases: [Simple linear regression parameter variance] # Searchable synonyms and translations
---

Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Simple Linear Regression]]
****

````ad-tip
title: Theorem 5.8 <br> Variance of estimators
collapse: open

The variance and covariance of the estimators in [[Residual Sum of Squares - RSS#^Theorem5-4|Theorem 5.4]] are given by
$$
\begin{align*}
\mathrm{V}\left[\hat{\beta}_{0}\right] &=\frac{\sigma^{2}}{n}+\frac{\bar{x}^{2} \sigma^{2}}{S_{x x}}, & \hat{\sigma}_{\beta_{0}}=\hat{\sigma} \sqrt{\frac{1}{n}+\frac{\bar{x}^{2}}{S_{x x}}}\\
\mathrm{~V}\left[\hat{\beta}_{1}\right] &=\frac{\sigma^{2}}{S_{x x}},& \hat{\sigma}_{\beta_{1}}=\hat{\sigma} \sqrt{\frac{1}{\sum_{i=1}^{n}\left(x_{i}-\bar{x}\right)^{2}}} \\
\operatorname{Cov}\left[\hat{\beta}_{0}, \hat{\beta}_{1}\right] &=-\frac{\bar{x} \sigma^{2}}{S_{x x}}
\end{align*}
$$
where $\sigma^{2}$ is usually replaced by its estimate $\hat{\sigma}^{2}$.
The central estimator for $\sigma^{2}$ is
$$
\hat{\sigma}^{2}=\frac{R S S\left(\hat{\beta}_{0}, \hat{\beta}_{1}\right)}{n-2}=\frac{\sum_{i=1}^{n} e_{i}^{2}}{n-2}
$$
When the estimate of $\sigma^{2}$ is used the variances also become estimates and we'll refer to them as $\hat{\sigma}_{\beta_0}^{2}$ and $\hat{\sigma}_{\beta_{1}}^{2}$.

```ad-info
title: Proof
collapse: close

As $\hat\beta_{0}$ can be written as ([[Simple linear parameter estimation#^central-estimator-proof|Central estimator proof]]):
$$
\begin{aligned}
\hat{\beta}_{0} =\beta_{0}+\frac{1}{n} \sum_{i=1}^{n} \varepsilon_{i}-\left(\frac{\sum_{i=1}^{n} \varepsilon_{i}\left(x_{i}-\bar{x}\right)}{S_{x x}}\right) \bar{x}
\end{aligned}
$$
The variance of $\hat\beta_0$ can be written as:
$$
\mathrm{V}\left(\hat{\beta}_{0}\right)=\mathrm{V}\left[\beta_{0}+\frac{1}{n} \sum_{i=1}^{n} \varepsilon_{i}-\left(\frac{\sum_{i=1}^{n} \varepsilon_{i}\left(x_{i}-\bar{x}\right)}{S_{x x}}\right) \bar{x}\right]
$$


using the definition of the variance $\left(\mathrm{V}(X)=\mathrm{E}\left[(X-\mathrm{E}[X])^{2}\right]\right)$ and $\mathrm{E}(\varepsilon)=0$ we get
$$
\begin{aligned}
\mathrm{V}\left(\hat{\beta}_{0}\right)=\mathrm{V}[&\left.\frac{1}{n} \sum_{i=1}^{n} \varepsilon_{i}\right]+\mathrm{V}\left[\left(\frac{\sum_{i=1}^{n} \varepsilon_{i}\left(x_{i}-\bar{x}\right)}{S_{x x}}\right) \bar{x}\right]-\\
& 2\cdot \mathrm{E}\left[\frac{1}{n} \sum_{i=1}^{n} \varepsilon_{i}\left(\frac{\sum_{i=1}^{n} \varepsilon_{i}\left(x_{i}-\bar{x}\right)}{S_{x x}}\right) \bar{x}\right],
\end{aligned}
$$
now use independence between $\varepsilon_{i}$ and $\varepsilon_{j}(i \neq j)$ to get
$$
\begin{aligned}
\mathrm{V}\left(\hat{\beta}_{0}\right) &=\frac{\sigma^{2}}{n}+\frac{\bar{x}^{2} \sigma^{2} \sum_{i=1}^{n}\left(x_{i}-\bar{x}\right)^{2}}{\left(S_{x x}\right)^{2}}+\frac{\bar{x} \sigma^{2}}{n S_{x x}} \sum_{i=1}^{n}\left(x_{i}-\bar{x}\right) \\
&=\frac{\sigma^{2}}{n}+\frac{\bar{x}^{2} \sigma^{2}}{S_{x x}}
\end{aligned}
$$
Finally, the variance of $\hat{\beta}_{1}$ is (again using the definition of variance and independence of the $\left.\varepsilon^{\prime} s\right)$
$$
\begin{aligned}
\mathrm{V}\left(\hat{\beta}_{1}\right) &=\mathrm{V}\left[\beta_{1}+\frac{\sum_{i=1}^{n} \varepsilon_{i}\left(x_{i}-\bar{x}\right)}{S_{x x}}\right] \\
&=\frac{\sum_{i=1}^{n}\left(x_{i}-\bar{x}\right)^{2} \mathrm{~V}\left(\varepsilon_{i}\right)}{\left(S_{x x}\right)^{2}} \\
&=\frac{\sigma^{2}}{S_{x x}}
\end{aligned}
$$
and the covariance between the parameters estimates becomes
$$
\begin{aligned}
\operatorname{Cov}\left(\hat{\beta}_{0}, \hat{\beta}_{1}\right) &=\mathrm{E}\left[\left(\hat{\beta}_{0}-\beta_{0}\right)\left(\hat{\beta}_{1}-\beta_{1}\right)\right] \\
&=\mathrm{E}\left[\left(\frac{1}{n} \sum_{i=1}^{n} \varepsilon_{i}-\frac{\sum_{i=1}^{n} \varepsilon_{i}\left(x_{i}-\bar{x}\right)}{S_{x x}}\right) \bar{x} \frac{\sum_{i=1}^{n} \varepsilon_{i}\left(x_{i}-\bar{x}\right)}{S_{x x}}\right] \\
&=\frac{\bar{x}}{n S_{x x}} \mathrm{E}\left[\sum_{i=1}^{n} \varepsilon_{i} \sum_{i=1}^{n} \varepsilon_{i}\left(x_{i}-\bar{x}\right)\right]-\frac{\bar{x}}{\left(S_{x x}\right)^{2}} \mathrm{E}\left[\sum_{i=1}^{n} \varepsilon_{i}^{2}\left(x_{i}-\bar{x}\right)^{2}\right] \\
&=\frac{\bar{x} \sigma^{2}(n \bar{x}-n \bar{x})}{n S_{x x}}-\frac{\bar{x}}{\left(S_{x x}\right)^{2}} \sigma^{2} \sum_{i=1}^{n}\left(x_{i}-\bar{x}\right)^{2} \\
&=-\frac{\bar{x} \sigma^{2}}{S_{x x}}
\end{aligned}
$$

using the definition of the variance $\left(\mathrm{V}(X)=\mathrm{E}\left[(X-\mathrm{E}[X])^{2}\right]\right)$ and $\mathrm{E}(\varepsilon)=0$ we get
$$
\begin{aligned}
\mathrm{V}\left(\hat{\beta}_{0}\right)=\mathrm{V}[&\left.\frac{1}{n} \sum_{i=1}^{n} \varepsilon_{i}\right]+\mathrm{V}\left[\left(\frac{\sum_{i=1}^{n} \varepsilon_{i}\left(x_{i}-\bar{x}\right)}{S_{x x}}\right) \bar{x}\right]-\\
& 2 \mathrm{E}\left[\frac{1}{n} \sum_{i=1}^{n} \varepsilon_{i}\left(\frac{\sum_{i=1}^{n} \varepsilon_{i}\left(x_{i}-\bar{x}\right)}{S_{x x}}\right) \bar{x}\right],
\end{aligned}
$$

To get an estimate of the residual variance we calculate the expected value of the residual sum of squares
$$
\mathrm{E}(R S S)=\mathrm{E}\left[\sum_{i=1}^{n}\left(Y_{i}-\left(\hat{\beta}_{0}+\hat{\beta}_{1} x_{i}\right)\right)^{2}\right]
$$
inserting $Y_{i}=\beta_{0}+\beta_{1} x_{i}+\varepsilon_{i}$ and rearranging gives
$$
\begin{aligned}
\mathrm{E}(R S S) &=\sum_{i=1}^{n} \mathrm{E}\left[\left(-\left(\hat{\beta}_{0}-\beta_{0}\right)-\left(\hat{\beta}_{1}-\beta_{1}\right) x_{i}+\varepsilon_{i}\right)^{2}\right] \\
&=\sum_{i=1}^{n}\left\{\mathrm{E}\left[\left(\hat{\beta}_{0}-\beta_{0}\right)^{2}\right]+\mathrm{E}\left[\left(\hat{\beta}_{1}-\beta_{1}\right)^{2}\right] x_{i}^{2}+\mathrm{E}\left[\varepsilon_{i}^{2}\right]+\right.\\
&\left.2 \mathrm{E}\left[\left(\hat{\beta}_{0}-\beta_{0}\right)\left(\hat{\beta}_{1}-\beta_{1}\right)\right] x_{i}-2 \mathrm{E}\left[\left(\hat{\beta}_{0}-\beta_{0}\right) \varepsilon_{i}\right]-2 \mathrm{E}\left[\left(\hat{\beta}_{1}-\beta_{1}\right) \varepsilon_{i}\right] x_{i}\right\}
\end{aligned}
$$

now observe that $\mathrm{E}\left[\left(\hat{\beta}_{0}-\beta_{0}\right)^{2}\right]=\mathrm{V}\left[\hat{\beta}_{0}\right]$,$\mathrm{E}\left[\left(\hat{\beta}_{1}-\beta_{1}\right)^{2}\right]=\mathrm{V}\left[\hat{\beta}_{1}\right]$,$\mathrm{E}\left(\varepsilon_{i}^{2}\right)=\sigma^{2}$, and $\mathrm{E}\left[\left(\hat{\beta}_{0}-\beta_{0}\right)\left(\hat{\beta}_{1}-\beta_{1}\right)\right]=\operatorname{Cov}\left(\hat{\beta}_{0}, \hat{\beta}_{1}\right)$, and insert $\hat{\beta}_{0}$ and $\hat{\beta}_{1}$ in the last two terms
$$
\begin{aligned}
\mathrm{E}(R S S) &=n \mathrm{~V}\left(\hat{\beta}_{0}\right)+\mathrm{V}\left(\hat{\beta}_{1}\right) \sum_{i=1}^{n} x_{i}^{2}+n \sigma^{2}+2 \sum_{i=1}^{n} \operatorname{Cov}\left(\hat{\beta}_{0}, \hat{\beta}_{1}\right) x_{i}-\\
& 2 \sum_{i=1}^{n}\left\{\mathrm{E}\left[\left(\frac{1}{n} \sum_{j=1}^{n} \varepsilon_{j}-\frac{\sum_{j=1}^{2} \varepsilon_{j}\left(x_{j}-\bar{x}\right.}{S_{x x}}\right) \varepsilon_{i}\right]-\mathrm{E}\left[\frac{\sum_{j=1}^{n} \varepsilon_{j}\left(x_{j}-\bar{x}\right)}{S_{x x}} \varepsilon_{i}\right] x_{i}\right\} \\
&=\sigma^{2}+\frac{n \bar{x}^{2} \sigma^{2}}{S_{x x}}+\frac{\sigma^{2} \sum_{i=1}^{n} x_{i}^{2}}{S_{x x}}+n \sigma^{2}-2 \sum_{i=1}^{n} \frac{\bar{x} \sigma^{2}}{S_{x x}} x_{i}-\\
& 2 \sum_{i=1}^{n}\left(\frac{\sigma^{2}}{n}-\frac{\sigma^{2}\left(x_{i}-\bar{x}\right)}{S_{x x}}\right)-2 \sum_{i=1}^{n} \frac{\sigma^{2}\left(x_{i}-\bar{x}\right) x_{i}}{S_{x x}}
\end{aligned}
$$
now collect terms and observe that $\sum x_{i}=n \bar{x}$
$$
\begin{aligned}
\mathrm{E}(R S S) &=\sigma^{2}(n+1)+\frac{\sigma^{2}}{S_{x x}} \sum_{i=1}^{n}\left(x_{i}^{2}+\bar{x}^{2}\right)-2 \frac{n \bar{x}^{2} \sigma^{2}}{S_{x x}}-2 \sigma^{2}-2 \frac{\sigma^{2} \sum_{i=1}^{n}\left(x_{i}^{2}-x_{i} \bar{x}\right)}{S_{x x}} \\
&=\sigma^{2}(n-1)+\frac{\sigma^{2}}{S_{x x}} \sum_{i=1}^{n}\left(-x_{i}^{2}-\bar{x}^{2}+2 x_{i} \bar{x}\right) \\
&=\sigma^{2}(n-1)-\frac{\sigma^{2}}{S_{x x}} S_{x x} \\
&=\sigma^{2}(n-2)
\end{aligned}
$$
and thus a central estimator for $\sigma^{2}$ is $\hat{\sigma}^{2}=\frac{R S S}{n-2}$.
```
````
^theorem5-8

The intuitive explanation for dividing with $n-2$ is that with only two pairs it will not be possible to say anything about the variation (the residuals will be zero).
Note also that the estimated error/residual variance decreases with the sample size ($n$).

# In R
```R
summary(lm(formula = y~x))$coefficients[,2]
```

# Examples

````ad-example
title: Example 5.9 <br> Simple linear regression cont. (Parameter variance)
collapse: open

With the parameter estimates found:
$$
\hat{\beta}_{0}=-119.96, \quad \hat{\beta}_{1}=1.113
$$
and the model:
$$
\hat{y}_{i}=-119.96+1.113 \cdot x_{i}
$$
with the values of the residuals being:
$$
e_{i}=y_{i}-\hat{y}_{i}
$$
and the error variance estimate with $n=10:$
$$
\hat{\sigma}^{2}=\frac{1}{10-2} \sum_{i=1}^{10} e_{i}^{2}
$$

In R:
```R
beta0 <- coef(fitStudents)[1]
beta1 <- coef(fitStudents)[2]
e <- y - (beta0 + beta1 * x)
n <- length(e)
sigma <- sqrt(sum(e^2) / (n - 2))
sigma.beta0 <- sqrt(sigma^2 * (1 / n + xbar^2 / Sxx))
sigma.beta1 <- sqrt(sigma^2 / Sxx)
c(sigma, sigma.beta0, sigma.beta1)

[1] 3.8809005 18.8970518  0.1059391
```
or can be seen in the lm output in Std. Error and Residual standard error:
```R
D <- data.frame(x=x, y=y)
fitStudents <- lm(y ~ x, data=D)
summary(fitStudents)

Call:
lm(formula = y ~ x, data = D)

Residuals:
Min 1Q Median 3Q Max
-5.876 -1.451 -0.608 2.234 6.477

Coefficients:
			Estimate 	Std. Error	t value Pr(>|t|)
(Intercept) -119.958 	18.897 		-6.35 	0.00022 ***
x 			1.113 		0.106 		10.50 	0.0000059 ***
---
Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
Residual standard error: 3.88 on 8 degrees of freedom
Multiple R-squared: 0.932,Adjusted R-squared: 0.924
F-statistic: 110 on 1 and 8 DF, p-value: 0.00000587
```
````
^example5-9

````ad-example
title: Example <br> Simulation
collapse: open

$$
Y_{i}=10+3 x_{i}+\varepsilon_{i}, \quad \varepsilon_{i} \sim \ndist\left(0,5^{2}\right)
$$

```R
n <- 10; k <- 500
x <- seq(-2, 5, length=n)
Sxx <- (n-1)*var(x)
c(mean(x), Sxx)
[1] 1.50 49.91

y <- matrix(0, ncol=k, nrow=n)
```
We'd expect to obtain variance estimates close to:
$$
\begin{aligned}
&\mathrm{V}\left[\hat{\beta}_{0}\right]=5^{2}\left(\frac{1}{10}+\frac{1.50^{2}}{49.91}\right)=3.63 \\
&\mathrm{~V}\left[\hat{\beta}_{1}\right]=\frac{5^{2}}{49.91}=0.501
\end{aligned}
$$

With simulation:
```R
b0 <- numeric(k); b1 <- numeric(k)
sigma <- numeric(k)
for(i in 1:k){
	fit <- lm(y[ ,i] ~ x)
	b <- coef(fit)
	b0[i] <- b[1]
	b1[i] <- b[2]
	sigma[i] <- summary(fit)$sigma
}

c(var(b0), var(b1), mean(sigma))
[1] 3.7755 0.5427 4.8580
```
The simulated values are close to the theoretical values, and would be even closer if the sample sizes was larger.
````

````ad-example
title: Example <br> Visual representation of decreasing variance with sample size
collapse: open

Consider the model:
$$
Y_{i}=1+x_{i}+\varepsilon_{i r} \quad \varepsilon_{i} \sim \ndist(0,1)
$$
where $x_{i}=\frac{i-1}{n-1}, i=1, \ldots, n$. We'll not simulate the experiment with increasing $n$, to see the effect of the sample size on the estimator variances.
```R
k <- 1000
sigma.beta <- matrix(nrow=k,ncol=2)
sigma <- numeric(k);
n <- seq(3, k+2)
for(i in 1:k){
	x <- seq(0,1,length=n[i])
	y <- 1+x+rnorm(n[i])
	fit <- lm(y ~ x)
	sigma[i] <- summary(fit)$sigma
	sigma.beta[i, ] <- summary(fit)$coefficients[ ,2]
}
```
<span class="centerImg">![[RSSEstimatorVarianceSampleSizeExample.png]]</span>
We see that the redisual variance converge to zero.
````

# References
- [[Introduction to Mathematical Statistics - 02403]]