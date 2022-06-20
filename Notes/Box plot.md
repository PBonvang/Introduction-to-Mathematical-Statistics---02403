---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Data visualisation]]
****
<span class="centerImg">![[BoxPlotDiagram.png|250]]</span>
The standard/default box plot shows the max, min, [[Inter Quartile Range - IQR|IQR]] and [[Median]] of the dataset.

In the modified box plot usually used and implemented by libraries, observations outside $1.5\*\op{IQR}$ is visualized as dots and the min and max is then set as $1.5\*\op{IQR}$.
<span class="centerImg">![[ModifiedBoxplotDiagram.png]]</span>

# In R
```R
boxplot(x, main="TITLE")
```

**Basic histogram:** Set the `range` argument to 0, to get a basic histogram.

**Add text to the quantiles:** Add following
```R
text(1.3, quantile(x), c("Minimum","Q1","Median","Q3","Maximum"))
```

# References
- [[Introduction to Mathematical Statistics - 02403]]