---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: [#MOC]
Subjects: [[Statistics]], [[Hypothesis testing]]
****
A confidence interval is range which with some certainty/[[Statistical significance|Significance level]] includes the true value of an estimate.
A common use case is the certainty of a discrete mean: [[Discrete proportion estimate and confidence interval]].
But the way a confidence interval is defined depends on the study. Confidence intervals are a central part of [[Hypothesis testing]], and you'll therefore find the definition of various types of confidence intervals under [[Hypothesis testing]].

# Overlapping confidence intervals
To quickly check if two samples overlap is to plot the samples means with their 95% confidence interval in a bar plot:
```R
# The confidence intervals and joining the lower and upper limits
CIA <- t.test(xA)$conf.int
CIB <- t.test(xB)$conf.int
lower <- c(CIA[1], CIB[1])
upper <- c(CIA[2], CIB[2])

# First install the package with: install.packages("gplots")
library(gplots)
barplot2(c(mean(xA),mean(xB)), plot.ci=TRUE, ci.l=lower, ci.u=upper,
col = 2:3)
```
<span class="centerImg">![[OverlappingConfidenceIntervalVisualization.png]]</span>

Note that if the confidence intervals doesn't overlap the two groups are significantly different, but if they do we cannot say if they're true means are different. For that use the [[Two-sample hypothesis testing#^method3-51|Two sample test method]]

# References
- [[Introduction to intelligent systems - 02461]]
- [[Introduction to Mathematical Statistics - 02403]]