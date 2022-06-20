---
aliases: [Categorical sample size determination, Proportion sample size determination, Categorical sample size calculation] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]], [[Discrete data]], [[Sample size calculation]]
****

```ad-summary
title: Method 7.13 <br> Sample size formula for the CI of a proportion
collapse: open

Given some "guess" (scenario) of the size of the unknown $p$, and given some requirement to the $M E$-value (required expected precision/user defined) the necessary sample size is then
$$
n=p(1-p)\left(\frac{z_{1-\alpha / 2}}{M E}\right)^{2}
$$
If $p$ is unknown, a worst case scenario with $p=1 / 2$ is applied and necessary sample size is
$$
n=\frac{1}{4}\left(\frac{z_{1-\alpha / 2}}{M E}\right)^{2}
$$

```
^method7-13

Note that the [[Margin of error]] $ME$ in this scenario the half the size of the range of the resulting confidence interval.

# References
- [[Introduction to Mathematical Statistics - 02403]]