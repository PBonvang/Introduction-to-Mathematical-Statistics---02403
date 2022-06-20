---
aliases: [Simple regression parameter uncertainty] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Simple Linear Regression]]
****

With the obtained parameter  estimates ($\hat\beta_0$ and $\hat\beta_1$), we'd like to determine the uncertainty of these parameters. In order to do so we need the probability distribution of the parameter estimators, which is usually assumed to follow a [[normal distribution]]
$$
Y_{i}=\beta_{0}+\beta_{1} x_{i}+\varepsilon_{i}, \quad \text { where } \varepsilon_{i} \overset{\text{i.i.d}}{\sim} \ndist\left(0, \sigma^{2}\right)
$$
The errors are in other words i.i.d normal [[Random variable|random variables]] with zero mean and variance $\sigma^{2}$.

$\hat\beta_0$ and $\hat\beta_1$ are central estimators for $\beta_{0}$ and $\beta_{1}$, as their expectations are $\beta_{0}$ and $\beta_{1}$.
$$\begin{align*}
\mathrm{E}\left[\hat{\beta}_{0}\right]&=\beta_{0}\\
\mathrm{E}\left[\hat{\beta}_{1}\right]&=\beta_{1}
\end{align*}$$
assuming $\varepsilon_{i}$ is a central estimator for 0 ($\mathrm{E}\left(\varepsilon_{i}\right)=0$).
```ad-info
title: Proof
collapse: close

To determine the expectations of the parameter estimators we define our estimators as functions of the true parameters:
$$
\hat{\beta}_{1}=\frac{\sum_{i=1}^{n}\left(Y_{i}-\bar{Y}\right)\left(x_{i}-\bar{x}\right)}{S_{x x}},
$$
inserting $Y_{i}=\beta_{0}+\beta_{1} x_{i}+\varepsilon_{i}$ and $\bar{Y}=\frac{1}{n} \sum_{i=1}^{n}\left(\beta_{0}+\beta_{1} x_{i}+\varepsilon_{i}\right)=\beta_{0}+\beta_{1} \bar{x}+\bar{\varepsilon}$ gives
$$
\hat{\beta}_{1}=\frac{\sum_{i=1}^{n}\left[\left(\beta_{0}+\beta_{1} x_{i}+\varepsilon_{i}-\left(\beta_{0}+\beta_{1} \bar{x}+\bar{\varepsilon}\right)\right]\left(x_{i}-\bar{x}\right)\right.}{S_{x x}},
$$
now the sum is divided into a part which depends on $\varepsilon_{i}$ (the random part) and a part which is independent of $\varepsilon_{i}$
$$
\begin{aligned}
\hat{\beta}_{1} &=\frac{\sum_{i=1}^{n} \beta_{1}\left(x_{i}-\bar{x}\right)^{2}}{S_{x x}}+\frac{\sum_{i=1}^{n}\left(\varepsilon_{i}-\bar{\varepsilon}\right)\left(x_{i}-\bar{x}\right)}{S_{x x}} \\
&=\beta_{1}+\frac{\sum_{i=1}^{n} \varepsilon_{i}\left(x_{i}-\bar{x}\right)}{S_{x x}}-\frac{\bar{\varepsilon} \sum_{i=1}^{n}\left(x_{i}-\bar{x}\right)}{S_{x x}},
\end{aligned}
$$
now observe that $\sum_{i=1}^{n}\left(x_{i}-\bar{x}\right)=0$ to get
$$
\hat{\beta}_{1}=\beta_{1}+\frac{\sum_{i=1}^{n} \varepsilon_{i}\left(x_{i}-\bar{x}\right)}{S_{x x}}
$$
for $\hat{\beta}_{0}$ we get
$$
\begin{aligned}
\hat{\beta}_{0} &=\bar{y}-\hat{\beta}_{1} \bar{x} \\
&=\frac{1}{n} \sum_{i=1}^{n}\left(\beta_{0}+\beta_{1} x_{i}+\varepsilon_{i}\right)-\left(\beta_{1}+\frac{\sum_{i=1}^{n} \varepsilon_{i}\left(x_{i}-\bar{x}\right)}{S_{x x}}\right) \bar{x} \\
&=\beta_{0}+\beta_{1} \bar{x}_{i}+\frac{1}{n} \sum_{i=1}^{n} \varepsilon_{i}-\left(\beta_{1}+\frac{\sum_{i=1}^{n} \varepsilon_{i}\left(x_{i}-\bar{x}\right)}{S_{x x}}\right) \bar{x} \\
&=\beta_{0}+\frac{1}{n} \sum_{i=1}^{n} \varepsilon_{i}-\left(\frac{\sum_{i=1}^{n} \varepsilon_{i}\left(x_{i}-\bar{x}\right)}{S_{x x}}\right) \bar{x}
\end{aligned}
$$

Since expectation is a linear operation and the expectation of $\varepsilon_{i}$ is zero we find that $\mathrm{E}\left[\hat{\beta}_{0}\right]=\beta_{0}$ and $\mathrm{E}\left[\hat{\beta}_{1}\right]=\beta_{1}$, and we say that $\hat{\beta}_{0}, \hat{\beta}_{1}$ are central estimators.
```
^central-estimator-proof

Secondly to determine the certainty we need to find the [[Simple linear regression estimator variance|estimator variances]].

With the estimator variances determined we can then determine the [[Simple Linear parameter hypothesis testing|distribution of the parameters and test them]].

And with those determine the confidence interval of the models predictions, as described in [[Simple Linear line intervals]].
# References
- [[Introduction to Mathematical Statistics - 02403]]