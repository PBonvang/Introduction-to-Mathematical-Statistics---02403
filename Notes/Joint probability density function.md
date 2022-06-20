---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Probability]], [[Probability density function - PDF]]
****

$$\large
f(x,y)=\P(X=x,Y=y)
$$

The joint [[Probability density function - PDF|PDF]] of two 2-dimensional discrete [[Random variable|random variables]] is defined as shown above.
Just like the single variable PDF:
$$
\begin{align*}
f(x, y) & \geq 0 \text { for all }(x, y) \\
\sum_{\text {all } x} \sum_{\text {all } y} f(x, y) &=1\tag{Discrete}\\
\int\int f(x,y)\ dx\ dy &= 1\tag{Continuous}
\end{align*}
$$

Additionally for continuous variables:
$$
f_{X}(x)=\int f(x, y)\ d y, \quad f_{Y}(y)=\int f(x, y) d x
$$

# References
- [[Introduction to Mathematical Statistics - 02403]]