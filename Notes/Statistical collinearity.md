---
aliases: [Kollinearitet, Collinearity] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]]
****

In statistics collinearity refers to situations where the [[Sample correlation]] between presumed independent variables is high, thus not independent.
If the correlation is high we should be careful with interpretation of parameter estimates, and often means that we should reduce the model.
If we have the model
$$
y_{i}=\beta_{0}+\beta_{1} x_{1}+\beta_{2} x_{2}+\varepsilon_{i}, \quad \varepsilon_{i} \sim \ndist\left(0, \sigma^{2}\right)
$$
and the [[Sample correlation]] between the parameters $x_1$ and $x_2$ equal 1, it implies that we can write one as a function of the other, e.g. $x_{2}=a+bx_{1}$ which means that the model would be
$$
\begin{align*}
y_{i} &=\beta_{0}+\beta_{1} x_{1}+\beta_{2}\left(a+b x_{1}\right)+\varepsilon_{i} \\
&=\beta_{0}+\beta_{2} a+\left(\beta_{1}+\beta_{2} b\right) x_{1}+\varepsilon_{i}\\
&=\beta_{0}+\beta_{1}x_{1}+\varepsilon_{i}
\end{align*}
$$
As $\beta_{i}$ are constants they can just include other constants, and we therefore get a [[Simple Linear Regression]] model. It means that we don't get any additional information from having both parameters in our model. In real life the correlation is rarely 1, but rather close to 1, which has the same result. A simple way to handle this is by removing one of the parameters. 
Procedures:
- Remove one of the unnecessary parameters (Common) 
- Using the average of the regressors/parameters
- Using [[Principle component regression]]

Strong collinearity hides the true effect of parameters/regressors, because of the parameters high [[correlation]].

# Examples
````ad-example
title: Example 6.13 <br>
collapse: open

Consider the model
$$
Y_{i}=\beta_{0}+\beta_{1} x_{1}+\beta_{2} x_{2}+\varepsilon_{i}, \quad \varepsilon_{i} \sim \ndist\left(0, \sigma^{2}\right)
$$

with the following R generated data:
```R
n <- 100
x1 <- runif(n)
x2 <- x1 + rnorm(n, sd=0.01)
y <- x1 + x2 + rnorm(n, sd=0.5)
plot(x1, y, pch=19, cex=0.5, xlab=expression(x[1]))
plot(x2, y, pch=19, cex=0.5, xlab=expression(x[2]))
```
<span class="centerImg">![[StatisticalCollinearityExample.png]]</span>
Clearly both $x_1$ and $x_2$ contain information about $y$, but our usual linear regression:
```R
confint(lm(y ~ x1 + x2))
			
			2.5 % 97.5 %
(Intercept) -0.3453 0.07124
x1 			-14.9270 5.98682
x2 			-3.6745 17.20468
```
says that non of the parameters are significant. But if we remove $x_1$ (parameter with the highest p-value) we get:
```R
summary(lm(y ~ x2))

Call:
lm(formula = y ~ x2)

Residuals:
Min 1Q Median 3Q Max
-1.2229 -0.3025 0.0025 0.2641 1.7649

Coefficients:
			Estimate Std. Error t value Pr(>|t|)
(Intercept) -0.140 0.105 -1.33 0.19
x2 			2.305 0.194 11.86 <2e-16 ***
---
Signif. codes: 0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.502 on 98 degrees of freedom
Multiple R-squared: 0.589,Adjusted R-squared: 0.585
F-statistic: 141 on 1 and 98 DF, p-value: <2e-16
```
the slope $x_2$ is now highly significant.

However note that the estimate is quitie far from the actual coefficient of the model (1).

A way to get around this is to simulate the data as if the first half was a function of $x_{1}$ and the second a function of $x_{2}$.
```R
x1[1:(n / 2)] <- 0
x2[(n / 2): n] <- 0
y <- x1 + x2 + rnorm(n, sd=0.5)

summary(lm(y ~ x1 + x2))

Call:
lm(formula = y ~ x1 + x2)

Residuals:
    Min      1Q  Median      3Q     Max 
-1.3551 -0.2882  0.0036  0.3484  1.3107 

Coefficients:
            Estimate Std. Error t value Pr(>|t|)    
(Intercept)  0.01571    0.09583   0.164     0.87
x1           0.92075    0.18982   4.851 4.69e-06 ***
x2           0.87287    0.19383   4.503 1.86e-05 ***
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1

Residual standard error: 0.4858 on 97 degrees of freedom
Multiple R-squared:  0.2218,    Adjusted R-squared:  0.2058
F-statistic: 13.82 on 2 and 97 DF,  p-value: 5.224e-06

```
Now both variables are significant and around the correct values.

````
^example6-13

# References
- [[Introduction to Mathematical Statistics - 02403]]