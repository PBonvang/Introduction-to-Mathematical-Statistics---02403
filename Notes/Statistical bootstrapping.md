---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]], [[Statistical simulation]]
****

When determining the [[Confidence interval]] for a unknown parameter we assume that the distribution is [[Normal distribution|normal]], however for small sample sizes ($n<30$) this cannot be assumed.
In principle there's two approaches for solving to this problem:
1. Select a different and more suitable distribution for the population/system
2. Not assuming any distribution at all

Bootstrapping is a simulation method, which essentially simulates many samples, there's 2 versions:
1. [[Parametric bootstrapping]]: Simulate multiple samples from the assumed distribution.
2. [[Non-parametric bootstrapping]]: simulate multiple samples directly from the data (Not assuming a distribution).

Bootstrap is a general simulation tool, to estimate non-normal and non-t distribution features which isn't possible to determine with existing theorems. 

# References
- [[Introduction to Mathematical Statistics - 02403]]