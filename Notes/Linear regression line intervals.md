---
aliases: [Linear confidence interval, Linear prediction interval] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Multiple Linear Regression]]
****

In [[Linear Regression]] we are usually interested in predicting future outcomes, and are therefore interested in quantifying the uncertainty of these prediction.
Let's define the expected value of a new experiment as
$$
\hat{y}_{\text {new }}=\hat{\beta}_{0}+\hat{\beta}_{1} x_{1, \text { new }}+\ldots+\hat{\beta}_{p} x_{p, \text { new }}
$$
The variance of $\hat{y}_{\text {new}}$ is a function of:
1. [[Variance]] of the parameters
2. The pair wise [[Covariance]] of the parameters
3. $x_{\text{new}}=[1,x_{1,\text{new}},...,x_{p,\text{new}}]$

````ad-summary
title: Method 6.9 <br> Line intervals in R
collapse: open

The ($1-\alpha)$ confidence and prediction intervals for the line $\hat{\beta}_{0}+\hat{\beta}_{1} x_{1 \text {,new }}+\cdots+\hat{\beta}_{p} x_{p, \text { new }}$ are calculated in R by

```R
# Confidence interval
predict(fit, newdata=Xnew, interval="confidence", level=1-alpha)

# Prediction interval
predict(fit, newdata=Xnew, interval="prediction", level=1-alpha)
```
````
^method6-9

# [[Matrix formulation of linear regression|Matrix formulation]]
```ad-summary
title: Method <br> Line intervals, matrix formulation
collapse: open

The ($1- \alpha)$ **confidence interval** for the line $\hat{\beta}\dotprod x_{\text {new }}$ is
$$
\hat{\beta}\dotprod x_{\text {new }} \pm t_{1-\alpha / 2} \cdot\hat{\sigma}\cdot\sqrt{x_{\text {new }}\dotprod\left(\boldsymbol{X}^{T} \boldsymbol{X}\right)^{-1}\dotprod x_{\text {new }}^{\top}}
$$

and the $(1-\alpha)$ **prediction interval** is
$$
\hat\beta \pm t_{1-\alpha/2}\cdot\hat\sigma\cdot\sqrt{1+\boldsymbol{x}_{\text {new }}\left(\boldsymbol{X}^{T} \boldsymbol{X}\right)^{-1} \boldsymbol{x}_{\text {new }}^{T}}
$$
where $t_{1-\alpha / 2}$ is the $(1-\alpha / 2)$-quantile of the $t$-distribution with $n-2$ degrees of freedom.
```

To determine the line intervals for a new point
$$
x_{\text {new }}=\left[1, x_{1, \text { new }}, \ldots, x_{p, \text { new }}\right]
$$
we need to determine the variance of $\hat{Y}_{\text{new}}:$
$$\large
\begin{aligned}
\mathrm{V}\left(\hat{Y}_{\text {new }}\right) &=\mathrm{V}\left(\boldsymbol{x}_{\text {new }} \hat{\boldsymbol{\beta}}\right) \\
&=x_{\text {new }} \mathrm{V}(\hat{\boldsymbol{\beta}}) \boldsymbol{x}_{\text {new }}^{T} \\
&=\sigma^{2} \boldsymbol{x}_{\text {new }}\left(\boldsymbol{X}^{T} \boldsymbol{X}\right)^{-1} \boldsymbol{x}_{\text {new }}^{T}
\end{aligned}
$$
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
$\beta:[\beta_0,\beta_1,\cdots,\beta_p]$
$X:$ Existing observations

in practice we'll replace $\sigma^{2}$ with its estimate $\hat\sigma^{2}$ and use the appropriate [[t-distribution]] and standard errors $\hat\sigma$ to calculate the confidence intervals.

The variance of a single prediction is:
$$\large
\begin{aligned}
\mathrm{V}\left(Y_{\text {new }}\right) &=\mathrm{V}\left(\boldsymbol{x}_{\text {new }} \hat{\boldsymbol{\beta}}+\varepsilon_{\text {new }}\right) \\
&=\boldsymbol{x}_{\text {new }} \mathrm{V}(\hat{\boldsymbol{\beta}}) \boldsymbol{x}_{\text {new }}^{T}+\sigma^{2} \\
&=\sigma^{2}\left(1+\boldsymbol{x}_{\text {new }}\left(\boldsymbol{X}^{T} \boldsymbol{X}\right)^{-1} \boldsymbol{x}_{\text {new }}^{T}\right)
\end{aligned}
$$

