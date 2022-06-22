---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Analysis of Variance - ANOVA|ANOVA]]
****
$$\large
\begin{array}{|c|ccc|}
\hline & \mathrm{Block}_{1} & \ldots & \mathrm{Block}_{l} \\
\hline \mathrm{Treatment}_{1} & y_{11} & \ldots & y_{1, l} \\
\vdots & \vdots & \ldots & \vdots \\
\mathrm{Treatment}_{k} & y_{k, 1} & \ldots & y_{k, l} \\
\hline
\end{array}
$$


Where [[One-way ANOVA]] assumes the groups to be independent, two-way ANOVA assumes that the same observational units are used for every treatment/group.
This is the extension of [[Paired statistics]], where paired refers to two, meaning only two groups are compared, two-way ANOVA compares multiple groups/treatments using the same block.

Generally the two-way is preferred over the one-way version, as the two way isn't influenced by unit-unit (person-person) variability caused by gender, age, weight... as each treatment is tried on the same block. It might take a little longer to do this type as the treatments must be spaced out in time, to avoid one effecting the test result of another.

In block design all units receive the same treatments, so to ensure that one treatment isn't effecting the other, it's recommended to randomize the order of which each unit (e.g. patient) receives the treatments. This design is called *Randomized block design*.

# Model
$$\large
Y_{i j}=\mu+\alpha_{i}+\beta_{j}+\varepsilon_{i j}, \quad \varepsilon_{i j} \sim \ndist\left(0, \sigma^{2}\right)
$$
$\boldsymbol\mu:$ Overall/General mean
$$\hat{\mu} =\bar{\bar{y}}=\frac{1}{k \cdot l} \sum_{i=1}^{k} \sum_{j=1}^{l} y_{i j}$$

$\boldsymbol\a_i:$ Treatment effect/Treatment deviation from general mean
$$\begin{align*}
\hat{\alpha}_{i} &=\left(\frac{1}{l} \sum_{j=1}^{l} y_{i j}\right)-\hat{\mu}\\
&=\hat\mu_{i\cdot}-\hat\mu
\end{align*}$$

$\boldsymbol\beta_i:$ Block effect/Block deviation from general mean
$$\begin{align*}
\hat{\beta}_{j} &=\left(\frac{1}{k} \sum_{i=1}^{k} y_{i j}\right)-\hat{\mu}\\
&=\hat{\mu}_{\cdot j}-\hat\mu
\end{align*}$$
$\boldsymbol\varepsilon_{ij}:$ Error term

# Variability decomposition
````ad-tip
title: Theorem 8.20 <br> Variation decomposition
collapse: open

The total sum of squares $(S S T)$ can be decomposed into sum of squared errors $(S S E)$, treatment sum of squares $(S S(T r))$, and a block sum of squares $(S S(B l))$
$$\begin{align*}
\underbrace{\sum_{i=1}^{k} \sum_{j=1}^{l}\left(y_{i j}-\hat{\mu}\right)^{2}}_{\text {SST }}&=\underbrace{\sum_{i=1}^{k} \sum_{j=1}^{l}\left(y_{i j}-\hat{\alpha}_{i}-\hat{\beta}_{j}-\hat{\mu}\right)^{2}}_{\text {SSE }}+\underbrace{l \cdot \sum_{i=1}^{k} \hat{\alpha}_{i}^{2}}_{\text {SS(Tr) }}+\underbrace{k \cdot \sum_{j=1}^{l} \hat{\beta}_{j}^{2}}_{\mathrm{SS}(\mathrm{Bl})}\\
&=\underbrace{\sum_{i=1}^{k} \sum_{j=1}^{l}\left(y_{i j}-\bar{y}_{i \cdot}-\bar{y}_{\cdot j}+\hat\mu\right)^{2}}_{\text {SSE }}+\underbrace{l \cdot \sum_{i=1}^{k}\left(\bar{y}_{i \cdot}-\hat\mu\right)^{2}}_{\mathrm{SS}(\mathrm{Tr})}+\underbrace{k \cdot \sum_{j=1}^{l}(\bar{y}_{\cdot j}-\hat\mu)^{2}}_{S S(B l)}
\end{align*}$$

Expressed in short form
$$
SST = SSE + SS(Tr) + SS(Bl)
$$
````
^theorem8-20

