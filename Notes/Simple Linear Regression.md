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
# References
- [[Introduction to intelligent systems - 02461]]
- [[Introduction to Mathematical Statistics - 02403]]