---
aliases: [Simpel mindste kvadraters metode, Simple RSS] # Searchable synonyms and translations
---

Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]], [[Simple Linear Regression]]
****

<span class="centerImg">![[LinearRegressionRSSDiagram.png|400]]</span>
$$
\operatorname{RSS}\left(\beta_{0}, \beta_{1}\right)=\sum_{i=1}^{n} \varepsilon_{i}^{2}=\sum_{i=1}^{n}\left(Y_{i}-\left(\beta_{0}+\beta_{1} x_{i}\right)\right)^{2}
$$
For [[Simple Linear Regression]] the purpose of RSS is to estimate $\beta_{0}$ and $\beta_{1}$ $\rightarrow$ $\hat{\beta}_{0}$ and $\hat{\beta}_{1}$.
````ad-tip
title: Theorem 5.4 <br> Least squares estimators
collapse: open

The least squares estimators of $\beta_{0}$ and $\beta_{1}$ are given by
$$
\begin{aligned}
&\hat{\beta}_{1}=\frac{\sum_{i=1}^{n}\left(Y_{i}-\bar{Y}\right)\left(x_{i}-\bar{x}\right)}{S_{x x}} \\
&\hat{\beta}_{0}=\bar{Y}-\hat{\beta}_{1} \bar{x}
\end{aligned}
$$
where $S_{x x}=\sum_{i=1}^{n}\left(x_{i}-\bar{x}\right)^{2}$.


```ad-info
title: Proof
collapse: close

In order to find the minimum of the function RSS we differentiate the residual sum of squares with respect to the parameters
$$
\frac{\partial R S S}{\partial \hat{\beta}_{0}}=-2 \sum_{i=1}^{n}\left(y_{i}-\left(\hat{\beta}_{0}+\hat{\beta}_{1} x_{i}\right)\right)
$$
now equating with zero we get
$$
\begin{aligned}
0 &=-2 \sum_{i=1}^{n}\left(y_{i}-\left(\hat{\beta}_{0}+\hat{\beta}_{1} x_{i}\right)\right) \\
&=-2 n \bar{y}+2 n \hat{\beta}_{0}+2 n \hat{\beta}_{1} \bar{x}
\end{aligned}
$$
solving for $\hat{\beta}_{0}$ gives
$$
\hat{\beta}_{0}=\bar{y}-\hat{\beta}_{1} \bar{x}
$$
and by similar calculations we get
$$
\begin{aligned}
\frac{\partial R S S}{\partial \hat{\beta}_{1}} &=\frac{\partial}{\partial \hat{\beta}_{1}}\left(\sum_{i=1}^{n}\left(y_{i}-\left(\bar{y}-\hat{\beta}_{1} \bar{x}+\hat{\beta}_{1} x_{i}\right)\right)^{2}\right) \\
&=\frac{\partial}{\partial \hat{\beta}_{1}}\left(\sum_{i=1}^{n}\left(\left(y_{i}-\bar{y}\right)-\hat{\beta}_{1}\left(x_{i}-\bar{x}\right)\right)^{2}\right) \\
&=-2 \sum_{i=1}^{n}\left(\left(y_{i}-\bar{y}\right)-\hat{\beta}_{1}\left(x_{i}-\bar{x}\right)\right)\left(x_{i}-\bar{x}\right) \\
&=-2\left[\sum_{i=1}^{x}\left(y_{i}-\bar{y}\right)\left(x_{i}-\bar{x}\right)-\hat{\beta}_{1} \sum_{i=1}^{x}\left(x_{i}-\bar{x}\right)^{2}\right]
\end{aligned}
$$
equating with zero and solving for $\hat{\beta}_{1}$ gives
$$
\begin{aligned}
\hat{\beta}_{1} &=\frac{\sum_{i=1}^{n}\left(y_{i}-\bar{y}\right)\left(x_{i}-\bar{x}\right)}{\sum_{i=1}^{n}\left(x_{i}-\bar{x}\right)^{2}} \\
&=\frac{\sum_{i=1}^{n}\left(y_{i}-\bar{y}\right)\left(x_{i}-\bar{x}\right)}{S_{x x}}
\end{aligned}
$$
The estimates $\hat{\beta}_{0}$ and $\hat{\beta}_{1}$ are called least squares estimates, because they minimize the sum of squared residuals (i.e. RSS). Replacing $y_{i}$ with $Y_{i}$ give the estimators in the theorem.
```
````
^Theorem5-4

As the estimators ($\hat{\beta}_{0}$ and $\hat{\beta}_{1}$) are functions of [[Random variable|random variables]] $(Y_{i},\bar{Y})$ they are random variables.

The concrete residuals can be calculated by:
$$e_{i}=y_{i}-\hat{y}_{i}$$
As it's the error between the prediction and the actual.

# Expectation
$$\mathrm{E}[RSS]=(n-2)\sigma^{2}$$
As per [[Simple linear regression estimator variance#^theorem5-8|Theorem 5.8]]

# References
- [[Introduction to Mathematical Statistics - 02403]]