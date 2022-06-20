---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Probability]], [[Joint probability]], [[Random variable]]
****

Two [[Random variable|random variables]] are independent if, they aren't dependent on each other. Meaning that the outcome of one variable isn't influenced by the other.
Therefore their [[Joint probability density function]] is equal to:
$$\begin{align*}
\P(X=x, Y=y)&=\P(X=x) \cdot \P(Y=y)\tag{Discrete}\\
f(x,y)&=f(x)\cdot f(y)\tag{Continuous}
\end{align*}$$
If this isn't true, the variables aren't independent.

In practice this means that we need to know the sampling procedure, ensuring our observational units aren't related, e.g. if measuring average height, our sample humans must not come from the same family, else they are considered dependent. 

# Properties
**[[Mean]] / [[Expectation]]:**
$$
\mathrm{E}(X Y)=\mathrm{E}(X) \mathrm{E}(Y)
$$

```ad-info
title: Proof
collapse: close

$$
\begin{aligned}
\mathrm{E}(X Y) &=\iint x y f(x, y) d x d y=\iint x y f(x) f(y) d x d y \\
&=\int x f(x) d x \int y f(y) d y=\mathrm{E}(X) \mathrm{E}(Y)
\end{aligned}
$$

```

**[[Covariance]]:**
$$\op{Cov}(X,Y)=0$$
Note that this is only one way, if two variables have a covariance of 0 they aren't necessarily independent. However if they also follow a [[Bivariate normal distribution]] they are independent.

```ad-info
title: Proof
collapse: close

$$
\begin{aligned}
\operatorname{Cov}(X, Y) &=\mathrm{E}[(X-\mathrm{E}(X))(Y-\mathrm{E}(Y))] \\
&=\mathrm{E}[X Y]-\mathrm{E}[\mathrm{E}(X) Y]-\mathrm{E}[X \mathrm{E}(Y)]+\mathrm{E}(X) \mathrm{E}(Y) \\
&=0
\end{aligned}
$$
```
If the random variables $X_1,...,X_n$ are both independent and identically distributed (I.I.D) then:
$$
\operatorname{Cov}\left(\overline{X}, X_{i}-\overline{X}\right)=0
$$

```ad-info
title: Proof
collapse: close

$$
\begin{aligned}
\operatorname{Cov}\left(\bar{X}, X_{i}-\bar{X}\right) &=\operatorname{Cov}\left(\bar{X}, X_{i}\right)-\operatorname{Cov}(\bar{X}, \bar{X}) \\
&=\frac{1}{n} \sigma^{2}-\frac{1}{n^{2}} \operatorname{Cov}\left(\sum X_{i}, \sum X_{i}\right) \\
&=\frac{1}{n} \sigma^{2}-\frac{1}{n^{2}} n \sigma^{2}=0
\end{aligned}
$$
```

# Independence for [[Discrete data|Categorical variables]]
````ad-tip
title: Theorem 7.24 <br>
collapse: open

To test if two categorical variables are independent the null hypothesis
$$
H_{0}: p_{i j}=p_{i .} p_{. j} \text { for all } i, j
$$
Where $p_{i .}=\sum_{j=1}^{c} p_{i j}$ is the proportion of row $i$ and $p_{. j}=\sum_{i=1}^{r} p_{i j}$ is the proportion of column $j$, is tested.

The $p$-value for the observed result under this null hypothesis is calculated using the $\chi^{2}$ test statistic from [[Contingency tables#^method7-22|Method 7.22]].
````
^theorem7-24

````ad-example
title: Example 7.25 <br>
collapse: open



A group of 400 students have had an English test and a mathematics test. The results of each test a categorized as either bad, average or good.
$$\begin{array}{|l|c|c|c|c|}
\hline \text{English\\Mathematics}
& Bad & Average & Good & Row total \\
\hline Bad & 23 & 60 & 29 & 112 \\
Average & 28 & 79 & 60 & 167 \\
Good & 9 & 49 & 63 & 121 \\
\hline Column total & 60 & 188 & 152 & 400 \\
\hline
\end{array}$$

We want to test the hypothesis of independence between results in English and mathematics.
```R
results <- matrix(c(23, 60, 29, 28, 79, 60, 9, 49, 63),
    ncol = 3,
    byrow = TRUE
)
colnames(results) <- c("MathBad", "MathAve", "MathGood")
rownames(results) <- c("EngBad", "EngAve", "EngGood")

# Percentages
prop.table(results)
        MathBad MathAve MathGood
EngBad   0.0575  0.1500   0.0725
EngAve   0.0700  0.1975   0.1500
EngGood  0.0225  0.1225   0.1575

# Row totals
margin.table(results, 1)
 EngBad  EngAve EngGood 
    112     167     121
	
# Column totals
margin.table(results, 2)
 MathBad  MathAve MathGood 
      60      188      152
```

We now need to determine the expected cell counts under $H_{0}$. As we are checking for independence it means that the joint probability is equal to the product of their individual probabilities, e.g:
$$
p_{33}=P(\text { "Good English and Good Maths" })=P(\text { "Good English" }) \cdot P(\text { "Good Maths") }
$$
From the sample we would estimate
$$
\hat{p}_{33}=\left(\frac{121}{400}\right) \cdot\left(\frac{152}{400}\right)
$$

Which means that we would expect out of 400 students
$$
e_{33}=400 \cdot \hat{p}_{33}=400 \cdot\left(\frac{121}{400}\right) \cdot\left(\frac{152}{400}\right)=121 \cdot \frac{152}{400}=45.98
$$
to be in the Good-Good (3,3) cell.
This results in the following table:


$$
\begin{array}{|l|l|l|l|}
\hline \text { English\\Math } & \text { Bad } & \text { Average } & \text { Good } \\
\hline \text { Bad } & o_{11}=23 & o_{12}=60 & o_{13}=29 \\
& e_{11}=16.80 & e_{12}=52.64 & e_{13}=42.56 \\
\hline \text { Average } & o_{21}=28 & o_{22}=79 & o_{23}=60 \\
& e_{21}=25.05 & e_{22}=78.49 & e_{23}=63.46 \\
\hline \text { Good } & o_{31}=9 & o_{32}=49 & o_{33}=63 \\
& e_{31}=18.15 & e_{32}=56.87 & e_{33}=45.98 \\
\hline
\end{array}
$$
```R
chi <- chisq.test(results, correct = FALSE)
chi

        Pearson's Chi-squared test

data:  results
X-squared = 20.179, df = 4, p-value = 0.0004604

# Expected values
chi$expected
        MathBad MathAve MathGood
EngBad    16.80   52.64    42.56
EngAve    25.05   78.49    63.46
EngGood   18.15   56.87    45.98
```
As the p-value$<\alpha$ with a significance level $\alpha=0.05$ (95%) we can reject the hypothesis that the grades betwwen the two subjects are independent.

````
^example7-25
# References
- [[Introduction to Mathematical Statistics - 02403]]