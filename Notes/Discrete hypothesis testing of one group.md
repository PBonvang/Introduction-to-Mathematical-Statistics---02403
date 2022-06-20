---
aliases: [One-sample discrete hypothesis testing] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Discrete data]], [[Statistics]], [[Hypothesis testing]]
****

A common task in discrete statistics is to test if the probability of some outcome of a discrete [[Random variable]] is what we expect it to be.

````ad-tip
title: Theorem 7.10 <br>
collapse: open

When the sample size is large enough (generally when both $n p_{0}>15$ and $n\left(1-p_{0}\right)>15$), the random variable $Z$ follows approximately a standard normal distribution
$$
Z=\frac{X-n p_{0}}{\sqrt{n p_{0}\left(1-p_{0}\right)}} \sim N(0,1),
$$
when the null hypothesis is true. 

````
^theorem7-10

Which leads us to the discrete one-sample proportion hypothesis test:

```ad-summary
title: Method 7.11 <br> One sample proportion hypothesis test
collapse: open

1. Setup hypothesis and determine [[Statistical significance|Significance level]] $\alpha$
$$\begin{align*}
&H_{0}:p=p_0\\
&H_{1}:p\neq p_{0}
\end{align*}$$
2. Compute the test statistic
$$\large
z_{\mathrm{obs}}=\frac{x-n p_{0}}{\sqrt{n p_{0}\left(1-p_{0}\right)}}
$$
2. Compute evidence against the null hypothesis
$$
H_{0}: p=p_{0}
$$
vs. the the alternative hypothesis
$$
H_{1}: p \neq p_{0}
$$
by the
$$
p \text {-value }=2 \cdot P\left(Z>\left|z_{\mathrm{obs}}\right|\right) .
$$
where the standard normal distribution $Z \sim N\left(0,1^{2}\right)$ is used
3. If the $p$-value $<\alpha$ we reject $H_{0}$, otherwise we accept $H_{0}$,
Can also be determined using the critical value:
if $\left|z_{\text {obs }}\right|>z_{1-\alpha / 2}$ we reject $H_{0}$, otherwise we accept $H_{0}$

```
^method7-11

````ad-example
title: Example <br>
collapse: open

In a study 100 students were asked if they liked rock. 60 said they did, giving the estimated probability and proportion $\hat{p}=\frac{60}{100}=0.6$.

We wish to determine if the true proportion students who like rock is half. So our hypothesis is:
$$
\begin{aligned}
&H_{0}: p=0.5 \\
&H_{1}: p \neq 0.5
\end{aligned}
$$
and we set the significance level to $\alpha = 0.05$ (95%).

The test statistic:
$$z_\text{obs}=\frac{60-100\cdot0.5}{\sqrt{100\cdot0.5(1-0.5)}}=2$$

as $2>1.96$ (the critical value $z_{1-\alpha/2}$) we can reject this hypothesis, the true proportion is therefore very unlikely to be half of the students.
This could also have been shown by determining the [[p-value]]:
$$2\cdot\P(Z\ge2)=0.04550026$$
which is larger than the significance level and thus also rejects the hypothesis.
If we wanted to determine if the true proportion is more than 50% we would determine the p-value as :
$$\P(Z<2)=0.9772499$$
as the p-value is larger than the significance level we must accept the hypothesis that the true proportion is bigger than 50%.

In R:
```R
prop.test(x=60, n=100, p=0.5, correct = FALSE)

        1-sample proportions test without continuity correction

data:  60 out of 100, null probability 0.5
X-squared = 4, df = 1, p-value = 0.0455
alternative hypothesis: true p is not equal to 0.5
95 percent confidence interval:
 0.5020026 0.6905987
sample estimates:
  p
0.6
```
````
# References
- [[Introduction to Mathematical Statistics - 02403]]