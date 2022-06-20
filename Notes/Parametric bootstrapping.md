---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]], [[Statistical simulation]]
****

Parametric bootstrapping is one approach to [[Statistical bootstrapping]], which samples from the assumed distribution to determine features of the true population/distribution.

````ad-example
title: Example: <br> Confidence interval for the exponential rate or mean

The following 10 waiting times (in sec) was observed in a call center:
$$
32.6,1.6,42.1,29.2,53.4,79.3,2.3,4.7,13.6,2.0
$$
We model the waiting times using a [[Exponential distribution]]. We estimate the mean as:
$$
\hat{\mu}=\bar{x}=26.08
$$
and the rate as:
$$\hat\lambda=\frac{1}{\hat\mu}=\frac{1}{26.08}=0.03834356$$
We now wish to determine the 95% confidence interval for the mean. As we don't have any theorems for this, we simulate the estimated exponential distribution:
```R
x <- c(32.6, 1.6, 42.1, 29.2, 53.4, 79.3, 2.3 , 4.7, 13.6, 2.0)
n <- length(x)

# Set the number of simulations
k <- 100000

# 1. Simulate 10 exponentials with the sample mean k times
simsamples <- replicate(k, rexp(10,1/26.08)) # 10 x k matrix

# 2. Compute the mean of the 10 simulated observations k times
simmeans <- apply(simsamples, 2, mean) # k length vector

# 3. Find the two relevant quantiles of the k simulated means
quantile(simmeans, c(0.025, 0.975))
	2.5% 97.5%
	12.59 44.63
```
The 95% confidence interval for the mean $\mu$ is therefore:
$$[12.6,~44.6]$$

For the same confidence interval for the rate can then be calculated as:
$$
[1 / 44.6,1 / 12.6] \Leftrightarrow[0.022,0.0794]
$$
```R
hist(simmeans, col="blue", nclass=30, cex.main=0.8)
```
<span class="centerImg">![[parametricBootstrappingExampleSimmeansHistogram.png]]</span>
We see clearly that the sampling distribution in this case is not a normal nor a [[t-distribution]]: it has a clear right skewed shape. So $n=10$ is not quite large enough for this exponential distribution to make the [[Central Limit Theorem]] take over.
````

# One-sample confidence intervals assuming any distribution
If we're interested in features not expressed as a simple function of the mean like the median, coefficient of variation, the quartiles, the [[Inter Quartile Range - IQR]] or any other [[Quantiles and percentiles]].
We must use a different method which can determine any statistic $\hat\theta$.

```ad-summary
title: Method 4.7 <br> Confidence interval for any feature $\theta$ by parametric bootstrap
collapse: open

Assume we have actual observations $x_{1}, \ldots, x_{n}$ and assume that they stem from some probability distribution with density ([[Probability density function - PDF|pdf]]) $f$ :
1. Simulate $k$ samples of $n$ observations from the assumed distribution $f$ where the mean is set to $\bar{x}$
	Or choose the choosen distribution which matches the data best using the [[Maximum likelihood]] approach.
2. Calculate the statistic $\hat{\theta}$ in each of the $k$ samples $\hat{\theta}_{1}^{*}, \ldots, \hat{\theta}_{k}^{*}$
3. Find the $100(\alpha / 2) \%$ and $100(1-\alpha / 2) \%$ quantiles for these, $q_{100(\alpha / 2) \%}^{*}$ and $q_{100(1-\alpha / 2) \%}^{*}$ as the $100(1-\alpha) \%$ confidence interval:
$$\large\left[q_{100(\alpha / 2) \%}^{*},~ q_{100(1-\alpha / 2) \%}^{*}\right]$$

```
````ad-example
title: Example: <br> Confidence interval for the exponential median
collapse: close

