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
# References
- [[Introduction to Mathematical Statistics - 02403]]