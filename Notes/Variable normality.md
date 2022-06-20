---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]], [[Normal distribution]]
****

Variable normality refers to the distribution of a [[Random variable]] being a [[Normal distribution]].

To check if a variable is normally distributed use a [[QQ plot]].

# Transformation towards normality
Sometimes data isn't normally distributed by can be transformed to follow a normal distribution.

If the sample is positive with long tail or a few large observations apply a logarithmic transformation, $\log(x)$.
Other transformations:
- $\sqrt{x},\frac{1}{x}$ for making large values smaller
- $x^{k}$ for making large values larger

Transformations preserves the [[Quantiles and percentiles]] of the data.


````ad-example
title: Example: Radon

In an American study the radon level was measured in a number of houses. The Environmental Protection Agency's recommended action level is $\geq 4 \mathrm{pCi} / \mathrm{L}$. Here we have the results for 20 of the houses (in $\mathrm{pCi} / \mathrm{L}$ ):
$$\begin{array}{l|cccccccccc}
\text{House} & 1 & 2 & 3 & 4 & 5 & 6 & 7 & 8 & 9 & 10 \\
\text{Radon level} & 2.4 & 4.2 & 1.8 & 2.5 & 5.4 & 2.2 & 4.0 & 1.1 & 1.5 & 5.4 \\
\hline \text{House} & 11 & 12 & 13 & 14 & 15 & 16 & 17 & 18 & 19 & 20 \\
\text{Radon level} & 6.3 & 1.9 & 1.7 & 1.1 & 6.6 & 3.1 & 2.3 & 1.4 & 2.9 & 2.9 \\
\hline
\end{array}$$
The sample mean, median and std. deviance is: $x=3.04, Q_{2}=2.45$ and $s_{x}=1.72$.
We would like to see whether these observed radon levels could be thought of as coming from a normal distribution. To do this we will plot the data:
<span class="centerImg">![[Pasted image 20220609221001.png]]</span>
From both plots we see that the data are positive and right skewed with a few large observations. Therefore a log-transformation is applied:
```R
# Transform using the natural logarithm
logRadon <- log(radon)
hist(logRadon)
qqnorm(logRadon, ylab = "Sample quantiles", xlab = "Normal quantiles")
qqline(logRadon)
```
<span class="centerImg">![[Pasted image 20220609221100.png]]</span>

As expected the log-transformed data seem to be closer to a normal distribution.

Now calculating th $95\%$ [[confidence interval]] for the log-transformed data.
But the log mean isn't really understandable, therefore we can transform it back using the exponential of the esimated mean. **Note that it's then no longer a mean, but a median on the original pCi/L scale.**

```R
# A confidence interval and t-test
t.test(logRadon, conf.level=0.95)

One Sample t-test
data: logRadon
t = 7.8, df = 19, p-value = 2e-07
alternative hypothesis: true mean is not equal to 0
95 percent confidence interval:
0.7054 1.2234
sample estimates:
mean of x
0.9644

# Back transform to original scale, now we get the median!
exp(0.9644)
[1] 2.623

# And the confidence interval on the original scale
exp(c(0.7054, 1.2234))
[1] 2.025 3.399
```

From the R code we see that the mean log-radon level is $0.96$ (95\% CI: $0.71$ to $1.22$ ). On the original scale the estimated median radon level is $2.6 \mathrm{pCi} / \mathrm{L}(95 \% \mathrm{CI}: 2.0$ to 3.4).

````
# References
- [[Introduction to Mathematical Statistics - 02403]]