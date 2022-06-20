---
aliases: [Simple linear confidence interval, Simple linear prediction interval] # Searchable synonyms and translations
---

Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Simple Linear Regression]]
****
Model predictions based on the fitted model
$$
\hat{y}_{\text {new }}=\hat{\beta}_{0}+\hat{\beta}_{1} x_{\text {new }}
$$
will have a variance equal to:
$$
\begin{aligned}
\mathrm{V}\left(\hat{Y}_{\text {new }}\right) &=\mathrm{V}\left(\hat{\beta}_{0}+\hat{\beta}_{1} x_{\text {new }}\right) \\
&=\mathrm{V}\left(\hat{\beta}_{0}\right)+\mathrm{V}\left(\hat{\beta}_{1}\right)x_{\text {new }}^{2}+2 \operatorname{Cov}\left(\hat{\beta}_{0}, \hat{\beta}_{1} x_{\text {new }}\right)
\end{aligned}
$$
which we know from [[Simple linear regression estimator variance#^theorem5-8|Theorem 5.8]] is equal to
$$
\begin{aligned}
\mathrm{V}\left(\hat{Y}_{\text {new }}\right) &=\frac{\sigma^{2}}{n}+\frac{\sigma^{2} \bar{x}^{2}}{S_{x x}}+\frac{\sigma^{2}}{S_{x x}}x_{\text {new }}^{2}-2 \frac{\sigma^{2} \bar{x} x_{\text {new }}}{S_{x x}} \\
&=\sigma^{2}\left(\frac{1}{n}+\frac{\left(x_{\text {new }}-\bar{x}\right)^{2}}{S_{x x}}\right)
\end{aligned}
$$

And for a single new point were using
$$
Y_{\text {new }}=\hat{\beta}_{0}+\hat{\beta}_{1} x_{\text {new }}+\varepsilon_{\text {new }}=\hat{Y}+\varepsilon_\text{new} 
$$
as we need to add the variance of the residuals ($\varepsilon_{new}$), which means 
$$\begin{align*}
\mathrm{V}\left(Y_{\text {new }}\right)&=\mathrm{V}(\hat{Y}_{\text {new }}) + \overbrace{\mathrm{V}(\varepsilon_{\text{new}})}^{\sigma^{2}}\\
&=\sigma^{2}\left(1+\frac{1}{n}+\frac{\left(x_{\text {new }}-\bar{x}\right)^{2}}{S_{x x}}\right)
\end{align*}$$
```ad-summary
title: Method 5.18 <br> Intervals for the line
collapse: open

The ($1- \alpha)$ **confidence interval** for the line $\hat{\beta}_{0}+\hat{\beta}_{1} x_{\text {new }}$ is
$$
\hat{\beta}_{0}+\hat{\beta}_{1} x_{\text {new }} \pm t_{1-\alpha / 2} \cdot\hat{\sigma} \sqrt{\frac{1}{n}+\frac{\left(x_{\text {new }}-\bar{x}\right)^{2}}{S_{x x}}}
$$
and the $(1-\alpha)$ **prediction interval** is
$$
\hat{\beta}_{0}+\hat{\beta}_{1} x_{\text {new }} \pm t_{1-\alpha / 2}\cdot \hat{\sigma} \sqrt{1+\frac{1}{n}+\frac{\left(x_{\text {new }}-\bar{x}\right)^{2}}{S_{x x}}}
$$
where $t_{1-\alpha / 2}$ is the $(1-\alpha / 2)$-quantile of the $t$-distribution with $n-2$ degrees of freedom.

```
^method5-18

Note that the prediction interval width will approach $2 z_{1-\alpha / 2} \cdot \sigma$ as $n \rightarrow \infty$, where as the width of the confidence approaches 0.

Interval meaning:
- **Prediction interval:** Covers a new observation $(1-\alpha)\cdot 100\%$ of the time. We actually don't know the probability of this interval covering new observations when it's calculated on a sample. We just know that their covered  $(1-\alpha)\cdot 100\%$ of the time.
- **Confidence interval:** Expected to cover the true regression line $(1-\alpha)\cdot 100\%$ of the time. This predicts the expected range that new observations will be in.

<span class="centerImg">![[RSSLinearRegressionModelIntervalsExample.png]]</span>
<center> Best linear fit (blue line), truth (yellow line), 95% prediction interval for
the points (dark grey area), 95 % CI for the line (light grey area), and observed
values (white dots), for simulated data</center>

# Examples
````ad-example
title: Example 5.20 <br> Line intervals
collapse: open

Continuing on [[Simple Linear parameter hypothesis testing#^example5-17|Ex. 5.17]] we wish to calculate prediction and confidence intervals for the line for a new student with $x_{new}=200~cm$. The prediction is $\hat{y}_{\text {new }}=102.6 \mathrm{~kg}$ and the $95 \%$ confidence and prediction intervals become:
$$
I_{\text {pred }}=-120+1.113 \cdot 200 \pm t_{0.975}(8) \cdot 3.88 \sqrt{1+\frac{1}{10}+\frac{(178-200)^{2}}{1342}}=[91.8,113]
$$
$$
I_{\text {conf }}=-120+1.113 \cdot 200 \pm t_{0.975}(8) \cdot 3.88 \sqrt{\frac{1}{10}+\frac{(178-200)^{2}}{1342}}=[96.5,109]
$$
Where $t_{0.975}$ is the $0.975$-quantile of a $t$-distribution with $n-2$ degrees of freedom.

In R:
```R
CI <- predict(fitStudents, newdata=data.frame(x=200), interval="confidence",
level=0.95)

	fit lwr upr
1 102.6 96.52 108.7

# Confidence interval plot
plot(x, y, pch=20) # Data
abline(fitStudents) # Model
lines(xval, CI[, "lwr"], lty=2, col="red", lwd=2) # CI lower
lines(xval, CI[, "upr"], lty=2, col="red", lwd=2) # CI upper

PI <- predict(fitStudents, newdata=data.frame(x=200), interval="prediction",
level=0.95)

	fit lwr upr
1 102.6 91.77 113.4

## Prediction interval plot
plot(x, y, pch=20) # Data
abline(fit) # Model
lines(xval, PI[, "lwr"], lty=2, col="blue", lwd=2) # PI lower
lines(xval, PI[, "upr"], lty=2, col="blue", lwd=2) # PI upper

```
````
^example5-20

# References
- [[Introduction to Mathematical Statistics - 02403]]