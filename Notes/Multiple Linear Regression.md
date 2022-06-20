---
aliases: [General linear model] # Searchable synonyms and translations
---

Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Linear Regression]], [[Statistics]]
****
$$\large
Y_{i}=\beta_{0}+\beta_{1} x_{1, i}+\cdots+\beta_{p} x_{p, i}+\varepsilon_{i}, \quad \varepsilon_{i} \overset{\text{i.i.d}}{\sim} \ndist\left(0, \sigma^{2}\right)\tag{GLM}
$$
$p:$ Number of regressors.

Multiple linear regression is simply an extension/generalization of [[Simple Linear Regression]], adding multiple regressors to the model.
The residuals $\varepsilon_i$ are still assumed to be i.i.d normal [[Random variable|random variables]] with a mean of zero and some unknown constant variance $\sigma^{2}$.
This approach can also approximate non-linear functions of the regressors, i.e
$$
Y_{i}=f\left(x_{i}\right)+\varepsilon_{i}, \quad \varepsilon_{i} \sim \ndist\left(0, \sigma^{2}\right)
$$
For a "2D" meaning $p=2$, we can thing of the model as a plane with the form:
$$
\hat{y}_{i}=\hat{\beta}_{0}+\hat{\beta}_{1} x_{1, i}+\hat{\beta}_{2} x_{2, i}
$$
<span class="centerImg">![[MultipleLinearRegression2DExample.png]]</span>
The dots are the observation $x$, the blue and yellow lines represents the errors $e_{i}$ and the surface the optimal estimate.
This is the same as
$$
Y_{i}=\hat{y}_{i}+e_{i}
$$

The linearity refers to the linearity in the parameters not the regressors. So
$$
Y_{i}=\beta_{0}+\beta_{2} \log \left(x_{i}\right)+\varepsilon_{i}\tag{Linear}
$$
$$
Y_{i}=\beta_{0}+\log \left(x_{i}+\beta_{2}\right)+\varepsilon_{i}\tag{Not linear}
$$

# Index
- [[Linear regression parameter estimation]]
- [[Linear regression line intervals]]
- [[Linear model validation|Residual analysis]]
- [[Matrix formulation of linear regression]]

# Examples
````ad-example
title: Example 6.1 <br>
collapse: open

A car manufacture first constructed a simple linear model for fuel consumption as a function of speed, but a [[Linear model validation|Residual analysis]] revealed that the residuals were not independent of the fitted values, we therefore need to extend the model.
It's realized that the fuel consumption is a function of wind speed as well as the speed of the car, and a new model could be formulated as:
$$
Y_{i}=\beta_{0}+\beta_{1} x_{1, i}+\beta_{2} x_{2, i}+\varepsilon_{i}
$$
where $x_{1,i}$ is the speed and $x_{2,i}$ is the wind speed (relative to the car).
Another possiblity is that the model shouldnt be linear in speed, but quadratic
$$
\begin{aligned}
Y_{i} &=\beta_{0}+\beta_{1} x_{1, i}+\beta_{2} x_{1, i}^{2}+\varepsilon_{i} \\
&=\beta_{0}+\beta_{1} x_{1, i}+\beta_{2} x_{2, i}+\varepsilon_{i}
\end{aligned}
$$
where $x_{2,i}$ is now the squared speed.
Note that both models are linear in the parameters $\left(\beta_{0}, \beta_{1}, \beta_{2}\right)$.
````
^example6-1

# References
- [[Introduction to Mathematical Statistics - 02403]]