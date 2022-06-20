---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Two-way ANOVA]]
****

$$
\begin{array}{|l|c|c|l|c|c|}
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
\text { Mean sums of } \\
\text { squares }
\end{array} & \begin{array}{l}
\text { Test } \\
\text { statistic } F
\end{array} & \begin{array}{l}
p
\text {-value }
\end{array} \\
\hline \text { Treatment } & k-1 & S S(T r) & M S(T r)=\frac{S S(T r)}{k-1} & F_{T r}=\frac{M S(T r)}{M S E} & P\left(F>F_{T r}\right) \\
\hline \text { Block } & l-1 & S S(B l) & M S(B l)=\frac{S S(B l)}{l-1} & F_{B l}=\frac{M S(B I)}{M S E} & P\left(F>F_{B l}\right) \\
\hline \text { Residual } & (l-1)(k-1) & S S E & M S E=\frac{S S E}{(k-1)(l-1)} & & \\
\hline \text { Total } & n-1 & S S T & & & \\
\hline
\end{array}
$$


# References
- [[Introduction to Mathematical Statistics - 02403]]