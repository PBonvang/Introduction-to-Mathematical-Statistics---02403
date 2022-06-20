---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]], [[Statistical bootstrapping]]
****

Like [[Parametric bootstrapping]] non-parametric bootstrapping is a [[Statistical bootstrapping]] method for determining the confidence intervals of distribution features, where the feature isn't normally distributed.

Where parametric bootstrapping assumes a distribution and samples from the assumed distribution, non-parametric method samples from the given sample with replacement. In that way the non-parametric method can be seen as the parametric method, where the assumed distribution is the empirical probability density distribution of the given data.

````ad-example
title: Example: <br> One-sample confidence interval for $\mu$

In a study of women's cigarette consumption before and after giving birth was explored, and gave the following observations of the number of smoked cigarettes per day:
$$
\begin{array}{|c|ccc|}
\hline \text { before } & 8 & 24 & 7 & 20 & 6 & 20 & 13 & 15 & 11 & 22 & 15\\
\hline \text { after } & 5 & 11 & 0 & 15 & 0 & 20 & 15 & 19 & 12 & 0 & 6\\
\hline
\end{array}
$$

Determining the 95% confidence interval of $\mu$ is then:
```R
x1 <- c(8, 24, 7, 20, 6, 20, 13, 15, 11, 22, 15)
x2 <- c(5, 11, 0, 15, 0, 20, 15, 19, 12, 0, 6)
# Determining the differences
dif <- x1-x2

# Number of simulated samples
k <- 100000

# Simulate
simsamples <- replicate(k, sample(dif, replace=TRUE))

# Calculate the mean of each simulated sample
simmeans <- apply(simsamples, 2, mean)

# Quantiles of the differences gives the CI
quantile(simmeans, c(0.025,0.975))

	2.5% 97.5%
	1.364 9.727
```
````
^WomenCigaretteExample

This method is called the *percentile* method, and is the simple straightforward but also less accurate method.
In real studies methods such as *bootstrap-t*, *studentized bootstrap* and *Bias Corrected Accelerated* are used. Which uses more advanced sampling techniques.

# One-sample confidence interval
```ad-summary
title: Method 4.15 <br>  Confidence interval for any feature $\theta$ by nonparametric bootstrap
collapse: open

Assume we have actual observations $x_{1}, \ldots, x_{n}$ :
1. Simulate $k$ samples of size $n$ by randomly sampling among the available data (with replacement)
2. Calculate the statistic $\hat{\theta}$ in each of the $k$ samples $\hat{\theta}_{1}^{*}, \ldots, \hat{\theta}_{k}^{*}$
3. Find the $100(\alpha / 2) \%$ and $100(1-\alpha / 2) \%$ quantiles for these, $q_{100(\alpha / 2) \%}^{*}$ and $q_{100(1-\alpha / 2) \%}^{*}$ as the $100(1-\alpha) \%$ confidence interval:
$$\large\left[q_{100(\alpha / 2) \%}^{*},~ q_{100(1-\alpha / 2) \%}^{*}\right]$$

```

````ad-example
title: Example 4.16 <br> Median confidence interval
Continued from the previous example, the median 95% confidence interval can be determined as:
```R
k <- 100000
simsamples <- replicate(k, sample(dif, replace = TRUE))
simmedians <- apply(simsamples, 2, median)
quantile(simmedians, c(0.025,0.975))
	
	2.5% 97.5%
	-1 9
```
````

# Two-sample confidence intervals
```ad-summary
title: Method 4.17 <br> Two-sample confidence interval for $\theta_{1}- \theta_{2}$ by nonparametric bootstrap
collapse: open

Assume we have actual observations $x_{1}, \ldots, x_{n_{1}}$ and $y_{1}, \ldots, y_{n_{2}}$ :
1. Simulate $k$ sets of 2 samples of $n_{1}$ and $n_{2}$ observations from the respective groups (with replacement)
2. Calculate the difference between the features in each of the $k$ samples $\hat{\theta}_{x 1}^{*}-\hat{\theta}_{y 1}^{*}, \ldots, \hat{\theta}_{x k}^{*}-\hat{\theta}_{y k}^{*}$
3. Find the $100(\alpha / 2) \%$ and $100(1-\alpha / 2) \%$ quantiles for these, $q_{100(\alpha / 2) \%}^{*}$ and $q_{100(1-\alpha / 2) \%}^{*}$ as the $100(1-\alpha) \%$ confidence interval: 
$$\large\left[q_{100(\alpha / 2) \%}^{*},~ q_{100(1-\alpha / 2) \%}^{*}\right]$$

```

````ad-example
title: Example <br> Mean difference (Teeth growth)
collapse: open

