---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]]
****

<span class="centerImg">![[ChiSquareDistributionExample.png|350]]</span>
$$\large
\sum_{i=1}^{v} Z_{i}^{2} \sim \chi^{2}(v)
$$
The $\chi^{2}$-distribution is essentially the sum of squared independent [[Standard normal distribution|standard normal distributions]] $Z_{1}, \ldots, Z_{v}$ and is mostly used for [[Hypothesis testing]]. 

````ad-example
title: Milk dose machines (E2.82)

A manufacture of machines for dosing milk claims that their machines can dose with a precision defined by the normal distribution with a standard deviation less than $2 \%$ of the dose volume in the operation range. A sample of $n=20$ observations was taken to check if the precision was as claimed. The sample standard deviation was calculated to $s=0.03$.

Hence the claim is that $\sigma \leq 0.02$, thus we want to answer the question: if $\sigma=0.02$ (i.e. the upper limit of the claim), what is then the probability of getting the sampling deviation $s \geq 0.03$ ?
```R
# The sample size
n <- 20
# The claimed deviation
sigma <- 0.02
# The observed sample standard deviation
s <- 0.03
# Calculate the chi-square statistic
chiSq <- (n-1)*s^2 / sigma^2
# Use the cdf to calculate the probability of getting the observed
# sample standard deviation or higher
1 - pchisq(chiSq, df=n-1)

[1] 0.001402
```

The probability of getting a sample variance $s\ge0.03$ if the true variance was $0.02$ is $0.14~\%$. It's therefore highly unlikely that the true variance is 2 %.

````

# Properties
Given a sample of $n$ from normal distributed [[random variable|random variables]] $X_i$, with [[variance]] $\sigma^{2}$, the [[Variance#Sample variance|sample variance]] $S^{2}$ can be transformed to:
$$
\chi^{2}=\frac{(n-1) S^{2}}{\sigma^{2}}
$$
which follow a $\chi^{2}$-distribution with degrees of freedom $v=n-1$.

# [[Probability density function - PDF]]
$$\Large
f(x)=\frac{1}{2^{\frac{v}{2}} \Gamma\left(\frac{v}{2}\right)} x^{\frac{v}{2}-1} \e^{-\frac{x}{2}} ; \quad x \geq 0
$$

$\Gamma(x):$ Gamma function
$v:$ Degrees of freedom

# [[Mean]] and [[variance]]
$$
\mathrm{E}(\mathrm{X})=v
$$

$$
\mathrm{V}(\mathrm{X})=2 v
$$

## Determining expected value of the sample variance
$$
\begin{aligned}
\mathrm{E}\left(S^{2}\right) &=\frac{\sigma^{2}}{n-1} \frac{n-1}{\sigma^{2}} \mathrm{E}\left(S^{2}\right) \\
&=\frac{\sigma^{2}}{n-1} \mathrm{E}\left(\frac{n-1}{\sigma^{2}} S^{2}\right) \\
&=\frac{\sigma^{2}}{n-1}(n-1)=\sigma^{2},
\end{aligned}
$$
Because $\frac{n-1}{\sigma^{2}} S^{2} \sim \chi^{2}(n-1)$.
$S^{2}$ is therefore a central and consistent estimator for $\sigma^{2}$

## Variance of sample variance
$$
\begin{aligned}
\mathrm{V}\left(S^{2}\right) &=\left(\frac{\sigma^{2}}{n-1}\right)^{2} \mathrm{~V}\left(\frac{n-1}{\sigma^{2}} S^{2}\right) \\
&=\frac{\sigma^{4}}{(n-1)^{2}} 2(n-1)=2 \frac{\sigma^{4}}{n-1}
\end{aligned}
$$

# Linear combinations


Hvis $Q_{1} \sim \chi^{2}\left(v_{1}\right)$ og $Q_{2} \sim \chi^{2}\left(v_{2}\right)$ er uafhængige så gæelder
$$
Q=Q_{1}+Q_{2} \sim \chi^{2}\left(v_{1}+v_{2}\right)
$$

# References
- [[t and chi distributions]]
- [[Introduction to Mathematical Statistics - 02403]]