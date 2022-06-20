---
aliases: [ANOVA, Comparing means of multiple groups] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]]
****

ANOVA is a method for comparing means of multiple groups, a multi-sample situation.
The hypothesis of $k$ groups having the same mean:
$$
H_{0}: \quad \mu_{1}=\mu_{2}=\cdots=\mu_{k}
$$
And the alternative hypothesis $H_{1}$ is that at least one group has a significantly different mean.

# Purpose
The purposes of ANOVA:
1. Answer: "Are the group means significantly different?"
	1. Hypothesis testing
2. Quantify the groups and their potential differences
	1. Estimates
	2. Confidence intervals

# How it works
$$
Y_{i j}=\mu_{i}+\varepsilon_{i j}, \quad \varepsilon_{i j} \sim \ndist\left(0, \sigma^{2}\right)
$$
ANOVA works by making a [[Linear Regression]] model, fitting it to the observed means, then measuring the amount of [[Variance]] explained by this model. If enough variation is explained, there's a significant difference in the groups means.

ANOVA has 2 subsections, just like two-sample situations:
- [[One-way ANOVA]]: When the groups are assumed independent of each other.
- [[Two-way ANOVA]]: When the groups are paired, meaning the same observational units (e.g. people) are used in all the groups.

## Assumptions
The assumptions for the an ANOVA model is:
1. The observations comes from a [[Normal distribution]] within each group
2. The variance $\sigma^{2}$ is the same for all groups (Variance homogeneity)

# Terminology
**Treatments:** aka. Groups, is the things, being compared.

# References
- [[Introduction to Mathematical Statistics - 02403]]