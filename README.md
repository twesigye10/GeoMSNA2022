
<!-- README.md is generated from README.Rmd. Please edit that file -->

# GeoMSNA2022

<!-- badges: start -->
<!-- badges: end -->

The goal of GeoMSNA2022 is to facilitate geospatial and remote sensing
analyses of selected global `MSNA`s.

Prior to the creation of this repository various RS variables have been
extracted for 6 MSNA data sets (SOM, IRQ, COL, NER, NGA, and HTI). The
extraction process is currently performed and documented in the
`surveyGEER` package repository. Now that the variables have been
extracted we aim to explore relationships between
environmental/climatic/geospatial phenomena and household conditions.

It is recommended the country-offices with R-capacity use this
repository to host this stage of analysis.

## Recommendations

-   We recommend starting with Exploratory Data Analysis (EDA) using
    rmarkdown notebooks. You can simply run `usethis::use_vignettes()`
    to automatically create a markdown notebook
-   Once exploratory data analysis has been performed the analyst should
    be sure to use weights for final analysis
