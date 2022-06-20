---
date: 2022/06/02
course: 02043
courseWeek: 1
lecturer: Jan Kloppenborg Møller
---

Tags: [#Literature/Lecture, #Archived ]
Subjects: [[Statistics]], [[Probability]], [[Introduction to Mathematical Statistics - 02403]]

****
 
 <p align="center">
	<font size="9"><strong>Day 1 - Intro, R and descriptive statistics</strong></font>
</p>

****

# Agenda
# Notes
Statistics is a tool for making educated decisions.

We use a sample to infer something about the population, using a mathematical model.
![[Pasted image 20220602082032.png|350]]

Clear R env: `rm(list=ls())`

**R Commands:**
![[Pasted image 20220602082914.png]]
![[Pasted image 20220602083604.png]]
`dim(x)` gives dimensions of x
`summary(x)` gives a summary of the data, including the min, median, mean and max of each column in the dataset.
`ecdf(x)` gives the empirical density of x

The reason for variance has a $n-1$ is that we can't tell anything about variance if we only have one observation.

$$\begin{align*}
\hat{\mu}&=\arg\underset{\mu}{\min}\sum\limits_{i=1}^{n}(x_{i}-\mu_{x})^{2}\\
\tilde{\mu}&=\arg\underset{\mu}{\min}\sum\limits_{i=1}^{n}|x_{i}-\mu_{x}|
\end{align*}$$

Inter quatile range:
$$IQR = Q_{0.75} - Q_{0.25}$$

## Graphics
![[Pasted image 20220602090942.png]]
The dots in the histogram is extreme data points, outside the scope of the $IQR\*1.5$

## Correlation - r
Measures the degree of linear relation between two variables.

## Stochastic variables / Random variable
Represents the outcome of an experiment which hasn't been executed.
It could be:
- Throwing a dice
- Number of sixes in 10 dice throws
- Km/l for a car

In short a description of how the data is realized.

Discrete can be counted, continuous cannot.
A discrete example is how many people have corona right now.
A continuous could be the temperature.

**Notation:**
Stochastic variables are denoted $X_i$ before the experiment.
When the experiment is done the value is denoted $x_i$.
$X_i$ is a function and $x_i$ is a value.

Probability Density function (PDF):
$$f(x)=P(X=x)$$

## Nøgletal
![[Pasted image 20220602094244.png]]

## Terminology
**Population:** The full group/ collection
**Sample:** A subset of the population

**Varians:** Variation i data
**Spredning:** Variation med samme enhed som data
**Variations koefficient:** Variation i data, men enhedsløs

**Fraktiler:** Essentially fractions of the data. Denoted as $\tau_{p}$ where p is the fraction. It's used to determine the distribution of the dataset. If you get the $\tau_{0.8}$ you get the value which all the first 80% percent of the sorted dataset is or is below.
![[Pasted image 20220602090556.png|350]]

In general if there's a hat on a variable it means it's an estimate, calculated on a sample. The true variable value (without hat) would require infinite samples.

# Thoughts

# Quotes

# References