Tags: []
Subjects: [[Covariance]]
Translations: 
Synonyms: Variance-covariance matrix
****

 <p align="center">
	<font size="9"><strong>Covariance matrix</strong></font>
</p>

****
$$
\operatorname{cov}(X)=\boldsymbol{\Sigma}=\left[\begin{array}{cccc}
\operatorname{var}\left[X_{1}\right] & \operatorname{cov}\left[X_{1}, X_{2}\right] & \ldots & \operatorname{cov}\left[X_{1}, X_{D}\right] \\
\operatorname{cov}\left[X_{1}, X_{2}\right] & \operatorname{var}\left[X_{2}\right] & \ldots & \operatorname{cov}\left[X_{2}, X_{D}\right] \\
\vdots & \vdots & \ddots & \vdots \\
\operatorname{cov}\left[X_{D}, X_{1}\right] & \operatorname{cov}\left[X_{D}, X_{2}\right] & \ldots & \operatorname{var}\left[X_{D}\right]
\end{array}\right]
$$
$$\operatorname{cov}(X)=\mathbb{E}\left[(\mathbf{\Sigma}-\mathbb{E}[\mathbf{\Sigma}])(\mathbf{\Sigma}-\mathbb{E}[\mathbf{\Sigma}])^{\top}\right]$$
The covariance matrix is a [[Symmetrical matrices|symmetrical matrix]] which describes the [[Covariance]] between all pairs of the variables $\left[X_{1}, X_{2}, \ldots, X_{D}\right]$.
The diagonal is the [[Variance]] of each variable as $\operatorname{cov}\left[X, X\right]=\operatorname{var}\left[X\right]$.

# References
- [[Signals and data - 02462]]