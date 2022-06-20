---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Simple Linear Regression]], [[Matrix formulation of linear regression]]
****
$$\large
Y\sim\ndist(X\beta,\sigma^{2}I)
$$
$$\large\Updownarrow$$
$$\large
\boldsymbol{Y}=\boldsymbol{X} \boldsymbol{\beta}+\boldsymbol{\varepsilon}, \quad \boldsymbol{\varepsilon} \sim \ndist\left(\mathbf{0}, \sigma^{2} \boldsymbol{I}\right)
$$
$$\large\Updownarrow$$
$$
\left[\begin{array}{c}
Y_{1} \\
\vdots \\
Y_{n}
\end{array}\right]=\left[\begin{array}{cc}
1 & x_{1} \\
\vdots & \vdots \\
1 & x_{n}
\end{array}\right]\left[\begin{array}{l}
\beta_{0} \\
\beta_{1}
\end{array}\right]+\left[\begin{array}{c}
\varepsilon_{1} \\
\vdots \\
\varepsilon_{n}
\end{array}\right], \quad \varepsilon_{i} \sim \ndist\left(0, \sigma^{2}\right)
$$
One advantage of the matrix formulation is that the analysis generalize to higher dimensions easily.
The [[Simple Residual Sum of Squares]] is given by:
$$
R S S=\boldsymbol{\varepsilon}^{T} \boldsymbol{\varepsilon}=(\boldsymbol{Y}-\boldsymbol{X} \boldsymbol{\beta})^{T}(\boldsymbol{Y}-\boldsymbol{X} \boldsymbol{\beta})
$$
with the parameter estimators:
````ad-tip
title: Theorem 5.23 <br> Matrix parameter estimators
collapse: open

The estimators of the parameters in the simple linear regression model are given by
$$
\hat{\boldsymbol{\beta}}=\left(\boldsymbol{X}^{T} \boldsymbol{X}\right)^{-1} \boldsymbol{X}^{T} \boldsymbol{Y}
$$
with the covariance matrix of the estimates being
$$
\mathrm{V}[\hat{\boldsymbol{\beta}}]=\sigma^{2}\left(\boldsymbol{X}^{T} \boldsymbol{X}\right)^{-1}
$$
and the central estimate for the error variance is
$$
\hat{\sigma}^{2}=\frac{R S S}{n-2}
$$

```ad-info
title: Proof
collapse: close

To find the minimum of RSS, we differentiate RSS with respect to the parameters:

$$
\begin{aligned}
\frac{\partial R S S}{\partial \boldsymbol{\beta}} &=-2 \boldsymbol{X}^{T}(\boldsymbol{Y}-\boldsymbol{X} \boldsymbol{\beta}) \\
&=-2\left(\boldsymbol{X}^{T} \boldsymbol{Y}-\boldsymbol{X}^{T} \boldsymbol{X} \boldsymbol{\beta}\right)
\end{aligned}
$$
Solving for $\boldsymbol{\beta}$ gives
$$
\hat{\boldsymbol{\beta}}=\left(\boldsymbol{X}^{T} \boldsymbol{X}\right)^{-1} \boldsymbol{X}^{T} \boldsymbol{Y}
$$
taking the expectation of $\hat{\beta}$ we get
$$
\begin{aligned}
\mathrm{E}[\hat{\boldsymbol{\beta}}] &=\mathrm{E}\left[\left(\boldsymbol{X}^{T} \boldsymbol{X}\right)^{-1} \boldsymbol{X}^{T} \boldsymbol{Y}\right] \\
&=\left(\boldsymbol{X}^{T} \boldsymbol{X}\right)^{-1} \boldsymbol{X}^{T} \mathrm{E}[\boldsymbol{X} \boldsymbol{\beta}+\boldsymbol{\varepsilon}] \\
&=\left(\boldsymbol{X}^{T} \boldsymbol{X}\right)^{-1} \boldsymbol{X}^{T} \boldsymbol{X} \boldsymbol{\beta} \\
&=\boldsymbol{\beta}
\end{aligned}
$$
The variance of the parameters estimates are given by
$$
\begin{aligned}
\mathrm{V}[\hat{\boldsymbol{\beta}}] &=\mathrm{V}\left[\left(\boldsymbol{X}^{T} \boldsymbol{X}\right)^{-1} \boldsymbol{X}^{T} \boldsymbol{Y}\right] \\
&=\left(\boldsymbol{X}^{T} \boldsymbol{X}\right)^{-1} \boldsymbol{X}^{T} \mathrm{~V}[\boldsymbol{X} \boldsymbol{\beta}+\boldsymbol{\varepsilon}] \boldsymbol{X}\left(\boldsymbol{X}^{T} \boldsymbol{X}\right)^{-T} \\
&=\left(\boldsymbol{X}^{T} \boldsymbol{X}\right)^{-1} \boldsymbol{X}^{T}(\mathrm{~V}[\boldsymbol{X} \boldsymbol{\beta}]+\mathrm{V}[\boldsymbol{\varepsilon}]) \boldsymbol{X}\left(\boldsymbol{X}^{T} \boldsymbol{X}\right)^{-T} \\
&=\left(\boldsymbol{X}^{T} \boldsymbol{X}\right)^{-1} \boldsymbol{X}^{T} \sigma^{2} \boldsymbol{I} \boldsymbol{X}\left(\boldsymbol{X}^{T} \boldsymbol{X}\right)^{-T} \\
&=\sigma^{2}\left(\boldsymbol{X}^{T} \boldsymbol{X}\right)^{-1} \boldsymbol{X}^{T} \boldsymbol{X}\left(\boldsymbol{X}^{T} \boldsymbol{X}\right)^{-1} \\
&=\sigma^{2}\left(\boldsymbol{X}^{T} \boldsymbol{X}\right)^{-1}
\end{aligned}
$$
Again a central estimate for $\sigma^{2}$ is
$$
\hat{\sigma}^{2}=\frac{R S S(\hat{\boldsymbol{\beta}})}{n-2}
$$
```
````
^theorem5-23

