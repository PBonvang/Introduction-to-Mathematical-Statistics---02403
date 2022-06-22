---
aliases: [Linear Parameter confidence interval, Linear Parameter hypothesis testing] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Linear regression]], [[Multiple Linear Regression]]
****
As for [[Simple Linear Regression]], the optimal parameters for a multiple linear regression model is most commonly found by determining the parameters which minimize the [[Multiple Residual Sum of Squares|Residual Sum of Squares - RSS]].
Which is done by determining the partial derivatives of RSS, setting them equal to zero and solving for the variables.
$$
\frac{\partial R S S}{\partial \beta_{j}}=0 ; \quad j=0,1, \ldots, p
$$
This gives $p+1$ equations in $p+1$ unknowns (the parameters), called the normal equations:
$$
\begin{aligned}
2 \sum_{i=1}^{n}\left[y_{i}-\left(\hat{\beta}_{0}+\hat{\beta}_{1} x_{1, i}+\cdots+\hat{\beta}_{p} x_{p, i}\right)\right] &=0, \\
2 \sum_{i=1}^{n}\left[y_{i}-\left(\hat{\beta}_{0}+\hat{\beta}_{1} x_{1, i}+\cdots+\hat{\beta}_{p} x_{p, i}\right) x_{1, i}\right] &=0, \\
\vdots \\
2 \sum_{i=1}^{n}\left[y_{i}-\left(\hat{\beta}_{0}+\hat{\beta}_{1} x_{1, i}+\cdots+\hat{\beta}_{p} x_{p, i}\right) x_{p, i}\right] &=0,
\end{aligned}
$$
These equations make up a [[Linear system of equations]], which can is solved using [[Linear algebra]], see [[#Matrix formulation of multiple linear regression Matrix formulation|Matrix formulation]].

````ad-tip
title: Theorem 6.2 <br> Hypothesis tests and confidence interval
collapse: open

Suppose the we are given parameter estimates $\left(\hat{\beta}_{0}, \ldots, \hat{\beta}_{p}\right)$ and their corresponding standard errors $\left(\hat{\sigma}_{\beta_{0}}, \ldots, \hat{\sigma}_{\beta_{p}}\right)$, then under the null hypothesis
$$
H_{0, i}: \quad \beta_{i}=\beta_{0, i}
$$
the $t$-statistic
$$
T_{i}=\frac{\hat{\beta}_{i}-\beta_{0, i}}{\hat{\sigma}_{\beta_{i}}},
$$
will follow the $t$-distribution with $v=n-(p+1)$ degrees of freedom, and hypothesis testing and confidence intervals should be based on this distribution. Further, a central estimate for the residual variance is
$$
\hat{\sigma}^{2}=\frac{\operatorname{RSS}\left(\hat{\beta}_{0}, \ldots, \hat{\beta}_{p}\right)}{n-(p+1)} .
$$
````
^theorem6-2

Note that it's $p+1$ because there's actually $p+1$ parameters, because of $\beta_0$.

```ad-summary
title: Method 6.4 <br> Level $\alpha$ t-tests for parameters
collapse: open

1. Formulate the null hypothesis: $H_{0, i}: \beta_{i}=\beta_{0, i}$, and the alternative hypothesis $H_{1, i}: \beta_{i} \neq \beta_{0, i}$
2. Compute the test statistic 
$$\large\begin{align*}
t_{\mathrm{obs}, \beta_{i}}&=\frac{\hat{\beta}_{i}-\beta_{0, i}}{\hat{\sigma}_{\beta_{i}}}\\
&=\frac{\hat{\beta}_{i}-\beta_{0, i}}{\sqrt{\left(\hat{\boldsymbol{\Sigma}}_{\beta}\right)_{i i}}}
\end{align*}$$

3. Compute the evidence against the null hypothesis, where $T$ follows a [[t-distribution]] with $n-(p+1)$ degrees of freedom
$$\large
p \text {-value }_{i}=2\cdot \P\left(T>\left|t_{\mathrm{obs}, \beta_{i}}\right|\right)
$$

4. If the $p$-value${ }_{i}<\alpha$ reject $H_{0, i}$, otherwise accept $H_{0, i}$
```
^method6-4

```ad-summary
title: Method 6.5 <br> Parameter confidence intervals
collapse: open

The $(1-\alpha)$ confidence interval for $\beta_{i}$ is given by
$$\large
\hat{\beta}_{i} \pm t_{1-\alpha / 2}\cdot \hat{\sigma}_{\beta_{i}}
$$
$$\Updownarrow$$
$$
\hat{\beta}_{i} \pm t_{1-\alpha / 2}\cdot \sqrt{(\hat\Sigma_{\beta})_{ii}}
$$
where $t_{1-\alpha / 2}$ is the $(1-\alpha / 2)$-quantile of a $t$-distribution with $n-(p+1)$ degrees of freedom.
```
^method6-5

Determining the estimate $\hat\beta_{i}$ and it's standard error $\sigma_{\hat\beta_{i}}$ is done using the R as show in [[#^example6-3|Ex. 6.3]].

# [[Matrix formulation of linear regression|Matrix formulation]]

````ad-tip
title: Theorem 6.17 <br> Parameter estimation for [[Multiple Linear Regression]] models
collapse: open

The estimators of the parameters in the simple linear regression model are given by
$$\large
\hat{\boldsymbol{\beta}}=\left(\boldsymbol{X}^{T} \boldsymbol{X}\right)^{-1} \boldsymbol{X}^{T} \boldsymbol{Y}
$$
and the covariance matrix of the estimates is
$$\large
V[\hat{\boldsymbol{\beta}}]=\sigma^{2}\left(\boldsymbol{X}^{T} \boldsymbol{X}\right)^{-1}
$$
$$
\hat\Sigma_{\beta}=\hat\sigma^{2}\left(\boldsymbol{X}^{T} \boldsymbol{X}\right)^{-1}
$$
and central estimate for the residual variance is
$$\large
\hat{\sigma}^{2}=\frac{R S S}{n-(p+1)} \text {. }
$$

````
^theorem6-17
# In R
```R
fit <- lm(y ~ x1 + x2 + ..., data = D)

# Summary of fit (parameter estimates, standard error, p-values, etc.)
summary(fit)

Call:
lm(formula = y ~ x1 + x2 + ...)

Residuals:
Min 1Q Median 3Q Max
q0 q25 q50 q75 q100

Coefficients:
			Estimate Std. Error t value Pr(>|t|)
(Intercept) b0 		 s_b0	 	t_b0	pval_b0
x1 			b1 		 s_b1	 	t_b1	pval_b1 *
x2 			b2 		 s_b2	 	t_b2	pval_b2 ***
.
.
.
---
Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: {sigma} on {n-(p+1)} degrees of freedom
Multiple R-squared: {coefficient_of_determination}, Adjusted R-squared: {adjusted_coefficient_of_determination}
F-statistic: {f_dist_statistic} on {p} and {n-(p+1)} DF, p-value: {pval_for_H0}
```
# Examples
````ad-example
title: Example 6.3, 6.7 <br>
collapse: open

**Ex 6.3 - General analysis:**
Given the following data:
$$
\begin{array}{l|llllllllll}
x_{1} & 0.083 & 0.409 & 0.515 & 0.397 & 0.223 & 0.292 & 0.584 & 0.491 & 0.923 & 0.280 \\
x_{2} & 0.625 & 0.604 & 0.077 & 0.414 & 0.343 & 0.202 & 0.840 & 0.266 & 0.831 & 0.385 \\
y & 0.156 & 1.234 & 0.490 & 1.649 & 0.500 & 0.395 & 1.452 & 0.416 & 1.390 & 0.234 \\
& & & & & & & & & & \\
x_{1} & 0.772 & 0.857 & 0.758 & 0.850 & 0.409 & 0.055 & 0.578 & 0.745 & 0.886 & 0.031 \\
x_{2} & 0.821 & 0.308 & 0.440 & 0.865 & 0.111 & 0.970 & 0.192 & 0.939 & 0.149 & 0.318 \\
y & 1.574 & 0.349 & 1.287 & 1.709 & 0.323 & 1.201 & 1.210 & 1.787 & 0.591 & 0.110
\end{array}
$$

We assume the model
$$
Y_{i}=\beta_{0}+\beta_{1} x_{1, i}+\beta_{2} x_{2, i}+\varepsilon_{i}, \quad \varepsilon_{i} \sim \ndist\left(0, \sigma^{2}\right)
$$

```R
# Read data
x1 <- c(0.083, 0.409, 0.515, 0.397, 0.223, 0.292, 0.584, 0.491, 0.923,
0.280, 0.772, 0.857, 0.758, 0.850, 0.409, 0.055, 0.578, 0.745,
0.886, 0.031)
x2 <- c(0.625, 0.604, 0.077, 0.414, 0.343, 0.202, 0.840, 0.266, 0.831,
0.385, 0.821, 0.308, 0.440, 0.865, 0.111, 0.970, 0.192, 0.939,
0.149, 0.318)
y <- c(0.156, 1.234, 0.490, 1.649, 0.500, 0.395, 1.452, 0.416, 1.390,
0.234, 1.574, 0.349, 1.287, 1.709, 0.323, 1.201, 1.210, 1.787,
0.591, 0.110)

# Parameter estimation
fit <- lm(y ~ x1 + x2)

# Summary of fit (parameter estimates, standard error, p-values, etc.)
summary(fit)

Call:
lm(formula = y ~ x1 + x2)

Residuals:
Min 1Q Median 3Q Max
-0.6242 -0.2040 0.0280 0.0957 0.9251

Coefficients:
			Estimate Std. Error t value Pr(>|t|)
(Intercept) -0.118 0.212 -0.56 0.58571
x1 			0.827 0.304 2.72 0.01459 *
x2 			1.239 0.293 4.24 0.00056 ***
---
Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.378 on 17 degrees of freedom
Multiple R-squared: 0.632,Adjusted R-squared: 0.589
F-statistic: 14.6 on 2 and 17 DF, p-value: 0.000203
```

Here we see the estimate of each of the parameters $\left(\hat{\beta}_{0}, \hat{\beta}_{1}, \hat{\beta}_{2}\right)$, their standard errors $\left(\hat{\sigma}_{\beta_{0}}, \hat{\sigma}_{\beta_{1}}, \hat{\sigma}_{\beta_{2}}\right)
$, t-statistic for the standard hypothesis $H_{0, i}: \beta_{i}=0$ and the [[p-value]] for the two sided alternative.

We can therefore conclude that both $x_1$ and $x_2$ is significant on a 5% significance level.

**Ex 6.7 - Parameter confidence intervals:**
We wish to determine the 95% confidence intervals of the parameters.
First we find the $t_{1-\alpha/2}$ values
```R
qt(0.975, df = length(y) - (2 + 1))

[1] 2.11
```
The intervals can now be determined using the found estimates:
$$
\begin{aligned}
I_{\beta_{0}} &=-0.118 \pm 2.110 \cdot 0.212 \\
I_{\beta_{1}} &=0.827 \pm 2.110 \cdot 0.304 \\
I_{\beta_{2}} &=1.239 \pm 2.110 \cdot 0.293
\end{aligned}
$$

Or in R:
```R
confint(fit, level = 0.95)

			2.5 % 	97.5 %
(Intercept) -0.5643 0.329
x1 			0.1854 	1.470
x2 			0.6220 	1.857
```
````
^example6-3

# References
- [[Introduction to Mathematical Statistics - 02403]]