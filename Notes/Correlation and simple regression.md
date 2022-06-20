---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Correlation]], [[Simple Linear Regression]]
****
In [[linear regression]] models we seek to measure the amount of variation in the outcome $Y$ explained by the input $X$.  It's a measure of the linear relation between two [[Random variable|random variables]].
This is often done using the [[Coefficient of determination]] / $R^2$-value.

If the correlation is close to 1, we've explained most of the variance with our model, and if it's close to 0, we've explained very little of it.

The estimated correlation is defined as:
$$
\hat{\rho}=r=\sqrt{r^{2}} \operatorname{sgn}\left(\hat{\beta}_{1}\right)
$$
$\operatorname{sgn}\left(\hat{\beta}_{1}\right):$ The sign (fortegn) of $\hat{\beta}_{1}$.
So:
- Positive correlation for positive slope
- Negative for negative slope

# Inference (Hypothesis testing)
To answer the question: are $X$ and $Y$ correlated? 
We're interested in constructing a [[Hypothesis testing|hypothesis test]] of type:
$$
H_{0}: \rho=0, \quad H_{1}: \rho \neq 0
$$
Consider the simple linear model:
$$
Y_{i}=\beta_{0}+\beta_{1} X_{i}+\varepsilon_{i}, \quad \varepsilon_{i} \sim \ndist\left(0, \sigma^{2}\right)
$$
for this model the sample correlation can be rewritten as:
$$
\begin{aligned}
\hat{\rho} &=\frac{1}{n-1} \sum_{i=1}^{n}\left(\frac{x_{i}-\bar{x}}{s_{x}}\right)\left(\frac{y_{i}-\bar{y}}{s_{y}}\right) \\
&=\frac{S_{x x}}{n-1} \frac{1}{S_{x x}} \sum_{i=1}^{n}\left(\frac{x_{i}-\bar{x}}{s_{x}}\right)\left(\frac{y_{i}-\bar{y}}{s_{y}}\right) \\
&=\frac{S_{x x}}{n-1} \frac{1}{s_{x} s_{y}} \hat{\beta}_{1} \\
&=\frac{s_{x}}{s_{y}} \hat{\beta}_{1}
\end{aligned}
$$
which implies that the hypothesis can be tested by testing the hypothesis
$$
H_{0}: \beta_{1}=0 ; \quad H_{1}: \beta_{1} \neq 0
$$
Note that we cannot use the test to construct a confidence interval for $\rho$.
# References
- [[Introduction to Mathematical Statistics - 02403]]