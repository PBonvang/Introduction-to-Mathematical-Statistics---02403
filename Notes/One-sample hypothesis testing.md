---
aliases: [One-sample confidence interval] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Hypothesis testing]]
****

```ad-summary
title: Method 3.36 <br> The level $\boldsymbol\alpha$ one-sample t-test

1. Compute $t_{\text {obs }}$:
$$
t_{\mathrm{obs}}=\frac{\bar{x}-\mu_{0}}{s / \sqrt{n}}
$$
2. Compute the evidence against [[the null hypothesis]]
$$
H_{0}: \quad \mu=\mu_{0},
$$
vs. the alternative hypothesis
$$
H_{1}: \quad \mu \neq \mu_{0},
$$
by the
$$
p \text {-value }=2 \cdot \P\left(T>\left|t_{\mathrm{obs}}\right|\right),
$$
where the [[t-distribution]] with $n-1$ degrees of freedom is used
3. If the $p$-value $<\alpha$, we reject $H_{0}$, otherwise we accept $H_{0}$,
or
The rejection/acceptance conclusion can equivalently be based on the critical value(s) $\pm t_{1-\alpha / 2}$ :
if $\left|t_{\mathrm{obs}}\right|>t_{1-\alpha / 2}$ we reject $H_{0}$, otherwise we accept $H_{0}$
or
If the hypothesized mean isn't in the confidence interval, then we reject $H_0$, else accept it.

```

**Simulation:** For statistics which aren't functions of the mean bootstrapping can be used. See: [[Statistical bootstrapping]]


```ad-info
title: Definition 3.31 <br> The critical values
The $(1-\alpha) 100 \%$ critical values for the one-sample t-test are the $\alpha / 2$ - and $1-\alpha / 2$-quantiles of the $t$-distribution with $n-1$ degrees of freedom
$$
t_{\alpha / 2} \text { and } t_{1-\alpha / 2} \text {. }
$$

```
Determined using [[R programming language]]:
```R
qt(alpha/2, df=n-1) # t_{alpha/2}
qt(1-alpha/2, df=n-1) # t_{1-alpha/2}
```

```ad-summary
title: Method 3.32 <br> The one-sample hypothesis test by the critical value

A null hypothesis is rejected if the observed test-statistic is more extreme than the critical values
$$
\text { If }\left|t_{\mathrm{obs}}\right|>t_{1-\alpha / 2} \text { then reject, }
$$
otherwise accept.

```

```ad-tip
title: Theorem 3.33 <br> Confidence interval for $\mu$

We consider a $(1-\alpha) \cdot 100 \%$ confidence interval for $\mu$
$$\large
\bar{x} \pm t_{1-\alpha / 2} \cdot \frac{s}{\sqrt{n}}
$$
The confidence interval corresponds to the acceptance region for $H_{0}$ when testing the null hypothesis
$$
H_{0}: \quad \mu=\mu_{0}
$$

$\mu_{0}:$ Is the mean if the degree of effect is 0.
```
```ad-summary
title: Method 3.23 <br> The one-sample t-test statistic and the p-value

For a (quantitative) one sample situation, the $p$-value is given by
$$
p \text {-value }=2 \cdot P\left(T>\left|t_{\text {obs }}\right|\right),
$$
where $T$ follows a [[t-distribution]] with $(n-1)$ degrees of freedom. The observed value of the test statistics to be computed is
$$
t_{\mathrm{obs}}=\frac{\bar{x}-\mu_{0}}{s / \sqrt{n}},
$$
where $\mu_{0}$ is the value of $\mu$ under the null hypothesis
$$
H_{0}: \mu=\mu_{0}
$$
```

# Examples
````ad-example
title: Example: Sleeping medicine
In a study of two kinds of sleeping medicine A and B. 10 test persons tried both kinds and the following 10 **differences** between the two was measured in hours:

$$
\begin{array}{c|c}
\text { Person } & x=\text { Beffect - Aeffect } \\
\hline 1 & 1.2 \\
2 & 2.4 \\
3 & 1.3 \\
4 & 1.3 \\
5 & 0.9 \\
6 & 1.0 \\
7 & 1.8 \\
8 & 0.8 \\
9 & 4.6 \\
10 & 1.4
\end{array}
$$

For person 1, medicine B provided 1.2 hours more sleep than A, etc.
Now we doing the null-hypothesis test, testing if there's really a difference:

Our hypothesis is therefore: $H_{0}:\mu=0$
```R
# Sleep difference observations
x <- c(1.2, 2.4, 1.3, 1.3, 0.9, 1.0, 1.8, 0.8, 4.6, 1.4)
n <- length(x)

# Compute the tobs - the observed test statistic
tobs <- (mean(x) - 0) / (sd(x) / sqrt(n))
[1] 4.672

# Compute the p-value as a tail-probability in the t-distribution
pvalue <- 2 * (1-pt(abs(tobs), df=n-1))
pvalue
[1] 0.001166

# Or simply
t.test(x)

One Sample t-test
data: x
t = 4.7, df = 9, p-value = 0.001
alternative hypothesis: true mean is not equal to 0
95 percent confidence interval:
	0.8613 2.4787
sample estimates:
mean of x
	1.67
```

As the p-value$\approx 0.001$, it seems very unlikely that the null hypotheses is true, and we therefore reject it.
Additionally we get the difference confidence interval:
$$
[0.86,2.48]
$$
which says that $95\%$ of the time, the true difference between A and B will be within this interval.
````
# References
- [[Introduction to Mathematical Statistics - 02403]]