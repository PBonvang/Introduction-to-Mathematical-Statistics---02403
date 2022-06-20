---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Probability]], [[Normal distribution]]
****
$$\large
Z \sim \mathcal{N}(0,1)
$$
The standard normal distribution is simply the [[Normal distribution]] with the [[Mean]] of 0 and [[Variance]] of 1.

# Converting to the standardized normal random variable
If $X$ is a normally distributed random variable, it can be transformed into a standardized normal random variable by:
$$Z=\frac{X-\mu}{\sigma}$$

$$\begin{align*}
\op{Var}(Z)&=\frac{1}{\sigma^{2}}\op{Var}(X-\mu)\\
&\frac{\op{var}(X)}{\sigma^{2}}=1
\end{align*}$$
# [[Quantiles and percentiles]]
<span class="centerImg">![[StandardNormalQuantiles.png|400]]</span>

$$
\begin{array}{l|cccccccc}
\text { Percentile } & 1 \% & 2.5 \% & 5 \% & 25 \% & 75 \% & 95 \% & 97.5 \% & 99 \% \\
\hline \text { Quantile } & 0.01 & 0.025 & 0.05 & 0.25 & 0.75 & 0.95 & 0.975 & 0.99 \\
\hline \text { Value } & -2.33 & -1.96 & -1.64 & -0.67 & 0.67 & 1.64 & 1.96 & 2.33
\end{array}
$$

# References
- [[Introduction to Mathematical Statistics - 02403]]