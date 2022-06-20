---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[One-way ANOVA]]
****

$$
\begin{array}{|l|c|c|c|c|c|}
\hline \begin{array}{l}
\text { Source of } \\
\text { variation }
\end{array} & \begin{array}{l}
\text { Degrees of } \\
\text { freedom }
\end{array} & \begin{array}{l}
\text { Sums of } \\
\text { squares }
\end{array} & \begin{array}{l}
\text { Mean sum of } \\
\text { squares }
\end{array} & \begin{array}{l}
\text { Test- } \\
\text { statistic } F
\end{array} & \begin{array}{l}
p\text {-value }
\end{array} \\
\hline \text { Treatment } & k-1 & S S(T r) & M S(T r)=\frac{S S(T r)}{k-1} & F_{\text {obs }}=\frac{M S(T r)}{M S E} & P\left(F>F_{\text {obs }}\right) \\
\hline \text { Residual } & n-k & S S E & M S E=\frac{S S E}{n-k} & & \\
\hline \text { Total } & n-1 & S S T & & & \\
\hline
\end{array}
$$
^ANOVATable
# References
- [[Introduction to Mathematical Statistics - 02403]]