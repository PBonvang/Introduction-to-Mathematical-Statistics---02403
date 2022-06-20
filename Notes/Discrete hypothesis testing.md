---
aliases: [Comparing proportions, Chi-square test, Proportional hypothesis testing, Categorical hypothesis testing] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]], [[Discrete data]], [[Hypothesis testing]]
****
![[Contingency Tables#^ContingencyTable]]

In general when comparing several groups the hypothesis is that the distribution is the same in each group:
$$
H_{0}: p_{i 1}=p_{i 2}=\ldots=p_{i c}=p_{i}, \text { for all rows } i=1,2, \ldots, r
$$
which means the hypothesis is that the probability of obtaining an outcome in a row/category doesn't depend on the given group/column. 

To test this hypothesis we need to calculate the expected number in each cell under $H_{0}$:
$$
e_{i j}=\frac{\left(i^{\prime} \text { th row total }\right) \cdot\left(j^{\prime} \text { th column total }\right)}{(\text {Grand total})}
=n_{j} \cdot \frac{o_{i}}{n}
$$

```ad-summary
title: Method 7.22 <br> The $r\times c$ frequency table $\chi^{2}$-test
collapse: open

Requirement: all $e_{ij}\ge5.$

For an $r \times c$ table the hypothesis
$$
H_{0}: p_{i 1}=p_{i 2}=\ldots=p_{i c}=p_{i}, \text { for all rows } i=1,2, \ldots, r,
$$
is tested using the test statistic
$$
\chi_{\text {obs }}^{2}=\sum_{i=1}^{r} \sum_{j=1}^{c} \frac{\left(o_{i j}-e_{i j}\right)^{2}}{e_{i j}} .
$$
where $o_{i j}$ is the observed number in cell $(i, j)$ and $e_{i j}$ is the expected number in cell $(i, j)$. This test statistic should be compared with the $\chi^{2}$-distribution with $(r-1)(c-1)$ degrees of freedom and the hypothesis is **rejected** at significance level $\alpha$ if
$$
\chi_{\mathrm{obs}}^{2}>\chi_{1-\alpha}^{2}((r-1)(c-1))
$$

\* o for observation
\* e for expectation
```
^method7-22

**P-value**:
$$p\text{-value}=\P(\chi^{2}>|\chi^{2}_\text{obs}|)$$
where $\chi^2$ follows a [[Chi-square distribution]] with $(r-1)(c-1)$ degrees of freedom.
```R
1 - pchisq(chi_obs, df = (r-1)(c-1))
```

# Index
- [[Discrete proportion estimate and confidence interval]]
- [[Discrete hypothesis testing of one group]]
- [[Discrete binary hypothesis testing]]

# In [[R programming language|R]]
```R
# Print estimated probability of each cell
colnames(data) <- c("Col 1", ..., "Col c")
rownames(data) <- c("Row 1", ..., "Row r")

prop.table(data, 2)

# Hypothesis testing
chisq.test(data, correct = FALSE) # correct controls if continuity correction is applied

chisq.test(data, correct = FALSE)$expected # prints the expected cell values
```
# Examples
````ad-example
title: Example 7.23 <br>
collapse: open

3 opinion polls of 2 candidates, taken over time resulted in the following table:
$$
\begin{array}{|l|c|c|c|c|}
\hline & \text { 4 weeks before } & \text { 2 weeks before } & \text { 1 week before } & \text { Row total } \\
\hline \text { Candidate } 1 & 79 & 91 & 93 & 263 \\
\text { Candidate } 2 & 84 & 66 & 60 & 210 \\
\text { Undecided } & 37 & 43 & 47 & 127 \\
\hline \text { Column total } & 200 & 200 & 200 & 600 \\
\hline
\end{array}
$$
Each time asking 200 people.

Now to test the hypothesis that the votes are equally distributed,
$$
H_{0}: p_{i 1}=p_{i 2}=p_{i 3}, \text { for all rows } i=1,2,3
$$

We need to determine the expected number of votes under $H_{0}$, ex Candidate 2, week 2:
$$
e_{22}=\text { "2'nd column total" } \cdot \frac{\text { "2'nd row total" }}{\text { "grand total" }}=\frac{210 \cdot 200}{600}=70
$$

Which gives:
$$
\begin{array}{|l|c|c|c|}
\hline & \text { 4 weeks before } & 2 \text { weeks before } & \text { 1 week before } \\
\hline \text { Candidate 1 } & o_{11}=79 & o_{12}=91 & o_{13}=93 \\
& e_{11}=87.67 & e_{12}=87.67 & e_{13}=87.67 \\
\hline \text { Candidate 2 } & o_{21}=84 & o_{22}=66 & o_{23}=60 \\
& e_{21}=70.00 & e_{22}=70.00 & e_{23}=70.00 \\
\hline \text { Undecided } & o_{31}=37 & o_{32}=43 & 0_{33}=47 \\
& e_{31}=42.33 & e_{32}=42.33 & e_{33}=42.33 \\
\hline
\end{array}
$$
Just looking at the table it seems that 4 weeks befre candidate 1 had less votes than expected while 2 had more.

```R
poll <- matrix(c(79, 91, 93, 84, 66, 60, 37, 43, 47),
    ncol = 3,
    byrow = TRUE
)
colnames(poll) <- c("4 weeks", "2 weeks", "1 week")
rownames(poll) <- c("Cand1", "Cand2", "Undecided")
# Column percentages
colpercent <- prop.table(poll, 2)
colpercent
          4 weeks 2 weeks 1 week
Cand1       0.395   0.455  0.465
Cand2       0.420   0.330  0.300
Undecided   0.185   0.215  0.235

barplot(t(colpercent),
    beside = TRUE, col = 2:4, las = 1,
    ylab = "Percent each week", xlab = "Candidate",
    main = "Distribution of Votes"
)
legend(legend = colnames(poll), fill = 2:4, "topright", cex = 0.7)
```
<span class="centerImg">![[ContingencyTables_PollExampleBarChart.png]]</span>
From the plot it could seem that the support for candidate 2 decreased over time.

Now testing if these differences are statistically significant could be done using [[#^method7-22|Method 7.22]], or with the following R code:
```R
chi <- chisq.test(poll, correct = FALSE)
chi

        Pearson's Chi-squared test

data:  poll
X-squared = 6.962, df = 4, p-value = 0.1379

# Expected values
chi$expected

           4 weeks  2 weeks   1 week
Cand1     87.66667 87.66667 87.66667
Cand2     70.00000 70.00000 70.00000
Undecided 42.33333 42.33333 42.33333
```
As the found p-value$>\alpha$ for a significance level of $\alpha=0.05$ (95%).
There's therefore very weak evidence against the null hypothesis, and we must therefore accept it. Which means there's no evidence that the distribution change among the three polls.

````
^example7-23
# References
- [[Contingency Tables]]
- [[Introduction to Mathematical Statistics - 02403]]