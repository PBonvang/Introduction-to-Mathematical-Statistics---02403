---
aliases: [Multiple RSS] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Multiple Linear Regression]]
****

$$\begin{align*}
\operatorname{RSS}\left(\beta_{0}, \ldots, \beta_{p}\right)&=\sum_{i=1}^{n}\left[Y_{i}-\left(\beta_{0}+\beta_{1} x_{1, i}+\cdots+\beta_{p} x_{p, i}\right)\right]^{2}\\
&=\sum_{i=1}^{n}\left(y_{i}-\hat{y}_{i}\right)^{2}\\
&=\sum_{i=1}^{n} e_{i}^{2}
\end{align*}$$
$n:$ Number of observations.
$p:$ Number of regressors.
$y_i:$ Actual observation
$\hat{y}_i:$ Prediction
$e_{i}:$ Residual/error

Multiple RSS just like [[Simple Residual Sum of Squares | Simple RSS]], is the squared sum of errors/residuals.

# [[Matrix formulation of linear regression|Matrix formulation]]
$$\large
R S S=\boldsymbol{\varepsilon}^{T} \boldsymbol{\varepsilon}=(\boldsymbol{y}-\boldsymbol{X} \boldsymbol{\beta})^{T}(\boldsymbol{y}-\boldsymbol{X} \boldsymbol{\beta})
$$


# References
- [[Introduction to Mathematical Statistics - 02403]]