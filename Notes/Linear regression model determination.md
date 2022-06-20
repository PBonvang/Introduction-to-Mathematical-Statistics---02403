---
aliases: [] # Searchable synonyms and translations
---
Modified: `$= dv.current().file.mtime`
Tags: []
Subjects: [[Linear Regression]]
****

When determining a [[Linear Regression]] model, to goal is to determine the simplest model which fits the data best, and therefore is expected to make the best predictions. A model with only significant parameters, so as to avoid [[Statistical collinearity]].

When determining the model the usual strategies are:
- **Backward selection:** Start with the most complicated model and remove the least significant term one at a time, till all the model parameters are significant.
- **Forward selection:** Basically reverse backwards selection. Add one term at a time till the new either makes other parameters insignificant or is it self significant.

# Correcting for outliers
When determining the model, we might discover some points which doesn't really follow the rest of the data. We call these outliers, and dealing with them is important as they can have a quite large effect on the parameters, making it less accurate in general.
When an outlier is discovered, go back and determine if the observation is sound. If it is, then it might be worth removing it anyways, but REMEMBER to document it.

# Adding higher orders of the same variable
If you wish to have a specific variable($x_{i}$) and it's quadratic it's recommended to add the squared deviation from it's mean, to avoid [[Statistical collinearity|collinearity]].
$$x_{i,sq} = (x_{i}-\bar{x}_{i})^{2}$$
# References
- [[Statistical significance]]
- [[Introduction to Mathematical Statistics - 02403]]