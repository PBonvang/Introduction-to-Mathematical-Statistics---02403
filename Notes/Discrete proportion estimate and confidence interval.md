---
aliases: [Andels estimat og konfidence interval, Categorical proportion estimate and confidence interval, Discrete probability estimate and confidence interval] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Discrete data]]
****

Discrete proportion refers to the proportion of a value or group of values in a single category. In other words the proportions of one or more outcomes of a single discrete [[Random variable]].
$$
\begin{array}{|l|c|c|}
\hline & \text { Category } \\
\hline \text {Value 1} & o_{1} \\
\vdots & \vdots\\
\text {Value r} & o_{r}  \\
\hline \text {Total} & n \\
\hline
\end{array}
$$

The proportion is equivalent with the [[probability]] in this case, and the observations ($o_1,...,o_r$) divided by the sample size $n$ is thus the [[Empirical probability distribution]].
$$\P(\text{Value i})=\frac{o_{i}}{n}, \quad i\in[1,~r]\in\R$$
However it's very unusual to know the true proportions in real life, we therefore often estimate it by the observed proportion/probability $\hat{p}$ of a sample.
E.g. In a study 100 students were asked if they liked rock. 60 said they did, giving the estimated probability and proportion $\hat{p}=\frac{60}{100}=0.6$.

We can think of this type of experiment as $n=100$ trials, which for each have a binary outcome (in the category or not), occurring with the unknown probability $p$. The [[Random variable]] $X$ counts the yes', hence $X$ follows a [[Binomial distribution]] $B(n,p)$ with the probability of observing $x$ successes given by:
$$
\P(X=x)=\left(\begin{array}{l}
n \\
x
\end{array}\right) p^{x}(1-p)^{n-x}
$$
With our estimate of $p$
$$
\hat{p}=\frac{x}{n}, \quad \hat{p} \in[0,1]
$$
and the knowledge that ([[Binomial distribution#Mean and variance|Binomial distributions]])
$$
\begin{aligned}
\mathrm{E}(X) &=n p \\
\mathrm{~V}(\mathrm{X}) &=n p(1-p)
\end{aligned}
$$
We find that
$$
\begin{aligned}
&\mathrm{E}(\hat{p})=\mathrm{E}\left(\frac{X}{n}\right)=\frac{n p}{n}=p \text {, }\\
&\mathrm{V}(\hat{p})=\mathrm{V}\left(\frac{X}{n}\right)=\frac{1}{n^{2}} \mathrm{~V}(X)=\frac{p(1-p)}{n}
\end{aligned}
$$
$\hat{p}$ is thus an unbiased [[Statistics Terminology|central estimator]] for $p$, and the standard error / [[Standard deviation#Sample standard deviation|sampling standard deviation]] of $\hat{p}$ is 
$$
\sigma_{\hat{p}}=\sqrt{\frac{p(1-p)}{n}}
$$
However it depends on the true probability/proportion $p$, which is therefore usually substituted with the estimate $\hat{p}$.


```ad-summary
title: Method 7.3 <br> Proportion estimate and confidence interval
collapse: open

The best estimate of the probability $p$ of belonging to a category (the population proportion) is the sample proportion
$$\large
\hat{p}=\frac{x}{n},
$$
where $x$ is the number of observations in the category and $n$ is the total number of observations.
A large sample $(1-\alpha) 100 \%$ confidence interval for $p$ is given as
$$
\hat{p} \pm \underbrace{z_{1-\alpha / 2} \sqrt{\frac{\hat{p}(1-\hat{p})}{n}}}_{\text{Margin of error }} .
$$
where $z_{1-\alpha / 2}$ is the $(1-\alpha/2)$ [[Quantiles and percentiles|Quantile]] of the [[Standard normal distribution]] (See [[Critical values]]).

As a **rule of thumb** the normal distribution is a good approximation for the binomial distribution if $np$ and $n(1-p)$ are both greater than $15$.
```
^method7-3

Continuing on the student rock example, the 95% confidence interval of our estimated probability can now be determined. First by determining the standard error:
$$\hat\sigma_{\hat{p}}=\sqrt{0.6(1-0.6)/100}\approx0.04899$$
And the [[#Critical value]]:
```R
qnorm(0.975)

[1] 1.959964
```
And now we can determine the 95% probability CI as:
$$
\hat{p} \pm 1.96 \cdot \hat{\sigma}_{\hat{p}}=0.6 \pm 1.96 \cdot 0.04899\approx[0.551, 0.649]
$$
# Small samples
In case the sample size is to small, either $n p \leq 15 \text { or } n(1-p) \leq 15$, we need to correct for it.
Methods:
- Continuity correction: Making the best approximation of discrete probabilities using a continuous distribution (in this case the normal distribution). 
	- In [[R programming language|R]]: `prop.test`.
		- This is by default on, unless otherwise specified (`correct = F`)
- Exact intervals: Probably the most well known way to obtain valid CIs for a proportion. This method uses the actual binomial probabilities instead of a normal approximation. This method works for any size of $n$ and $p$. 
	- In R: `binom.test`
- "Plus 2"-approach: Adding two to the number of observations in the category and 4 to the sample size, $\tilde{x}=x+2$ and $\tilde{n}=n+4$, then using the "normal" approach described in [[#^method7-3|Method 7.3]].

# In R
```R
prop.test(x, n, correct=FALSE, conf.level=0.95)
# or
binom.test # (Must be used for small samples)
```

# Critical value
## Common critical values
| % ($1-\alpha$) | Tail area ($\alpha/2$) | Crit. value ($z_{1-\alpha/2}$) |
| -------------- | ---------------------- | ------------------------------ |
| 50%            | 0.25                   | 0.67                           |
| 90%            | 0.05                   | 1.64                           |
| 95%            | 0.025                  | 1.96                           |
| 99%            | 0.005                  | 2.58                           |

## How to determine
The critical value can be determined as the quantile of the [[t-distribution]] with $n-1$ degrees of freedom and $1-\frac{\alpha}{2}$ being the percentile. In that sense $\alpha$ determines the error margin of the confidence interval.
Ex: t value for a 99% confidence interval with a sample size $n=10$
```R
n = 10
alpha = 0.01

qt(p=1-alpha/2, df=n-1)
> 3.249836
```

**For big sample sizes** ($n\ge30$) the [[t-distribution]] quantile and the [[Standard normal distribution]] quantile is almost the same, hence the standard normal distribution critical values are often used as they don't require determining the degrees of freedom.
```R
qnorm(1-alpha/2)
[1] 2.575829

n = 500
qt(0.995,df=n-1)

[1] 2.585718

```

# References
- [[Introduction to Mathematical Statistics - 02403]]