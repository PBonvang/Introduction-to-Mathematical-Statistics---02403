Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Data visualisation]], [[Statistics]]
****
<span class="centerImg">![[ExampleHistogram.png|350]]</span>
A histogram depicts the [[Frequency distribution]] in a bar plot. The default histogram uses the same interval size for each bin.

# In R
```R
hist(x)
```

**Making it a density histogram:**
```R
hist(x, prop=TRUE, nclass=8)
```

# References
- [[Introduction to Mathematical Statistics - 02403]]