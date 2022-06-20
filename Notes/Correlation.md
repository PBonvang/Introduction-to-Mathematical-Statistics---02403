Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Probability]], [[Covariance]]
Translations: 
Synonyms: Correlation coefficient
****
$$
\rho_{(x,y)}=r_{xy}=\operatorname{corr}(X, Y)=\frac{\operatorname{cov}(X, Y)}{\sqrt{\operatorname{var}[X] \operatorname{var}[Y]}}=\frac{\sigma_{XY}}{\sigma_X\*\sigma_Y}
$$
Correlation is a measure of linear influence/relation between two random variables, calculated as the [[Covariance]] normalized to the interval: $[-1,1]$.

Just like [[Covariance]], the value of the correlation coefficient tells us the relation between the two variables:
$\operatorname{corr}(X, Y)=0\Rightarrow$ $X$ and $Y$ are independent.
$\operatorname{corr}(X, Y)=1\Rightarrow X=Y$ 
$\operatorname{corr}(X, Y)=-1\Rightarrow X=-Y$ 
$r_{xy}=\pm1:$ All observations are exactly on a line

Note that only the linear relation is considered!

<span class="centerImg">![[CovarianceContourExamples3.png]]</span>

```ad-example
collapse: close

Given:
$$x=\{1,8,4,10,2\},\quad y=\{7,5,4,3,6\}$$
$$\mu_x=5,\quad \mu_y = 5,\quad \sigma_x\approx 3.46,\quad \sigma_y\approx 1.41$$

Covariance:
$$\begin{aligned}
\operatorname{cov}(x, y)=& \frac{1}{N} \sum_{i=1}^{N}\left(x_{i}-\mu_{x}\right)\left(y_{i}-\mu_{y}\right) \\
=& \frac{1}{5}((1-5)(7-5)+(8-5)(5-5)+(4-5)(4-5)\\
&\quad+(10-5)(3-5)+(2-5)(6-5))=-4
\end{aligned}$$
Because $\operatorname{cov}(x,y)<0$ it means when $x$ is higher than it's mean, $y$ is relatively lower than it's mean.

Correlation coefficient:
$$\rho_{x, y}=\frac{\operatorname{cov}(x, y)}{\sigma_{x} \cdot \sigma_{y}} \approx \frac{-4}{3.46 \cdot 1.41} \approx-0.82$$
```

# References
- [[Variance]]
- [[Sample correlation]]
- [[Signals and data - 02462]]