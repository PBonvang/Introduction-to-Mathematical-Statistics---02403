---
aliases: [Quantile, Percentile, Fraktiler] # Searchable synonyms and translations
---

Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]]
****

**Quantiles** provide is a number which a subset of a ordered dataset is, or is below, usually provided as **percentiles** which simply, separates the set into a 100 subsection, giving you the percentage of the dataset.
The 60'th percentile is the 0.6 quantile and will provide a value which 60 % of the datasets values is or is below, providing an idea of the distribution of the dataset.
If the 90'th percentile is much lower than the 100'th percentile, it therefore indicated that there's a lot of extreme points in the dataset.

**Quartiles** are the quarter percentiles: 0% (Min.), 25% (Lower), 50% ([[Median]]), 75% (Upper) and 100% (Max.).
Denoted: $q_{0}, q_{0.25}, q_{0.50}, q_{0.75} \text { and } q_{1}$
^Quartiles

# Procedure
1. Order the $n$ observations from ascending
2. Compute $pn$ ($p$ is the percentage of the dataset wanted e.g. 0.25 for a quarter)
3. Determine the quantile $q_{p}$:
	1. If $pn$ is an integer:
		$$\large q_{p}=\frac{x_{(n p)}+x_{(n p+1)}}{2}$$
	2. Else:
		$$\large q_{p}=x_{(\lceil n p\rceil)}$$

# Programming implementation
**R:** 
```R
quantile(x, props=0.25 type=2)
```

# References
- [[Introduction to intelligent systems - 02461]]
- [[Introduction to Mathematical Statistics - 02403]]