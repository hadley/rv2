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
* `check-me`: a version with some problems that need fixing for R CMD check.

Commits made to these branches need to be minimal and well described in the commmit message since they will be regularly rebased from master.

To ensure that all branches are synced with master, run:

```
git checkout test-me && git rebase master
git checkout document-me && git rebase master
git checkout check-me && git rebase master
git push --all --force
```

You can create zipped version of these packages with:

```
git archive --format zip --prefix test-me/ --output ../day-2/test-me.zip test-me 
git archive --format zip --prefix document-me/ --output ../day-2/document-me.zip document-me 
git archive --format zip --prefix check-me/ --output ../day-2/check-me.zip check-me 
cd ../day-2/
unzip test-me.zip
unzip document-me.zip
unzip check-me.zip
rm *.zip
mv test-me/rv2.Rproj test-me/test-me.Rproj
mv document-me/rv2.Rproj document-me/document-me.Rproj
mv check-me/rv2.Rproj check-me/check-me.Rproj
```

## `package-me`

You can make a single file to practice creating a package by running:

```R
paths <- c("R/rv.R", "R/probability.R", "R/moments.R", "R/simulation.R", "R/ops.R")
files <- lapply(paths, readLines, warn = FALSE)
lines <- unlist(files)
code <- lines[!grepl("^#'", lines)]
code <- code[code != "NULL"]
dir.create("../day-2/package-me/")
writeLines(code, "../day-2/package-me/rv.R")
```
