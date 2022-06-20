---
aliases: [Distribution function] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]], [[Probability]]
****

Where the [[Probability density function - PDF]] described the probability of a certain outcome or a intervals of outcomes, the cumulative distribution function provides the cumulative sum from $-\infty$ to the provided value.
In short it's the probability of an outcome being equal or below the provided value.

Denoted: $F_x(x)$

# Discrete variables
$$\large
F(x)=P(X \leq x)=\sum_{j \text { where } x_{j}\  \leq\ x} f\left(x_{j}\right)=\sum_{j \text { where } x_{j}\ \leq\ x} P\left(X=x_{j}\right)
$$

# Continuous variables
Defined as the area under the density function $p_x(x)$ in the interval $[-\infty,x]$:
$$
F_{X}(x)=\int_{-\infty}^{x} p_{X}(t) d t
$$

$$
\lim _{x \rightarrow-\infty} F(x)=0 \text { and } \lim _{x \rightarrow \infty} F(x)=1
$$

**The probability of X being greater than a:**
$$\mathbb{P}(X > a)=1-F_x(a)$$

Note that the derivative of the CDF is the [[Probability density function - PDF]].
$$
f(x)=\frac{d}{d x} F(x)
$$

```ad-example
collapse: close

Given the density function:
$$
p_{X}(x)=\left\{\begin{array}{ll}
2 e^{-2 x} & \text { for } x>0 \\
0 & \text { for } x \leq 0
\end{array}\right.
$$
We find the CDF:
$$
\int_{0}^{x} 2 e^{-2 t} d t=1-e^{-2 x}
$$
$$\Downarrow$$
$$
F_{X}(x)=\left\{\begin{array}{ll}
1-e^{-2 x} & \text { for } x>0 \\
0 & \text { for } x \leq 0
\end{array}\right.
$$
<span class="centerImg">![[CDFExample1.png|200]]</span>

Probability of $X\in[1,4]$:
$$
F_{X}(4)-F_{X}(1)=e^{-2}-e^{-8} \approx 0.135
$$

Probability of $X>0.5$:
$$
1-F_{X}(0.5)=e^{-1} \approx 0.368
$$
```


# Generally
For both discrete and continuous, the probability of a outcome being in a certain range is:
$$
\P(a<X \leq b)=F(b)-F(a)
$$
# References
- [[Signals and data - 02462]]
- [[Introduction to Mathematical Statistics - 02403]]