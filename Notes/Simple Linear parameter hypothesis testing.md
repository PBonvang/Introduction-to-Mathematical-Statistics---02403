---
aliases: [Simple Linear parameter confidence interval] # Searchable synonyms and translations
---

Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Simple Linear Regression]], [[Linear regression hypothesis testing]]
****

When fitting a simple [[Simple Linear Regression]] model, the estimated parameters/weights are rarely the true values.
We therefore wish to determine the uncertainty of the estimate and test the hypothesis that our estimate is really the true value.
$$\begin{align*}
H_{0, i}:& \quad \beta_{i}=\beta_{0, i}\\
H_{1, i}:& \quad \beta_{i}\neq\beta_{0, i}
\end{align*}$$
So how is this done?

```ad-tip
title: Theorem 5.12 <br> Test statistics
collapse: open

Under the null hypothesis $\left(\beta_{0}=\beta_{0,0}\right.$ and $\left.\beta_{1}=\beta_{0,1}\right)$ the statistics
$$
\begin{aligned}
&T_{\beta_{0}}=\frac{\hat{\beta}_{0}-\beta_{0,0}}{\hat{\sigma}_{\beta_{0}}}\\
&T_{\beta_{1}}=\frac{\hat{\beta}_{1}-\beta_{0,1}}{\hat{\sigma}_{\beta_{1}}}
\end{aligned}
$$
are [[t-distribution|t-distributed]] with $n-2$ degrees of freedom, and inference should be based on this distribution.

```
Where
$$\large
\begin{aligned}
&\hat{\sigma}_{\beta_{0}}=\sqrt{\frac{\hat{\partial}^{2}}{n}+\frac{\bar{x}^{2} \hat{\theta}^{2}}{S_{x x}}}=\hat{\sigma} \sqrt{\frac{1}{n}+\frac{\bar{x}^{2}}{\sum_{i=1}^{n}\left(x_{i}-\bar{x}\right)^{2}}} \\
&\hat{\sigma}_{\beta_{1}}=\sqrt{\frac{\hat{\sigma}^{2}}{S_{x x}}}=\hat{\sigma} \sqrt{\frac{1}{\sum_{i=1}^{n}\left(x_{i}-\bar{x}\right)^{2}}}
\end{aligned}\tag{1}
$$
^parameter-standarddeviation

As per [[Simple linear regression estimator variance#^theorem5-8|Theorem 5.8]].

Note that the central estimator of $\sigma^{2}$ follows a [[Chi-square distribution]] with $n-2$ degrees of freedom.

Now just as described in [[Hypothesis testing]], we can test hypothesis of the estimators.

```ad-summary
title: Method 5.14 <br> Level $\alpha~t$-tests for parameter
collapse: open

1. Formulate the null hypothesis: $H_{0, i}: \beta_{i}=\beta_{0, i}$, and the alternative hypothesis $H_{1, i}: \beta_{i} \neq \beta_{0, i}$
2. Compute the test statistics
$$\large t_{\mathrm{obs}, \beta_{i}}=\frac{\hat{\beta}_{i}-\beta_{0, i}}{\hat{\sigma}_{\beta_{i}}}$$
3. Compute the evidence against the null hypothesis
$$
p \text {-value }{ }_{i}=2 \cdot P\left(T>\left|t_{\mathrm{obs}, \beta_{i}}\right|\right)
$$
4. If $p$-value${}_{i}<\alpha$ reject $H_{0, i}$, otherwise accept $H_{0, i}$
```
Alternatively the correlation between the input and output variables can be used, see [[Correlation and simple regression]].

```ad-summary
title: Method 5.15 <br> Parameter confidence intervals
collapse: open

$(1-\alpha)$ confidence intervals for $\beta_{0}$ and $\beta_{1}$ are given by
$$
\begin{aligned}
&\hat{\beta}_{0} \pm t_{1-\alpha / 2} \cdot \hat{\sigma}_{\beta_{0}} \\
&\hat{\beta}_{1} \pm t_{1-\alpha / 2} \cdot \hat{\sigma}_{\beta_{1}}
\end{aligned}
$$
where $t_{1-\alpha / 2}$ is the $(1-\alpha / 2)$-quantile of a $t$-distribution with $n-2$ degrees of freedom. Where $\hat{\sigma}_{\beta_{0}}$ and $\hat{\sigma}_{\beta_{1}}$ are calculated as shown in [[#^parameter-standarddeviation|Eq. 1]]
```
^method5-15

# Examples
````ad-example
title: Example 5.13 <br>
collapse: open

Continuing from [[Simple RSS estimator variance#^example5-9|Example 5.9]] where the parameter estimates and variance estimates were found.
We want to test the hypotheses:
$$H_{00}: \beta_{0}=0 \quad\text{vs.}\quad H_{10}: \beta_{0} \neq 0$$
$$H_{01}: \beta_{1}=1 \quad\text{vs.}\quad H_{11}: \beta_{1} \neq 1$$
with a [[Statistical significance]] level of $\alpha=0.05$.

t-statistics:
$$
\begin{aligned}
&t_{\mathrm{obs}, \beta_{0}}=\frac{-119.96}{18.897}=-6.35 \\
&t_{\mathrm{obs}, \beta_{1}}=\frac{1.113-1}{0.1059}=1.07
\end{aligned}
$$

Critical value $t_{1- \alpha/2}$:
```R
qt(0.975,df=10-2)

[1] 2.306
```
As $\left|t_{\mathrm{obs}, \beta_{0}}\right|>t_{1-\alpha / 2}$ $H_{00}$ is rejected, and $H_{01}$ is accepted as $\left|t_{\mathrm{obs}, \beta_{1}}\right|\not>t_{1-\alpha / 2}$.

Alternatively we could've determined the p values:
```R
p.v0 <- 2 * (1 - pt(abs(-6.35), df=10-2))
p.v1 <- 2 * (1 - pt(abs(1.07), df=10-2))
c(p.v0,p.v1)

[1] 0.0002206 0.3158371
```
Which shows the same.
The t statistics and p-values is also shown in the `summary(lm(formula, data))`, but note that the default hypothesis is the 0 hypothesis.
````
^example5-13

````ad-example
title: Example 5.17 <br> Parameter CI example
collapse: open

Continuing [[#^example5-13|Example 5.13]] we find the the 95% CI for the parameters, using [[#^method5-15|Method 5.15]]:
$$
\begin{aligned}
&I_{\beta_{0}}=-119.96 \pm t_{0.975} \cdot 18.897=[-163.54,-76.38] \\
&I_{\beta_{1}}=1.113 \pm t_{0.975} \cdot 0.1059=[0.869,1.357]
\end{aligned}
$$
where the degrees of freedom for the [[t-distribution]] is 8, and we can say with high confidence (95%) that the intervals contain the true paramter values.

In R:
```R
confint(fitStudents, level=0.95)

			2.5 % 		97.5 %
(Intercept) -163.5348 	-76.381
x 			0.8684 		1.357

```
````
^example5-17
# References
- [[Simple linear regression estimator variance]]
- [[Hypothesis testing]]
- [[Introduction to Mathematical Statistics - 02403]]