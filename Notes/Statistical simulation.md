---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Probability]], [[Statistics]]
****

If the [[Random variable]] observed is a non-linear one, we do not have tools and theorems allowing us to determine the [[Mean]], [[Variance]] and so on.
To solve this problem, we can simulate the variable. Do a large number of observations and compute these variables based on that.
Statistical simulation is a more general purpose tool, used in statistics to determine unknown distribution parameters when theorems cannot.

# Index
- [[Parametric bootstrapping]]
- [[Non-parametric bootstrapping]]

# Examples

````ad-example
collapse: close

A company produces rectangular plates. The length of plates (in meters), $X$ is assumed to follow a [[normal distribution]] $N\left(2,0.01^{2}\right)$ and the width of the plates (in meters), $Y$ are assumed to follow a normal distribution $N\left(3,0.02^{2}\right)$. We're hence dealing with plates of size $2 \times 3$ meters, but with errors in both length and width.
Assume that these errors are completely independent. We are interested in the area of the plates which is given by $A=X Y$.
```R
# Number of simulations
k <- 10000

# Simulate X, Y and then A
X <- rnorm(k, 2, 0.01)
Y <- rnorm(k, 3, 0.02)
A <- X*Y

# Parameters
mean(A)
> 6

sd(A)
> 0.04957
```

Let's say we wish to determine the probability that the error is more than $0.1~m^2$. We simply do this by checking how many observations had an error bigger than 0.1 and get a fairly good approximation:

```R
mean(abs(A-6)>0.1)
> 0.0439
```
````

# References
- [[Introduction to Mathematical Statistics - 02403]]