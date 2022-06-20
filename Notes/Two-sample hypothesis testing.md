---
aliases: [Welch two-sample t-test, Two-sample confidence interval, Mean difference hypothesis testing] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]]
****
$$T = \frac{OBS-H_{0}}{sd(OBS)}$$

Often in the fields of science and engineering we compare the quality of two products, compare performance of two groups, compare a new drug to a placebo and so on. 
In all these cases we learn about the difference between the means of two  populations.

```ad-summary
title: Method 3.47 <br> The two-sample confidence interval for $\mu_{1}-\mu_{2}$

For two samples $x_{1}, \ldots, x_{n}$ and $y_{1}, \ldots, y_{n}$ the $100(1-\alpha) \%$ confidence interval for $\mu_{1}-\mu_{2}$ is given by
$$
\bar{x}-\bar{y} \pm t_{1-\alpha / 2} \cdot \sqrt{\frac{s_{1}^{2}}{n_{1}}+\frac{s_{2}^{2}}{n_{2}}},
$$
where $t_{1-\alpha / 2}$ is the $(1-\alpha / 2)$-quantile from the $t$-distribution with $v$ degrees of freedom defined by:
$$
v=\frac{\left(\frac{s_{1}^{2}}{n_{1}}+\frac{s_{2}^{2}}{n_{2}}\right)^{2}}{\frac{\left(s_{1}^{2} / n_{1}\right)^{2}}{n_{1}-1}+\frac{\left(s_{2}^{2} / n_{2}\right)^{2}}{n_{2}-1}}\tag{Eq. 1}
$$
```
^method3-47

```ad-summary
title: Method 3.49 <br> The (Welch) two-sample $t$-test statistic

When considering the null hypothesis about the difference between the means of two independent samples
$$
\begin{aligned}
&\delta=\mu_{2}-\mu_{1} \\
&H_{0}: \delta=\delta_{0}
\end{aligned}
$$
the (Welch) two-sample $t$-test statistic is
$$
t_{\mathrm{obs}}=\frac{\left(\bar{x}_{1}-\bar{x}_{2}\right)-\delta_{0}}{\sqrt{s_{1}^{2} / n_{1}+s_{2}^{2} / n_{2}}} .
$$

```
^method3-49

The distribution of the (Welch) two-sample statistic as a [[random variable]] is 
$$
T=\frac{\left(X_{1}-\bar{X}_{2}\right)-\delta_{0}}{\sqrt{S_{1}^{2} / n_{1}+S_{2}^{2} / n_{2}}}
$$
and roughly follows a [[t-distribution]] under the null hypothesis, with $v$ degrees of freedom defined in [[#^method3-47|Eq. 1]], **unless** the two true variances are assumed to be the same: $\sigma_{1}^{2}=\sigma_{2}^{2}$. Then: $v=n_{1}+n_{2}-2$

Alternative to the Welch method the [[Pooled variance]] method can also be used, though less accurate.

```ad-summary
title: Method 3.51 <br> The level $\boldsymbol\alpha$ two-sample $t$-test

1. Compute the test statistic $t_{obs}$ and the degrees of $v$
	$$\begin{align*}
	t_{\mathrm{obs}}&=\frac{\left(\bar{x}_{1}-\bar{x}_{2}\right)-\delta_{0}}{\sqrt{s_{1}^{2} / n_{1}+s_{2}^{2} / n_{2}}}\\
	&=\frac{\left(\bar{x}_{1}-\bar{x}_{2}\right)-\delta_{0}}{s_{d}/\sqrt{n}}\tag{if \(n_1=n_2=n\)}
	\end{align*}$$
	$s_d=sd(\op{abs}(x_{1}-x_{2}))$
	$$\begin{align*}
	v&=\frac{\left(\frac{s_{1}^{2}}{n_{1}}+\frac{s_{2}^{2}}{n_{2}}\right)^{2}}{\frac{\left(s_{1}^{2} / n_{1}\right)^{2}}{n_{1}-1}+\frac{\left(s_{2}^{2} / n_{2}\right)^{2}}{n_{2}-1}}\\
&=n_{1}+n_{2}-2\tag{if \(\sigma_1=\sigma_2\)}
	\end{align*}$$
2. Compute the evidence against the null hypothesis
$$
H_{0}: \quad \mu_{1}-\mu_{2}=\delta_{0},
$$
vs. the alternative hypothesis
$$
H_{1}: \quad \mu_{1}-\mu_{2} \neq \delta_{0},
$$
by the
$$
p \text {-value }=2 \cdot P\left(T>\left|t_{\mathrm{obs}}\right|\right),
$$
where the $t$-distribution with $v$ degrees of freedom is used
3. If $p$-value $<\alpha$ : we reject $H_{0}$, otherwise we accept $H_{0}$, 
or
The rejection/acceptance conclusion can equivalently be based on the critical value(s) $\pm t_{1-\alpha / 2}$ :
if $\left|t_{\text {obs }}\right|>t_{1-\mathfrak{\alpha} / 2}$ we reject $H_{0}$, otherwise we accept $H_{0}$
or
If the hypothesized mean isn't in the confidence interval, then we reject $H_0$, else accept it.
```
^method3-51

**Simulation:** For statistics which aren't functions of the mean bootstrapping can be used. See: [[Statistical bootstrapping]]
# In R
```R
# Keep the summary statistics
ms <- c(mean(xA), mean(xB))
vs <- c(var(xA), var(xB))
ns <- c(length(xA), length(xB))

# The observed statistic
t_obs <- (ms[2]-ms[1])/sqrt(vs[1]/ns[1]+vs[2]/ns[2])

# The degrees of freedom
v <- ((vs[1]/ns[1]+vs[2]/ns[2])^2)/
((vs[1]/ns[1])^2/(ns[1]-1)+(vs[2]/ns[2])^2/(ns[2]-1))
 
# P-value
p_val <- 2*(1 - pt(t_obs, df = v))
 
# OR
t.test(x1, x2) # By default Welch
```
# References
- [[Introduction to Mathematical Statistics - 02403]]