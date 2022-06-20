---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Probability]], [[Normal distribution]], [[Distributions]]
****
<span class="centerImg">![[Lognormal-Distribution.png|350]]</span>
$$
X \sim L \mathcal{N}\left(\alpha, \beta^{2}\right)
$$
$\alpha:$ [[Mean]] of the normal distribution when taking the natural log to $X$
$\beta^{2}:$ [[Variance]] of the normal distribution when taking the natural log to $X$

A [[Continuous random variable]] is log-normally distributed if its logarithm is normally distributed.

# [[Probability density function - PDF]]
$$
f(x)=\frac{1}{x \sqrt{2 \pi} \beta} \op{exp}\left({-\frac{(\ln x-\alpha)^{2}}{2 \beta^{2}}}\right)
$$

# [[Mean]] and [[Variance]]
$$
\mu=\e^{\alpha+\beta^{2} / 2}
$$
$$
\sigma^{2}=e^{2 \alpha+\beta^{2}}\left(e^{\beta^{2}}-1\right)
$$

# In R
```R
lnorm
```

# References
- [[Introduction to Mathematical Statistics - 02403]]