---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]]
****
$$\large
\begin{align*}
S^{2}=\frac{1}{n-1} \sum_{i=1}^{n}\left(X_{i}-\bar{X}\right)^{2} \tag{Estimator}\\
s^{2}=\hat\sigma^{2}=\frac{1}{n-1}\sum\limits_{i=1}^{n}(x_i - \hat\mu)^{2}\tag{Estimate}
\end{align*}$$
$\hat\mu:$ [[Sample mean]]

The reason we divide with $n-1$, is that $\hat{\mu}$ isn't the real [[mean]] and therefore the difference is slightly lower than the difference with the actual mean $\mu$, and it turns out we can correct this is to subtract one from the denominator. 
$$\op{var}(\bar{X})=\frac{\sigma^{2}}{n}$$

# Confidence interval
**It's assumed that the observations comes from a [[normal distribution]]!**

The variance estimator has a sampling distribution which follows the [[Chi-square distribution]], where $S^{2}$ is the variance of a sample of size $n$ from a normal distribution:
$$
\chi^{2}=\frac{(n-1) S^{2}}{\sigma^{2}}
$$
with $v=n-1$ degrees of freedom.

```ad-summary
title: Method 3.19 <br> Confidence interval for the variance/standard deviation



A $100(1-\alpha) \%$ confidence interval for the variance $\sigma^{2}$ is
$$
\left[\frac{(n-1) s^{2}}{\chi_{1-\alpha / 2}^{2}}, \frac{(n-1) s^{2}}{\chi_{\alpha / 2}^{2}}\right],
$$
where the quantiles come from a $\chi^{2}$-distribution with $v=n-1$ degrees of freedom.
A $100(1-\alpha) \%$ confidence interval for the standard deviation $\sigma$ is
$$
\left[\sqrt{\frac{(n-1) s^{2}}{\chi_{1-\alpha / 2}^{2}}}, \sqrt{\frac{(n-1) s^{2}}{\chi_{\alpha / 2}^{2}}}\right] .
$$
$s^{2}:$ Sample variance estimate
$n:$ Sample size
$\alpha:$ Significance level

```

````ad-example
title: Example: Tablet production

A random sample of $n=20$ tablets is collected, with the sample mean $\bar{x}=1.01$ and variance $s^{2}=0.07^{2}$

Determine the 95%-confidence interval.
To do so we simply determine the 0.0025 and 0.975 [[Quantiles and percentiles|quantiles]] of the $\chi^{2}$-distribution with $v=20-1=19$ degrees of freedom:
```R
alpha = 0.05
qchisq(p=c(1-alpha/2, alpha/2), df=19)

[1]  32.852327 8.906516
```
Therefore the confidence interval is:
$$
\left[\frac{19 \cdot 0.07^{2}}{32.85}, \frac{19 \cdot 0.07^{2}}{8.907}\right] \approx[0.00283,0.0105]
$$
and for the standard deviation:
$$
[\sqrt{0.002834}, \sqrt{0.01045}] \approx[0.053,0.102]
$$
````
# References
- [[Variance]]
- [[Introduction to Mathematical Statistics - 02403]]