Where $\hat\beta$ is the vector of parameters/weights and $\mathrm{V}(\hat\beta)$ a matrix:
$$\mathrm{V}(\hat\beta)=\begin{bmatrix}
\mathrm{V}(\hat\beta_{0}) & \mathrm{Cov}(\hat\beta_{0},\hat\beta_{1}) \\
\mathrm{Cov}(\hat\beta_{0},\hat\beta_{1}) &  \mathrm{V}(\hat\beta_{1}) 
\end{bmatrix}$$

An estimate of the parameter covariance matrix is then 
$$
\hat{\boldsymbol{\Sigma}}_{\beta}=\hat{\sigma}^{2}\left(\boldsymbol{X}^{T} \boldsymbol{X}\right)^{-1}
$$

Marginal tests $\left(H_{0}: \beta_{i}=\beta_{i, 0}\right)$ are constructed by observing that
$$
\frac{\hat{\beta}_{i}-\beta_{i, 0}}{\sqrt{\left(\hat{\boldsymbol{\Sigma}}_{\beta}\right)_{i i}}} \sim t(n-2) .
$$

````ad-example
title: Example 5.24 <br> Student height and weight
collapse: open

Given the following students height and weight:
$$
\begin{array}{l|rrrrrrrrrr}
\text { Heights }\left(x_{i}\right) & 168 & 161 & 167 & 179 & 184 & 166 & 198 & 187 & 191 & 179 \\
\text { Weights }\left(y_{i}\right) & 65.5 & 58.3 & 68.1 & 85.7 & 80.5 & 63.4 & 102.6 & 91.4 & 86.7 & 78.9
\end{array}
$$
The matrix formulation in R:
```R
# Data
x <- c(168, 161, 167, 179, 184, 166, 198, 187, 191, 179)
y <- c(65.5, 58.3, 68.1, 85.7, 80.5, 63.4, 102.6, 91.4, 86.7, 78.9)
X <- cbind(1, x)
n <- length(y)

# Parameter estimates and variance
beta <- solve(t(X) %*% X) %*% t(X) %*% y
e <- y - X %*% beta
s <- sqrt(sum(e^2) / (n - 2))
Vbeta <- s^2 * solve(t(X) %*% X)
sbeta <- sqrt(diag(Vbeta))
T.stat <- beta / sbeta
p.value <- 2 * (1 - pt(abs(T.stat), df = n-2))

# Print the results
coef.mat <- cbind(beta, sbeta, T.stat, p.value);
colnames(coef.mat) <- c("Estimates","Std.Error","t.value","p.value")
rownames(coef.mat) <- c("beta0", "beta1")
coef.mat; s

Estimates Std.Error t.value p.value
beta0 9.815 0.07773 126.3 0
beta1 3.039 0.01363 222.9 0
[1] 0.42

# Prediction and confidence interval
xnew <- matrix(c(1, 200), ncol=2)
ynew <- xnew %*% beta
Vconf <- xnew %*% Vbeta %*% t(xnew)
Vpred <- Vconf + s^2
sqrt(c(Vconf, Vpred))
[1] 2.740 2.772
```

\* `%*%` is for matrix multiplication.
````
^example5-24
# References
- [[Introduction to Mathematical Statistics - 02403]]