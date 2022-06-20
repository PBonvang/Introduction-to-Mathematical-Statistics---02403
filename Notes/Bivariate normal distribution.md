---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]], [[Probability]], [[Normal distribution]], [[Multivariate Normal Distribution]]
****

<span class="centerImg">![[2VariableNormalDistribution.png|#invert]]</span>
$$
\begin{aligned}
p\left(x_{1}, x_{2}\right) &=\frac{1}{2 \pi \sqrt{|\Sigma|}} \op{exp}\left(-\frac{1}{2}(x-\mu)^{T} \Sigma^{-1}(x-\mu)\right) \\
&=\frac{1}{2 \pi \sqrt{\sigma_{11} \sigma_{22}-\sigma_{12}^{2}}} \op{exp}\left(-\frac{\sigma_{22}\left(x_{1}-\mu_{1}\right)^{2}+\sigma_{11}\left(x_{2}-\mu_{2}\right)^{2}-2 \sigma_{12}\left(x_{1}-\mu_{1}\right)\left(x_{2}-\mu_{2}\right)}{2\left(\sigma_{11} \sigma_{22}-\sigma_{12}^{2}\right)}\right)
\end{aligned}
$$

$x=(x_{1},x_{2}):$ The variables values
$\mu=[E(X_{1}),E[X_{2}]]:$ The variable [[Mean|means]] / [[Expectation|expectations]]
$\Sigma:$ [[Covariance matrix]]
A bivariate normal distribution is simply a [[Multivariate Normal Distribution]] of two variables.
# Examples
```ad-example

A manufacturer of concrete items knows that the length $(L)$ of his items are reasonably normally distributed with $\mu_{L}=3000 \mathrm{~mm}$ and $\sigma_{L}=3 \mathrm{~mm}$. The requirement for these elements is that the length should be not more than $3007 \mathrm{~mm}$ and the length must be at least $2993 \mathrm{~mm}$.

The concrete items are supported by beams, where the distance between the beams is called $L_{\text {beam }}$ and can be assumed normal distributed. The concrete items length is still called L. For the items to be supported correctly, the following requirements for these lengths must be fulfilled: $90 \mathrm{~mm}<L-L_{\text {beam }}<110 \mathrm{~mm}$. It is assumed that the mean of the distance between the beams is $\mu_{\text {beam }}=2900 \mathrm{~mm}$. How large may the standard deviation $\sigma_{\text {beam }}$ of the distance between the beams be if you want the requirement fulfilled in $99 \%$ of the cases?

We wish to determine: $P(90 <L - L_{beam} < 110)$
The idea is to transform the normal distribution to a [[Standard normal distribution]], and use the transformed format to determine the max variance.

**Steps:**
1. Determine variance: $V(L - L_{beam}) = 9 + \sigma_{beam}^2$
2. Transform to standard form:
	The mean of the distribution is given as: $3000-2900=100mm$, and the error boundaries are: 90mm and 100mm.
	$$\begin{align*}
	0.99&=P\left(90<L-L_{\text {beam }}<110\right)\\\\
	&=P\left(\frac{90-100}{\sqrt{V(L - L_{beam})}}<Z<\frac{110-100}{\sqrt{V(L - L_{beam})}}\right)\\
	&=P\left(\frac{-10}{\sqrt{9+\sigma_{\text {beam }}^{2}}}<Z<\frac{10}{\sqrt{9+\sigma_{\text {beam }}^{2}}}\right)
	\end{align*}$$
3. Determine value for lower boundary
	With the boundaries determined and we have a normal distribution which is symmetrical, we can simply determine the value where 0.5 % of the distribution is.
	`qnorm(0.005)`$\approx 2.58$
4. Determine variance
	With the lower boundary determine we can simply solve for the variance in the boundary:
	$$\begin{align*}
	-2.58 &= \frac{-10}{\sqrt{9 + \sigma_{beam}^2}}\\
	\sigma_{\text {beam }}&=\sqrt{\left(\frac{10}{2.576}\right)^{2}-9}=2.464
	\end{align*}$$

The max variance must therefore be approximately 2.464 mm.
```

# References
- [[Introduction to Mathematical Statistics - 02403]]