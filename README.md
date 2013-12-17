# rv2

A simple package used to demonstrate package development with devtools. The package implements some simple tools for working with discrete random variables, inspired by code written by [Andreas Buja](http://stat.wharton.upenn.edu/~buja/STAT-101/src-probability.R).

```r
library(rv2)
dice <- rv(1:6)
dice
plot(dice)
P(dice > 3)
E(dice)
rsim(dice, 100)
```
