---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]], [[Distributions]]
****

<span class="centerImg">![[poissonDistributionExample.png|#invert]]</span>

$$
X \sim P o(\lambda)
$$
$\lambda:$ The rate/intensity. The average number of events per interval

The Poisson distribution describes the probability of a given number of event occurring in a fixed interval, if we know their average rate and they occur independently of each other.
The interval is often time, used to monitor arrivals, traffic... but could just as well be distance, area, volumne...

A useful property of the Poisson distribution is it's rate scaling. If you have the hourly rate $\lambda^{\text{hour}}$ you can easily change it to the minute rate:
$$
\lambda^{\text {minute }}=\frac{\lambda^{\text {hour }}}{60}
$$
```ad-example
title: Example: Rate scaling

You are at a soccer match and need to pee. You estimate that it will take you 10 minutes and want to determine the probability of no goals being scored while you are away.
We assume the scoring of goals per match is Poisson distributed and on average 3.4 goals are scored per match.
We therefore have the 90 minute rate: $\lambda^{\text{90 min}}=3.4$
which we can transform to the 10 min rate by dividing with 9: $\lambda^{\text{10 min}}=\frac{3.4}{9}$

Now computing the probability of no goals (0 events happening, $x=0$) in the 10 minute interval is given by the [[#Probability density function - PDF]]:
$$
P(X=0)=f\left(0, \lambda^{10 \text { minutes }}\right) \approx 0.685
$$
```
In practice this means

**Commonly used to describe:**
- the number radioactive particle decays per time interval, i.e. the number of clicks per time interval of a Geiger counter
- calls to a call center per time interval ($\lambda$ changes through the day)
- number of mutations in a given stretch of DNA after a certain amount of radiation
- goals scored in a soccer match

# Determining the rate
If you're provided with the probability of no events occurring in a period, we can simply use the [[#Probability density function - PDF]] to determine the rate:
$$\begin{align*}
\P(X=0)&=\frac{\lambda^{0}}{0 !} \e^{-\lambda}=\e^{-\lambda}\\
&\Updownarrow\\
\lambda&=-\log(\P(X=0))
\end{align*}$$

```ad-example
The arrival of guests wishing to check into a hotel is assumed in the period between 14 and 18 o'clock to be described by a poisson proces (arrivals are assumed evenly distributed over time and independent of each other). From extensive previous measurements it has been found that the probability that no guests arrive in a period of 15 minutes is $0.3$.
$P\left(\lambda_{15 \min }=0\right)=0.3$, where $\lambda_{15 \min }$ describes the number of arrivals per $15 \mathrm{~min}$.

$$\lambda_{15 \min }=-\log(0.3)=1.2$$

```


# [[Exponential distribution]]
If the number of events follow a Poisson distribution with the mean value: $\lambda$, the time between events follow a [[Exponential distribution]] with a mean of $1/\lambda$.
# [[Probability density function - PDF]]
$$
f(x ; \lambda)=\frac{\lambda^{x}}{x !} e^{-\lambda}
$$
$x:$ Number of 
The Poisson PDF describes the probability of $x$ events occurring in an interval.

# [[Mean]] and [[variance]]
$$\mu=\lambda$$
$$\sigma^{2}=\lambda$$

# In R
```R
{d,p,q,r}pois()
```
````ad-example
```R
# The mean rate of events per interval
lambda <- 4
# Number of realizations
n <- 1000
# Simulate
x <- rpois(n, lambda)
# Plot the empirical pdf
plot(table(x)/n)
# Add the pdf to the plot
lines(0:20, dpois(0:20,lambda), type="h", col="red")
```
<span class="centerImg">![[PoissonDistributionRExample.png|350]]</span>
````

# References
- [[Introduction to Mathematical Statistics - 02403]]