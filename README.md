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

# Branches

The master branch contains a complete version of the package that passes `R CMD check --as-cran`. There are two branches made from this branch:

* `test-me`: a version with fewer tests and some bugs
* `document-me`: a version with less documentation and some problems

Commits made to these branches need to be minimal and well described in the commmit message since they will be regularly rebased from master.

You can create zipped version of these packages with:

```R
git archive --format zip --output test-me.zip test-me 
git archive --format zip --output document-me.zip document-me 
```

## `package-me`

You can make a single file to practice creating a package by running:

```R
paths <- c("R/rv.R", "R/probability.R", "R/moments.R", "R/simulation.R", "R/ops.R")
files <- lapply(paths, readLines, warn = FALSE)
lines <- unlist(files)
code <- lines[!grepl("^#'", lines)]
code <- code[code != "NULL"]
writeLines(code, "rv.R")
```
