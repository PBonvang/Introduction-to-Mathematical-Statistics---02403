---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Probability]]
****
<span class="centerImg">![[ExponentialDistributionExample.png|350]]</span>
$$
X \sim \operatorname{Exp}(\lambda)
$$
$\lambda:$ The average rate of events

The exponential distribution is commonly used to describe the length (usually time) between events which, when counted, follows a [[Poisson distribution]]. The length between events which occur continuously and independently at a constant rate.

# [[Probability density function - PDF]]
$$
f(x)= \begin{cases}\lambda e^{-\lambda x} & \text { for } x \geq 0 \\ 0 & \text { for } x<0\end{cases}
$$

# [[Mean]] and [[variance]]
$$\mu=\frac{1}{\lambda}$$
$$\sigma^{2}=\frac{1}{\lambda^{2}}$$

# Min-sum
In a system of serially connected components, has a lifetime equal to the exponential distribution with the rate as the sum of the lifetime rates of each component in the system.
$$\lambda_{sys}=\lambda_{c1}+\lambda_{c2}+\cdots+\lambda_{n}$$


# In R
```r
# The rate parameter: events per time
lambda <- 4
# Number of realizations
n <- 1000
# Simulate
x <- rexp(n, lambda)
# The empirical pdf
hist(x, probability=TRUE)
# Add the pdf to the plot
curve(dexp(xseq,lambda), xname="xseq", add=TRUE, col="red")
# Check the relation to the Poisson distribution
# by counting the events in each interval

# Sum up to get the running time
xCum <- cumsum(x)
# Use the hist function to count in intervals between the breaks,
# here 0,1,2,...
tmp <- hist(xCum, breaks=0:ceiling(max(xCum)))
# Plot the discrete empirical pdf
plot(table(tmp$counts)/length(tmp$counts))
# Add the Poisson pdf to the plot
lines(0:20, dpois(0:20,lambda), type="h", col="red")
```
<span class="centerImg">![[ExponentialDistributionTimeExample.png|350]]</span>
# References
- [[Introduction to Mathematical Statistics - 02403]]