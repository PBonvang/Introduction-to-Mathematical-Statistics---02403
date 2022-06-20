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
- [[Introduction to Mathematical Statistics - 02403]]