---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]], [[Variance]]
****
$$
S^{2}=a S_{x}^{2}+(1-a) S_{y}^{2}, \quad a \in[0,1]
$$
$$
S_{p}^{2}=\frac{\left(n_{1}-1\right) S_{1}^{2}+\left(n_{2}-1\right) S_{2}^{2}}{n_{1}+n_{2}-2}\tag{min. var}
$$
^method3-52

$n_1,n_2:$ Sample size
$S_{1}^{2},S_{2}^{2}:$ [[Sample variance]]
****

Given two *i.i.d* samples:
$$
X_{1}, \ldots, X_{n_{x}}, \quad X_{i} \sim \ndist\left(\mu_{x}, \sigma_{x}^{2}\right), \quad \op{var}(X)=S_{X}^{2}
$$
$$
Y_{1}, \ldots, Y_{n_{y}}, \quad Y_{i} \sim \ndist\left(\mu_{y}, \sigma_{y}^{2}\right), \quad \op{var}(Y)=S_{Y}^{2}
$$
**It's crucial that the samples has the same true variance.** 
$$\sigma_{x}=\sigma_{y}$$
Both $S_{X}^{2}$ and $S_{Y}^{2}$ will thus be central estimators of $\sigma^{2}$, and so will any weighted average of the two also be:
$$
S^{2}=a S_{x}^{2}+(1-a) S_{y}^{2}, \quad a \in[0,1]
$$
With the expected value:
$$E[S_{p}^{2}]=E[aS_{1}^{2}]+(1-a)E[S_{2}^{2}]=a\sigma^2+(1-a)\sigma^{2}=\sigma^{2}$$
Now we'd like to determine $a$ to minimize the variance of $S^{2}$, which is done by first determining the variance of $S^{2}$:
$$
\begin{aligned}
\mathrm{V}\left(S^{2}\right) &=Var[S_{p}^{2}]=a^{2}V[S_{1^2}]+(1-a)^{2}V[S_{2}^{2}]\\
&=a^{2} 2 \frac{\sigma^{4}}{n_{x}-1}+(1-a)^{2} 2 \frac{\sigma^{4}}{n_{y}-1} \\
&=2 \sigma^{4}\left(a^{2} \frac{1}{n_{x}-1}+(1-a)^{2} \frac{1}{n_{y}-1}\right)
\end{aligned}
$$
then differentiate with respect to $a$:
$$
\begin{aligned}
\frac{\partial \mathrm{V}\left(S^{2}\right)}{\partial a} &=2 \sigma^{4}\left(2 a \frac{1}{n_{x}-1}-2(1-a) \frac{1}{n_{y}-1}\right) \\
&=4 \sigma^{4}\left(a\left(\frac{1}{n_{x}-1}+\frac{1}{n_{y}-1}\right)-\frac{1}{n_{y}-1}\right) \\
&=4 \sigma^{4}\left(a \frac{n_{x}+n_{y}-2}{\left(n_{x}-1\right)\left(n_{y}-1\right)}-\frac{1}{n_{y}-1}\right)
\end{aligned}
$$
which is 0 when:
$$
a=\frac{n_{1}-1}{n_{1}+n_{2}-2}
$$
We can then insert that into the sample variance expression:
$$
S_{p}^{2}=\frac{\left(n_{1}-1\right) S_{1}^{2}+\left(n_{2}-1\right) S_{2}^{2}}{n_{1}+n_{2}-2}
$$
Note that $S_{p}^{2}$ (the pooled variance) is a weighted average of the sample variances. 

# Confidence interval
$$\large\bar X - \bar Y \pm t_{1- \frac{\alpha}{2}}S_{p}\sqrt{\frac{1}{n_{1}}+ \frac{1}{n_{2}}}$$
# References
- [[Introduction to Mathematical Statistics - 02403]]