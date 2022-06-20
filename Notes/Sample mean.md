---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]], [[Mean]]
****

$$\large
\tilde{\mu}=\bar{X}=\frac{1}{n}\sum\limits_{i=1}^{n}x_{i}
$$
The best estimate of $\mu$ (the true/population [[Mean]]), assuming the population is [[Normal distribution|normally distributed]] is sum of the numbers, divided by the amount of numbers.

R:
```R
mean(x)
```
# Determining the precision/uncertainty
As we know, doing the sampling again would result in a different sample mean, which means the sample mean is itself a [[Random variable]].
If $X$ is normally distributed with the mean $\mu$ and [[variance]] $\sigma^{2}$, then the sample mean $\bar{X}$ is normally distributed, assuming that each observation is independent and identically distributed.
$$
\bar{X}=\frac{1}{n} \sum_{i=1}^{n} X_{i} \sim N\left(\mu, \frac{\sigma^{2}}{n}\right)
$$

An **important** point is that the [[Standard deviation]] of the sample mean $\sigma_{\bar{X}}$ is equal to:
$$
\sigma_{\bar{X}}=\frac{\sigma}{\sqrt{n}}=\sigma_{(\bar{X}-\mu)}
$$
which is also the standard deviation of the difference between $\bar{X}$ and $\mu$ (the error).

```ad-tip
title: Theorem 3.4 <br> The distribution of the $\sigma$-standardized mean of normal random variables

Assuming that each random variable $X_1,\dots,X_n$ are independent and identically normally distributed, $X_{i}\sim\ndist(\mu,\sigma^{2})$ then
$$
Z=\frac{\bar{X}-\mu}{\sigma / \sqrt{n}} \sim N\left(0,1^{2}\right)
$$
The standardized sample mean $Z$ follows a standard normal distribution.

```

The problem with Theorem 3.4, is that the true standard deviation $\sigma$ is required which is rarely known.
Instead we can utilize the sample standard deviation, however this means that the sample mean is no longer normally distributed, but rather follows a [[t-distribution]].

```ad-tip
title: Theorem 3.5 <br> The distribution of the $S$-standardized mean of normal random variables.
Assuming the random variables are independent and identically normally distributed, then
$$
T=\frac{\bar{X}-\mu}{S / \sqrt{n}} \sim t(n-1)
$$
where $t(n-1)$ is the $t$-distribution with $n-1$ degrees of freedom.
```

## Confidence interval - CI
Even through we don't know the true mean, we can quantify our precision/uncertainty with a confidence interval (CI).
It's assumed that the population is [[Normal distribution|normally distributed]], however if the sample size $n$ is large enough, can be applicable to other distribution types.
```ad-summary
title: Method 3.9 <br> The one sample confidence interval for $\mu$

For a sample $x_{1}, \ldots, x_{n}$ the $100(1-\alpha) \%$ confidence interval is given by
$$\large
\bar{x} \pm t_{1-\alpha / 2} \cdot \frac{s}{\sqrt{n}}
$$
where $t_{1-\alpha / 2}$ is the $(1-\alpha / 2)$ quantile from the $t$-distribution with $n-1$ degrees of freedom.
Most commonly used is the $95 \%$-confidence interval:
$$
\bar{x} \pm t_{0.975} \cdot \frac{s}{\sqrt{n}} .
$$
```

The reason for halving the $\alpha$ value is because we are neglecting the tails on each side of the distribution.
You can see this as the saying that the true mean is with 100% certainty in the distribution, then as we narrow our inclusion we get less certain
<span class="centerImg">![[NormalDistributionDiagram.png|#invert]]</span>

Note that a confidence interval of $95\%$ means that the if we simulated the confidence interval 100 times the true mean would be simulated 95% of the time.
```R
# Simulate 1000 samples of n=50 observations, and
# calculate a CI from each sample
k <- 1000
ThousandCIs <- replicate(k, t.test(rnorm(n=50, mean=1, sd=1))$conf.int)
# Count how often 1 is covered
sum(ThousandCIs[1,] < 1 & 1 < ThousandCIs[2,])
[1] 954
```

### In R
```R
# 99% CI for the mean of x
t.test(x, conf.level = 0.99)
```
## How to determine t
The t value can be determined as the quantile of the [[t-distribution]] with $n-1$ degrees of freedom and $1-\frac{\alpha}{2}$ being the percentile. In that sense $\alpha$ determines the error margin of the confidence interval.
Ex: t value for a 99% confidence interval with a sample size $n=10$
```R
n = 10
alpha = 0.01

qt(p=1-alpha/2, df=n-1)
> 3.249836
```

# References
- [[Introduction to Mathematical Statistics - 02403]]