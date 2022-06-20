---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]], [[Variable normality]]
****
<span class="centerImg">![[NormalQQPlot.png|300]]</span>

The QQ-plot is a verification method, used to check if a [[Random variable]] is indeed [[normal distribution|normally distributed]].
In practice the plot shows quantiles of the observations of a sample along with the quantiles of the best fitted normal distribution. If the samples deviate a lot, it's a good sign that the variable isn't normally distributed.

# In R
**Simple QQ-plot:**
```R
qqnorm(x)
qqline(x)
```
**Wally plot:** Makes 9 QQ-plots of 8 similar but normally distributed variables and the sample QQ-plot. Can be easier to tell if the deviation actually exist.
```R
require(MESS)
qqwrap <- function(x,y, ...) {
	qqnorm(y,main="",...)
	qqline(y)
}
wallyplot(data, FUN = qqwrap)
```

# Examples
````ad-example
Given two normally distributed random variables:
$$X \sim\ndist(2,2^{2}), \quad Y \sim\ndist(3,3^{2})$$

We wish to determine if their sum:
$$Z=X+Y$$
follows the distribution:
$$Z\sim\ndist(2+3,2^{2}+3^{2})?$$

by simulating the variables a large quantity of times and adding their observations we get a fairly good idea of the distribution.

```R
# Number of observations
k = 10000

# Variables
mu_x = 2
sd_x = 2
X = rnorm(k, mu_x, sd_x)

mu_y = 3
sd_y = 3
Y = rnorm(k, mu_y, sd_y)

# Expression
Z = X+Y

# Plot
par(mfrow = c(1, 2))

hist(Z, freq = FALSE)
curve(dnorm(xseq, mean = mu_x + mu_y, sd = sqrt(sd_x^2 + sd_y^2)), xname="xseq", add = TRUE, col = 2)

plot(ecdf(Z))
curve(pnorm(xseq, mean = mu_x + mu_y, sd = sqrt(sd_x^2 + sd_y^2)), xname="xseq", add = TRUE, col = 2)
```
<span class="centerImg">![[StatisticalSimulationExampleQQPlot.png]]</span>

````
# References
- [[Introduction to Mathematical Statistics - 02403]]