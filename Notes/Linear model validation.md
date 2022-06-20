---
aliases: [Residual analysis] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Linear Regression]]
****

In [[Linear regression hypothesis testing]] we assume that the residuals are [[normal distribution|normally distributed]] with zero mean and constant variance, and that the residuals were mutually independent. However these assumptions needs to be check, which is what model validation/residual analysis is. It uses the same validation idea as described in [[Variable normality]] just with some extra steps.

Assumptions:
- Normality: check by a normal [[QQ plot]] of the **residuals**.
- Residual independence:  checked by plotting the residuals as a function of the fitted values, and verifying that no systematic behaviour exist, meaning the range and mean should be constant similar.
	- Other ways to check independence:
		- Plot $\varepsilon_{i}$ as a function of $\varepsilon_{i-1}$, which should have no systematic behaviour.
		- Determine the [[correlation]]: $\op{Cor}(\varepsilon_{i},\varepsilon_{i-1})$, which should be close to 0.
		- Plot the residuals as a function of time, if it makes sense, which should have no systematic behaviour.

In R the residual independence as a function of the previous residual can be plotted by:
```R
plot(e[-1],e[-n])
```

```ad-summary
title: Method 5.28 <br> Model validation/Residual analysis
collapse: open

1. Check the normality assumption with a q-q plot of the residuals
2. Check the systematic behaviour by plotting the residuals $e_{i}$ as a function of fitted values $\hat{y}_{i}$
	- Alternatively

```
^method5-28

````ad-example
title: Example 5.27 <br> [[Simple Linear Regression]]
collapse: open

We consider data generated from the following three models
$$\large
\begin{aligned}
&Y_{1, i}=\beta_{0}+\beta_{1} x_{1, i}+\varepsilon_{i}, \quad \varepsilon_{i} \sim \ndist(0,1) \\
&Y_{2, i}=\beta_{0}+\beta_{1} x_{1, i}+\beta_{2} x_{2, i}+\varepsilon_{i}, \quad \varepsilon_{i} \sim \ndist(0,1) \\
&Y_{3, i}=e^{\beta_{0}+\beta_{1} x_{1, i}+\varepsilon_{i}}, \quad \varepsilon_{i} \sim \ndist(0,1)
\end{aligned}
$$
In all cases we fit the model
$$
Y_{i}=\beta_{0}+\beta_{1} x_{1, i}+\varepsilon_{i}, \quad \varepsilon_{i} \sim \ndist\left(0, \sigma^{2}\right)
$$
to the data.
1. The first model should not have any problems
2. The second has a linear dependency which isn't included in the model, it should therefore be clear in the residual analysis
3. The third is a non-linear function of the residuals as well as the regressors, and should also as is show some problems in the residual analysis.

The **first** model is simulated, estimated and analysed with $\beta_{0}=0, \beta_{1}=1, \text { and } \sigma^{2}=1$:
```R
n <-100
x1 <- seq(1, 10, length=n)
y <- x1 + rnorm(n)
fit <- lm(y ~ x1)
qqnorm(fit$residuals, pch=19, cex=0.5)
qqline(fit$residuals)
plot(fit$fitted.values, fit$residuals, pch=19, cex=0.5,
xlab="Fitted values ($\\hat{y}_i$)", ylab="Residuals ($e_i$)")
```
<span class="centerImg">![[LinearRegressionModelValidationExampleModel1.png]]</span>
Evidently there's no serious outliers from normality, and no pattern in the residuals, we therefore accept the assumptions.

For the **second** model with $\beta_{0}=0, \beta_{1}=1, \beta_{2}=0.5 \text { and } \sigma^{2}=1$:
```R
x1 <- seq(1, 10, length=n)
x2 <- seq(1, 10, length=n)^2
y <- x1 + 0.5 * x2 + rnorm(n)
fit <- lm(y ~ x1)
```
<span class="centerImg">![[LinearRegressionModelValidationExampleModel2.png]]</span>
From the second plot particularly it's easy to see that the residuals follow a pattern, and the assumption is therefore wrong.

