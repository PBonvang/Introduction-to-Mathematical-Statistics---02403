---
aliases: [Curve-linear regression, Curvlinearity] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Linear Regression]]
****
$$\large
Y_{i}=f\left(x_{i}\right)+\varepsilon_{i}, \quad \varepsilon_{i} \sim N\left(0, \sigma^{2}\right)
$$
Say we're given a pair of values $x$ and $y$ and it seems that $y$ is a function of $x$, but the relation isn't linear, and the non-linear relation $f(x_i)$ is unknown.
Then the methods of [[Linear Regression]] could not be used. However we know that any function can be approximated by its [[Taylor series]]
$$
f(x) \approx f(0)+f^{\prime}(0) \cdot x+\frac{f^{\prime \prime}(0)}{2} x^{2}+\cdots+\frac{f^{(p)}(0)}{p !} x^{p}
$$
Now to make it a [[Multiple Linear Regression]] model we simply replace the coefficients with parameters $b_j$:
$$
\begin{aligned}
Y_{i} &=\beta_{0}+\beta_{1} x+\beta_{2} x^{2}+\cdots+\beta_{p} x^{p}+\varepsilon_{i} \\
&=\beta_{0}+\beta_{1} x_{1}+\beta_{2} x_{2}+\cdots+\beta_{p} x_{p}+\varepsilon_{i}
\end{aligned}
$$
$x_{j}=x^{j}$.
This method is what we call the *curvilinear regression*.

# Examples
````ad-example
title: Example 6.11 <br> Simulation of non-linear model
collapse: open

Given a non-linear model:
$$
Y_{i}=\sin \left(\pi x_{i}\right)+\varepsilon_{i}, \quad \varepsilon_{i} \sim \ndist\left(0,0.1^{2}\right)
$$
with $x\in[0,1]$, we can simulate it by:
```R
n <- 200
x <- runif(n)
y <- sin(pi*x) + rnorm(n,sd=0.1)
```

Now if we try to estimate the parameters using the [[Simple Linear Regression]] 
$$
Y_{i}=\beta_{0}+\beta_{1} x_{i}+\varepsilon_{i}, \quad \varepsilon_{i} \sim \ndist\left(0, \sigma^{2}\right)
$$
and determine the 95% CI for the parameters, we get:
```R
fit1 <- lm(y ~ x)
confint(fit1)

			2.5 % 97.5 %
(Intercept) 0.5737 0.7544
x 			-0.1960 0.1251
```
As the CI for $\beta_1$ includes zero, we cannot reject the null hypothesis.

Let's now try with a quadratic term to approximate the non-linear function
$$
Y_{i}=\beta_{0}+\beta_{1} x_{i}+\beta_{2} x_{i}^{2}+\varepsilon_{i}, \quad \varepsilon_{i} \sim N\left(0, \sigma^{2}\right)
$$
```R
x1 <- x; x2 <- x^2
fit2 <- lm(y ~ x1 + x2)
confint(fit2)

			2.5 % 97.5 %
(Intercept) -0.0906 -0.005303
x1 			3.9858 4.381327
x2 			-4.3823 -4.001747
```
This model showes that all the parameters are significantly different from zero on a 5% confidence level.
<span class="centerImg">![[CurvilinearRegressionExample6-11ResidualComparison.png]]</span>

From the figure its clear that the second model had a much better fit, removing almost all systematic dependence in the residuals.
And plotting the two models together it's clear that the quadratic (blue) fits the data far better than the simple linear (purple).
<span class="centerImg">![[CurvilinearRegressionExample6-11ModelComparison.png]]</span>
````
^example6-11

# References
- [[Introduction to Mathematical Statistics - 02403]]