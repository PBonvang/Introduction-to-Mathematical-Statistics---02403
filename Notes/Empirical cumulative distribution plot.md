---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Data visualisation]]
****
<span class="centerImg">![[ECDFExample.png]]</span>
The empirical cumulative distribution is simply adding the next frequency to the cumulative value each step, often providing a good indication of the balance of the distribution.

# In R
`plot(ecdf(x), verticals=TRUE)`

# References
- [[Introduction to Mathematical Statistics - 02403]]