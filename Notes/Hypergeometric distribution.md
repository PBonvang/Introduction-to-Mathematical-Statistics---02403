---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Statistics]], [[Probability]], [[Discrete distributions]]
****

$$
X \sim H(n, a, N)
$$
$X:$ The number of successes in $n$ draws without replacement.
$n:$ The number of draws.
$a:$ Number of successes of the $N$ elements in the population.
$N:$ Total number of elements in population.

The hypergeometric distribution describes number of successes from successive draws without replacement, e.g. drawing cards (the same card cannot be drawn again).
It's basically the [[Binomial distribution]] without replacement (once a ball is observed, it's removed from the set for the next draw).

# [[Probability density function - PDF]]
$$
f(x ; n, a, N)=P(X=x)=\frac{\left(\begin{array}{l}
a \\
x
\end{array}\right)\left(\begin{array}{c}
N-a \\
n-x
\end{array}\right)}{\left(\begin{array}{l}
N \\
n
\end{array}\right)}
$$
The notation:
$$
\left(\begin{array}{l}
a \\
b
\end{array}\right)=\frac{a !}{b !(a-b) !}
$$
represent the number of combinations of $b$ elements which can be chosen from a set of $a$ elements.

# [[Mean]] and [[variance]]
$$\mu=n \frac{a}{N}$$
$$\sigma^2=n \frac{a(N-a)}{N^{2}}\cdot \frac{N-n}{N-1}$$

# In R
```R
dhyper(x, m=a, n=N-a, k=n)
```

# Examples
```ad-example
title: Example: <br> Multiple $x$ values

On a shelf 9 apparently identical ring binders are postioned. It is known that 2 of the ring binders contain statistics exercises, 3 of the ring binders contain math problems and 4 of ring binders contain reports. Three ring binders are sampled without replacement.

What's the probability that all three are report binders?
$x=3, ~n=3, ~a=4, ~N=9$
$$\P(X=3)=\frac{\left(\begin{array}{l}
4 \\
3
\end{array}\right)\left(\begin{array}{c}
9-4 \\
3-3
\end{array}\right)}{\left(\begin{array}{l}
9 \\
3
\end{array}\right)}=\frac{1}{21}$$

What's the probablity of getting one of each type?
In general the nominator counts the ones corresponding to the event in question and the denominator counts the total number of possibilites:
$$
\P_{all}=\frac{\left(\begin{array}{l}
2 \\
1
\end{array}\right)\left(\begin{array}{l}
3 \\
1
\end{array}\right)\left(\begin{array}{l}
4 \\
1
\end{array}\right)}{\left(\begin{array}{l}
9 \\
3
\end{array}\right)}=\frac{6}{21}
$$
```
# References
- [[Introduction to Mathematical Statistics - 02403]]