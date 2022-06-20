---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Linear Regression]], [[R programming language]]
****

````ad-summary
title: Method 6.16 <br> 
collapse: open

<span class="centerImg">![[LinearRegressionInRMethod6-16.png]]</span>

```R
#### 2. Estimate parameters:
model <- lm(y ~ x1 + ... + xp)

#### 3. Residual analysis
qqnorm(residuals(model)) # Normal assumption
qqline(residuals(model))

plot(fitted.values(model), residuals(model)) # Checking for structures
plot(x1, residuals(model)) # Identify structures

#### 4. Analyse model
summary(model) # (p-values)
confint(model) # 95% CI for paramters

#### 5. Calculate confidence and prediction intervals:
# Confidence interval
predict(model, newdata=data.frame(x1=x1new,...,xp=xpnew), interval="confidence", level=1-alpha)

# Prediction interval
predict(model, newdata=data.frame(x1=x1new,...,xp=xpnew), interval="prediction", level=1-alpha)
```
````
^method6-16

# References
- [[Introduction to Mathematical Statistics - 02403]]