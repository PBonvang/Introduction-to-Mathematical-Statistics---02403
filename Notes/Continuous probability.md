---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Probability]] 
****

 <p align="center">
	<font size="9"><strong>Continuous probability</strong></font>
</p>

****

When the random variable is a continuous variable, resulting in infinite state space, the probability that the variable takes a particular value is therefore almost 0, and therefore doesn't make sense to use a probability mass function.
Instead the *probability density function* is utilized, to describe the probability of the random variable X taking a value within an interval.

# Index
- [[Probability density function - PDF#Continuous variables]]
- [[Cumulative distribution function - CDF#Continuous variables]]

## Joint probabilities
Denoted: $p_{var1,var2,...}$
For multiple random variables the probability density function is defined as:
$$\mathbb((var1,var2,...)\in R)=\int ...\int_R p_{var1,var2,...}(var1,var2,...)\space dvar1 \space dvar2 ...$$
where $R$ is a region of the n-dimensional space.

## Conditional probability density function
Denoted: $p_{x|y}(x,y)$
The probability density for $X$ given $Y=y$