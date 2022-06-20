---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: [#MOC]
Subjects: [[Statistics]]
****

<span class="centerImg">![[NullHypothesis.png|350]]</span>
<center>Null hypothesis distribution for 95%</center>

1. Formulate the hypotheses ([[The null hypothesis]] & the alternative hypothesis) and choose the level of [[Statistical significance]] $\alpha$.
2. Calculate the test statistic using the provided data
3. Do one of the two following: (In general the CI method is easier and provides more info)
	1. Calculate the [[p-value]] from the test statistic and the relevant sampling distribution. If $p$-value $<\alpha$, we reject $H_{0}$, otherwise we accept $H_{0}$
	2. Compare the test statistic with the relevant [[Critical values]]. If $\left|t_{\mathrm{obs}}\right|>c_{\text{val}}$ we reject $H_{0}$, else we accept it.
		1. This is the same as checking if the resulting [[Confidence interval]] contains the null value (typically 0). If it does we accept $H_{0}$, else reject it.
4. Make a conclusion

**Note** that accepting the null hypothesis doesn't mean the hypothesis is proven, but rather that we couldn't prove it wrong. It might simply be that we haven't collected enough data, or that the variances is too large.

Alternate to the two-sided/non-directional hypothesis setup, seen above, where it's either one or the other, the one-sided/directional hypothesis setup has the alternative hypothesis that it's either "less than" or "greater than" the null value.
In most cases the two-sided should be applied, since the notion of "extreme" is in both directions if we have no prior knowledge of the distribution.
However in some cases the one-sided setup makes sense to use, if we know the variable to only go in one direction from the null value.

The one-sided "less than" hypothesis setup is: compute the evidence against the null hypothesis vs. the one-sided alternative hypothesis
$$
\begin{array}{ll}
H_{0}: & \mu \geq \mu_{0} \\
H_{1}: & \mu<\mu_{0}
\end{array}
$$
by the
$$
p \text {-value }=P\left(T<t_{\mathrm{obs}}\right) \text {. }
$$
and equivalently for the "greater than" setup
$$
\begin{array}{ll}
H_{0}: & \mu \leq \mu_{0} \\
H_{1}: & \mu>\mu_{0},
\end{array}
$$
by the
$$
p \text {-value }=P\left(T>t_{\mathrm{obs}}\right)
$$
In both cases: if $p$-value $<\alpha$ : We reject $H_{0}$, otherwise we accept $H_{0}$.
In practice we just use one side of the distribution instead of both as in the two sided.

# Errors in hypothesis testing
$$
\begin{array}{c|c|c}
\hline & \text { Reject } H_{0} & \text { Fail to reject } H_{0} \\
\hline H_{0} \text { is true } & \text { Type I error }(\alpha) & \text { Correct acceptance of } H_{0} \\
H_{0} \text { is false } & \text { Correct rejection of } H_{0} \text { (Power) } & \text { Type II error }(\beta) \\
\hline
\end{array}
$$

In testing of statistical hypothesis, two kinds of errors can occur:
1. Rejection of $H_0$ ([[The null hypothesis]]) when $H_0$ is true
2. Non-rejection (acceptance) of $H_{0}$ when $H_{1}$ ([[The alternative hypothesis]]) is true

```ad-example
title: Example: Ambulance

A ambulance claims their average time from call to being on location is 20 minues.

We have some measurements: 21.1, 22.3, 19.6, 24.2,...

Our hypothesis is then:
$$
\begin{array}{ll}
H_{0}: & \mu=20 \\
H_{1}: & \mu \neq 20
\end{array}
$$

The errors which could occur would then be:
1. Rejecting $H_{0}$ when it's true, meaning we mistakenly conclude that it takes longer or shorter than 20 min for the ambulance
2. Not rejecting $H_{0}$ when $H_{1}$ is true, meaning we mistakenly conclude that it takes the ambluance 20 min.

```

Generally the probabilities of the two types are defined as:
$$\begin{align*}
P(\text { "Type I error" })=\alpha\\
P(\text{ "Type II error" })=\beta
\end{align*}$$

```ad-tip
title: Theorem 3.39 <br> Significance level and Type 1 error

The significance level $\alpha$ in hypothesis testing is the overall Type I risk
$P($ "Type I error" $)=P\left(\right.$ "Rejection of $H_{0}$ when $H_{0}$ is true" $)=\alpha$.

```

# In R
```R
t.test(x, conf.level=0.95)
```

# Index
- [[One-sample hypothesis testing]]
- [[Two-sample hypothesis testing]]
- [[Discrete hypothesis testing]]
- [[Analysis of Variance - ANOVA|ANOVA]]
# References
- [[Statistical significance]]
- [[The null hypothesis]]
- [[Introduction to Mathematical Statistics - 02403]]