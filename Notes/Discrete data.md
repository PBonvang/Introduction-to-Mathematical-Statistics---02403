---
aliases: [Discrete random variables, Categorical variables, Categorical data] # Searchable synonyms and translations
cssclass: clean-embeds
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]]
****

![[Contingency Tables#^ContingencyTable]]

Categorical/Discrete data is as the name suggest data with a finite set of categories/values.
It could be the grades for a given group of students, the country of origin for some group of people and so on.
Categorical data is generally observations from a discrete [[Random variable]], e.g. the outcome of a die, the outcome of picking a card...

In statistics, categorical data is a little different to "normal" continuous data.
For example: For continuous data the standard error refers to the uncertainty of exactly one value, and confidence intervals are thus a range which the true value is expected to be in.
But that doesn't really work for categorical data, either it's in a category or not.

For categorical data the statistics therefore usually refers to the proportions of the observed/sampled data, and the certainty of those estimates.

# Common tasks
**Determining the true probability and its uncertainty of some data being in a category/having a specific value:**
- For a single group: [[Discrete proportion estimate and confidence interval]]

**Hypothesis testing:**
- [[Discrete hypothesis testing]]

**Determine sample size:**
- [[Discrete sample size determination]]

# In R
`factor`: Factor makes R consider the values as grouped variables (factors) instead of normal numerical values.

`tapply(data, treatm, func)`: tapply applies the function `func` to the discrete data  `data` which is mapped into the groups by `treatm`.

See [[One-way ANOVA#^example8-1|Ex. 8.1]].
# References
- [[Introduction to Mathematical Statistics - 02403]]