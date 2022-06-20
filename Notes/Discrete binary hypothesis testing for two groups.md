---
aliases: [Two-sample binary hypothesis testing] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]], [[Discrete data]], [[Hypothesis testing]]
****
Binary refers to the fact that there's two categories, generally referred to as: *success* and *failure*.
For [[Discrete data|Categorical variables]] we often want to compare the binary proportions in two populations/groups $X$ and $Y$.
If $p_1$ denote the proportion in group $X$ and $p_2$ the proportion in group $Y$, we can compare the groups by looking at the difference in proportions, estimated by $\hat{p}_1-\hat{p}_2$.
As the possible outcomes are binary, the [[Random variable|Random variables]] $X$ and $Y$ are [[Binomial distribution|binomially distributed]]
$$\begin{align*}
X&\sim B(n_{1},p_{1})\\
Y&\sim B(n_{2},p_{2})
\end{align*}$$

````ad-example
title: Example 7.14 <br>
collapse: close

A study of the relation between intake of birth control pills and the risk of blood clot in the heart was investigated. The following data were collected:

$$
\begin{array}{|l|c|c|}
\hline & \text { Contraceptive pill } & \text { No pill } \\
\hline \text { Blood clot } & 23 & 35 \\
\text { No blood clot } & 34 & 132 \\
\hline \text { Total } & 57 & 167 \\
\hline
\end{array}
$$

The outcome is binary and there's two groups (pill, no pill).
The estimates:


$$
\begin{gathered}
\hat{p}_{1}=\frac{\text { "Number of blood clots in the pill group" }}{\text { "Number of women in the pill group" }}=\frac{23}{57}=0.4035 \\
\hat{p}_{2}=\frac{\text { "Number of blood clots in the no pill group" }}{\text { "Number of women in the no pill group" }}=\frac{35}{167}=0.2096 
\end{gathered}
$$
The difference:
$$
\hat{p}_{1}-\hat{p}_{2}=0.4035-0.2096=0.1939
$$

The observed probability of getting a blood clot was 0.1939 higher in the pill group, compared to the no pill group.
````
^example7-14

Now determining the certainty of this difference:

```ad-summary
title: Method 7.15 <br> Two sample proportions confidence interval
collapse: open

An estimate of the standard error of the estimator $\hat{p}_{1}-\hat{p}_{2}$ is
$$\large\begin{align*}
\hat{\sigma}_{\hat{p}_{1}-\hat{p}_{2}}&=\sqrt{\frac{\hat{p}_{1}\left(1-\hat{p}_{1}\right)}{n_{1}}+\frac{\hat{p}_{2}\left(1-\hat{p}_{2}\right)}{n_{2}}}
\\
&=\sqrt{\hat{\sigma}_{\hat{p}_{1}}^{2}+\hat{\sigma}_{\hat{p}_{2}}^{2}}\\
&=\sqrt{\mathrm{V}\left(\hat{p}_{1}-\hat{p}_{2}\right)}
\end{align*}$$
The $(1-\alpha) 100 \%$ confidence interval for the difference $p_{1}-p_{2}$ is
$$\large
\left(\hat{p}_{1}-\hat{p}_{2}\right) \pm z_{1-\alpha / 2} \cdot \hat{\sigma}_{\hat{p}_{1}-\hat{p}_{2}}
$$
This confidence interval requires independent random samples for the two groups and large enough sample sizes $n_{1}$ and $n_{2}$. A rule of thumb is that $n_{i} p_{i} \geq 10$ and $n_{i}\left(1-p_{i}\right) \geq 10$ for $i=1,2$.

```
^method7-15

````ad-example
title: Example 7-17 <br>
collapse: close

Continuing from [[#^example7-14|Ex. 7.14]], we wish to determine the 99% CI.
First we determine the estimated standard error:

$$\large
\hat{\sigma}_{\hat{p}_{1}-\hat{p}_{2}}=\sqrt{\frac{0.4035(1-0.4035)}{57}+\frac{0.2096(1-0.2096)}{167}}=0.0722
$$

The 99% CI for the difference is then:
$$\large
\left(\hat{p}_{1}-\hat{p}_{2}\right) \pm z_{0.995} \cdot \hat{\sigma}_{\hat{p}_{1}-\hat{p}_{2}}=0.1939 \pm 2.5758 \cdot 0.0722=[0.0079,0.3799] .
$$
thus our best estimate of the difference is 0.19, and with very high confidence can we say that the true difference is between 0.008 and 0.38. As 0 isn't included it's highly likely that the pills increases the risk of blood clots.
````
^example7-17

```ad-summary
title: Method 7.18 <br> Two sample proportions hypothesis test
collapse: open



The two-sample hypothesis test for comparing two proportions is given by the following procedure:
1. Compute, with $\hat{p}=\frac{x_{1}+x_{2}}{n_{1}+n_{2}}$, the test statistic
$$\large
z_{\mathrm{obs}}=\frac{\hat{p}_{1}-\hat{p}_{2}}{\sqrt{\hat{p}(1-\hat{p})\left(\frac{1}{n_{1}}+\frac{1}{n_{2}}\right)}}
$$
2. Compute evidence against the null hypothesis
$$
H_{0}: p_{1}=p_{2}
$$
vs. the the alternative hypothesis
$$
H_{1}: p_{1} \neq p_{2}
$$
by the
$$
p \text {-value }=2 \cdot P\left(Z>\left|z_{\text {obs }}\right|\right)
$$
where the standard normal distribution $Z \sim N\left(0,1^{2}\right)$ is used
3. If the $p$-value $<\alpha$ we reject $H_{0}$, otherwise we accept $H_{0}$, 
or
if $\left|z_{\text {obs }}\right|>z_{1-\alpha / 2}$ we reject $H_{0}$, otherwise we accept $H_{0}$

```
^method7-18

````ad-example
title: Example 7.19 <br>
collapse: close

[[#^example7-17|Ex 7.17]] continued.
Like in the previous example we can determine if there's a real difference between two proportions by using [[#^method7-18|Method 7.18]] to test the hypothesis:
$$
\begin{aligned}
&H_{0}: p_{1}=p_{2} \\
&H_{1}: p_{1} \neq p_{2}
\end{aligned}
$$
Pooled estimate of the probability of blood clot under $H_0$:
$$
\hat{p}=\frac{23+35}{57+167}=0.259
$$
Test statistic:
$$
z_{\mathrm{obs}}=\frac{\hat{p}_{1}-\hat{p}_{2}}{\sqrt{\hat{p}(1-\hat{p})\left(\frac{1}{n_{1}}+\frac{1}{n_{2}}\right)}}=\frac{0.194}{\sqrt{0.259(1-0.259)\left(\frac{1}{57}+\frac{1}{167}\right)}}=2.89
$$
We can already see that $z_\text{obs}$ is bigger than the critical value $z_{0.995}$, and we can therefore reject the hypothesis at a significance level of $\alpha=0.01$

Alternatively in R:
```R
prop.test(x=c(23,35), n=c(57,167), correct=FALSE, conf.level=0.99)

        2-sample test for equality of proportions without continuity correction

data:  c(23, 35) out of c(57, 167)
X-squared = 8.3288, df = 1, p-value = 0.003902
alternative hypothesis: two.sided
99 percent confidence interval:
 0.007922055 0.379933812
sample estimates:
   prop 1    prop 2
0.4035088 0.2095808
```

````
^example7-19

# References
- [[Discrete proportion estimate and confidence interval]]
- [[Introduction to Mathematical Statistics - 02403]]