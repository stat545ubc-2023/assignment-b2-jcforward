
<!-- README.md is generated from README.Rmd. Please edit that file -->

# missingGroup

<!-- badges: start -->
<!-- badges: end -->

`missingGroup` is an R package designed to facilitate the analysis of
missing values in datasets. It provides a straightforward and efficient
way to group a data frame by a specified column and then calculate the
count of missing values in all other columns for each group.

## Installation

You can install the development version of missingGroup like so:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2023/missingGroup")
```

## Example

Here are a few examples that showcase the usage of these functions

### Example 1: Basic Use

This is a basic example which shows you how to use the function:

``` r

library(missingGroup)
library(dplyr)
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union

exists("count_all_missing_by_group")
#> [1] TRUE
# Using the airquality dataset
count_all_missing_by_group(airquality, Month)
#> # A tibble: 5 × 6
#>   Month Ozone Solar.R  Wind  Temp   Day
#>   <int> <int>   <int> <int> <int> <int>
#> 1     5     5       4     0     0     0
#> 2     6    21       0     0     0     0
#> 3     7     5       0     0     0     0
#> 4     8     5       3     0     0     0
#> 5     9     1       0     0     0     0
```

### Example 2: Piping a Dataset

``` r

# Piping the dataset into the function
airquality |> count_all_missing_by_group(Month)
#> # A tibble: 5 × 6
#>   Month Ozone Solar.R  Wind  Temp   Day
#>   <int> <int>   <int> <int> <int> <int>
#> 1     5     5       4     0     0     0
#> 2     6    21       0     0     0     0
#> 3     7     5       0     0     0     0
#> 4     8     5       3     0     0     0
#> 5     9     1       0     0     0     0
```

### Example 3: Keeping the Grouping

``` r

# Keeping the output grouped
count_all_missing_by_group(airquality, Month, .groups = "keep")
#> # A tibble: 5 × 6
#> # Groups:   Month [5]
#>   Month Ozone Solar.R  Wind  Temp   Day
#>   <int> <int>   <int> <int> <int> <int>
#> 1     5     5       4     0     0     0
#> 2     6    21       0     0     0     0
#> 3     7     5       0     0     0     0
#> 4     8     5       3     0     0     0
#> 5     9     1       0     0     0     0
```
