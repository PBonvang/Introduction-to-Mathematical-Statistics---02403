Modified: `$= dv.current().file.mtime`
Tags: []
Subjects:  [[Probability]], [[Statistics]]
Translations: Varians
Synonyms: 
****

$$\large
\begin{align*}
\sigma^{2}=\operatorname{var}[X]&=\frac{1}{n}\sum\limits_{i=1}^{n}(x_i - \mu)^{2}\\
&=\sum\limits_{i=1}^{n}(x_i - \mu)^{2}\*f(x_{i})\\
&=\mathbb{E}\left[(X-\mathbb{E}[X])^{2}\right]\\
&=\mathbb{E}\left[X^{2}\right]-\mathbb{E}[X]^{2}
\end{align*}$$
$f(x):$ [[Probability density function - PDF]]
$\mathbb{E}[X]:$ [[Expectation]]

Variance of a sample is a measure of 'spread' in the distribution, calculated as the average squared deviation from the [[Mean]].
Notice that the variance has the squared unit of the actual dataset, which is why [[Standard deviation]] exist.

See also:
- [[Sample variance]]
- [[Pooled variance]]
# Sum rule
The variance of the sum of two variables:
$$
\operatorname{Var}[X+Y]=\operatorname{Var}[X]+\operatorname{Var}[Y]+2 \operatorname{Cov}[X, Y]
$$
Is the same as each of the variances plus 2 times the [[Covariance]] of the variables.

# Continuous variables
$$
\sigma^{2}=\mathrm{E}\left[(X-\mu)^{2}\right]=\int_{-\infty}^{\infty}(x-\mu)^{2} f(x)\ d x
$$
$f(x):$ [[Probability density function - PDF#Continuous variables|Probability density function - PDF]]

# Linearity
For a linear function $Y=a X+b$, the variance can simply be reduced to:
$$
\mathrm{Var}(Y)=\mathrm{Var}(a \mathrm{X}+b)=a^{2} \mathrm{~Var}(X)
$$
## Linear combinations
Assuming the [[Random variable|random variables]] are independent, the variance of their **scaled** sum is:
$$
\mathrm{Var}\left(a_{1} X_{1}+a_{2} X_{2}+\cdots+a_{n} X_{n}\right)=a_{1}^{2} \mathrm{~Var}\left(X_{1}\right)+a_{2}^{2} \mathrm{~Var}\left(X_{2}\right)+\cdots+a_{n}^{2} \mathrm{~Var}\left(X_{n}\right)
$$

Say we wish to determine the variance of 5 dice throws
$$
Y^{\text {sum }}=X_{1}+X_{2}+X_{3}+X_{4}+X_{5}
$$

$$
\begin{aligned}
\sigma_{Y^{\text {sum}}}^{2} &=\mathrm{V}\left(X_{1}+X_{2}+X_{3}+X_{4}+X_{5}\right) \\
&=\mathrm{V}\left(X_{1}\right)+\mathrm{V}\left(X_{2}\right)+\mathrm{V}\left(X_{3}\right)+\mathrm{V}\left(X_{4}\right)+\mathrm{V}\left(X_{5}\right) \\
&=5 \sigma_{X}^{2}
\end{aligned}
$$
Notice that the scaling is 5 due to the number of throws, not $5^{2}$ as with scaled variance.

## Multivariate
$$
\sigma_{X}^{2}=\iint\left(x-\mu_{X}\right)^{2} f(x, y) d x d y
$$
$f(x,y):$ [[Joint probability density function]]

$$
\begin{aligned}
Z=& a_{1} X_{1}+a_{2} X_{2}+. .+a_{n} X_{n} \\
\operatorname{Var}(Z)=& a_{1}^{2} \operatorname{Var}\left(X_{1}\right)+. .+a_{n}^{2} \operatorname{Var}\left(X_{n}\right)+2 a_{1} a_{2} \operatorname{Cov}\left(X_{1}, X_{2}\right)+\ldots+\\
& 2 a_{1} a_{n} \operatorname{Cov}\left(X_{1}, X_{n}\right)+2 a_{2} a_{3} \operatorname{Cov}\left(X_{2}, X_{3}\right)+\ldots+\\
& 2 a_{n-1} a_{n} \operatorname{Cov}\left(X_{n-1}, X_{n}\right)
\end{aligned}
$$

# References
- [[Expectation]]
- [[Introduction to Mathematical Statistics - 02403]]