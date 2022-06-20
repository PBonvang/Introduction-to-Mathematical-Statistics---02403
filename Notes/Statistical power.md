---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]]
****
<span class="centerImg">![[StatisticalPower.png]]</span>
The statistical power of a study is the probability of correctly rejecting the null hypothesis $H_{0}$ if $H_{0}$ is false.

The smaller the difference between $H_{0}$ and the alternative hypothesis $H_{1}$ (the effect size), the harder it get's to distinguish if there's an actual effect, and the smaller the power gets. It's therefore more likely to make a $\text{Type II error }\beta$ (Accepting $H_0$ when it's false) with a low power.

In general a power above 0.8 is considered relevant.

Power is determined by:
- Significance level $\alpha$
- Effect size $\delta=\mu_1-\mu_0$
- Sample size $n$
- Standard deviation $\sigma$

# In R
```R
power.t.test(n, delta, sd, sig.level,
			 type="one.sample") # Default type is two-sample.
```
# References
- [[Hypothesis testing]]
- [[Introduction to Mathematical Statistics - 02403]]