In a study it was explored if children who recived milk from bottle instead of breast, had worse or better teeth health conditions. For 19 randomly selected children their age at their first incident of caries was recorded:
$$
\begin{array}{|c|ccc|}
\hline \text { bottle } &  \text{N} &  \text{Y} &  \text{Y} &  \text{N} &  \text{N} &  \text{N} &  \text{Y} &  \text{N} &  \text{N} &  \text{N} &  \text{Y} &  \text{Y} &  \text{N} &  \text{Y} &  \text{Y} &  \text{Y} &  \text{Y} &  \text{N} &  \text{Y}\\
\hline \text { age } & 9 & 14 & 15 & 10 & 12 & 6 & 19 & 10 & 8 & 6 & 12 & 13 & 20 & 13 & 16 & 14 & 9 & 12 & 12\\
\hline
\end{array}
$$

Determining the 95% CI for $\mu_1-\mu_2$ can be done as:
```R
# Reading in "no bottle" group
x <- c(9, 10, 12, 6, 10, 8, 6, 20, 12)
# Reading in "yes bottle" group
y <- c(14,15,19,12,13,13,16,14,9,12)

# Number of simulations
k <- 100000

# Simulate each sample k times
simxsamples <- replicate(k, sample(x, replace=TRUE))
simysamples <- replicate(k, sample(y, replace=TRUE))

# Calculate the sample mean differences
simmeandifs <- apply(simxsamples,2,mean) - apply(simysamples,2,mean)

# Quantiles of the differences gives the CI
quantile(simmeandifs, c(0.025,0.975))

	2.5% 97.5%
	-6.2222 -0.1444
```
And the 99% CI for the difference:
```R
simmediandifs <- apply(simxsamples,2,median)-apply(simysamples,2,median)
quantile(simmediandifs, c(0.005,0.995))

	0.5% 99.5%
	-8 0
```
````

# In R
## The `bootstrap` library
The `bootstrap` library provides a bootstrap function which uses the more advanced methods of non-parametric bootstrapping, but is a one-liner:
```R
library(bootstrap)

sim_x <- bootstrap(x, k, mean)$thetastar
quantile(sim_x, c(0.025,0.975))
```

## The `boot` library
The `boot` library is a little more complicated than `bootstrap`, but comes with more features which is why it's recommended over `bootstrap`. The complication is that the package requires the statistics are in a specific functional form.
The biggest pro of `boot` is that it allows us to work directly on data frames.

**Bias Corrected and Accelerated (bca) CI:** `type="bca"`

````ad-example
title: Example <br> Bootstrapping the mean by the `boot` lib
collapse: close

This continues on the study of [[#^WomenCigaretteExample|womens cigarette consumption example]].
```R
x1 <- c(8,24,7,20,6,20,13,15,11,22,15)
x2 <- c(5,11,0,15,0,20,15,19,12,0,6)
dif <- x1-x2
```

Our aim is to determine the 95%-CI for the mean difference.
The additional complexity is here that we cannot just use the `mean` function, but must define it as a function:
```R
# Define function for calculating the mean of the d indexes
samplemean <- function(x, d){ mean(x[d]) }
```
So the function takes a vector x, and the indicies which the mean should be calculated on.
With the function defined we can now use the `boot` package to determine the bootstrapped/simulated value:
```R
library(boot)

# Non-parametric bootstrap of the mean difference:
k <- 10000
meandifboot <- boot(dif, samplemean, k)
plot(meandifboot)
```
<span class="centerImg">![[bootstrapping-boot-lib-example.png]]</span>

And the CI:
```R
boot.ci(meandifboot, type="perc")

BOOTSTRAP CONFIDENCE INTERVAL CALCULATIONS
Based on 10000 bootstrap replicates

CALL :
boot.ci(boot.out = meandifboot, type = "perc")

Intervals :
Level Percentile
95% ( 1.364, 9.909 )
Calculations and Intervals on Original Scale
```

bca CI:
```R
# Bias Corrected Accelerated CI:
boot.ci(meandifboot, type="bca")

BOOTSTRAP CONFIDENCE INTERVAL CALCULATIONS
Based on 10000 bootstrap replicates

CALL :
boot.ci(boot.out = meandifboot, type = "bca")

Intervals :
Level BCa
95% ( 1.636, 10.455 )
Calculations and Intervals on Original Scale
```
````

````ad-example
title: Example <br> `boot` data frame
collapse: close

```R
# Define dataframe
x <- runif(100)
y <- x + 2*runif(100)
D <- data.frame(x, y)

# The correlation function on the right form:
mycor <- function(D, d) {
	E <- D[d,]
	return(cor(E$x, E$y))
}

# Doing the bootstrap on the data frame:
b <- boot(D, mycor, 10000)
boot.ci(b, type="bca")

BOOTSTRAP CONFIDENCE INTERVAL CALCULATIONS
Based on 10000 bootstrap replicates

CALL :
boot.ci(boot.out = b, type = "bca")

Intervals :
Level BCa
95% ( 0.2118, 0.5341 )
Calculations and Intervals on Original Scale
```
````
# References
- [[Introduction to Mathematical Statistics - 02403]]