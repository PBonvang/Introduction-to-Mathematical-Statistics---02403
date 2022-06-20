---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Probability]], [[Statistics]]
****

$$\begin{align*}
\sigma=\operatorname{sd}[X]&=\sqrt{\operatorname{var}[X]}\\
&=\sqrt{\mathbb{E}\left[(X-\mathbb{E}[X])^{2}\right]}
\end{align*}$$
Used to describe the spread in a distribution/dataset, as the square root of the [[Variance]].
Sd. is usually used as it's the same unit as the distribution, contrary to variance.
See also: [[Sample standard deviation]]

# Linearity
For a linear function $Y=a X+b$, the standard deviation can simply be reduced to:
$$
\mathrm{sd}(Y)=\mathrm{sd}(a \mathrm{X}+b)=a\cdot\mathrm{sd}(X)
$$

## Linear combinations
Assuming the [[Random variable|random variables]] are independent, the standard deviation is:
$$\begin{align*}
\mathrm{sd}\left(X_{1}+X_{2}+\cdots+ X_{n}\right)&=\sqrt{n}\cdot\sigma_{X}
\end{align*}$$

```ad-example
title: Dice throws

Say we wish to determine the standard deviation of 5 dice throws
$$
Y=X_{1}+X_{2}+X_{3}+X_{4}+X_{5}
$$
Variance:
$$
\begin{aligned}
\sigma_{Y}^{2} &=\mathrm{V}\left(X_{1}+X_{2}+X_{3}+X_{4}+X_{5}\right) \\
&=\mathrm{V}\left(X_{1}\right)+\mathrm{V}\left(X_{2}\right)+\mathrm{V}\left(X_{3}\right)+\mathrm{V}\left(X_{4}\right)+\mathrm{V}\left(X_{5}\right) \\
&=5 \sigma_{X}^{2}
\end{aligned}
$$
Standard deviation
$$\sigma_{Y}=\sqrt{5}\cdot\sigma_{X}$$
Notice that the scaling is $\sqrt{5}$ due to the number of throws, not $5^{2}$ as with scaled standard deviation.
```
# References
- [[Expectation]]
- [[Introduction to intelligent systems - 02461]]
- [[Introduction to Mathematical Statistics - 02403]]