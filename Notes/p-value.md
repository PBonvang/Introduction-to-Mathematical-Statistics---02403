---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]], [[Hypothesis testing]]
****

The p-value is the probability of obtaining a test statistic which is at least as extreme as the observed test statistic. It's generally a measure of how probable it is to observe the observed test statistic, used to determine how likely it is that a hypotheses is true.
This probability is calculated under the assumption that [[The null hypothesis]] is true.

It's a general measure of evidence against a null hypotheses.

In general: If the $p$-value $<\alpha$ ([[Statistical significance|Significance level]]) we reject $H_{0}$ else we accept it.

**General value meaning:**
$$
\begin{array}{cl}
\hline p<0.001  & \text { Very strong evidence against } H_{0} \\
0.001 \leq p<0.01 & \text { Strong evidence against } H_{0} \\
0.01 \leq p<0.05  & \text { Some evidence against } H_{0} \\
0.05 \leq p<0.1  & \text { Weak evidence against } H_{0} \\
p \geq 0.1 &  \text { Little or no evidence against } H_{0} \\
\hline
\end{array}
$$

# References
- [[Introduction to Mathematical Statistics - 02403]]