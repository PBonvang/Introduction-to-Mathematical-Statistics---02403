---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Normal distribution]]
****

 <p align="center">
	<font size="9"><strong>Multivariate Normal Distribution</strong></font>
</p>

****
![[2VariableNormalDistribution.png|#invert]]![[2VariableNormalDistributionContour.png|#invert]]
$$
\mathcal{N}(x \mid \mu, \Sigma)=\frac{1}{\sqrt{(2 \pi)^{D} \operatorname{det}(\Sigma)}} \exp \left(-\frac{1}{2}(x-\mu)^{\top} \Sigma^{-1}(x-\mu)\right)
$$
$$
(\mathrm{X}-\mu)^{\top} \Sigma^{-1}(\mathrm{X}-\mu)
$$
$X=\left[x_1,...,x_D \right]^{\top}:$ A vector containing the D random variables.
$\Sigma:$ The [[Covariance matrix]] for $X$.
$\mu:$ A vector containing the [[Expectation]]/[[Mean]] for each variable.

When considering multiple variables, they aren't often independent, and we therefore need a way to calculate that dependence called: [[Covariance]].

You could say multivariate distributions has multiple dimensions. Each variable representing it's own dimension.

# Examples
```ad-example
title: Bivariate example
collapse: close

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

## Python example
```python
import math
import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import multivariate_normal 
# construct mean - vector and covariance - matrix 
mu = [0 , 0]
Sigma = [[5 , 4] ,[4 , 7]] # define a grid of (x,y) points 
x, y = np.mgrid[ -10:10:.1, -10:10:.1]
pos = np.empty(x.shape + (2,))
pos[:, :, 0] = x
pos[:, :, 1] = y
# obtain density values for all points
p = multivariate_normal(mu, Sigma).pdf(pos)
# plot point - densities as contour 
plt.contour(x, y, p)
plt.grid(True)
plt.xlabel('x')
plt.ylabel('y')
```
<span class="centerImg">![[MultivariateNormalDensityFunctionPythonExample.png|#invert]]</span>

# References
- [[Signals and data - 02462]]
- [[Introduction to Mathematical Statistics - 02403]]