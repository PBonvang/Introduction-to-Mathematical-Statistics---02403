---
aliases: [R] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]]
****

 <p align="center">
	<font size="9"><strong>R programming language</strong></font>
</p>

****

R is a programming language made for statisticians.

# Useful commands
## Summary
`summary(x)`
Provides a summary of the dataset by computing the [[Quantiles and percentiles#^Quartiles|quartiles]], describing the length of the dataset and so on.

```ad-example
<span class="centerImg">![[RSummaryExample.png|#invert]]</span>
```
# Useful snippets
## Removing rows with missing observations
```R
df[!apply(is.na(df),1,any)]
```
# References
- [[Introduction to Mathematical Statistics - 02403]]