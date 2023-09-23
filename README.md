
<!-- README.md is generated from README.Rmd. Please edit that file -->

# namechecker

<!-- badges: start -->

![R](https://img.shields.io/badge/r-%23276DC3.svg?style=for-the-badge&logo=r&logoColor=white)
![GitHub](https://img.shields.io/badge/github-%23121011.svg?style=for-the-badge&logo=github&logoColor=white)
<!-- badges: end -->

The package is designed to seamlessly interface with the WoRMS (World
Register of Marine Species) API, providing a straightforward method for
verifying the acceptance of species names. While there are other
packages available that offer functionalities centered around the WoRMS
API, we found that many of them come with complex documentation and
offer a multitude of tools that extend beyond our basic requirement of
name validation. Our package aims to simplify this process by focusing
solely on the essential task of checking the acceptance status of
species names, making it more user-friendly and easier to navigate.

## Installation

You can install the development version of namechecker from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("CBMC-GCMP/namechecker")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(namechecker)
library(dplyr)

species_list <- sample_species_names[c(1:3)]

final_data <- get_valid_names(species_list)

glimpse(final_data)
#> Rows: 3
#> Columns: 14
#> $ input_name      <chr> "Acetabularia parvula", "Chlorodesmis comosa", "Codium…
#> $ authority       <chr> "Solms-Laubach, 1895", NA, "(Woodward) M.A.Howe, 1911"
#> $ status          <chr> "unaccepted", "Species not found", "accepted"
#> $ valid_name      <chr> "Parvocaulis parvulus", NA, "Codium decorticatum"
#> $ valid_authority <chr> "(Solms-Laubach) S.Berger, Fettweiss, Gleissberg, Lidd…
#> $ unacceptreason  <chr> "synonym", NA, NA
#> $ rank            <chr> "Species", NA, "Species"
#> $ kingdom         <chr> "Plantae", NA, "Plantae"
#> $ phylum          <chr> "Chlorophyta", NA, "Chlorophyta"
#> $ class           <chr> "Ulvophyceae", NA, "Ulvophyceae"
#> $ order           <chr> "Dasycladales", NA, "Bryopsidales"
#> $ family          <chr> "Polyphysaceae", NA, "Codiaceae"
#> $ genus           <chr> "Acetabularia", NA, "Codium"
#> $ citation        <chr> "Guiry, M.D. & Guiry, G.M. (2023). AlgaeBase. World-wi…
```
