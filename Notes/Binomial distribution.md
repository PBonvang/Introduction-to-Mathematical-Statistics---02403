---
aliases: [Binomial distributions] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Probability]], [[Statistics]], [[Discrete distributions]]
****
$$X\sim B(n,\theta)$$
A binomial distribution describes the probability of seeing some sample of outcomes, given a success rate of the binary [[Random variable]] measured, e.g. getting 3 heads in 6 coin tosses.
$$
\P(X=k \mid \theta)=\left(\begin{array}{l}
n \\
k
\end{array}\right)\*(1-\theta)^{n-k}\* \theta^{k}
$$
$n:$ Total number of "slots"/observations
$k:$ Number of success observations
$\theta:$  The success rate of the variable. e.g. for a lottery ticket it will be very 
$$\begin{pmatrix}n\\k\end{pmatrix}=\frac{n!}{(n-k)!\*k!}$$
Which describes the number of possible combinations where $k$ positions are changeable of the $n$ positions.
It represent the number of combinations of $k$ elements which can be chosen from a set of $n$ elements.

```ad-example
title: Example: Lottery

What's the probability of winning on 2 tickets in a lottery given 50 tickets and a succes rate of 0.1?

$$\P(X=win\mid 0.1)=\begin{pmatrix}50\\2\end{pmatrix}\cdot(1-0.1)^{2}\cdot0.1^{48}\approx 9.9225\*10^{-46}$$
Aka. extremely unlikely.
```

```ad-example

![[BinomialDistributionExample.png]]
```

# Mean and variance
$$\large
\begin{aligned}
\mathrm{E}(X) &=n p \quad \text{ a.k.a } \quad \mu=n\cdot \theta\\
\mathrm{~V}(\mathrm{X}) &=n p(1-p) \quad \text{ a.k.a } \quad \sigma^{2}=n\cdot\theta\cdot(1-\theta)
\end{aligned}
$$

## Linear combinations
Assuming the variables are independent.
$$\begin{align*}
\op{V}(X-Y)&=\frac{1}{n_{x}}\op{V}(X)+ \frac{1}{n_{2}}\op{V}(Y)\\
&= \frac{\theta_{x}(1-\theta_{x})}{n_{x}} + \frac{\theta_{y}(1-\theta_{y})}{n_{y}}
\end{align*}$$

# In R
```R
dbinom(k, size=n, prob={theta})
```

# References
- [[Signals and data - 02462]]
- [[Combinatorics]]
- [Binomial distributions | Probabilities of probabilities, part 1, 3Blue1Brown](https://www.youtube.com/watch?v=8idr1WZ1A7Q)
- [[Introduction to Mathematical Statistics - 02403]]