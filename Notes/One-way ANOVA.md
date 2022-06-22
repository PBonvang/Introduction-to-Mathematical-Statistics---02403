---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Analysis of Variance - ANOVA|ANOVA]]
****
$$\large
\begin{array}{|c|ccc|}
\hline \operatorname{Treatment 1} & y_{11} & \cdots & y_{1, n_{1}} \\
\vdots & \vdots & \cdots & \vdots\\
\operatorname{Treatment k} & y_{k, 1} & \cdots & y_{k, n_{k}} \\
\hline
\end{array}
$$
$n=\sum_{i=1}^{k} n_{i}$
Note the number of observations $n_{i}$ in each group/treatment can vary from group to group.



To test the hypothesis ([[Analysis of Variance - ANOVA#Purpose|ANOVA purpose 1]]) we slightly modify the model:
$$
Y_{i j}=\mu+\a_{i}+\varepsilon_{i j}, \quad \varepsilon_{i j} \sim \ndist\left(0, \sigma^{2}\right)
$$
so $\mu$ is the overall mean (across all groups) and $\alpha_{i}= \mu_{i}-\mu$. The individual group mean is thus $\mu_{i}=\mu + \a_{i}$
The null hypothesis then becomes that the distance to the general mean is 0 for every group:
$$
H_{0}: \alpha_{1}=\cdots=\alpha_{k}=0
$$
<span class="centerImg">![[ANOVAConceptualizationPlot.png|350]]</span>
<center>White dots: Observations in group/treatment. Blue: The groups deviation from general mean. Blue line: General sample mean.</center>

# Model
$$\large
Y_{i j}=\mu+\a_{i}+\varepsilon_{i j}, \quad \varepsilon_{i j} \sim \ndist\left(0, \sigma^{2}\right)
$$
$\mu:$ General/Overall mean
$$\large\hat{\mu}=\bar{y} =\frac{1}{n} \sum_{i=1}^{k} \sum_{j=1}^{n_i} y_{i j}$$

$\boldsymbol\a_i:$ Treatment effect/Treatment deviation from general mean
$$\large\begin{align*}
\hat{\alpha}_{i} &=\left(\frac{1}{n_{i}} \sum_{j=1}^{n_{i}} y_{i j}\right)-\hat{\mu}\\
&=\hat{\mu}_{i}-\hat\mu
\end{align*}$$
$\boldsymbol\varepsilon_{ij}:$ Error term

# Variability decomposition
In one-way ANOVA the overall [[variability]] (measured by the total variation) decomposes into interpretable components which are used for e.g. [[Discrete hypothesis testing|hypothesis testing]].

$$SST = (n-1)\cdot\op{V}(X)$$
$n:$ Total sample size / The sum of observations from each group.
$\op{V}(X):$ The total variance / The variance of all the observations.

The total variation (SST) in this instance is the variation calculated across all the data, ignoring the fact that data belongs to different groups. Which can be decomposed into two components:
1. SSE: The average variation within the groups/treatments
	1. As each observation $y_{ij}$ is compared to the mean of it's group it expresses the average variability of the groups.
2. SS(Tr): Expression of the group differences
	1. It quantifies the variance explained by grouping the observations, meaning the variance explained by a model fitted with the mean from each group.

````ad-tip
title: Theorem 8.2 <br> Variability decomposition
collapse: open

The total sum of squares $(S S T)$ can be decomposed into sum of squared errors $(S S E)$ and treatment sum of squares $(S S(T r))$
$$
\underbrace{\sum_{i=1}^{k} \sum_{j=1}^{n_{i}}\left(y_{i j}-\bar{y}\right)^{2}}_{\text {SST }}=\underbrace{\sum_{i=1}^{k} \sum_{j=1}^{n_{i}}\left(y_{i j}-\bar{y}_{i}\right)^{2}}_{\text {SSE }}+\underbrace{\sum_{i=1}^{k} n_{i}\left(\overline{y_{i}}-\bar{y}\right)^{2}}_{\text {SS(Tr) }},
$$
where
$$
\bar{y}=\frac{1}{n} \sum_{j=1}^{k} \sum_{j=1}^{n_{i}} y_{i j}, \quad \overline{y_{i}}=\frac{1}{n_{i}} \sum_{j=1}^{n_{i}} y_{i j}
$$
Expressed in short form
$$
S S T=S S(T r)+S S E
$$

```ad-info
title: Proof
collapse: close

Add and subtract $\bar{y}_{i}$ in SST to get
$$
\begin{aligned}
\sum_{i=1}^{k} \sum_{j=1}^{n_{i}}\left(y_{i j}-\bar{y}\right)^{2} &=\sum_{i=1}^{k} \sum_{j=1}^{n_{i}}\left(y_{i j}-\bar{y}_{i}+\bar{y}_{i}-\bar{y}\right)^{2} \\
&=\sum_{i=1}^{k} \sum_{j=1}^{n_{i}}\left[\left(y_{i j}-\bar{y}_{i}\right)^{2}+\left(\bar{y}_{i}-\bar{y}\right)^{2}+2\left(y_{i j}-\bar{y}_{i}\right)\left(\bar{y}_{i}-\bar{y}\right)\right] \\
&=\sum_{i=1}^{k} \sum_{j=1}^{n_{i}}\left(y_{i j}-\bar{y}_{i}\right)^{2}+\sum_{i=1}^{k} \sum_{j=1}^{n_{i}}\left(\bar{y}_{i}-\bar{y}\right)^{2}+2 \sum_{i=1}^{k} \sum_{j=1}^{n_{i}}\left(y_{i j}-\bar{y}_{i}\right)\left(\bar{y}_{i}-\bar{y}\right) \\
&=\sum_{i=1}^{k} \sum_{j=1}^{n_{i}}\left(y_{i j}-\bar{y}_{i}\right)^{2}+\sum_{i=1}^{k} n_{i}\left(\bar{y}_{i}-\bar{y}\right)^{2}+2 \sum_{i=1}^{k}\left(\bar{y}_{i}-\bar{y}\right) \sum_{j=1}^{n_{i}}\left(y_{i j}-\bar{y}_{i}\right)
\end{aligned}
$$

now observe that $\sum_{j=1}^{n_{i}}\left(y_{i j}-\bar{y}_{i}\right)=0$, and the proof is completed.

```
````
^theorem8-2

Note that if the sample size for each group is identical SSE can be determined as:
$$SSE=(n-k)\cdot s^{2}_{\text{means}}$$
where
$$
s_{\text {means }}^{2}=\frac{1}{k-1} \sum_{i=1}^{k}\left(\bar{y}_{i}-\bar{y}\right)^{2}
$$
is the average variance of the group variances, see [[#^example8-1|Ex 8.1]].

Alternatively if the individual group variances are know SSE can be determined as:
$$
S S E=\sum_{i=1}^{k}\left(n_{i}-1\right) s_{i}^{2}
$$
where $s_{i}^{2}$ is the group variance.

The group variation component SS(Tr) can also be expressed as
$$
S S(T r)=\sum_{i=1}^{k} n_{i}\left(\bar{y}_{i}-\bar{y}\right)^{2}=\sum_{i=1}^{k} n_{i} \hat{\alpha}_{i}^{2}
$$
In case the number of observations is the same for each group $n_{1}=\ldots=n_{k}=m$  then SS(Tr) is:
$$
S S(T r)=(k-1) \cdot m \cdot s_{\text {means }}^{2}
$$

Intuitively we know that if some of the $|\hat\a_{i}|$'s are large it's evidence against the null hypothesis.
Thus a large SS(Tr) value is evidence against $H_{0}$, but it should be relative to some variation. If the variation around $\hat\mu_i$ is small and $\hat\a_{i}$ is large it's again intuitive that it must go against the null hypothesis. SSE expresses the variation inside the groups and therefore is the relative variation is expressed in SSE. We therefore compare these.

````ad-tip
title: Theorem 8.4 <br> Within group variability
collapse: open

The sum of squared errors $S S E$ divided by $n-k$, also called the residual mean square $M S E=S S E /(n-k)$ is the weighted average of the sample variances from each group
$$
M S E=\frac{S S E}{n-k}=\frac{\left(n_{1}-1\right) s_{1}^{2}+\cdots+\left(n_{k}-1\right) s_{k}^{2}}{n-k},
$$
where $s_{i}^{2}$ is the variance within the $i$ th group
$$
s_{i}^{2}=\frac{1}{n_{i}-1} \sum_{j=1}^{n_{i}}\left(y_{i j}-\bar{y}_{i}\right)^{2} .
$$
When $k=2$, that is, we are in the two-sample case presented in [[Two-sample hypothesis testing]], the result here is the [[Pooled variance]]
$$
\text { For } k=2: M S E=s_{p}^{2}=\frac{\left(n_{1}-1\right) s_{1}^{2}+\left(n_{2}-1\right) s_{2}^{2}}{n-2}
$$

````
^theorem8-4

Both $S S(\operatorname{Tr}) /(k-1)$ and $S S E /(n-k)$ are both central estimators for $\sigma^{2}$ (error variance) if the null hypothesis is true.
In general the error variance $\sigma^{2}$ is estimated by MSE.
$$
\hat{\sigma}^{2}=M S E
$$

````ad-tip
title: Theorem 8.6 <br>
collapse: open

Under the null hypothesis
$$
H_{0}: \quad \alpha_{i}=0, \quad i=1,2, \ldots, k,
$$
the test statistic
$$
F=\frac{S S(T r) /(k-1)}{S S E /(n-k)}=\frac{MS(Tr)}{MSE}
$$
follows an [[F-distribution]] with $k-1$ and $n-k$ degrees of freedom.
````
^theorem8-6

The test statistic $F$ will naturally be large if SS(Tr) is large and the SSE is small, which is clear evidence against the null hypothesis.
The statistics are usually collected in an [[#One-way ANOVA table]].
See [[#^example8-1|Ex 8.7]].

**Note** that the [[p-value]] should be compared with the ($1-\a$) quantile of the [[F-distribution]] with $k-1$ and $n-k$ degrees of freedom.

# One-way ANOVA table
$$
\begin{array}{|l|c|c|c|c|c|}
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
\text { Mean sum of } \\
\text { squares }
\end{array} & \begin{array}{l}
\text { Test- } \\
\text { statistic } F
\end{array} & \begin{array}{l}
p\text {-value }
\end{array} \\
\hline \text { Treatment } & k-1 & S S(T r) & M S(T r)=\frac{S S(T r)}{k-1} & F_{\text {obs }}=\frac{M S(T r)}{M S E} & P\left(F>F_{\text {obs }}\right) \\
\hline \text { Residual } & n-k & S S E & M S E=\frac{S S E}{n-k} & & \\
\hline \text { Total } & n-1 & S S T & & & \\
\hline
\end{array}
$$
^ANOVATable
# Post hoc comparisons
If we reject $H_{0}$, we're often interested in which group/treatment was actually different ([[Analysis of Variance - ANOVA#Purpose|ANOVA purpose 2]]).
This is done by pair wise comparison of the treatments, and such comparisons can be done using [[Two-sample hypothesis testing#^method3-51|Method 3.51]],  with MSE as the estimate of the error variance $s^{2}$, and $n-k$ degrees of freedom.

```ad-summary
title: Method 8.9 <br> Post hoc pairwise confidence intervals
collapse: open

A single pre-planned $(1-\alpha) \cdot 100 \%$ confidence interval for the difference between treatment $i$ and $j$ is found as
$$
\bar{y}_{i}-\bar{y}_{j} \pm t_{1-\alpha / 2} \sqrt{M S E\left(\frac{1}{n_{i}}+\frac{1}{n_{j}}\right)},
$$
where $t_{1-\alpha / 2}$ is based on the $t$-distribution with $n-k$ degrees of freedom. If all $M=k(k-1) / 2$ combinations of pairwise confidence intervals are calculated use the formula $M$ times, with the [[Bonferroni correction]]  $\alpha_{\text {Bonferroni }}=\alpha / M$.
```
^method8-9

```ad-summary
title: Method 8.10 <br> Post hoc pairwise hypothesis tests
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
where the $t$-distribution with $n-k$ degrees of freedom is used.
If all $M=k(k-1) / 2$ combinations of pairwise hypothesis tests are carried out use the approach $M$ times but each time with test level $\alpha_{\text {Bonferroni }}=\alpha / M$
```
^method8-10

Alternatively the [[Least Significant Difference - LSD]] value can be used to make the pairwise comparisons easier.

# Assumptions & model control
The assumptions of the [[Analysis of Variance - ANOVA#Assumptions|ANOVA]] model needs to be verified, to be able to conclude anything about a study.

In *one-way* ANOVA, the groups are also assumed independent, meaning that every group has it's own observational unit(s) (e.g. people), different from the other groups. Meaning every person in a study would only try one treatment.

## 1. Normality
Validating that the observations all follow a normal distribution in their own group is easiest done by performing a [[QQ plot]] on the pooled residuals, as all the residuals should follow the [[Normal distribution]] with 0 mean and variance $\sigma^{2}$.
$$
\varepsilon_{i j} \sim N\left(0, \sigma^{2}\right) 
$$
```ad-summary
title: Method 8.15 <br> Normality control in one-way ANOVA
collapse: open

To control for the normality assumptions in one-way ANOVA we perform a q-q plot on the pooled set of $n$ estimated residuals
$$
e_{i j}=y_{i j}-\bar{y}_{i}, j=1, \ldots, n_{i}, i=1 \ldots, k .
$$

```
^method8-15

**In R:**
```R
residuals <- lm(y ~ treatm)$residuals
qqnorm(residuals)
qqline(residuals)
```
## 2. Homogeneous variances
Validating that the variances of the groups aren't significantly different are easiest done by plotting the group-wise box plot.
```R
plot(treatm, data)
```

# In R
```R
anova(lm(y ~ treatm))

# Ex output:
Analysis of Variance Table

Response: y
          Df Sum Sq Mean Sq F value   Pr(>F)    
treatm     2 30.792 15.3958  26.672 0.000165 ***
Residuals  9  5.195  0.5772
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

How each value is calculated can be seen in [[#One-way ANOVA table]].

# Examples
````ad-example
title: Example 8.1, 8.5, 8.7, 8.11, 8.16 <br>
collapse: open

**Ex 8.1:**
$$
\begin{array}{|c|c|c|}
\hline \text { Group A } & \text { Group B } & \text { Group C } \\
\hline 2.8 & 5.5 & 5.8 \\
3.6 & 6.3 & 8.3 \\
3.4 & 6.1 & 6.9 \\
2.3 & 5.7 & 6.1 \\
\hline
\end{array}
$$

Is there a difference in the means?
```R
y <- c(
        2.8, 3.6, 3.4, 2.3,
        5.5, 6.3, 6.1, 5.7,
        5.8, 8.3, 6.9, 6.1
    )
mtreat <- factor(as.vector(mapply(rep, 4, x = 1:3)))

plot(treatm,y)
```
<span class="centerImg">![[ANOVAExample8.1plot.png|300]]</span>

From the plot it seems that 1 is different to the others, but lets calculate the parameter estimates $\hat\mu$ and $\hat\a$.
```R
mu <- mean(y)
muis <- tapply(y, treatm, mean)
alpha <- muis - mu
mu
[1] 5.233

muis
    1     2     3 
3.025 5.900 6.775 

alpha
         1          2          3 
-2.2083333  0.6666667  1.5416667 
```
$$\hat\mu\approx 5.23$$
$$\hat\a_{1}\approx -2-21, \quad \hat\a_{2}\approx 0.67, \quad \hat\a_{3}\approx 1.54$$
So the question becomes: how likely is it that the observed differences in group means are random variation? If very unlikely we conclude that at least one of them is significantly different from the others.

**Ex 8.5:**
Determining SST, SSE and SS(Tr):
```R
SST <- sum((y - mu)^2)
SSE <- sum((y[treatm==1] - muis[1])^2)+
sum((y[treatm==2] - muis[2])^2)+
sum((y[treatm==3] - muis[3])^2)
SSTr <- 4 * sum(alpha^2)
c(SST, SSE, SSTr)

[1] 35.987 5.195 30.792
```

SSE could alternatively be calculated as the average of the variances for each group as the sample size is identical.
```R
vars <- tapply(y, treatm, var)
(12-3)*mean(vars)

[1] 5.195
```

**Ex 8.7:**
Let's now determine the F-statistic and the p-value:
```R
F <- (SSTr/(3 - 1)/(SSE/(12 - 3)))
pv <- 1 - pf(F, df1 = 3 - 1, df2 = 12 - 3)
c(F , pv)

[1] 26.672281 0.000165
```
As the p-value is lower than the [[Statistical significance|Significance level]] $\alpha=0.05$, we can reject the null hypothesis.

In R:
```R
anova(lm(y ~ treatm))
Analysis of Variance Table

Response: y
          Df Sum Sq Mean Sq F value   Pr(>F)    
treatm     2 30.792 15.3958  26.672 0.000165 ***
Residuals  9  5.195  0.5772
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```

**Ex 8.11:**
The 95% confidence interval for comparing A and B:
```R
muis[1] - muis[2] + c(-1, 1) *
qt(0.975, df = 12 - 3) * sqrt(SSE/(12 - 3) * (1/4 + 1/4))

[1] -4.09 -1.66
```
Hence we can conclude that treatment A is different from B. The supporting p-value:
```R
tobs <- (muis[1] - muis[2])/sqrt(SSE/(12 - 3) * (1/4 + 1/4))
2 * (1 - pt(abs(tobs), 9))

[1] 0.0004614
```
Which likewise shows that the treatments are significantly different.

Now doing all three possible comparisons ($M=3 \cdot 2 / 2=3$), with a significance level $\a = 0.05$, meaning $\alpha_{\text {Bonferroni }}=0.05 / 3=0.016667$.
```R
alphaBonf <- 0.05/3
# A-B
alpha[1] - alpha[2] + c(-1, 1) *
	qt(1-alphaBonf/2, df = 12 - 3) * sqrt(SSE/(12 - 3) * (1/4 + 1/4))

[1] -4.451 -1.299

# A-C
alpha[1] - alpha[3] + c(-1, 1) *
	qt(1-alphaBonf/2, df = 12 - 3) * sqrt(SSE/(12 - 3) * (1/4 + 1/4))

[1] -5.326 -2.174

# B-C
alpha[2] - alpha[3] + c(-1, 1) *
	qt(1-alphaBonf/2, df = 12 - 3) * sqrt(SSE/(12 - 3) * (1/4 + 1/4))

[1] -2.4509 0.7009
```
From these confidence intervals we can conclude that A is significantly different from B and C as they have non-zero-including CIs, while we cannot reject that B and C are equal, due to their zero-including CI.

**Ex 8.16:**
Before clapping our hands and calling it a day, lets validate that our model assumptions are actually correct.
```R
residuals <- lm(y ~ treatm)$residuals
qqnorm(residuals)
qqline(residuals)
```
<span class="centerImg">![[OneWayANOVAExample8.16QQPlot.png|200]]</span>
The QQ plot suggests that the data is indeed normally distributed.

````
^example8-1

````ad-example
title: Example 8.17 <br>
collapse: open

On a lamp two plastic screens are to be mounted. It is essential that these plastic screens have a good impact strength. Therefore an experiment is carried out for 5 different types of plastic. 6 samples in each plastic type are tested. The strengths of these items are determined. The following measurement data was found (strength in $\left.\mathrm{kJ} / \mathrm{m}^{2}\right)$


$$
\begin{array}{|ccccc|}
\hline\text { I } & \text { II } & \text { III } & \text { IV } & \text { V } \\
\hline 44.6 & 52.8 & 53.1 & 51.5 & 48.2 \\
50.5 & 58.3 & 50.0 & 53.7 & 40.8 \\
46.3 & 55.4 & 54.4 & 50.5 & 44.5 \\
48.5 & 57.4 & 55.3 & 54.4 & 43.9 \\
45.2 & 58.1 & 50.6 & 47.5 & 45.9 \\
52.3 & 54.6 & 53.4 & 47.8 & 42.5 \\
\hline
\end{array}
$$

```R
D <- data.frame(
    strength = c(
        44.6, 52.8, 53.1, 51.5, 48.2, 50.5, 58.3, 50.0, 53.7, 40.8,
        46.3, 55.4, 54.4, 50.5, 44.5, 48.5, 57.4, 55.3, 54.4, 43.9,
        45.2, 58.1, 50.6, 47.5, 45.9, 52.3, 54.6, 53.4, 47.8, 42.5
    ),
    plastictype = factor(rep(1:5, 6))
)
plot(D$plastictype, D$strength, xlab = "Plastictype", ylab = "Strength")
```
<span class="centerImg">![[OneWayANOVAExample8.17BoxPlot.png]]</span>
The box plot suggests that the group has different means. Lets verify our assumption:
```R
fit <- lm(strength ~ plastictype, data=D)
anova(fit)
Analysis of Variance Table

Response: strength
            Df Sum Sq Mean Sq F value    Pr(>F)    
plastictype  4 491.76 122.940  18.234 3.988e-07 ***
Residuals   25 168.56   6.742
---
Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
```
As the p-value is as low as it is it confierms that there's very strong evidence against $H_{0}$.

Let's validate our model assumptions:
1. Normality:
```R
qqnorm(fit$residuals)
qqline(fit$residuals)
```
<span class="centerImg">![[OneWayANOVAExample8.17QQPlot.png]]</span>

2. The box plot doesn't indicate clear differences in variance.

Lets now determine which types is significantly different.
To do so we must first determine the LSD value.
```R
M <- 5*(5-1)/2
MSE <- 6.742 # Residual mean sq from ANOVA print
m <- 6 # Number of observations
a_b <- 0.05/M
LSD <- qt(1-a_b/2, df = 6*5 - 5)*sqrt(2*MSE/m)
LSD

[1] 4.614562
```
Then determine the group means:
```R
tapply(D$strength, D$plastictype, mean)
   1    2    3    4    5 
47.9 56.1 52.8 50.9 44.3
```
Now doing all the comparisons resulting in:
$$
\begin{array}{ccl}
\text { Plastictype } & \text { Mean } & \\
\hline 5 & 44.3 & \mathrm{a} \\
1 & 47.9 & \mathrm{ab} \\
4 & 50.9 & \mathrm{bc} \\
3 & 52.8 & \mathrm{~cd} \\
2 & 56.1 & \mathrm{~d} \\
\hline
\end{array}
$$
Where plastic types with one letter are significantly different to at least one other type.

````
^example8-17
# References
- [[Bonferroni correction]]
- [[Least Significant Difference - LSD]]
- [[Introduction to Mathematical Statistics - 02403]]