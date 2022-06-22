---
aliases: [Simpel Lineær Regression] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Mathematics]], [[Linear Regression]] [[Statistics]], [[Artificial intelligence]]
****
The simplest way to solve the linear regression problem besides the mean value, would be a linear model with one regressor:
$$f(x)=\beta_{0}+\beta_{1}x$$
When $f(x)$ is the result of an experiment, the model will not be perfect, and therefore has an error:
$$\large
Y_{i}=\beta_{0}+\beta_{1} x_{i}+\varepsilon_{i}, \quad i=\{1, \ldots, n\}, \quad \varepsilon_{i}\overset{\text{i.i.d}}{\sim} \ndist(0,\sigma^{2})
$$
$Y_{i}$ is called the *dependent variable*, and is a [[Random variable]].
$x_{i}$ is the *explanatory variable*, and  is concrete observations which *explains* the dependent variable.
The error $\varepsilon_i$ is an independent [[Random variable]] with [[Expectation]] = 0. For concrete observation the error is denoted: $e_i$, where as $\varepsilon_i$ can be interpreted as the true error.
The statistical interpretation of the linear model is therefore that it expresses the expected value
$$
\mathrm{E}\left(Y_{i}\right)=\beta_{0}+\beta_{1} x_{i}
$$
called the *model prediction*.
It's however very unusual to know $\beta_{0}$ and $\beta_{1}$, we therefore often rely on estimates based on concrete observations ($y_1,...,y_n$).
$$
\hat{y}_{i}=\hat{\beta}_{0}+\hat{\beta}_{1} x_{i}
$$
we therefore expect or predict $\hat{y}_{i}$ under the conditions of $x_i$.
When fitting a model (determining $\beta_0$ and $\beta_1$) we often have a dataset of the inputs ($x_1,...,x_n$) and expected outputs ($y_1,...,y_n$) of the model. The task is then to minimize the errors/residuals.
The most common way to do this is using [[Simple Residual Sum of Squares]].

See also:
- [[Linear model validation]]
- [[Matrix formulation of simple linear regression]]
- [[Sample correlation]]
- [[Multiple Linear Regression]]

# In R
```R
lm(formula, data)
```
# Examples
````ad-example
title: Example 5.5 <br> Simple linear regression
collapse: open

Given the following students height and weight:
$$
\begin{array}{l|rrrrrrrrrr}
\text { Heights }\left(x_{i}\right) & 168 & 161 & 167 & 179 & 184 & 166 & 198 & 187 & 191 & 179 \\
\text { Weights }\left(y_{i}\right) & 65.5 & 58.3 & 68.1 & 85.7 & 80.5 & 63.4 & 102.6 & 91.4 & 86.7 & 78.9
\end{array}
$$

we wish to determine the least squares regression line for these points, by calculating the leas squares estimates of $\hat{\beta}_{0}$ and $\hat{\beta}_{1}$.

Sample means:
$$
\begin{aligned}
&\bar{x}=\frac{1}{10}(168+161+\ldots+179)=178 \\
&\bar{y}=\frac{1}{10}(65.5+58.3+\ldots+78.9)=78.11
\end{aligned}
$$

Estimates:
$$
\hat{\beta}_{1}=\frac{1}{1342}((65.5-78.11)(168-179)+\ldots+(79.9-78.11)(179-178))=1.11
$$
$$
\hat{\beta}_{0}=78.11-1.11 \cdot 178=-120
$$

The mest model is thus:
$$f(x)=-120+1.11x$$

In R:
```R
D <- data.frame(x=x, y=y)
fitStudents <- lm(y ~ x, data=D)
summary(fitStudents)

Call:
lm(formula = y ~ x, data = D)

Residuals:
Min 1Q Median 3Q Max
-5.876 -1.451 -0.608 2.234 6.477

Coefficients:
			Estimate 	Std. Error	t value Pr(>|t|)
(Intercept) -119.958 	18.897 		-6.35 	0.00022 ***
x 			1.113 		0.106 		10.50 	0.0000059 ***
---
Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
Residual standard error: 3.88 on 8 degrees of freedom
Multiple R-squared: 0.932,Adjusted R-squared: 0.924
F-statistic: 110 on 1 and 8 DF, p-value: 0.00000587
```

(Intercept): $\hat\beta_0$
x: $\hat\beta_1$
````
^example5-5
# References
- [[Introduction to intelligent systems - 02461]]
- [[Introduction to Mathematical Statistics - 02403]]