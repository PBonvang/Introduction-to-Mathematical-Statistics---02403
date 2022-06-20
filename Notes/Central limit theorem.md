Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]]
Translations: 
Synonyms:
****
<span class="centerImg">![[CentralLimitTheoremExample.png|#invert]]</span>

The [[Sample mean]] of i.i.d random variables converges to a [[Normal distribution]] as the sample size increases.
A rule of thumb is that a normal distribution can be assumed when $n\ge30$, else the [[t-distribution]] is a better fit.

```ad-tip
title: Theorem 3.14  Central Limit Theorem

Let $\bar{X}$ be the sample mean of a random sample of size $n$ taken from a population with mean $\mu$ and variance $\sigma^{2}$, then
$$
Z=\frac{\bar{X}-\mu}{\sigma / \sqrt{n}},
$$
is a random variable which distribution function approaches that of the standard normal distribution, $N\left(0,1^{2}\right)$, as $n \rightarrow \infty$. In other words, for large enough $n$, it holds approximately that
$$
\frac{\bar{X}-\mu}{\sigma / \sqrt{n}} \sim N\left(0,1^{2}\right) .
$$

```

Additionally this means that
$$\bar{X}\sim\ndist(\mu,\frac{\sigma^{2}}{n})$$
when $n>>1$ or $n\rightarrow\infty$
# References
- [[Signals and data - 02462]]
- [[Introduction to Mathematical Statistics - 02403]]