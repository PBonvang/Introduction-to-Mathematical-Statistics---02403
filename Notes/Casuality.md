---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subject: [[Artificial intelligence]] 
****

 <p align="center">
	<font size="9"><strong>Casuality & casual estimation</strong></font>
</p>

****
The influence one one variable has on another.

*What casual effect will changing one variable have on another?*

# Example
During the second world war it was noticed that air planes returning from battle had more bullet holes in the fuselage than in the engine. At first, this finding suggested that more armour should be added to the fuselage to protect them where they seemed to get hit the most. However, a statistician who examined the case came to the opposite
conclusion: They should add more armour to the engine. While at first this might seem backward, the argument is clear: If we assume that the bombers are equally likely to get hit everywhere, the fact that the air planes that return have more bullet holes in the fuselage suggests that planes that are hit in the engine are more likely to crash and therefore not return. The planes that do return are the ones that are hit where it does not matter so much.

\- *Jordan Ellenberg, “How Not to Be Wrong: The Power of Mathematical Thinking”*

# Statistical dependence and independence
2 variables $x$ and $y$ is statistically independent if there's no association between the 2. Knowing something about $x$ doesn't tell us anything about $y$.

**Testing for independence:** If the probability of a combination of 2 variable values is the same as the product of the probabilities of each value:
$$p(x,y)=p(x)p(y)$$
Example: Heads and tails: the probability of getting heads is 50% ($p(x)=0.5$) and the probability of getting two heads in a row, or heads then tails, or any other combination is 25% ($p(x,y)=0.25$). Which shows that the value of the first throw and the second is statistically independent as $p(x,y)=p(x)p(y)=0.25$.

# Linear dependence
When 2 variables are associated.

**Positive dependence:** When a particular value of one variable tells us about a particular value of the other.

**Negative dependence:** When the value of one variable tells us what the other isn't. (Ex: Soduku)

## Measures of linear dependence
**Covariance:**
$$
\operatorname{cov}(x, y)=\frac{1}{N} \sum_{i=1}^{N}\left(x_{i}-\mu_{x}\right)\left(y_{i}-\mu_{y}\right)
$$

**(Pearson) Correlation coefficient:**
Between $-1$ and $1$.
$$
\rho_{x, y}=\frac{\operatorname{cov}(x, y)}{\sigma_{x} \cdot \sigma_{y}}
$$

**Example:**
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

## Types of correlation

**Causal relation:** Changing one variable also changes the other, but we don't know which is the cause and the which is the effect.

**Bidirectional relation:** When both variables are depending on each other (Ex: predator-pray, as the number of predators increase, the number of pray decrease, and as the number of pray decrease, the number of predators decrease).

**Confounding:** When an unobserved variable is the cause of the relation.
Confounding variables effect both the perceived cause/treatment and effect/outcome, which makes them a potential risk when debating causation (The treatment seems to work, but it might be because of a confounding variable and not the treatment).

**Spurious correlation:** A random coincidence.

## Correlation and causation
**Correlation isn't causation.** It's easy to believe that correlation between 2 variables means that one causes the other, but that is rarely the case, therefore it is crucial to know what assumptions need to be true for the correlation to be a causation.

**Correlation:** A statistical measure of the linear relation between 2 variables.

**Causation:** When one variable (effect) is the result of another variable (cause).

## Simpsons paradox
When the total probability gives a different picture than what the subgroups show.
Examples with kidney stones:

|              | Treatment A              | Treatment B              |
| ------------ | ------------------------ | ------------------------ |
| Small stones | $$\frac{81}{87}=93\%$$   | $$\frac{234}{270}=87\%$$ |
| Large stones | $$\frac{192}{263}=73\%$$ | $$\frac{55}{80}=69\%$$   |
| Total        | $$\frac{273}{350}=78\%$$ | $$\frac{289}{350}=83\%$$ |

### Probability
**Kidney stone example:**
$s:$ stone size (large or small)
$T:$ treatment (A or B)
$P(R=1\mid S=s,T=A):$ Probability of recovery if you have a small kidney stone and get treatment A. $\frac{81}{87}$
$P(S=s\mid T=A):$ $\frac{87}{350}$
$P(R=1\mid S=l,T=A):$ $\frac{192}{263}$
$P(S=l\mid T=A):$ $\frac{263}{350}$
$P(S=l):$ $\frac{263+80}{350+350}$

**Conditional probability of recovery:** When the selection of treatment A is done based on a doctors prior experiences.
$$P(R=1\mid T=A)=\sum\limits_{S} P(R=1 \mid S=s,T=A)\cdot P(S=s\mid T=A)=0.78$$

**Intervention of recovery:** When the choice of A is random.
$$P_{do(T=A)}(R=1)\sum\limits_{s}P(R=1\mid S=s,T=A)\cdot P(S=s)$$
$$=\frac{81}{87}\cdot \frac{87+270}{700} + \frac{192}{263}\cdot \frac{263+80}{700}\approx 83\%$$

Because there's a confounding variable (Kidney size) the intervention probability is a better indicator of the probability of recovery.