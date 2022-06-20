---
aliases: [Uniform fordeling] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Probability]], [[Statistics]]
****
<span class="centerImg">![[ProbabilityDensityFunctionExample2.png|#invert]]</span>
$$\large
X \sim U(\alpha,\ \beta)
$$
$[\alpha,\ \beta]:$ The defined range of the uniform distribution.

A [[Continuous random variable]] is uniformly distributed if the density is the same for every value within the defined range.

# [[Probability density function - PDF]]
$$\large
f(x)= \begin{cases}\frac{1}{\beta-\alpha} & \text { for } x \in[\alpha, \beta] \\ 0 & \text { otherwise }\end{cases}
$$

# [[Cumulative distribution function - CDF]]
$$
F(x)= \begin{cases}0 & \text { for } x<\alpha \\ \frac{x-\alpha}{\beta-\alpha} & \text { for } x \in[\alpha, \beta) \\ 1 & \text { for } x \geq \beta\end{cases}
$$

# [[Mean]] and [[variance]]
$$
\mu=\frac{1}{2}(\alpha+\beta)
$$
$$
\sigma^{2}=\frac{1}{12}(\beta-\alpha)^{2}
$$

# In R
```R
{d,p,q,r}unif
```
# References
- [[Signals and data - 02462]]
- [[Introduction to Mathematical Statistics - 02403]]