---
aliases: [Explanation, R-square-value] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Simple Linear Regression]], [[Correlation and simple regression]]
****
````ad-info
title: Definition 5.25 <br> Coefficient of determination $R^2$

The coefficient of determination expresses the proportion of variation in the outcome $(Y)$ explained by the regression line/model
$$
r^{2}=1-\frac{\sum_{i}\left(y_{i}-\hat{y}_{i}\right)^{2}}{\sum_{i}\left(y_{i}-\bar{y}\right)^{2}}
$$
$\hat{y}_i:$ Group mean
$\bar{y}:$ General mean

```ad-info
title: Proof
collapse: close

Firstly the variance of the outcome $y$:
$$
\begin{aligned}
s_{y}^{2} &=\frac{1}{n-1} \sum_{i=1}^{n}\left(y_{i}-\bar{y}\right)^{2} \\
&=\frac{1}{n-1} \sum_{i=1}^{n}\left(\hat{\beta}_{0}+\hat{\beta}_{1} x_{i}+e_{i}-\frac{1}{n} \sum_{i=1}^{n}\left(\hat{\beta}_{0}+\hat{\beta}_{1} x_{i}+e_{i}\right)\right)^{2} \\
&=\frac{1}{n-1} \sum_{i=1}^{n}\left(\hat{\beta}_{1}\left(x_{i}-\bar{x}\right)+e_{i}\right)^{2} \\
&=\hat{\beta}_{1}^{2} s_{x}^{2}+\frac{n-2}{n-1} \hat{\sigma}^{2}
\end{aligned}
$$
Which gives us the variation explained by the regression line as:
$$
\begin{aligned}
\frac{\hat{\beta}_{1}^{2} s_{x}^{2}}{s_{y}^{2}} &=\left(\frac{\sum_{i=1}^{n}\left(y_{i}-\bar{y}\right)\left(x_{i}-\bar{x}\right)}{\sum_{i=1}^{n}\left(x_{i}-\bar{x}\right)^{2}}\right)^{2} \frac{\sum_{i=1}^{n}\left(x_{i}-\bar{x}\right)^{2}}{n-1} \frac{n-1}{\sum_{i=1}^{n}\left(y_{i}-\bar{y}\right)^{2}} \\
&=\left(\frac{1}{n-1} \sum_{i=1}^{n}\left(y_{i}-\bar{y}\right)\left(x_{i}-\bar{x}\right)\right)^{2} \frac{n-1}{\sum_{i=1}^{n}\left(x_{i}-\bar{x}\right)^{2}} \frac{n-1}{\sum_{i=1}^{n}\left(y_{i}-\bar{y}\right)^{2}} \\
&=\left(\frac{1}{n-1} \sum_{i=1}^{n}\left(\frac{x_{i}-\bar{x}}{s_{x}}\right)\left(\frac{y_{i}-\bar{y}}{s_{y}}\right)\right)^{2} \\
&=\hat{\rho}^{2}=r^2
\end{aligned}
$$
```
````
^def5-25

Is a quantifiable measure of the variation explained by the [[Linear Regression]] model.

# In R
```R
cor(x,y)^2
```
or
```R
fit <- lm(y~x)
coef(fit)[2]^2 * var(x) / var(y)
```
or can be found in the summary of the fitted values, as *Multiple R-squared*.
```R
D <- data.frame(x=x, y=y)
fit <- lm(y ~ x, data=D)
summary(fit)
```

# References
- [[Introduction to Mathematical Statistics - 02403]]