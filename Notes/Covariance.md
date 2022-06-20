Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Machine learning]], [[Probability]]
Translations: 
****
Covariance is a measure influence/relation between variables. Providing an idea of how dependent each variable is on each other.

The covariance $\operatorname{cov}[X, Y]$ between $X$ and $Y$ is calculated as:
$$
\operatorname{cov}[X, Y]=\mathbb{E}[(X-\mathbb{E}[X])(Y-\mathbb{E}[Y])]=\mathbb{E}[X Y]-\mathbb{E}[X] \mathbb{E}[Y]
$$
or
$$
\operatorname{cov}(X, Y)=\sigma_{xy}=\frac{1}{N} \sum_{i=1}^{N}\left(x_{i}-\mu_{x}\right)\left(y_{i}-\mu_{y}\right)
$$

The covariance is reported as the [[Correlation]] p, which is a normalized measure between -1 and 1.

With the covariance and one variable we're able to estimate the others if they aren't independent. If the variance is -1 it means for $X$ and $Y$ that when $X$ is at it's upper bound $Y$ is at it's lower bound.

# Sample covariance
$$
s_{x y}=\frac{1}{n-1} \sum_{i=1}^{n}\left(x_{i}-\bar{x}\right)\left(y_{i}-\bar{y}\right)
$$

# What does it mean?
$\operatorname{cov}[X, Y]>0:$ the variables moves in the same direction.

$\operatorname{cov}[X, Y]<0:$ the variables move in opposite directions.

$\operatorname{cov}[X, Y]=0:$ they are independent.
## On contours
![[CovarianceContourExamples1.png]]![[CovarianceContourExamples2.png]]
# Rules/Properties
$$
\operatorname{cov}[X, Y]=\operatorname{cov}[Y, X]\tag{1}
$$
$$
\operatorname{cov}[X, X]=\operatorname{var}[X]\tag{2}
$$

# Linear combinations
$$
\operatorname{Cov}\left(a_{0}+a_{1} X+a_{2} Y, b_{0}+b_{1} X+b_{2} Y\right)=a_{1} b_{1}\cdot \mathrm{Var}(X)+a_{2} b_{2} \cdot\mathrm{Var}(Y)+\left(a_{1} b_{2}+a_{2} b_{1}\right)\cdot \operatorname{cov}(X, Y)
$$

```ad-example
$$
\mathrm{V}(Z) =\operatorname{Cov}[2 X-Y, 2 X-Y]=2^{2} \mathrm{~V}(X)+\mathrm{V}(Y)-4 \operatorname{Cov}(X, Y)
$$

```

# References
- [[Casuality]]
- [[Signals and data - 02462]]
- [[Introduction to intelligent systems - 02461]]
- [[Expectation]]