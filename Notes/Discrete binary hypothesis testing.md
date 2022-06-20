---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]], [[Discrete data]], [[Discrete hypothesis testing]]
****

With [[Discrete data]] we often wish to compare proportions from groups, against proportions in other groups.
We can think of it as several [[Binomial distribution|Binomial distributions]] which share the same parameter $p$.
$$
\begin{array}{c|c|c|c|c|c} 
& \text { Group 1 } & \text { Group 2 } & \ldots & \text { Group } c & \text { Total } \\
\hline \text { Success } & x_{1} & x_{2} & \ldots & x_{c} & x \\
\text { Failure } & n_{1}-x_{1} & n_{2}-x_{2} & \ldots & n_{c}-x_{c} & n-x \\
\hline \text { Total } & n_{1} & n_{2} & \ldots & n_{c} & n
\end{array}
$$

We're often interested in testing the null hypothesis:
$$
H_{0}: p_{1}=p_{2}=\ldots=p_{c}=p
$$
against the alternative: that at least one probability is different from the others.
Under $H_{0}$ the best estimator for the common probability $p$ is the overall observed proportion:
$$
\hat{p}=\frac{x}{n}
$$

To test the null hypothesis, we need to measure the likelihood of obtaining the observed data or data more extreme than the observed data, under the null hypothesis.
To do so we calculate the expected number of successes in the c groups as:
$$
e_{1 j}=n_{j} \cdot \hat{p}=n_{j} \cdot \frac{x}{n}
$$
and the expected number of failures as:
$$
e_{2 j}=n_{j} \cdot(1-\hat{p})=n_{j} \cdot \frac{(n-x)}{n}
$$
in general:
$$
e_{i j}=\frac{\left(i^{\prime} \text { th row total }\right) \cdot\left(j^{\prime} \text { th column total }\right)}{(\text {Grand total})}
$$


```ad-summary
title: Method 7.20 <br> The multi-sample proportions $\chi^2$-test
collapse: open

The hypothesis
$$
H_{0}: p_{1}=p_{2}=\ldots=p_{c}=p,
$$
can be tested using the test statistic
$$\large
\chi_{\mathrm{obs}}^{2}=\sum_{i=1}^{2} \sum_{j=1}^{c} \frac{\left(o_{i j}-e_{i j}\right)^{2}}{e_{i j}},
$$
where $o_{i j}$ is the observed number in cell $(i, j)$ and $e_{i j}$ is the expected number in cell $(i, j)$.

The test statistic $\chi_{\text {obs }}^{2}$ should be compared with the $\chi^{2}$-distribution with $c-1$ degrees of freedom.

The $\chi^{2}$-distribution is approximately the sampling distribution of the statistics under the null hypothesis.
The rule of thumb is that it is valid when all $e_{i j} \geq 5$.

\* o for observation
\* e for expectation
```
^method7-20

# Index
- [[Discrete binary hypothesis testing for two groups]]

# Examples
````ad-example
title: Example 7.21 <br>
collapse: open

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

$x=58$ and $n=224$.
For each cell we calculate the expected number if $H_{0}$ is true, ex the pill and blood clot cell:
$$
e_{1,1}=\frac{58 \cdot 57}{224}=14.76
$$

Which gives the following:
$$
\begin{array}{|l|c|c|c|}
\hline & \text { Birth control pill } & \text { No birth control pill } & \text { Total } \\
\hline \text { Blood clot } & o_{11}=23 & o_{12}=35 & x=58 \\
& e_{11}=14.76 & e_{12}=43.24 & \\
\hline \text { No blood clot } & o_{21}=34 & o_{22}=132 & (n-x)=166 \\
& e_{21}=42.24 & o_{22}=123.8 & \\
\hline \text { Total } & n_{1}=57 & n_{2}=167 & n=224 \\
\hline
\end{array}
$$

The $\chi^2$ test statistic:
$$
\chi_{\text {obs }}^{2}=\frac{(23-14.76)^{2}}{14.76}+\frac{(35-43.24)^{2}}{43.24}+\frac{(34-42.24)^{2}}{42.24}+\frac{(132-123.8)^{2}}{123.8}=8.33 .
$$

Then the p-value, calculated by how likely iy is to get 8.33 or more extreme if $H_0$ is true, using the [[Chi-square distribution]] with $c-1=2-1=1$ degrees of freedom:
$$
p \text {-value }=P\left(\chi^{2} \geq 8.33\right)=0.0039
$$

With a significance level of $\alpha=0.05$ (95%) we can say that it's highly unlikely that the hypothesis is true. Meaning it's highly unlikely that the pills doesn't increase the risk of blood clots.

In R:
```R
pill.study <- matrix(c(23, 35, 34, 132), ncol = 2, byrow = TRUE)
rownames(pill.study) <- c("Blood Clot", "No Clot")
colnames(pill.study) <- c("Pill", "No pill")
pill.study

           Pill No pill
Blood Clot   23      35
No Clot      34     132

chisq.test(pill.study, correct = FALSE)

        Pearson's Chi-squared test

data:  pill.study
X-squared = 8.3288, df = 1, p-value = 0.003902

chi <- chisq.test(pill.study, correct = FALSE)
chi$expected

               Pill   No pill
Blood Clot 14.75893  43.24107
No Clot    42.24107 123.75893
```
````
^example7-21
# References
- [[Chi-square distribution]]
- [[Introduction to Mathematical Statistics - 02403]]