---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Analysis of Variance - ANOVA|ANOVA]]
****
$$\large
L S D_{\alpha}=t_{1-\alpha / 2} \sqrt{2 \cdot M S E / m}
$$
$t_{1-\alpha / 2}:$  ($1-\alpha / 2$) quantile of a [[t-distribution]] with the following degrees of freedom:
- [[One-way ANOVA]]: $n-k$
- [[Two-way ANOVA]]: $(k-1)(l-1)$

If each treatment has the same number of observations $m=n_{1}=\ldots=n_{k}$ the LSD value is a value used to determine if the observed means are significantly different.
If the observed mean differs more than $LSD$ it is significantly different.

**When used for all the comparisons**, use the [[Bonferroni correction|Bonferroni corrected]] version denoted: $L S D_{\alpha_{\text {Bonferroni }}}$.
# References
- [[Introduction to Mathematical Statistics - 02403]]