
<!-- README.md is generated from README.Rmd. Please edit that file -->

# covid19today

covid19today is a library that extracts today’s covid-19 data of the
world.

## Installation

The package can be installed with the `devtools` package

``` r
  devtools::install_github("sorrychoe/covid19today")
```

## Usage

You can use `get_data()` function to gather today’s world covid19 data

``` r
data <- get_data(country)

# country: covid-19 data by country
# continent: covid-19 data by continent
```

## License

[MIT](https://choosealicense.com/licenses/mit/)

## Getting help

If you encounter a clear bug, please file an issue with a minimal
reproducible example on GitHub.
