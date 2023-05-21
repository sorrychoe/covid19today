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

``` r
data <- get_data(country)

# country: covid-19 data by country
# continent: covid-19 data by continent
# total covid-19 data of total stat
```

If you want to use it at other languages & tools, then you can extract
that data as a csv or excel file.

``` r
get_data_excel(data) # get .xlsx file

get_data_csv(data) # get .csv file
```

## License

[MIT](https://choosealicense.com/licenses/mit/)

## Authors

[@sorrychoe](https://www.github.com/sorrychoe)

## Getting help

If you encounter a clear bug, please file an issue with a minimal
reproducible example on GitHub.