```R
x <- c(32.6, 1.6, 42.1, 29.2, 53.4, 79.3, 2.3 , 4.7, 13.6, 2.0)
n <- length(x)

# Set the number of simulations
k <- 100000

# 1. Simulate k samples of n=10 exponentials with the sample mean
simsamples <- replicate(k, rexp(n,1/26.08))

# 2. Compute the median of the n=10 simulated observations k times:
simmedians <- apply(simsamples, 2, median)

# 3. Find the two relevant quantiles of the k simulated medians:
quantile(simmedians, c(0.025, 0.975))
	2.5% 97.5%
	7.038 38.465
```

The 95% confidence interval for the median is thus:
$$[7.038,~ 38.465]$$

<span class="centerImg">![[parametricBootstrappingExampleSimmediansHistogram.png]]</span>
Just as the [[mean]], the sampling distribution does not follow a normal or [[t-distribution]].
````

# Two-sample confidence intervals assuming any distribution
```ad-summary
title: Method 4.10 <br> Two-sample confidence interval for any feature comparison $\theta_1-\theta_2$ <br> by parametric bootstrap
collapse: open

Assume we have actual observations $x_{1}, \ldots, x_{n_{1}}$ and $y_{1}, \ldots, y_{n_{2}}$ and assume that they stem from some probability distributions with density $f_{1}$ and $f_{2}$ :
1. Simulate $k$ sets of 2 samples of $n_{1}$ and $n_{2}$ observations from the assumed distributions setting the means to $\hat{\mu}_{1}=\bar{x}$ and $\hat{\mu}_{2}=\bar{y}$, respectively
2. Calculate the difference between the features in each of the $k$ samples $\hat{\theta}_{x 1}^{*}-\hat{\theta}_{y 1}^{*}, \ldots, \hat{\theta}_{x k}^{*}-\hat{\theta}_{y k}^{*}$
3. Find the $100(\alpha / 2) \%$ and $100(1-\alpha / 2) \%$ quantiles for these, $q_{100(\alpha / 2) \%}^{*}$ and $q_{100(1-\alpha / 2) \%}^{*}$ as the $100(1-\alpha) \%$ confidence interval
$$\large\left[q_{100(\alpha / 2) \%}^{*},~ q_{100(1-\alpha / 2) \%}^{*}\right]$$

```

````ad-example
title: Example: <br> Confidence interval for the difference between two means <br> from exponentially distributed data
collapse: close

Continuing from the previous example we now have a second sample of 12 observations from another day at the call center:
$$
9.6,22.2,52.5,12.6,33.0,15.2,76.6,36.3,110.2,18.0,62.4,10.3
$$
We want to determine the confidence interval for the difference between the average wait time between the two days:
```R
x <- c(32.6, 1.6, 42.1, 29.2, 53.4, 79.3, 2.3 , 4.7, 13.6, 2.0)
y <- c(9.6, 22.2, 52.5, 12.6, 33.0, 15.2, 76.6, 36.3, 110.2, 18.0,
62.4, 10.3)
n1 <- length(x)
n2 <- length(y)

# Set the number of simulations
k <- 100000

# 1. Simulate k samples of each n1=10 and n2=12 exponentials
# with the sample means
simXsamples <- replicate(k, rexp(n1,1/mean(x)))
simYsamples <- replicate(k, rexp(n2,1/mean(y)))

# 2. Compute the difference between the simulated means k times
simDifmeans <- apply(simXsamples,2,mean) - apply(simYsamples,2,mean)

# 3. Find the two relevant quantiles of the k simulated differences
# in sample means
quantile(simDifmeans, c(0.025, 0.975), cex.main=0.8)
	2.5% 97.5%
	-40.74 14.12
```

The confidence is rather large including 0, which means we can't really say that the wait time was shorter on one of the days.
````

# Hypothesis testing
As with "normal" [[Hypothesis testing]], if the hypothesised value is withing the range of the confidence interval, we cannot reject it. However if it's outside we can.
# References
- [[Introduction to Mathematical Statistics - 02403]]