---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]]
****

# General terms

**Descriptive/Explorative statistics:** Simple summaries of data, e.g. summary tables, plots...

**Inferential statistics:** Using statistics and learning from data for educated decision making. In practice it means inferring properties about the statistical population based on the patterns found in the sample.

**Observational unit:** A single entity, which the information is about (e.g. a person)

**Observational variable:** A measurable property of the observational unit (e.g. height of a person)

**Statistical population:** The set consisting of the values of the observational variable for all observational units (e.g. the heights of everyone at DTU).

**Sample:** A subset of the statistical population, chosen to represent the population (e.g. height of 20 people at DTU).

**Random sample:** A subset of the statistical population chosen randomly. Each of the random variables of must be independent. In short the observations must come from the same population distribution and must each represent new information (independence).

**Categorical/Discrete data:** If the variable belongs to a set of categories. If there's a discrete number of possible outcomes.

**Population parameters:** 
- [[Mean]] / [[Expectation]] - [[Sample mean]]
- [[Variance]] - [[Sample variance]]
- [[Standard deviation]]

**CI:** [[Confidence interval]]
**CLT:** [[Central limit theorem]]
**PDF:** [[Probability density function - PDF]]
**CDF:** [[Cumulative distribution function - CDF]]
**I.I.D:** Independent and identically distributed, means that each observation is independent (not effected by other observations) and distributed using the same distribution type (often [[Normal distribution]]).

$\op{Cov}:$ [[Covariance]]
# Estimators
**Estimate:** A concrete estimate of a true value, e.g. the [[Sample mean]] value is a estimate of the true [[Mean]]. It's the concrete values as a result of a sample.

**Estimator:** A random variable which estimates a true value, e.g. the [[Sample mean]] is an estimator of the true [[mean]]. Estimators produce estimates.

**Central estimator:** $E[\hat\theta]=\theta$
An estimator $\hat\theta$ is central if and only if the [[median]] of the sample distribution of the estimator is $\theta$.
Ex: 
$E[\hat{\mu}]=\mu$
$Var[\bar{X}]=\frac{\sigma^{2}}{n}$

**Consistent estimator:**
A central estimator $\hat\theta$ which converges in probability ($\op{var}(\theta_{n})\rightarrow 0$)

**Efficient estimator:**
$\hat\theta_{1}$ is a more efficient estimator of $\theta$ than $\hat\theta_{2}$ if:
1. Both are central estimators of $\theta$
2. The variance of $\hat\theta_1$'s sample distribution is less than $\hat\theta_2$'s 
	$$\op{Var}(\hat\theta_{1})<\op{Var}(\hat\theta_{2})$$


# References
- [[Introduction to Mathematical Statistics - 02403]]