---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Probability]], [[Statistics]]
****

The probability density function (PDF) associates a probability to each possible outcome of a [[Random variable]].

# Discrete variables
If the variable is discrete like the role of a dice, the probability density function is simply the probability associated with each possible outcome, e.g. $\frac{1}{6}$ for any outcome of a dice.
$$f(x)=\P(X=x)$$
A discrete PDF fulfills 2 properties:
$$f(x)\ge0 \text{ for all } x\tag{1}$$
$$\sum\limits^{X} f(x)=1\tag{2}$$

# Continuous variables
Denoted: $p_x,f,f_x$

The density function $f$ itself is defined by us or given.

The probability of the value being in the range from $a$ to $b$ is computed as:
$$
\mathbb{P}(a \leq X \leq b)=\int_{a}^{b} p_{x}(x)\ d x
$$
<span class="centerImg">![[ProbabilityDensityFunctionExample1.png|#invert]]</span>

For the entirety of the state space:
$$
\int_{-\infty}^{\infty} p_{X}(x)\ d x=1, \quad p_{X}(x) \geq 0 \text { for all } x
$$

A difference between the mass and density functions is that the density function has units, eg. If X records a random time in seconds, the density is measured in $1/\text{sec}$ (Hertz)

**Example:**
For a [[Uniform distribution]] in a given interval $[a,b]$, the density function would be:
$$
p_{u}(u)=\left\{\begin{array}{ll}
\frac{1}{b-a} & \text { for } u \in[a, b] \\
0 & \text { otherwise }
\end{array}\right.
$$
<span class="centerImg">![[ProbabilityDensityFunctionExample2.png|#invert]]</span>


# References
 - [[Signals and data - 02462]]
 - [[Introduction to Mathematical Statistics - 02403]]