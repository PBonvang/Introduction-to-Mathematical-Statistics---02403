---
date: 2022/06/10
course: 02403
courseWeek: 2
lecturer: Jan Kloppenborg Møller
---

Tags: [#Literature/Lecture, #Archived ]
Subjects: [[Introduction to Mathematical Statistics - 02403]]

****

 <p align="center">
	<font size="9"><strong>Day 6 - Two sample situationer</strong></font>
</p>

****
# Agenda
- Checking the normality assumption
	- The Normal QQ plot
	- Transformation towards normality
- Planlægning: Power og sample size
- Two-sample $t$-test og $p$-værdi
- Konfidensinterval for forskellen
- Overlappende konfidensintervaller?
- Det parrede setup
- Checking the normality assumptions

# Notes
## Normal QQ plot
![[Pasted image 20220610081342.png|200]]
QQ-plot compares to the quantiles of the best normal distribution, formally defined as:

The ordered observations $x_{(1)}, \ldots, x_{(n)}$ are plotted versus a set of expected normal quantiles $z_{p_{1}}, \ldots, z_{p_{n}}$. Different definitions of $p_{1}, \ldots, p_{n}$ exist:
- In R, when $n>10$ :
$$
p_{i}=\frac{i-0.5}{n}, i=1, \ldots, n
$$
- In R, when $n \leq 10$ :
$$
p_{i}=\frac{i-3 / 8}{n+1 / 4}, i=1, \ldots, n
$$

## Transforming to normal distribution
The $\log(x)$ transformation is very common, to make a right skewed distribution normally distributed. Alternatives: $\sqrt{x},x^\frac{1}{3}$
If the distribution is left skewed we wish to make large values larger, which is done by: $x^2,x^3,...$


Log transformations are often used on concentrations.
## Planning: Power and sample size
**Confidence interval:**
$$\large\begin{align*}
K I&=\bar{x} \pm t_{1-\alpha / 2} \frac{s}{\sqrt{n}}=\bar{x} \pm M E\\
&=\bar{x} \pm z_{1-\alpha / 2} \frac{\sigma}{\sqrt{n}}=\bar{x} \pm M E\tag{If sigma is known}
\end{align*}$$
$ME:$ The wanted margin of error.

For known $\sigma$ and wanted $ME$ we can some for $n$ as:
$$
n=\left(\frac{z_{1-\alpha / 2} \sigma}{M E}\right)^{2}
$$

When planning there's 5 parameters we need to decide: $n,\alpha$
- Sample size $n$
- Significance level $\alpha$ of the test.
- A change in mean that you would want to detect (effect size) $\mu_{0}-\mu_{1}$.
- The population standard deviation, $\sigma$.
- The power $(1-\beta)=P\left(\right.$ Reject $H_{0}$ when $H_{1}$ is true).

Usually you decide 4 of them and calculate the last.

**Low power example:**
![[Pasted image 20220610083158.png|350]]
It means that we could detect alpha.

**High power:**
![[Pasted image 20220610083253.png|350]]


One-sample t-test for given $\alpha, \beta$ and $\sigma$ :
$$
n=\left(\sigma \frac{z_{1-\beta}+z_{1-\alpha / 2}}{\left(\mu_{0}-\mu_{1}\right)}\right)^{2}
$$
Where $\mu_{0}-\mu_{1}$ is the change in means that we would want to detect and $z_{1-\beta}, z_{1-\alpha / 2}$ are quantiles of the standard normal distribution.

In R:
```R
## Stikprøvestørrelse for t-test
power.t.test(power = .80, delta = 4, sd = 12.21,
	type = "one.sample")
##
## One-sample t test power calculation
##
## n = 75.077
## delta = 4
## sd = 12.21
## sig.level = 0.05
## power = 0.8
## alternative = two.sided
```

## Two-sample situations
$$T = \frac{OBS-H_{0}}{sd(OBS)}$$

We assume in the first case that the variance of the two variabels are identical.

If we cannot assume this we cannot use the $t_{obs}$ where $\sigma$ is the shared standard deviation. (Welch)
$$V(X_{1)}\neq V(X_{2})$$
$$\hat\sigma_{1}^{2}=S_{1}^{2},\hat\sigma_{2}^{2}=S_{2}^{2}$$
$$V(\bar X_{1}-\bar X_{2})=\frac{\sigma_{1}^{2}}{n_{1}}+\frac{\sigma_{2}^{2}}{n_{2}}$$

```R
df.cor(s1,s2,n1,n2)
```

Hvis vi antager at de to variancer er ens kan vi bruge den samvægtede variance ($S_{p}^{2}$)
Ellers skal den Welch måde bruges.

## Confidence intervals for the difference
For two samples $x_{1}, \ldots, x_{n}$ and $y_{1}, \ldots, y_{n}$ the $100(1-\alpha) \%$ confidence interval for $\mu_{1}-\mu_{2}$ is given by
$$
\bar{x}-\bar{y} \pm t_{1-\alpha / 2} \cdot \sqrt{\frac{s_{1}^{2}}{n_{1}}+\frac{s_{2}^{2}}{n_{2}}}
$$
where $t_{1-\alpha / 2}$ is the $100(1-\alpha / 2) \%$-quantile from the $t$-distribution with $\nu$ degrees of freedom given from equation (3.26) (as above).

**Pooled variance confidence interval:**
$$\large\bar X - \bar Y \pm t_{1- \frac{\alpha}{2}}S_{p}\sqrt{\frac{1}{n_{1}}+ \frac{1}{n_{2}}}$$

Confidence interval for two variables can be tested using R:
```R
t.test(X,Y)
```
It will by default use the welch method, but can be set to use the sammenvægtede version by setting var_eq = TRUE.

## The parred setup
Parred essentially means that the two samples are on the same observational unit.
E.g. testing the two different types of medicine on the same people.

```R
t.test(x2, x1, paired=TRUE)
# Same as
dif = x2-x1
t.test(dif)
```

# Thoughts
Why is the mean transformed back into the median in log transformations?

Are we allowed to hand in a nb instead of an R file?

# Quotes

# References