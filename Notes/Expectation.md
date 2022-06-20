---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Probability]] 
****

The mean value of a random variable $X$ in the limit of infinitely many trials:
$$
\mathbb{E}[X]=\lim _{N \rightarrow \infty} \frac{1}{N} \sum_{n=1}^{N} x_{n}
$$

## [[Discrete data|Discrete random variables]] 
$$
\mathbb{E}[X]=\sum_{X} f_{X}(x) x
$$
$f_X(x)=P(X=x):$ The probability mass function 

## [[Continuous random variable]]
$$
\mathbb{E}[X]=\int_{-\infty}^{\infty} p_{X}(x) x d x
$$

## Rules
- [[The law of the unconscious statistician LOTUS]]
### Linearity
$$
\mathbb{E}[a X+b Y]=a \mathbb{E}[X]+b \mathbb{E}[Y]
$$
### Tower property
$$
\mathbb{E}[X]=\mathbb{E}[\mathbb{E}[X \mid Y]]
$$
### Independent expectations
$$
X, Y \text { independent } \Rightarrow \mathbb{E}[X Y]=\mathbb{E}[X] \mathbb{E}[Y]
$$

## Identity function
$$
\mathbb{E}[\mathbb{I}[Y=i]]=\mathbb{P}(Y=i \mid X=x)
$$

# References
- [[Signals and data - 02462]]