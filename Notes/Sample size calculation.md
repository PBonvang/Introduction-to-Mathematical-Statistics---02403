---
aliases: [Sample size determination] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]]
****

# Statistical power method
This method determines the sample size using the [[Statistical power]] of the study.
The approach uses the 4 elements:
- The significance level $\alpha$ of the test (in R: sig. level)
- A difference in the mean that you would want to detect, effect size (in R: delta)
- The standard deviation $\sigma$ (in R: sd)
- The wanted power $(1-\beta)$ (in R: power)

```ad-summary
title: Method 3.65 <br> The one-sample size formula
collapse: open

For the one-sample $t$-test for given $\alpha, \beta$ and $\sigma$
$$
n=\left(\sigma \frac{z_{1-\beta}+z_{1-\alpha / 2}}{\left(\mu_{0}-\mu_{1}\right)}\right)^{2}
$$
where $\mu_{0}-\mu_{1}$ is the difference in means that we would want to detect and $z_{1-\beta}, z_{1-\alpha / 2}$ are quantiles of the standard normal distribution.
```

However this method uses the assumption that the sample size is large enough to assume a [[normal distribution]] and is therefore just a good approximation. The R command doesn't which can result in a different but more precise result.

```R
power.t.test(power, delta, sd, sig.level, type="one.sample")
```

Note that the R command can be used to determine any of the other elements by simply defining the 4 others, e.g. determining the effect size possible to detect with a given sample size:
```R
power.t.test(n, power, sd, sig.level, type="one.sample")
```

In the practical planning of a study, multiple scenario-based values of the effect size $\delta$ and $\sigma$ are used to determine a reasonable size of the study.

````ad-example
title: Example: Student height

We wish to collect data for new study to test the hypothesis that the mean height is 180cm
$$H_{0}: \mu=180$$
We determine the 4 elements:
- Set the significance level $\alpha$ equal to $5 \%$
- Specify that we want to be able to detect a difference of $4 \mathrm{~cm}$
- We will use the standard deviation $12.21$ from a pilot study with 10 subjects as our guess for $\sigma$
- We want a power of $80 \%$

$$
n=\left(12.21 \cdot \frac{0.84+1.96}{4}\right)^{2}=73.05
$$

We should therefore include 74 students in the study.

In R:
```R
power.t.test(power=0.8, delta=4, sd=12.21, sig.level=0.05,
			type="one.sample")

One-sample t test power calculation
	n = 75.08
	delta = 4
	sd = 12.21
	sig.level = 0.05
	power = 0.8
	alternative = two.sided
```
````

## In a two sample setup
All the R commands can be used on a two sample setup, by simply removing the `type="one.sample"` argument from the above mentioned implementations.

# Expected behavior method
This method provides a naive sample size, which only gives an expected an "expected" behavior of the resulting experiment. For a more precise approach use the [[#Statistical power method]].
$$\large
n=\left(\frac{z_{1-\alpha / 2} \cdot \sigma}{M E}\right)^{2}
$$
$z_{1-\alpha / 2}:$ The normal distribution quantile for the wanted confidence interval. See [[Critical values]].
$ME:$ Margin of error, determines the error margin of the resulting confidence interval. Defined as half the size of the range of the confidence interval.
$\sigma:$ The expected/estimated variance of the distribution. Usually determined by a pilot study.

A way to calculate the required sample size $n$ is working back from the wanted precision. 
The wanted precision is determined by the margin of error $ME$ defined as the half width of the [[Confidence interval]]
$$
M E=t_{1-\alpha / 2} \frac{\sigma}{\sqrt{n}}
$$
$t_{1- \frac{\alpha}{2}}:$ The $(1- \frac{\alpha}{2})$ [[Quantiles and percentiles|quantile]] from the [[t-distribution]] with $n-1$ degrees of freedom.
However as $t_{1- \frac{\alpha}{2}}$ is determined by $n$ which is what we want to find. To get around this we replace it with the quantile from the normal distribution $z_{1- \frac{\alpha}{2}}$, assuming $n$ will be large enough ($n\ge30$) to make it practically the same value.

Additionally we also need $\sigma$ which is estimated, usually based on a pilot study or literature, or as an educated guess.

We can now isolate $n$ using the following method:
```ad-summary
title: Method 3.93 <br> The one-sample CI sample size formula
collapse: open

When $\sigma$ is known or guessed at some value, we can calculate the sample size $n$ needed to achieve a given margin of error, $M E$, with probability $1-\alpha$ as
$$
n=\left(\frac{z_{1-\alpha / 2} \cdot \sigma}{M E}\right)^{2}
$$

```

```ad-example
title: Example: Student heights

In a pilot study of 10 students we found the sample standard deviation to be $s=12.21$.
We now want to determine how many student we should include in a new study to have a margin of error of $ME=3cm$ with 95% confidence ($z_{0.975}=1.96$).
$$
n=\left(\frac{1.96 \cdot 12.21}{3}\right)^{2}=63.64
$$
We should therefore include 64 students in the new study.
```

# References
- [[Introduction to Mathematical Statistics - 02403]]