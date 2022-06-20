---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Probability]]
****

 <p align="center">
	<font size="9"><strong>Joint probability</strong></font>
</p>

****

When we wish to determine the probability of multiple random variables in the same sample space, we wish to determine their *joint probability*.

## Joint probability mass function
Assigns a probability to each possible combination outcome x and y of the two random variables X and Y.

Often denoted: $P(X=x,Y=y)$

## Marginal probability
The sum of all probabilities where a variable is a certain value.
Say we have a table of X and Y values, we sum up all the probabilities where Y had a certain value, but X had different values.

Ex:
![[MarginalProbabilityExample.png]]

## Joint density function
If the two variables are independent, then we can define the joint density function as the product of each of the normal distributions:
$$
\begin{aligned}
\mathrm{p}\left(\mathrm{x}_{1}\right) \mathrm{p}\left(\mathrm{x}_{2}\right) &=\frac{1}{\sqrt{2 \pi \sigma_{1}^{2}}} \exp \left(-\frac{1}{2} \frac{\left(\mathrm{x}_{1}-\mu_{1}\right)^{2}}{\sigma_{1}^{2}}\right) \cdot \frac{1}{\sqrt{2 \pi \sigma_{2}^{2}}} \exp \left(-\frac{1}{2} \frac{\left(\mathrm{x}_{2}-\mu_{2}\right)^{2}}{\sigma_{2}^{2}}\right) \\
&=\frac{1}{\sqrt{(2 \pi)^{2} \sigma_{1}^{2} \sigma_{2}^{2}}} \exp \left(-\frac{1}{2}\left(\frac{\left(\mathrm{x}_{1}-\mu_{1}\right)^{2}}{\sigma_{1}^{2}}+\frac{\left(\mathrm{x}_{2}-\mu_{2}\right)^{2}}{\sigma_{2}^{2}}\right)\right)
\end{aligned}
$$