The confidence intervals is therefore:
$$\begin{align*}
CI&=\hat\beta \pm t_{1-\alpha/2}\cdot\sqrt{\mathrm{V}\left(\hat\beta\right)}\\
&=\hat\beta \pm t_{1-\alpha/2}\cdot\mathrm{sd}\left(\hat\beta\right)\\
&=\hat\beta \pm t_{1-\alpha/2}\cdot\hat\sigma
\end{align*}$$
The prediction intervals:
$$\begin{align*}
PI&=\hat\beta \pm t_{1-\alpha/2}\cdot\sqrt{\mathrm{V}\left(\hat\beta\right)+\mathrm{V}\left(\hat{Y}_{\text {new }}\right)}\\
&=\hat\beta \pm t_{1-\alpha/2}\cdot\sqrt{\mathrm{sd}\left(\hat\beta\right)^{2}+\hat\sigma^{2}}\\
&=\hat\beta \pm t_{1-\alpha/2}\cdot\hat\sigma\cdot\sqrt{1+\boldsymbol{x}_{\text {new }}\left(\boldsymbol{X}^{T} \boldsymbol{X}\right)^{-1} \boldsymbol{x}_{\text {new }}^{T}}
\end{align*}$$

where $t_{1-\alpha/2}$ is the ($1-\alpha/2$) [[Quantiles and percentiles|Quantile]] of the [[t-distribution]] with $n-(p+1)$ degrees of freedom.

````ad-example
title: Example <br> Linear regression, matrix formulation line intervals (Exam June 2021, Q. 25)
collapse: open

The multiple linear regression problem can be written in matrix-vector notation as
$$
\boldsymbol{Y}=\boldsymbol{X} \boldsymbol{\beta}+\boldsymbol{\epsilon} ; \quad \boldsymbol{\epsilon} \sim N\left(\mathbf{0}, \sigma^{2} \boldsymbol{I}\right)
$$
where $\boldsymbol{\beta}=\left[\beta_{0}, \beta_{1}, \beta_{2}\right]^{T}$

Calculating the 95% prediction interval for a new observation at $x_{1}=x_{2}=0$:

```R
x <- matrix(c(1, 0, 0), ncol = 3)
x %*% beta + c(-1, 1) * sigma * qt(0.975, df = n - 3) *
    sqrt(1 + x %*% solve(t(X) %*% X) %*% t(x))
```

````

# In R

## Plotting
```R
xnew <- seq(0, 1, by = 0.01)

# Prediction interval
PI <- predict(fit,
    newdata = data.frame(x = xnew),
    interval = "pred"
)

# Confidence interval
CI <- predict(fit,
    newdata = data.frame(x = xnew),
    interval = "conf"
)

plot(x, y) # Actual data
lines(xnew, PI[, "fit"], col = "black") # Prediction line
lines(xnew, CI[, "lwr"], col = "green", lty = 2)
lines(xnew, CI[, "upr"], col = "green", lty = 2)
lines(xnew, PI[, "lwr"], col = "red", lty = 2)
lines(xnew, PI[, "upr"], col = "red", lty = 2)
legend("topleft", c("Prediction", "Confidence band", "Prediction band"),
    lty = c(1, 2, 2), col = c(1, 3, 2), cex = 0.7
)

```

# Examples
````ad-example
title: Example 6.8 <br> Confidence and prediction intervals
collapse: open

Continuing from [[Linear Parameter Estimation#^example6-3|Ex. 6.3]] we want to predict the expected value for the points: $(0.5,0.5)$ and $(1,1)$.
```R
# New data
Xnew <- data.frame(x1 = c(0.5, 1), x2 = c(0.5, 1))

# Prediction
pred <- predict(fit, newdata = Xnew, se = TRUE)
pred

$fit (Predicted value)
1 2
0.9157 1.9491

$se.fit (Std. error)
1 2
0.08477 0.21426

$df (Degrees of freedom)
[1] 17

$residual.scale (Estimate of the residual error standard deviation)
[1] 0.3784
```

And the confidence and prediction intervals for the two points is thus:
$$
\begin{aligned}
&C I_{1}=0.9157 \pm t_{1-\alpha / 2} \cdot 0.08477 \\
&C I_{2}=1.9491 \pm t_{1-\alpha / 2} \cdot 0.21426
\end{aligned}
$$
and the prediction intervals become (add the variance of $\hat{Y}_{\text {new }}$ $\hat{\sigma}^{2}$ (\$residual.scale))
$$
\begin{aligned}
&P I_{1}=0.9157 \pm t_{1-\alpha / 2} \cdot \sqrt{0.08477^{2}+0.3784^{2}}, \\
&P I_{2}=1.9491 \pm t_{1-\alpha / 2} \cdot \sqrt{0.21426^{2}+0.3784^{2}},
\end{aligned}
$$
where $t_{1-\alpha / 2}$ is obtained from a $t$-distribution with 17 degrees of freedom.

In R:
```R
# Confidence interval
predict(fit, newdata = Xnew, interval = "confidence", level = 0.95)
	fit 	lwr upr
1 0.9157 0.7369 1.095
2 1.9491 1.4971 2.401

# Prediction interval
predict(fit, newdata = Xnew, interval = "prediction", level = 0.95)
	fit 	lwr  upr
1 0.9157 0.09759 1.734
2 1.9491 1.03165 2.867
```
````
^example6-8
# References
- [[Introduction to Mathematical Statistics - 02403]]