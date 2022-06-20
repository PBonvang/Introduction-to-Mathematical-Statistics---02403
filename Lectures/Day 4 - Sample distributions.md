---
date: 2022/06/08
course: 02403
courseWeek: 2
lecturer: Jan Kloppenborg Møller
---

Tags: [#Literature/Lecture, #Archived ]
Subjects: [[Introduction to Mathematical Statistics - 02403]], [[Statistics]], [[Sampling]]

****

 <p align="center">
	<font size="9"><strong>Day 4 - Sample distributions</strong></font>
</p>

****
# Agenda
- Simulation
- Statistic inference
- [[Normal distribution]]
- [[Chi-square distribution]]
- [[t-distribution]]
# Notes
Hvis vores hypothese er at $\mu_{0}$ er 5, men vores sample mean $\bar{X}$ er 7.
Så ønsker vi at undersøge fejlen
$$\frac{\bar{X}-\mu_{0}}{\sigma_{\bar{X}}}$$

Under antagelsen at
$$X_i\sim\ndist(\mu_{0},\sigma^{2})$$

Så:
$$\bar{X}\sim\ndist(\mu_{0},\frac{\sigma^{2}}{n})$$


$$\frac{\bar{X}-\mu_{0}}{S/\sqrt{n}}$$
Udtrykket beskriver distrancen mellem sample og vores hypothese i standard avigelser.
$$\hat{\sigma}^{2}=S^{2}$$

At bestemme: $S^{2}\sim?$
```R
X.bar <- apply(X, 1, mean)
S2 <- apply(X, 1, var)
hist(X.bar, prob = TRUE); hist(S2, prob = TRUE)
```
Ex: Mean = 10, sigma = 2
![[Pasted image 20220608082025.png]]

## Estimatorer
$\bar{X}$ og $S^{2}$ er estimatorer for $\mu$ og $\sigma^{2}$, og er selv stokastiske variabler.

**Central estimator:** $E[\theta^{2}]=\theta$
A estimator $\theta$ is central if and only if the mean of the sample distribution of the estimator is $\theta$.
Ex: 
$\hat{\mu}=\bar{X}$
$E[\bar{X}]=\mu$
$Var[\bar{X}]=\frac{\sigma^{2}}{n}$

**Consistent estimator:**
A central estimator $\hat\theta$ which convegates in probability ($var(\theta_{n})\rightarrow 0$)

**Efficient estimator:**
![[Pasted image 20220608082928.png]]

**Estimat:** The concrete values, as a result of a sample.

## Mu notation
$\tilde\mu$ is for the sample median
$\hat\mu$ is for the sample mean
middelværdi = median
## [[Chi-square distribution]]
```ad-example
$$
X_{1} \sim N\left(\mu, \sigma^{2}\right)\quad X_{2} \sim N\left(\mu, \sigma^{2}\right)\tag{i.i.d}
$$
What's the median of:
$$
Q=\left(X_{1}-\bar{X}\right)^{2}+\left(X_{2}-\bar{X}\right)^{2}
$$

$$\bar{X}=\frac{1}{2}(X_{1}+X_{2}),X_{1}-\bar{X}=\frac{1}{2}(X_{1}-X_{2})$$
$$\Rightarrow Q=\frac{1}{4}(X_{1}-X_{2})^{2}+ \frac{1}{4}(X_{2}-X_{1})^{2}$$
$$\begin{align*}
E[Q]&=E[\frac{1}{2}(X_{1}-\mu+\mu-X_{2})^{2}]\\
&=\frac{1}{2}(E[(X_{1}-\mu)^{2}] + E[(X_{2}-\mu)^{2}] + 2\cdot E[(X_{1}-\mu)(X_{2}-\mu)])
\end{align*}$$
```

**Multivariate:**
Lad $X_{1}, \ldots, X_{n}$ være uafhængige og identisk fordelte stokastiske variable med middelværdi $E\left[X_{i}\right]=\mu$ og varians $V\left[X_{i}\right]=\sigma^{2}$, lad $Q$ være
$$
Q=\sum_{i=1}^{n}\left(X_{i}-\bar{X}\right)^{2}
$$
Hvad er middelværdien af $Q$ ?
$$
\begin{aligned}
E[Q] &=\sum_{i=1}^{n} E\left[\left(X_{i}-\bar{X}\right)^{2}\right] \\
&=\sum_{i=1}^{n} E\left[\left(X_{i}-\mu+\mu-\bar{X}\right)^{2}\right] \\
&=\sum_{i=1}^{n} E\left[\left(X_{i}-\mu\right)^{2}+(\mu-\bar{X})^{2}+2\left(X_{i}-\mu\right)(\mu-\bar{X})\right]\\
&=\sum_{i=1}^{n} E\left[\left(X_{i}-\mu\right)^{2}\right]+E\left[(\mu-\bar{X})^{2}\right]-2 \operatorname{Cov}\left[X_{i}, \bar{X}\right] \\
&=n \sigma^{2}+\sigma^{2}-2 \sum_{i=1}^{n} \frac{1}{n} \operatorname{Cov}\left(X_{i}, \sum_{j=1}^{n} X_{j}\right) \\
&=(n+1) \sigma^{2}-2 \sum_{i=1}^{n} \frac{1}{n} \operatorname{Cov}\left(X_{i}, X_{i}\right) \\
&=(n+1) \sigma^{2}-2 \sigma^{2} \\
&=(n-1) \sigma^{2}
\end{aligned}
$$
Dermed er $S^{2}=\frac{1}{n-1} \sum_{i=1}^{n}\left(X_{i}-\bar{X}\right)^{2}$ en central estimator for $\sigma^{2}$

**Eksempel:**
Hvis $X_{1}, \ldots, X_{10}$ er i.i.d. $N\left(\mu, \sigma^{2}\right)$ og
$$
Q=\frac{1}{\sigma^{2}} \sum_{i=1}^{10}\left(X_{i}-\mu\right)^{2}
$$
Hvad er så $P(Q>10) ?$

Først bestem fordeling:
$$\frac{X_{i}-\mu}{\sigma}\sim\ndist(0,1)$$
Derfor må
$$Q=\sum\limits_{i=1}^{10}\left(\frac{X_{i}-\mu}{\sigma}\right)^{2}\sim\chi^{2}(10)$$
$$\P(Q>10) = 1- \P(Q<10)=1-F(10)=0.44$$

**Generelt:**
$$Q=\sum\limits_{i=1}^{v}\left(\frac{X_{i}-\mu}{\sigma}\right)^{2}\sim\chi^{2}(v)$$
v: frihedsgrader og i dette tilfælde antal variabler

Hvis $X_{1}, \ldots, X_{n}$ er i.i.d. $N\left(\mu, \sigma^{2}\right)$, med $\bar{X}, S^{2}$ hhv. gennemsnit og empirisk varians. Så gælder at
$$
\frac{1}{\sigma^{2}} \sum_{i=1}^{n}\left(X_{i}-\mu\right)^{2}=\frac{(n-1) S^{2}}{\sigma^{2}}+\left(\frac{\bar{X}-\mu}{\sigma / \sqrt{n}}\right)^{2}
$$
og det følger at
$$
\frac{(n-1) S^{2}}{\sigma^{2}} \sim \chi^{2}(n-1)
$$

$\chi^{2}$-dist: Bruges til samligning af emperisk(sample) mean og true mean.

$S^2$ og $\bar{x}$ er uafhængige, derfor er $Q_{1}$ og $Q_{2}$ også uafhængige.
```ad-info
title: Bevis

$1: \quad \frac{1}{\sigma^{2}} \sum_{i=1}^{n}\left(X_{i}-\mu\right)^{2} \sim \chi^{2}(n) \quad$ og $\quad \frac{(\bar{X}-\mu)^{2}}{\sigma^{2} / n} \sim \chi^{2}(1)$
$2: \quad \frac{1}{\sigma^{2}} \sum_{i=1}^{n}\left(X_{i}-\mu\right)^{2}=\frac{(n-1) S^{2}}{\sigma^{2}}+\frac{(\bar{X}-\mu)^{2}}{\sigma^{2} / n}$
3: $\operatorname{Cov}\left(\bar{X}, \bar{X}-X_{i}\right)=0 \Rightarrow S^{2}$ og $(\bar{X}-\mu)^{2}$ uafhængige
4: Hvis $Q_{1} \sim \chi^{2}\left(n_{1}\right)$ og $Q_{2} \sim \chi^{2}\left(n_{2}\right)$ uafhængige, så gælder $Q_{1}+Q_{2} \sim \chi^{2}\left(n_{1}+n_{2}\right)$

```


## [[t-distribution]]
Hvis $X \sim N(0,1)$ og $Q \sim \chi^{2}(n)$ og $X$ og $Q$ er uafhængige så følger
$$
T=\frac{X}{\sqrt{Q / n}}
$$
en $t$-fordeling med $n$-frihedsgrader.

Bevis:
Vi har vist at $\bar{X}$ og $S^{2}$ er uafhængige
$$
Z=\frac{\bar{X}-\mu}{\sigma / \sqrt{n}} \sim N(0,1) \text { og } Q=\frac{n-1}{\sigma^{2}} S^{2} \sim \chi^{2}(n-1)
$$
$$
T=\frac{\frac{1}{\sigma / \sqrt{n}}(\bar{X}-\mu)}{\sqrt{\frac{1}{\sigma^{2} / n} \frac{n-1}{n-1} S^{2} / n}}=\frac{Z}{\sqrt{Q /(n-1)}}
$$
hvor $Z \sim N(0,1)$ og dermed følger $T$ en $t$-fordeling med $n-1$ frihedsgrader.

## Confidence interval
Lad $X_{1}, \ldots, X_{n}$ være i.i.d. $\sim N\left(\mu, \sigma^{2}\right)$, find $d$ (intervalet) så $(0<\alpha<0.5)$
$$
1-\alpha=\P(\mu-d \cdot S<\bar{X}<\mu+d \cdot S)
$$

Vi ønsker at få udtrykket på t-distributions form:
$$
\begin{align*}
P(\mu-d \cdot S<\bar{X}<\mu+d \cdot S) &=P\left(-d<\frac{\bar{X}-\mu}{S}<d\right)\tag{-mu} \\
&=P\left(-d \sqrt{n}<\frac{\bar{X}-\mu}{S / \sqrt{n}}<d \sqrt{n}\right) \tag{normalize}\\
&=F_{T}(d \sqrt{n})-F_{T}(-d \sqrt{n})=2 F_{T}(d \sqrt{n})-1
\end{align*}
$$
ved at sætte ovenstående lig med $1-\alpha$ og løse for $d$ fås
$$
d=\frac{1}{\sqrt{n}} F_{T}^{-1}\left(1-\frac{\alpha}{2}\right)=\frac{t_{1-\frac{\alpha}{2}}}{\sqrt{n}}
$$
hvor $t_{1-\frac{\alpha}{2}}$ er $1-\frac{\alpha}{2}$-fraktilen i en $t$-fordeling med $n-1$ frihedsgrader.

Den anden vej, fordi vi ikke kender $\mu$:
$$
\begin{aligned}
1-\alpha &=P\left(\mu-\frac{t_{1-\frac{\alpha}{2}}}{\sqrt{n}} \cdot S<\bar{X}<\mu+\frac{t_{1-\frac{\alpha}{2}}}{\sqrt{n}} \cdot S\right) \\
&=P\left(\bar{X}-\frac{t_{1-\frac{\alpha}{2}}}{\sqrt{n}} \cdot S<\mu<\bar{X}+\frac{t_{1-\frac{\alpha}{2}}}{\sqrt{n}} \cdot S\right)
\end{aligned}
$$
På den måde kan vi med en sikkerhed sige at gennemsnittet ligger i intervalet defineret.
Ex:  Vi er 95% sikker på at $\mu$ ligger i intervallet:
$$
\bar{x} \pm t_{0.975} \cdot \frac{s}{\sqrt{n}}
$$
$s^2:$ Empirical variance.
$\alpha:$ Error margin, ex: $\alpha=0.05$ would provide a confidence interval of 95%




# Thoughts

# Quotes

# References