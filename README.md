
<!-- README.md is generated from README.Rmd. Please edit that file -->

# c2d

The goal of c2d is to host code for loading data used in creds2.

Fun example in Python to show reproducible code:

``` python
import numpy as np
x = [1, 2, 4, 9]
y = [2, 3, 5, 6]
# import matplotlib
z = np.add(x, y)
print(z)
#> [ 3  5  9 15]
```

## Packages used

We’ll use the following packages. Make sure you’ve installed them before
proceeding, e.g. with the following code:

``` r
pkgs = c(
  "DiagrammeR",
  "tidyverse",
  "tabplot"
)
install.packages(pkgs)
```

## Flow diagram

The plot below, generated using reproducible code stored in the script
`data-flow-diag.R`, is a data flow diagram
([DFD](https://en.wikipedia.org/wiki/Data_flow_diagram)). We will modify
this as the project evolve as we clarify the work to be done.

``` r
source("data-flow-diag.R")
render_graph(g, layout = "tree")
```

![](README_files/figure-gfm/unnamed-chunk-3-1.png)<!-- -->

## Exploration of data

``` r
library(tidyverse)
d = read_csv("all_cluster_variables.csv")
tabplot::tableplot(d[2:10], sortCol = "Income")
```

![](README_files/figure-gfm/unnamed-chunk-4-1.png)<!-- -->

``` r
tabplot::tableplot(d[11:18])
```

![](README_files/figure-gfm/unnamed-chunk-4-2.png)<!-- -->

``` r
tabplot::tableplot(d[19:30])
```

![](README_files/figure-gfm/unnamed-chunk-4-3.png)<!-- -->

``` r
tabplot::tableplot(d[31:43])
```

![](README_files/figure-gfm/unnamed-chunk-4-4.png)<!-- -->

``` r
tabplot::tableplot(d[44:55])
```

![](README_files/figure-gfm/unnamed-chunk-4-5.png)<!-- -->

## References

References can be found in the ‘creds2’ folder of the
energy-and-transport Zotero group:
<https://www.zotero.org/groups/418217/energy-and-transport/items/collectionKey/AS8RTJ2X>

Get all the references by signing-in to Zotero, downloading the app, and
syncing it on your computer.

Alternatively, anyone can download the latest bib file from this as
follows:

``` r
refs = RefManageR::ReadZotero(group = "418217", .params = list(collection = "AS8RTJ2X", limit = 100))
#> Ignoring entry 'chatterton_financial_2016-1'  (line77) because:
#>  A bibentry of bibtype 'InProceedings' has to specify the field: editor
RefManageR::WriteBib(refs, "references.bib")
#> Writing 6 Bibtex entries ...
#> OK
#> Results written to file 'references.bib'
```

The citations are also saved in the GitHub folder.