Note that SST and SS(Tr) is identical in [[One-way ANOVA#Variability decomposition|one-way ANOVA]].

# Hypothesis testing
````ad-tip
title: Theorem 8.22 <br> F-test
collapse: open

Under the null hypothesis that there's no difference in effect between the treatments
$$
H_{0, T r}: \quad \alpha_{i}=0, \quad i=1,2, \ldots, k
$$
the test statistic
$$
F_{T r}=\frac{\operatorname{SS}(T r) /(k-1)}{\operatorname{SSE} /((k-1)(l-1))}=\frac{\op{MS}(Tr)}{\op{MSE}}
$$
follows an $F$-distribution with $k-1$ and $(k-1)(l-1)$ degrees of freedom. Further, under the null hypothesis that there's no difference between variation in the different blocks
$$
H_{0, B l}: \quad \beta_{j}=0, \quad j=1,2, \ldots, l,
$$
the test statistic
$$
F_{B l}=\frac{S S(B l) /(l-1)}{S S E /((k-1)(l-1))}=\frac{\op{SS}(Bl)}{\op{MSE}}
$$
follows an $F$-distribution with $l-1$ and $(k-1)(l-1)$ degrees of freedom.

````
^theorem8-22

**Two-way MSE:**
$$MSE=\frac{SSE}{(k-1)(l-1)}$$

# Two-way ANOVA table
$$
\begin{array}{|l|c|c|l|c|c|}
\hline \begin{array}{l}
\text { Source of } \\
\text { variation }
\end{array} & \begin{array}{l}
\text { Degrees of } \\
\text { freedom }
\end{array} & \begin{array}{l}
\text { Sums of } \\
\text { squares }
\end{array} & \begin{array}{l}
\text { Mean sums of } \\
\text { squares }
\end{array} & \begin{array}{l}
\text { Test } \\
\text { statistic } F
\end{array} & \begin{array}{l}
p
\text {-value }
\end{array} \\
\hline \text { Treatment } & k-1 & S S(T r) & M S(T r)=\frac{S S(T r)}{k-1} & F_{T r}=\frac{M S(T r)}{M S E} & P\left(F>F_{T r}\right) \\
\hline \text { Block } & l-1 & S S(B l) & M S(B l)=\frac{S S(B l)}{l-1} & F_{B l}=\frac{M S(B I)}{M S E} & P\left(F>F_{B l}\right) \\
\hline \text { Residual } & (l-1)(k-1) & S S E & M S E=\frac{S S E}{(k-1)(l-1)} & & \\
\hline \text { Total } & n-1 & S S T & & & \\
\hline
\end{array}
$$

# Post hoc comparisons
Two way post hoc investigation uses the same approach and principles as [[One-way ANOVA#Post hoc comparisons|one-way ANOVA]] post hoc, with the following differences:
1. Use the two-way MSE and/or SSE instead of the one-way
2. Use $(l-1)(k-1)$ degrees of freedom for the [[F-distribution]] instead

```ad-summary
title: Method <br> Two-way post hoc pairwise confidence intervals
collapse: open

A single pre-planned $(1-\alpha) \cdot 100 \%$ confidence interval for the difference between treatment $i$ and $j$ is found as
$$
\bar{y}_{i}-\bar{y}_{j} \pm t_{1-\alpha / 2} \sqrt{M S E\left(\frac{1}{n_{i}}+\frac{1}{n_{j}}\right)}=\bar{y}_{i}-\bar{y}_{j}\pm\op{LSD},
$$
where $t_{1-\alpha / 2}$ is based on the $t$-distribution with $(k-1)(l-1)$ degrees of freedom.
If all $M=k(k-1) / 2$ combinations of pairwise confidence intervals are calculated using the formula $M$ times, the [[Bonferroni correction]] should be used $\alpha_{\text {Bonferroni }}=\alpha / M$
```

**LSD:** [[Least Significant Difference - LSD]]

```ad-summary
title: Method <br> Two-way post hoc pairwise hypothesis tests
collapse: open

A single pre-planned level $\alpha$ hypothesis tests
$$
H_{0}: \mu_{i}=\mu_{j}, \quad H_{1}: \mu_{i} \neq \mu_{j},
$$
is carried out by
$$
t_{\mathrm{obs}}=\frac{\bar{y}_{i}-\bar{y}_{j}}{\sqrt{\operatorname{MSE}\left(\frac{1}{n_{i}}+\frac{1}{n_{j}}\right)}},
$$
and
$$
p \text {-value }=2 \cdot P\left(T>\left|t_{\mathrm{obs}}\right|\right),
$$
where the $t$-distribution with $(k-1)(l-1)$ degrees of freedom is used.
If all $M=k(k-1) / 2$ combinations of pairwise hypothesis tests are carried out use the approach $M$ times but each time with [[Bonferroni correction|Bonferroni corrected]] test level $\alpha_{\text {Bonferroni }}=\alpha / M$
```

# Model control
Two-way model control uses the same approach and principles as [[One-way ANOVA#Assumptions Model control|One-way ANOVA]] with the slight difference that the variance homegenity is verified by making a box plot of the residuals instead of the data.

**Variance homegenity check:**
```R
par(mfrow=c(1,2))
plot(D$treatm, fit$residuals, xlab="Treatment", ylab="Residuals")
plot(D$block, fit$residuals, xlab="Block", ylab="Residuals")
```
# In R
```R
D <- data.frame(treatm, block, y)
fit <- lm(y ~ treatm + block, data=D)
anova(fit)
```
See how the table values are calculated here: [[#Two-way ANOVA table]].
# Terminology
**Block:** Block refers to a observational unit (e.g. people) used for the different treatments, when the same observation unit is used for every treatment. Comes from agriculture, where a block was an actual piece of land. But a block can also be a class, or another group of observational units.
Generally used to avoid variability between test subjects/observational units effecting the results of a study without our knowledge.

**Randomized Block design:** Randomizing the order of which each unit (e.g. patient) receives the treatments.

# Examples
````ad-example
title: Example 8.19, 8.21, 8.23, 8.24 <br> Two-way ANOVA
collapse: open

**Ex 8.19:**
$$
\begin{array}{|l|c|c|c|}
\hline & \text { Group A } & \text { Group B } & \text { Group C } \\
\hline \text { Block 1 } & 2.8 & 5.5 & 5.8 \\
\text { Block 2 } & 3.6 & 6.3 & 8.3 \\
\text { Block 3 } & 3.4 & 6.1 & 6.9 \\
\text { Block 4 } & 2.3 & 5.7 & 6.1 \\
\hline
\end{array}
$$

```R
y <- c(
    2.8, 3.6, 3.4, 2.3,
    5.5, 6.3, 6.1, 5.7,
    5.8, 8.3, 6.9, 6.1
)
treatm <- factor(c(
    1, 1, 1, 1,
    2, 2, 2, 2,
    3, 3, 3, 3
))
block <- factor(c(
    1, 2, 3, 4,
    1, 2, 3, 4,
    1, 2, 3, 4
))

# Parameters
mu <- mean(y)
alpha <- tapply(y, treatm, mean) - mu
beta <- tapply(y, block, mean) - mu
mu
[1] 5.233333

alpha
         1          2          3 
-2.2083333  0.6666667  1.5416667

beta
         1          2          3          4 
-0.5333333  0.8333333  0.2333333 -0.5333333
```

**Ex 8.21 - Variability decomposition:**
```R
k <- 3
l <- 4
SSBl <- k * sum(beta^2)
SSTr <- l * sum(alpha^2)
SST <- sum((y - mu)^2)
SSE <- SST - SSTr - SSBl
c(SST, SSE, SSTr, SSBl)

[1] 35.986667  1.241667 30.791667  3.953333
```

**Ex 8.23 - Hypothesis testing:**
```R
# Test statistics
Ftr <- SSTr / (3 - 1) / (SSE / ((3 - 1) * (4 - 1)))
Fbl <- SSBl / (4 - 1) / (SSE / ((3 - 1) * (4 - 1)))
c(Ftr, Fbl)
[1] 74.395973  6.367785

# p-values
pv.tr <- 1 - pf(Ftr, df1 = 3 - 1, df2 = (3 - 1) * (4 - 1))
pv.bl <- 1 - pf(Fbl, df1 = 4 - 1, df2 = (3 - 1) * (4 - 1))
c(pv.tr, pv.bl)
[1] 0.0000582383 0.0270483378
```

Or in R:
```R
D <- data.frame(treatm, block, y)
fit <- lm(y ~ treatm + block, data=D)
anova(fit)
Analysis of Variance Table

Response: y
          Df  Sum Sq Mean Sq F value    Pr(>F)    
treatm     2 30.7917 15.3958 74.3960 5.824e-05 ***
block      3  3.9533  1.3178  6.3678   0.02705 *  
Residuals  6  1.2417  0.2069
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```
As seen in the p-values, at least one treatment seems to have be significantly different. Likewise at least one block seems be significantly different on a 5% confidence level.

**8.24 - Post hoc investigation:**
We now wish to determine which of the treatments that are significantly different.
To do so we determine the 95%-confidence intervals between the treatments:
With $M=3\cdot2/2=3$ possible combinations and the [[Statistical significance|Significance level]] $\alpha=0.05$, the [[Bonferroni significance]] is $\alpha_{\text {Bonferroni }}=0.05 / 3=0.017$.
and the confidence intervals are thus:
```R
alphaBonf <- 0.05/3

# A vs. B
alpha[1] - alpha[2] + c(-1, 1) *
qt(1-alphaBonf/2, df = 6) * sqrt(SSE/6 * (1/4 + 1/4))
[1] -3.932 -1.818

# A vs. C
alpha[1] - alpha[3] + c(-1, 1) *
qt(1-alphaBonf/2, df = 6) * sqrt(SSE/6 * (1/4 + 1/4))
[1] -4.807 -2.693

# B vs. C
alpha[2] - alpha[3] + c(-1, 1) *
qt(1-alphaBonf/2, df = 6) * sqrt(SSE/6 * (1/4 + 1/4))
[1] -1.9325 0.1825
```
We can conclude that treatment A is significantly different from B and C as the confidence intervals doesn't including 0, when A is being compared.
````
^example8-19

````ad-example
title: Example 8.26 <br> Car tires
collapse: open



In a study of 3 different types of tires ("treatment") effect on the fuel economy, drives of $1000 \mathrm{~km}$ in 4 different cars ("blocks") were carried out. The results are listed in the following table in $\mathrm{km} / \mathrm{l}$.

$$
\begin{array}{|l|rrrr|r|}
\hline & \text { Car 1 } & \text { Car 2 } & \text { Car 3 } & \text { Car 4 } & \text { Mean } \\
\hline \text { Tire 1 } & 22.5 & 24.3 & 24.9 & 22.4 & 22.525 \\
\text { Tire 2 } & 21.5 & 21.3 & 23.9 & 18.4 & 21.275 \\
\text { Tire 3 } & 22.2 & 21.9 & 21.7 & 17.9 & 20.925 \\
\hline \text { Mean } & 21.400 & 22.167 & 23.167 & 19.567 & 21.575 \\
\hline
\end{array}
$$

Let us analyse these data with a two-way ANOVA model, but first some explorative plotting:
```R
# Collecting the data in a data frame
D <- data.frame(
    y = c(
        22.5, 24.3, 24.9, 22.4,
        21.5, 21.3, 23.9, 18.4,
        22.2, 21.9, 21.7, 17.9
    ),
    car = factor(c(1, 2, 3, 4, 1, 2, 3, 4, 1, 2, 3, 4)),
    tire = factor(c(1, 1, 1, 1, 2, 2, 2, 2, 3, 3, 3, 3))
)
par(mfrow = c(1, 2))
plot(D$tire, D$y, xlab = "Tire", ylab = "y")
plot(D$car, D$y, xlab = "Car", ylab = "y")
```
<span class="centerImg">![[TwoWayANOVACarTiresExampleBarPlot.png]]</span>

```R
fit <- lm(y ~ car + tire, data=D)
anova(fit)
Analysis of Variance Table

Response: y
          Df  Sum Sq Mean Sq F value  Pr(>F)  
car        3 25.1758  8.3919  7.0258 0.02173 *
tire       2 15.9267  7.9633  6.6670 0.02989 *
Residuals  6  7.1667  1.1944
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

**Conclusion:** Tires (treatments) are significantly different and Cars (blocks) are significantly different.

**Model control:**
Normality:
```R
qqnorm(fit$residuals)
qqline(fit$residuals)
```
<span class="centerImg">![[TwoWayANOVACarTiresExampleQQPlot.png]]</span>

Looks fine.

Variance homogeneity:
```R
par(mfrow=c(1,2))
plot(D$car, fit$residuals, xlab="Car", ylab="Residuals")
plot(D$tire, fit$residuals, xlab="Tire", ylab="Residuals")
```
<span class="centerImg">![[TwoWayANOVACarTiresExampleResidualPlot.png]]</span>
The variance betwwen Car 2 and 3 might seem differenct, but it's somewhat axpected with such a small sample sice, we therefore conclude that there's no important deviations from the model assumptions.

**Post hoc analysis:**
Treatment means:
```R
t_means <- tapply(D$y, D$tire, mean)
     1      2      3 
23.525 21.275 20.925
```
Bonferroni corrected LSD:
```R
LSD_bonf <- qt(1-0.05/6, df=6) * sqrt(2*1.19/4)
LSD_bonf
[1] 2.535819
```
So the tires are significantly different if they differ more than $\pm2.54$ from each other, which 1 and 3 does. Thus there's a significant difference between 3 and one, but we cannot say that any of them are different from 2.
````
^example8-26

# References
- [[Introduction to Mathematical Statistics - 02403]]