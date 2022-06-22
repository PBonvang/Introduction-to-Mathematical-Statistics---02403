---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Linear Regression]]
****
$$\large
\boldsymbol{Y}=\boldsymbol{X} \boldsymbol{\beta}+\boldsymbol{\varepsilon}, \quad \boldsymbol{\varepsilon} \sim \ndist\left(\mathbf{0}, \sigma^{2} \boldsymbol{I}\right)
$$
$$\large\Updownarrow$$
$$\large
\left[\begin{array}{c}
Y_{1} \\
\vdots \\
Y_{n}
\end{array}\right]=\left[\begin{array}{cccc}
1 & x_{1,1} & \cdots & x_{p, 1} \\
\vdots & \vdots & & \vdots \\
1 & x_{1, n} & \cdots & x_{p, n}
\end{array}\right]\left[\begin{array}{c}
\beta_{0} \\
\vdots \\
\beta_{p}
\end{array}\right]+\left[\begin{array}{c}
\varepsilon_{1} \\
\vdots \\
\varepsilon_{n}
\end{array}\right], \quad \varepsilon_{i} \sim \ndist\left(0, \sigma^{2}\right)
$$
$X:$ Design matrix
Just as for [[Simple Linear Regression]], [[Multiple Linear Regression]] models has a matrix formulation as seen above.

# Examples
````ad-example
title: Example 5.24 <br> Student height and weight
collapse: open

Given the following students height and weight:
$$
\begin{array}{l|rrrrrrrrrr}
\text { Heights }\left(x_{i}\right) & 168 & 161 & 167 & 179 & 184 & 166 & 198 & 187 & 191 & 179 \\
\text { Weights }\left(y_{i}\right) & 65.5 & 58.3 & 68.1 & 85.7 & 80.5 & 63.4 & 102.6 & 91.4 & 86.7 & 78.9
\end{array}
$$
The matrix formulation in R:
```R
# Data
x <- c(168, 161, 167, 179, 184, 166, 198, 187, 191, 179)
y <- c(65.5, 58.3, 68.1, 85.7, 80.5, 63.4, 102.6, 91.4, 86.7, 78.9)
X <- cbind(1, x)
n <- length(y)

# Parameter estimates and variance
beta <- solve(t(X) %*% X) %*% t(X) %*% y
e <- y - X %*% beta
s <- sqrt(sum(e^2) / (n - 2))
Vbeta <- s^2 * solve(t(X) %*% X)
sbeta <- sqrt(diag(Vbeta))
T.stat <- beta / sbeta
p.value <- 2 * (1 - pt(abs(T.stat), df = n-2))

# Print the results
coef.mat <- cbind(beta, sbeta, T.stat, p.value);
colnames(coef.mat) <- c("Estimates","Std.Error","t.value","p.value")
rownames(coef.mat) <- c("beta0", "beta1")
coef.mat; s

Estimates Std.Error t.value p.value
beta0 9.815 0.07773 126.3 0
beta1 3.039 0.01363 222.9 0
[1] 0.42

# Prediction and confidence interval
xnew <- matrix(c(1, 200), ncol=2)
ynew <- xnew %*% beta
Vconf <- xnew %*% Vbeta %*% t(xnew)
Vpred <- Vconf + s^2
sqrt(c(Vconf, Vpred))
[1] 2.740 2.772
```

\* `%*%` is for matrix multiplication.
````
^example5-24
# References
- [[Introduction to Mathematical Statistics - 02403]]