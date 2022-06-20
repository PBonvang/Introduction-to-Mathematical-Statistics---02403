---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]], [[Two-sample hypothesis testing]]
****

In statistics two experiments done on the same observational units/group is considered paired, as we'd expect the same type of variance coming from the same unit. Also called dependent samples.
Paired statistics is [[Two-way ANOVA]] with two treatments.

Ex: In a drug study the same 10 people (observational units) first try drug A, then in a later experiment drug B. These two samples are considered paired as the sample variance of each of the samples is expected to be the same.

Ex: is comparing the temperature in Copenhagen (observational unit) now vs 20 years ago. The experiments consist of 12 datapoints, 1 for each month. To compare the two samples correctly we must note that the seasons plays a big role in the temperatures, we're therefore not interested in comparing the samples parameters but rather the difference between the two samples, as we'd then account for the seasonal changes.

To do paired statistics we always look at the difference between the two samples and use one-sample tools for the statistics.
$$\op{var}(\op{pair})=\op{var}(x_{1}-x_{2})$$

# In R
```R
t.test(x1, x2, paired = TRUE)
```

# References
- [[Introduction to Mathematical Statistics - 02403]]