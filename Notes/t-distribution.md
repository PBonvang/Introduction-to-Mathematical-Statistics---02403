---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]]
****

<span class="centerImg">![[tDistributionVsNormal.png]]</span>

The $t$-distribution is the sampling distribution of the sample mean standardized with the sample variation. This distribution is valid for all sample sizes, but is very similar to the [[Normal distribution]] for samples of size larger than 30 ($n>30$), hence for larger samples the normal distribution is often applied.

In general it's used for [[Hypothesis testing]], in how likely a claim of mean of a [[normal distribution|normally distributed]] variable is, given a small amount of samples.

Given a sample of normally and i.i.d random variables $X_{1}, \ldots, X_{n}$, then the random variable
$$
T=\frac{\bar{X}-\mu}{S / \sqrt{n}} \sim t(n-1),
$$
follows the $t$-distribution.
$\bar{x}:$ [[Sample mean]]
$\mu:$ [[Mean]] of $X$
$n:$ Sample size
$S:$ Sample standard deviation

# [[Probability density function - PDF]]
$$
f_{T}(t)=\frac{\Gamma\left(\frac{v+1}{2}\right)}{\sqrt{v \pi} \Gamma\left(\frac{v}{2}\right)}\left(1+\frac{t^{2}}{v}\right)^{-\frac{v+1}{2}},\quad t\in\R
$$
$\Gamma:$ Gamma function
$v:$ Degrees of freedom

# [[Mean]] and [[variance]]
$$
\mathrm{E}(X)=0, \quad v>1
$$
$$
\mathrm{V}(X)=\frac{v}{v-2}, \quad v>2
$$

# Sum
If $X \sim \ndist\left(\mu_{1}, \sigma^{2}\right)$ and $Y \sim \ndist\left(\mu_{2}, \sigma^{2}\right)$, then
$$
\frac{\bar{X}-\bar{Y}-\left(\mu_{1}-\mu_{2}\right)}{S_{p} \sqrt{\frac{1}{n_{1}}+\frac{1}{n_{2}}}} \sim t\left(n_{1}+n_{2}-2\right)
$$
$\bar{X}:$ [[Mean#Sample mean]] of $X$
$\bar{Y}:$ [[Mean#Sample mean]] of $Y$
$S_{p}:$ The weighted sample variance of the two variables, see [[Chi-square distribution]].

# Examples
````ad-example
title: EV driving distance

An electric car manufacture claims that their cars can drive on average $400 \mathrm{~km}$ on a full charge at a specified speed. From experience it is known that this full charge distance, denote it by $X$, is normal distributed. A test of $n=10$ cars was carried out, which resulted in a sample mean of $\bar{x}=382 \mathrm{~km}$ and a sample deviation of $s=14$.

Now we can use the $t$-distribution to calculate the probability of obtaining this value of the sample mean or lower, if their claim about the mean is actually true:

```R
# A test of 10 cars was carried out
n <- 10
# The claim is that the real mean is 400 km
muX <- 400
# From the sample the sample mean was calculated to
xMean <- 393
# And the sample deviation was
xSD <- 14
# Use the cdf to calculate the probability of obtaining this
# sample mean or a lower value
pt( (xMean-muX) / (xSD/sqrt(n)), df=n-1)

[1] 0.07415
```
It therefore seems highly unlikely that the true average/mean is actually 400 km.

````

# References
- [[t and chi distributions]]
- [[Introduction to Mathematical Statistics - 02403]]