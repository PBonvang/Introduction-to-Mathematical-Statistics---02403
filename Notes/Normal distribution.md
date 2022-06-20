Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Probability]], [[Statistics]]
Translations: Normal fordeling
Synonyms:
****

<span class="centerImg">![[NormalDistributionDiagram.png|#invert]]</span>
$$
X \sim \mathcal{N}\left(\mu, \sigma^{2}\right)
$$
$\mu=\mathbb{E}[X]:$ The [[Expectation]]/[[Mean]] of $X$
$\sigma^{2}=\operatorname{Var}[X]:$ The [[Variance]] of $X$

Characterized by its bell-shape.

Uniquely defined by two parameters; 
- *location* $\mu$ which determines where the center (mode) is located 
- scale $\sigma$ which determines how flat the curve is
	- When large, distribution is spread
	- When small, distribution is dense around the mean

# [[Probability density function - PDF]]
A continuous random variable $X$ is normally distributed when its density function is the normal distribution,
$$
f(x)=\mathcal{N}\left(x \mid \mu, \sigma^{2}\right)=\frac{1}{\sigma \sqrt{2 \pi}} \op{exp}\left({-\frac{(x-\mu)^{2}}{2 \sigma^{2}}}\right)
$$
The probability density function follows the normal PDF.
```ad-info
title: Udledning

<span class="centerImg">![[NormalUdledningSteps.png|400]]</span>

**Steps:**
1. Take the distance to the mean: $x-\mu$
2. Square the distance: $(x-\mu)^{2}$
3. Make it negative and scale it: $\frac{-(x-\mu)^{2}}{\left(2 \sigma^{2}\right)}$
4. Take the exponential: $\op{exp}\left({\frac{-(x-\mu)^{2}}{\left(2 \sigma^{2}\right)}}\right)$
5. Finally, scale it to have an area of one: $\frac{1}{\sigma \sqrt{2 \pi}} \op{exp}\left({\frac{-(x-\mu)^{2}}{\left(2 \sigma^{2}\right)}}\right)$

```

# [[Cumulative distribution function - CDF]]
$$
F(x)=\frac{1}{\sigma \sqrt{2 \pi}} \int_{-\infty}^{x} \op{exp}\left({-\frac{(u-\mu)^{2}}{2 \sigma^{2}}}\right)\ d u
$$

The probability of $X$ being in a given interval is then:
$$
\mathbb{P}(a \leq X \leq b)=\int_{a}^{b} \mathcal{N}\left(x \mid \mu, \sigma^{2}\right) d x=F_{X}(b)-F_{X}(a)
$$

# Properties

- Data is often normally distributed:
	Following the [[Central limit theorem]] data is often normally distributed.
- Normal distributions are mathematically convenient:
	Almost all the probability density is located within $3\sigma$, $99.7\%$ actually, meaning that most distributions can be approximated quite precisely with it.
	
| $\sigma$             | probability density |
| -------------------- | ------------------- |
| $[-\sigma,\sigma]$   | $68\%$              |
| $[-2\sigma,2\sigma]$ | $95\%$              |
| $[-3\sigma,3\sigma]$ | $99.7\%$            |

- It is concentrated around the mean $\mu$

### Scaling and translating normal variables
If $X$ is a normal variable and $X \sim \mathcal{N}(\mu,\sigma^2)$, then scaling or translating it results in another normal variable.
$$
Y=a X+b \Rightarrow Y \sim \mathcal{N}\left(\mu+b, a^{2} \sigma^{2}\right)
$$
![[NormalDistributionScalingAndTranslatingExample.png]]

### Linear combination of normal variables
If $X \sim \mathcal{N}\left(\mu_{X}, \sigma_{X}^{2}\right)$ and $Y \sim \mathcal{N}\left(\mu_{Y}, \sigma_{Y}^{2}\right)$ are normal variables, then their linear combination: $Z=X+Y$ is also a normal variable
$$
Z=X+Y \Rightarrow Z \sim \mathcal{N}\left(\mu_{X}+\mu_{Y}, \sigma_{X}^{2}+\sigma_{Y}^{2}\right)
$$
$$Z=X-Y\Rightarrow Z \sim \mathcal{N}\left(\mu_{X}-\mu_{Y}, \sigma_{X}^{2}+\sigma_{Y}^{2}\right)$$

<span class="centerImg">![[NormalDistributionLinearCombinationExample.png|400]]</span>

### Mixing normal distributions
If we have a dataset which looks like multiple bellcurves/normal distributions we can separate them into each of their own distributions and sum them as our overall probability:
![[NormalDistributionMixedNormalDistributionsExample.png]]
$$
p(x)=0.7 p_{1}(x)+0.3 p_{2}(x)
$$

# Examples
```ad-example
title: Flight passenger weight
collapse: close

The weight of the passengers in the plane is normally distributed with:
$$X_{i}\sim \mathcal{N}(70,10^{2})$$
There's 55 passengers, and the max weight is 4000 kg.

What's the probability that the plane is overfilled?
$n=55$

$$\begin{align*}
Y&=\text{Total weight}\\
&=\sum\limits_{i=1}^{n}X_{i}
\end{align*}$$

$$\mu=E[Y]=\sum\limits_{i=1}^{n}E[X_{i}]=55\cdot 70$$
$$\sigma^{2}=\op{Var}(Y)=\sum\limits_{i=1}^{n}\op{Var}(X_i)=55\cdot10^2$$

$$Y\sim \mathcal{N}(55\cdot70,55\cdot10^2)$$
With the normal distribution found, we can simply use the defined [[#Probability density function - PDF]]. To determine what the probability that the total weight is above 4000 kg.
```

# In R
`pnorm(x,mu,sd)`
Note that `pnorm` and `qnorm` is each others inverse, meaning `qnorm(pnorm(2))=2`.
 
```R
xSeq <- c(-3,-2,1,0,1,2,3)
# The pdf
dnorm(xSeq, mean=0, sd=1)
[1] 0.004432 0.053991 0.241971 0.398942 0.241971 0.053991 0.004432
# The cdf
pnorm(xSeq, mean=0, sd=1)
[1] 0.00135 0.02275 0.84134 0.50000 0.84134 0.97725 0.99865
# The quantiles
qnorm(c(0.01,0.025,0.05,0.5,0.95,0.975,0.99), mean=0, sd=1)
[1] -2.326 -1.960 -1.645 0.000 1.645 1.960 2.326
# Generate random normal distributed realizations
rnorm(n=10, mean=0, sd=1)
[1] 0.7859 -0.7339 -0.4250 0.9429 0.1238 0.8251 1.4352 2.0590
[9] -1.6450 0.2401
# Calculate the probability that the outcome of X is between a and b
a <- 0.2
b <- 0.8
pnorm(b) - pnorm(a)
[1] 0.2089

```
# References
- [[Variable normality]]
- [[Signals and data - 02462]]
- [[Introduction to Mathematical Statistics - 02403]]