The **third** model with $\beta_{0}=0, \beta_{1}=1, \beta_{2}=0.5 \text { and } \sigma^{2}=1$:
```R
x1 <- seq(4, 10, length=100)
y <- exp( 0.2 * x1 + rnorm(length(x1), sd=0.15))
fit <- lm(y ~ x1)
```
<span class="centerImg">![[LinearRegressionModelValidationExampleModel3.png]]</span>
As the q-q plot isn't symmetrical and the variance increases with the fitted values, this is clearly not living up to the assumptions.
When the variance is clearly related with the values one should transform the dependent variable.
In this case an obvious transformation would be the log-transformation:
```R
y <- log(y)
fit <- lm(y ~ x1)
```
<span class="centerImg">![[LinearRegressionModelValidationExampleModel3Log.png]]</span>
We see that the log transformed data fit's much better to the assumptions. The q-qplot is more symmetrical, still with heavy tales, hence less departure from normality compared to pre-log. And the residuals are no longer related clearly to the fitted values
````
^example5-27
 
 ````ad-example
title: Example 6.15 <br> [[Multiple Linear Regression]]
collapse: open

Consider the following simulation of the true model:
$$
y_{i}=x_{1}+2 x_{2}^{2}+\varepsilon_{i}, \quad \varepsilon_{i} \sim \ndist\left(0,0.125^{2}\right)
$$
```R
n <- 100
x1 <- runif(n)
x2 <- runif(n)
y <- x1 + 2*x2^2 + rnorm(n,sd=0.125)
```
As we don't know the true model we start by plotting the effects of the two parameters:
<span class="centerImg">![[MultipleResidualAnalysisExampleEffectPlots.png]]</span>
As both parameters seem to hold some information about y, we determine the following [[Multiple Linear Regression]] model:
$$
y_{i}=\beta_{0}+\beta_{1} x_{1}+\beta_{2} x_{2}+\varepsilon_{i}, \quad \varepsilon_{i} \sim \ndist\left(0, \sigma^{2}\right),
$$
Now we fit and check for systematic dependence betwwen the fitted values and the residuals.
```R
fit <- lm(y ~ x1 + x2)
plot(fitted.values(fit), residuals(fit), pch=19, cex=0.7)
plot(x1, residuals(fit), pch=19, cex=0.7)
plot(x2, residuals(fit), pch=19, cex=0.7)
```
<span class="centerImg">![[MultipleResidualAnalysisExampleFittedEffectPlots.png]]</span>
The left plot does't clearly suggest where the dependence comes from, but looking at the two fitted plots, we see that the residuals seems to be a quadratically related to $x_{2}$. We therefore include $x_{2}^{2}$ in the model:
```R
x3 <- x2^2
fit <- lm(y ~ x1 + x2 + x3)
plot(fitted.values(fit), residuals(fit), pch=19, cex=0.7)
plot(x1, residuals(fit), pch=19, cex=0.7)
plot(x2, residuals(fit), pch=19, cex=0.7)
```
<span class="centerImg">![[MultipleResidualAnalysisExampleQuadraticFittedEffectPlots.png]]</span>
Now there seems to be no systematic dependence in the residuals, and our final model is determined. We can now check the significance of the parameters:
```R
summary(fit)

Call:
lm(formula = y ~ x1 + x2 + x3)

Residuals:
Min 1Q Median 3Q Max
-0.27486 -0.07353 -0.00098 0.07630 0.23112

Coefficients:
			Estimate Std. Error t value Pr(>|t|)
(Intercept) -0.000979 0.032200 -0.03 0.98
x1 			0.998212 0.042055 23.74 <2e-16 ***
x2 			0.087010 0.138613 0.63 0.53
x3 			1.859060 0.140499 13.23 <2e-16 ***
---
Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.107 on 96 degrees of freedom
Multiple R-squared: 0.972,Adjusted R-squared: 0.972
F-statistic: 1.13e+03 on 3 and 96 DF, p-value: <2e-16
```
And we see here that we could possibly remove $x_{2}$ as it isn't significantly different from zero.
````
^example6-15
# References
- [[Introduction to Mathematical Statistics - 02403]]