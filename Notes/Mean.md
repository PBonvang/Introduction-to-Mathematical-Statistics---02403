Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Mathematics]], [[Statistics]], [[Probability]]
Translations: Gennemsnit
Synonyms: Average, [[Expectation]]
****
$$\Large
\mu=\op{E}(X)=\lim _{N \rightarrow \infty} \frac{1}{N} \sum_{n=1}^{N} x_{n}
$$

The population mean is the average/expected value of the [[Random variable]]. It's the sample mean/average value which the population asymptotically approaches as $n$ grows.
It's essentially the true mean of the population.

**Example:** Dice
For a dice the mean value is $3.5$, because each number is equally probable $\frac{1}{6}$, and the total sum of all the possible outcomes is $21$. The mean/expected value of a fair dice is therefore $\frac{21}{6}=3.5$ .

# Continuous variables
$$\large
\mu=\mathrm{E}(X)=\int_{-\infty}^{\infty} x f(x)\ d x
$$
$f(x):$ [[Probability density function - PDF#Continuous variables|Probability density function - PDF]]

# Linearity
For a linear function $Y=a X+b$, the mean is the mean of X times $a$ plus b:
$$
\mathrm{E}(Y)=\mathrm{E}(a X+b)=a \mathrm{E}(X)+b
$$
```ad-info
title: Proof
collapse: close

$$\begin{align*}
E[aX+b]&=\int (ax+b)f(x)\ dx\\
&=a\int x f(x)\ dx + b\int f(x)\ dx\\
&=aE[X] + b
\end{align*}$$
```

## Linear combinations
For [[Random variable|random variables]] the mean of their sum is:
$$
\mathrm{E}\left(a_{1} X_{1}+a_{2} X_{2}+\cdots+a_{n} X_{n}\right)=a_{1} \mathrm{E}\left(X_{1}\right)+a_{2} \mathrm{E}\left(X_{2}\right)+\cdots+a_{n} \mathrm{E}\left(X_{n}\right)
$$
regardless of their dependence.

## 2 variables
$$
\mu_{X}=\iint x f(x, y) d x d y
$$
$f(x,y):$ [[Joint probability density function]]

$$
Z_{1}=a_{0}+a_{1} X+a_{2} Y
$$

$$
E\left(Z_{1}\right)=a_{0}+a_{1} E(X)+a_{2} E(Y)
$$
# References
- [[Introduction to Mathematical Statistics - 02403]]