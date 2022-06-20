---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Analysis of Variance - ANOVA|ANOVA]] 
****

$$\large\alpha_\text{Bonferroni}=\alpha/M$$
$M=k\cdot(k-1)/2:$ The total number of possible combinations of treatments.

The Bonferroni correction makes it more difficult to claim that two treatments have different means, making is certain of the difference, if it exist.
In practice this correction increases the width of the confidence intervals, making it harder to be significantly different from eachother.
Ex:
The $0.05 / 3$-critical value with 9 degrees of freedom is $t_{0.9917}=2.933$ whereas the $0.05$-critical value is $t_{0.975}=2.262$.

**Purpose:** When the number of groups $k$ is large using the "normal" [[Statistical significance|Significance level]] $\a$, will with a high probability result in multiple significant tests, when the overall hypothesis, that no means are different, is true. The Bonferroni correction essentially scales the significance level to the number of groups in a study.
# References
- [[Introduction to Mathematical Statistics - 02403]]