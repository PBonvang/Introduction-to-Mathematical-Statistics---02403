---
aliases: [Error propagation] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]]
****
$$\Large
\sigma_{f\left(X_{1}, \ldots, X_{n}\right)}^{2}=\mathrm{V}\left(f\left(X_{1}, \ldots, X_{n}\right)\right)
$$
$X_{1}, \ldots, X_{n}:$ Independent measurements
$\sigma_{1}, \ldots, \sigma_{n}:$ The standard deviation of each of the measurements.

Propagation of errors refers to the accumulative effects of multiple measurement errors, that can result in wrong conclusions.
Quantifying a measurement error is often done using the [[Standard deviation]].
In practice the problem is a question of how the standard deviation of some function of the measurements depends on the standard deviation of the individual measurements.

```ad-summary
title: Method 4.3 <br> The non-linear approximative error propagation rule
collapse: open

If $X_{1}, \ldots, X_{n}$ are independent random variables with variances $\sigma_{1}^{2}, \ldots, \sigma_{n}^{2}$ and $f$ is a (potentially non-linear) function of $n$ variables, then the variance of the $f$-transformed variables can be **approximated** linearly by
$$
\sigma_{f\left(X_{1}, \ldots, X_{n}\right)}^{2}=\sum_{i=1}^{n}\left(\frac{\partial f}{\partial x_{i}}\right)^{2} \sigma_{i}^{2}
$$
where $\frac{\partial f}{\partial x_{i}}$ is the partial derivative of $f$ with respect to the $i^{\prime}$ th variable

```

```ad-example
collapse: close

$$X\sim\ndist(2,0.01^{2),\quad}Y\sim\ndist(3,0.02^{2})$$
$$A=XY$$
With these variables we wish to determine the approximate error progagation of $A$.
Derivatives of the function $f(x,y)=xy:$
$$
\frac{\partial f}{\partial x}=y, \frac{\partial f}{\partial y}=x
$$
For two specific measurements of $X$ and $Y$,$x=2$ m and $y=3$ m, the approximate uncertainty error variance of the area result ($2m\cdot3m=6m^2$) is:
$$
\sigma_{A}^{2}=y^{2} \cdot 0.01^{2}+x^{2} \cdot 0.02^{2}=3.00^{2} \cdot 0.01^{2}+2.00^{2} \cdot 0.02^{2}=0.0025
$$

```

```ad-summary
title: Method 4.4 <br> Non-linear error propagation by simulation
collapse: open

Assume we have actual measurements $x_{1}, \ldots, x_{n}$ with known/assumed error variances $\sigma_{1}^{2}, \ldots, \sigma_{n}^{2}$ :
1. Simulate $k$ outcomes of all $n$ measurements from assumed error distributions, e.g. $\ndist\left(x_{i}, \sigma_{i}^{2}\right): X_{i}^{(j)}, j=1 \ldots, k$
2. Calculate the standard deviation directly as the observed standard deviation of the $k$ simulated values of $f$ :
$$
s_{f\left(X_{1}, \ldots, X_{n}\right)}^{\operatorname{sim}}=\sqrt{\frac{1}{k-1} \sum_{j=1}^{k}\left(f_{j}-\bar{f}\right)^{2}}
$$
where
$$
f_{j}=f\left(X_{1}^{(j)}, \ldots, X_{n}^{(j)}\right)
$$

See example in [[Statistical simulation#Examples|Statistical simulation]]
```
# References
- [[Introduction to Mathematical Statistics - 02403]]